"""Integration regression tests using the real WeiDU patcher in a disposable game.

Run: python tests/test_free_action.py --weidu PATH_TO_WEIDU
No actual game installation is modified.
"""
import argparse
import re
import shutil
import struct
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def put(b, offset, value, fmt="I"):
    struct.pack_into("<" + fmt, b, offset, value & (0xFFFF if fmt == "H" else 0xFFFFFFFF))


def effect(op, p2=0, p1=0, target=1, special=0, resource="", probability=100, save=0):
    b = bytearray(48)
    put(b, 0, op, "H")
    b[2] = target
    put(b, 4, p1)
    put(b, 8, p2)
    b[12] = 2
    b[18] = probability
    b[20:28] = resource.encode().ljust(8, b"\0")
    put(b, 36, save)
    put(b, 44, special)
    return bytes(b)


def resource(kind, globals=(), abilities=()):
    stride = 56 if kind == "ITM" else 40
    b = bytearray(0x72 + len(abilities) * stride)
    b[:8] = (kind + " V1  ").encode()
    put(b, 0x64, 0x72)
    put(b, 0x68, len(abilities), "H")
    put(b, 0x6A, len(b))
    put(b, 0x70, len(globals), "H")
    fx = list(globals)
    for i, group in enumerate(abilities):
        at = 0x72 + i * stride
        put(b, at + 0x1E, len(group), "H")
        put(b, at + 0x20, len(fx), "H")
        if kind == "SPL":
            put(b, at + 0x10, 1, "H")
        fx.extend(group)
    return bytes(b) + b"".join(fx)


def eff_v2(fx):
    b = bytearray(264)
    b[:8] = b"EFF V2.0"
    put(b, 8, struct.unpack_from("<H", fx)[0])
    put(b, 12, fx[2])
    put(b, 16, fx[3])
    b[20:28] = fx[4:12]
    put(b, 28, fx[12])
    b[32:36] = fx[14:18]
    put(b, 36, fx[18], "H")
    put(b, 38, fx[19], "H")
    b[40:48] = fx[20:28]
    b[48:68] = fx[28:48]
    return bytes(b)


def creature(effects, v2=True):
    b = bytearray(0x2D4)
    b[:8] = b"CRE V1.0"
    b[0x33] = int(v2)
    for at in [0x2A0, 0x2A8, 0x2B0, 0x2C4]:
        put(b, at, len(b))
    put(b, 0x2C8, len(effects))
    fx = b"".join(eff_v2(e) if v2 else e for e in effects)
    put(b, 0x2BC, len(b) + len(fx))
    put(b, 0x2B8, len(b) + len(fx))
    return bytes(b) + fx + bytes(80)


def groups(b):
    u16 = lambda at: struct.unpack_from("<H", b, at)[0]
    u32 = lambda at: struct.unpack_from("<I", b, at)[0]
    if b[:8] == b"CRE V1.0":
        v2 = b[0x33] != 0
        stride = 264 if v2 else 48
        fx = [b[u32(0x2C4) + j * stride:u32(0x2C4) + (j + 1) * stride] for j in range(u32(0x2C8))]
        return [fx], v2
    stride = 56 if b[:3] == b"ITM" else 40
    slices = [(u16(0x6E), u16(0x70))]
    for i in range(u16(0x68)):
        at = u32(0x64) + stride * i
        slices.append((u16(at + 32), u16(at + 30)))
    return [[b[u32(0x6A) + j * 48:u32(0x6A) + (j + 1) * 48] for j in range(first, first + count)] for first, count in slices], False


def decoded(e, v2=False):
    return (struct.unpack_from("<I" if v2 else "<H", e, 8 if v2 else 0)[0],
            struct.unpack_from("<I", e, 24 if v2 else 8)[0])


def pack_resources(game, resources):
    """Use real KEY/BIFF lookup without copying thousands of override files."""
    types = {"ITM": 1005, "SPL": 1006, "CRE": 1009, "EFF": 1016}
    biffs, key_entries = [], []
    for name, data in resources.items():
        if len(name.rsplit(".", 1)[0]) > 8:
            (game / "override" / name).write_bytes(data)
    (game / "data").mkdir()
    # One BIFF per type keeps the 14-bit per-BIFF resource index in range.
    for ext, typ in types.items():
        entries = [(name, data) for name, data in resources.items() if name.endswith("." + ext) and len(name.rsplit(".", 1)[0]) <= 8]
        for start in range(0, len(entries), 16384):
            chunk = entries[start:start + 16384]
            index = len(biffs)
            filename = f"data/fixture{index}.bif"
            table, payload = bytearray(), bytearray()
            offset = 20 + len(chunk) * 16
            for name, data in chunk:
                i = len(table) // 16
                stem = name.rsplit(".", 1)[0].encode("ascii")
                table += struct.pack("<IIIHH", i, offset + len(payload), len(data), typ, 0)
                payload += data
                key_entries.append(stem.ljust(8, b"\0") + struct.pack("<HI", typ, (index << 20) | i))
            bif = b"BIFFV1  " + struct.pack("<III", len(table) // 16, 0, 20) + table + payload
            (game / filename).write_bytes(bif)
            biffs.append((filename.encode("ascii") + b"\0", len(bif)))
    res_offset = 24 + len(biffs) * 12
    name_offset = res_offset + len(key_entries) * 14
    files, names = bytearray(), bytearray()
    for filename, size in biffs:
        files += struct.pack("<IIHH", size, name_offset + len(names), len(filename), 1)
        names += filename
    key = b"KEY V1  " + struct.pack("<IIII", len(biffs), len(key_entries), 24, res_offset)
    (game / "chitin.key").write_bytes(key + files + b"".join(key_entries) + names)


def run(weidu, fixture):
    result = subprocess.run([str(weidu), "test.tp2", "--game", str(fixture), "--use-lang", "en_US",
                             "--no-exit-pause", "--force-install-list", "0", "--log", "test.debug"],
                            cwd=fixture, input="", capture_output=True, text=True)
    if result.returncode:
        raise AssertionError(result.stdout[-12000:] + result.stderr[-2000:])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--weidu", type=Path, required=True)
    parser.add_argument("--snapshots", type=Path, help="Optional directory of real ITM/SPL/CRE regression cases")
    parser.add_argument("--without-state", action="store_true", help="Test a game without SPLSTATE.IDS")
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="klatu-test-") as tmp:
        game = Path(tmp)
        (game / "override").mkdir()
        (game / "lang/en_US").mkdir(parents=True)
        (game / "lang/en_US/dialog.tlk").write_bytes(b"TLK V1  " + struct.pack("<HII", 0, 0, 18))
        (game / "chitin.key").write_bytes(b"KEY V1  " + struct.pack("<IIII", 0, 0, 24, 24))
        (game / "engine.lua").write_text('engine_name = "BaldurÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾Ãƒâ€šÃ‚Â¢s Gate II - Enhanced Edition"\nengine_mode = 1\n')
        shutil.copytree(ROOT / "klatu", game / "klatu")
        (game / "klatu/log").mkdir(exist_ok=True)
        (game / "test.tp2").write_text('''BACKUP ~test-backup~
AUTHOR ~regression test~
BEGIN ~Free Action regression test~
INCLUDE ~klatu/lib/common.tpa~
INCLUDE ~klatu/lib/freeAction.tpa~
LAF FA_IMPLEMENT_FREE_ACTION STR_VAR logFile = ~klatu/log/freeAction.txt~ END
''')
        (game / "test.tra").write_text('@225 = ~Hasted~\n')
        tp2 = game / "test.tp2"
        tp2.write_text(tp2.read_text().replace('INCLUDE ~klatu/lib/common.tpa~', 'LOAD_TRA ~test.tra~\nINCLUDE ~klatu/lib/common.tpa~'))
        out = game / "override"
        haste_state, unrelated_state = 412, 138
        if args.snapshots and (args.snapshots / "SPLSTATE.IDS").exists():
            ids = (args.snapshots / "SPLSTATE.IDS").read_text()
            haste_state = int(re.search(r"(?mi)^\s*(\d+)\s+HASTE_IMMUNITY\s*$", ids).group(1))
            unrelated_state = 999
        (out / "splstate.ids").write_text(f"IDS V1.0\n{haste_state} HASTE_IMMUNITY\n{unrelated_state} UNRELATED_STATE\n")
        if args.without_state:
            (out / "splstate.ids").unlink()
        fa = effect(163)
        modern = [effect(101, 16, save=4, probability=50), effect(328, haste_state, special=1, save=4), effect(337, 16, -1), effect(337, 317, -1), effect(101, 317)]
        keep = [effect(101, 40), effect(101, 109), effect(328, unrelated_state, special=1), effect(328, haste_state, special=0), effect(176, 2, 150)]
        fx = [fa] + modern + keep
        (out / "Z#FA.ITM").write_bytes(resource("ITM", fx, [[effect(12, p1=7)], [effect(40)]]))
        (out / "Z#FA.SPL").write_bytes(resource("SPL", (), [fx, [effect(101, 16)]]))
        (out / "Z#FA.CRE").write_bytes(creature(fx))
        (out / "Z#V1.CRE").write_bytes(creature(fx, False))
        # The display names intentionally have no connection to Haste.
        (out / "Z#HAST.SPL").write_bytes(resource("SPL", (), [[effect(16, 1)]]))
        (out / "Z#HW.SPL").write_bytes(resource("SPL", (), [[effect(146, resource="Z#HAST")]]))
        (out / "Z#HC.SPL").write_bytes(resource("SPL", (), [[effect(146, resource="Z#HC"), effect(146, resource="Z#HW")]]))
        (out / "Z#HST2.SPL").write_bytes(resource("SPL", (), [[effect(317)]]))
        (out / "Z#PROT.ITM").write_bytes(resource("ITM", [fa, effect(206, resource="Z#HC"), effect(206, resource="Z#HST2"), effect(206, resource="MISSING")]))
        (out / "Z#BLOCK.EFF").write_bytes(b"EFF V2.0" + eff_v2(effect(328, haste_state, special=1)))
        (out / "Z#EXT.ITM").write_bytes(resource("ITM", [fa, effect(177, resource="Z#BLOCK")]))
        (out / "Z#CHILD.SPL").write_bytes(resource("SPL", (), [[fa]]))
        (out / "Z#PARENT.ITM").write_bytes(resource("ITM", [effect(146, resource="Z#CHILD"), effect(337, 16, -1)]))
        (out / "Z#SPEED.EFF").write_bytes(b"EFF V2.0" + eff_v2(effect(126, 2, 150)))
        (out / "Z#SLOW.EFF").write_bytes(b"EFF V2.0" + eff_v2(effect(176, 2, 50)))
        (out / "Z#SPEEDI.ITM").write_bytes(resource("ITM", [fa, effect(177, resource="Z#SPEED"), effect(177, resource="Z#SLOW")]))
        (out / "Z#NOFREE.ITM").write_bytes(resource("ITM", modern))
        (out / "Z#TARGS.ITM").write_bytes(resource("ITM", [fa, effect(101, 16, target=2)]))
        # A relocated, large ability table must survive the common sanitizer.
        canonical = resource("SPL", [effect(101, 40)], [[effect(58, 2, 15)] for _ in range(255)])
        relocated = bytearray(canonical[:0x72] + bytes(160) + canonical[0x72:])
        put(relocated, 0x64, 0x72 + 160)
        put(relocated, 0x6A, struct.unpack_from("<I", canonical, 0x6A)[0] + 160)
        (out / "Z#LAYOUT.SPL").write_bytes(relocated)
        before = {}
        if args.snapshots:
            before = {p.name.upper(): p.read_bytes() for p in args.snapshots.iterdir()
                      if p.suffix.lower() in {".itm", ".spl", ".cre", ".eff"}}
            assert not (set(before) & {p.name.upper() for p in out.iterdir()}), "Synthetic fixture name collision"
            pack_resources(game, before)
        snapshot_names = set(before)
        before.update({p.name.upper(): p.read_bytes() for p in out.iterdir()})
        run(args.weidu.resolve(), game)
        after = dict(before)
        after.update({p.name.upper(): p.read_bytes() for p in out.iterdir()})
        # Neither source EFF nor intentionally unrelated immunities may be changed.
        for name in ["Z#NOFREE.ITM", "Z#BLOCK.EFF"]:
            assert before[name] == after[name], name
        assert groups(before["Z#TARGS.ITM"])[0][0][-1] in groups(after["Z#TARGS.ITM"])[0][0]
        for name in ["Z#FA.ITM", "Z#FA.SPL", "Z#FA.CRE", "Z#V1.CRE"]:
            gs, v2 = groups(after[name])
            group = gs[1] if name.endswith(".SPL") else gs[0]
            values = [decoded(e, v2) for e in group]
            assert (163, 0) in values, (name, values)
            for blocker in [(101, 16), (328, haste_state), (337, 16), (337, 317), (101, 317)]:
                if blocker == (328, haste_state):
                    assert sum(decoded(e, v2) == blocker for e in group) == (2 if args.without_state else 1), (name, values)
                else:
                    assert blocker not in values, (name, values)
            assert (101, 40) in values and (101, 109) in values, name
            assert (176, 2) in values and (328, unrelated_state) in values, name
        assert groups(after["Z#FA.ITM"])[0][1:] == groups(before["Z#FA.ITM"])[0][1:]
        assert groups(after["Z#FA.SPL"])[0][2:] == groups(before["Z#FA.SPL"])[0][2:]
        assert (not any(decoded(e)[0] == 177 for e in groups(after["Z#EXT.ITM"])[0][0])) == (not args.without_state)
        assert struct.unpack_from("<I", after["Z#SPEED.EFF"], 16)[0] == 176
        assert struct.unpack_from("<I", after["Z#SLOW.EFF"], 16)[0] == 126
        assert sum(decoded(e)[0] == 177 for e in groups(after["Z#SPEEDI.ITM"])[0][0]) == 1
        assert not any(decoded(e)[0] == 337 for e in groups(after["Z#PARENT.ITM"])[0][0])
        assert not any(decoded(e) == (101, 126) for e in groups(after["Z#PARENT.ITM"])[0][0]), "Helper cast must not grant permanent movement immunity"
        assert any(decoded(e) == (101, 126) for e in groups(after["Z#CHILD.SPL"])[0][1])
        protect = groups(after["Z#PROT.ITM"])[0][0]
        assert sum(decoded(e)[0] == 206 for e in protect) == 1
        real_scopes, real_blockers = 0, 0
        if args.snapshots:
            for name, original in before.items():
                if name not in snapshot_names or original[:8] not in {b"ITM V1  ", b"SPL V1  ", b"CRE V1.0"}:
                    continue
                original_groups, old_v2 = groups(original)
                patched_groups, new_v2 = groups(after[name])
                for old_group, new_group in zip(original_groups, patched_groups):
                    targets = {struct.unpack_from("<I", e, 12)[0] if old_v2 else e[2]
                               for e in old_group if decoded(e, old_v2)[0] == 163}
                    if not targets:
                        continue
                    real_scopes += 1
                    for old in old_group:
                        op, param = decoded(old, old_v2)
                        special = struct.unpack_from("<I", old, 64 if old_v2 else 44)[0]
                        target = struct.unpack_from("<I", old, 12)[0] if old_v2 else old[2]
                        blocked = ((op in {101, 337} and param in {16, 317}) or
                                   (op == 328 and param == haste_state and special == 1))
                        if blocked and target in targets:
                            real_blockers += 1
                            assert not any(decoded(e, new_v2) == (op, param) and
                                           (struct.unpack_from("<I", e, 64 if new_v2 else 44)[0] == special)
                                           for e in new_group), (name, op, param)
                    # Preserve unrelated effects byte-for-byte where formats agree.
                    for old in old_group:
                        op, param = decoded(old, old_v2)
                        target = struct.unpack_from("<I", old, 12)[0] if old_v2 else old[2]
                        if target not in targets or op not in {101, 337, 328, 126, 176, 169, 240, 267, 206, 177}:
                            if old_v2 == new_v2:
                                assert old in new_group, (name, "unrelated effect changed", op, param)
            print(f"PASS: real-resource audit: {real_scopes} Free Action scopes; {real_blockers} modern/legacy Haste blockers removed")
        assert groups(after["Z#LAYOUT.SPL"]) == groups(bytes(relocated)), "Relocated ability/effect table corrupted"
        # Invoke the same component again without uninstalling: byte-for-byte stability.
        second = game / "second.tp2"
        second.write_text(tp2.read_text().replace('BACKUP ~test-backup~', 'BACKUP ~second-backup~'))
        second.replace(tp2)
        (game / "weidu.log").unlink(missing_ok=True)
        run(args.weidu.resolve(), game)
        for p in out.iterdir():
            assert after[p.name.upper()] == p.read_bytes(), "Non-idempotent: " + p.name
        print(f"PASS: WeiDU integration, both CRE formats, modern/legacy blockers, helper graphs, scope isolation, preservation, and idempotence ({len(after)} resources)")


if __name__ == "__main__":
    main()
