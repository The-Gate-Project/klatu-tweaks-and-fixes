# Free Action and Haste compatibility

This change extends component **2070**, "Free Action does not
prevent Haste or Movement Rate Bonus", and adds **2071**, a separate late
compatibility repair using the same implementation. All original components
and component numbers remain available. Original mod author: klatu.

## Motivation

An EET installation with SCS retained Haste blockers after installing the
original tweak. Firecam Full-Plate Armor (`NPPLAT`, Keldorn's personal armor)
and Flail of Ages +5 (`BLUN30`) required separate manual repairs. An audit also
found remaining blockers on rings, potions, weapons, and Free Action spell
variants. Naming individual items does not solve the underlying problem.

## Component 2070 changes

- Remove immunity to both Haste opcodes, 16 and 317, and opcode 337 effects
  that remove them, within a Free Action effect group for the same recipient.
- Resolve `HASTE_IMMUNITY` from the installed `SPLSTATE.IDS` and remove the
  corresponding opcode 328 spell-state effect. No numeric state is hardcoded;
  other states and opcode 328's extended-state mode are preserved.
- Identify Haste spells by their effects, including helper SPL/EFF chains.
  Localized display names and BG1/BG2/EET resource naming are not used to
  decide whether a spell provides Haste. Missing references are tolerated and
  cycles terminate.
- Recognize Free Action applied through helper spells and single-effect EFF
  chains. Remove a blocking EFF invocation from its Free Action source rather
  than changing the shared EFF for every user.
- Match the recipient within each equipped/casting/ability/creature effect
  group. Do not require equal saving-throw or probability fields, which vary
  after SCS conversions. Separate attack abilities and effects for other
  recipients remain separate.
- Preserve positive movement bonuses beside Free Action. Retain the original
  separation of negative movement effects (126) and positive effects (176),
  including external EFF movement effects, and Free Action's immunity to
  negative movement modifiers.
- Cover ITM, SPL, and both effect formats in CRE resources. Keep Free Action
  itself and unrelated hold, paralysis, Slow, and other protections.

This is a compatibility pass over resources present when component 2070 runs.
It does not grant Haste through unrelated anti-magic effects, remove spell
gates globally, or modify saved games. Script-applied effects and arbitrary
future mod implementations are not a universal guarantee.

## Installation

Install component **2070 or 2071 late**, after SCS, item/spell/kit mods, and EET's
resource-generating stages. Later mods can create or reintroduce blockers;
run the updated component after those changes. The Project
Infinity metadata recommends installing after SCS (`stratagems`).

For a new setup, extract the release into the game directory and run
`setup-klatu.exe`, selecting component 2070. Other components are optional.
The source package does not bundle WeiDU: reuse your existing
`setup-klatu.exe`, or obtain WeiDU and rename its executable accordingly.

For an established game that already has an older component 2070, select the
new component **2071** after all other mods. This runs the complete repair at
the end of the install order without needing to reinstall the earlier 2070.
2071 also works if 2070 is absent. Both use the same idempotent patch.
Use a copied installation for the first upgrade. Reinstalling an earlier
WeiDU component can trigger reinstalls of later mods. Development testing
did not install either component into the live personal game.

Restart the game after patching resources. Equipped items may need to be
unequipped/re-equipped and temporary Free Action buffs may need to expire and
be recast. Already serialized effects in existing saves are not rewritten.

## Validation

The tests run the actual WeiDU patcher in a temporary, minimal game directory:

```text
python tests/test_free_action.py --weidu /path/to/weidu
python tests/test_free_action.py --weidu /path/to/weidu --without-state
```

They exercise modern and legacy Haste blockers, a relocated spell-state ID,
unrelated spell states, distinct recipients and attack headers, positive
movement bonuses, missing resources, helper cycles, indirect EFF blockers,
both CRE effect formats, and byte-for-byte stability on a second application.

An optional `--snapshots /path/to/resources` adds local ITM/SPL/CRE/EFF files
and checks their Free Action groups. If present, `SPLSTATE.IDS` supplies the
state number for that test. No copyrighted game-resource fixtures are stored
in this repository. In-game verification of Haste and Improved Haste in both
application orders is still required.

Validation on October 22, 2026 used WeiDU 251 with 21,208 exported EET
resources plus 19 synthetic cases. The historical pre-repair `NPPLAT` and
`BLUN30` were restored only in the test data. The pass checked 93 real Free
Action effect groups and removed 74 remaining Haste blockers. Preservation
checks and byte-for-byte stability on a second application passed. The
separate no-`SPLSTATE.IDS` run and English/German component listing checks
also passed.

## References

- Upstream: https://github.com/The-Gate-Project/klatu-tweaks-and-fixes
- IESDP opcode reference: https://gibberlings3.github.io/iesdp/opcodes/bgee.htm
- SCS implementation: `initial/immunities_via_324.tph` and its use of the
  dynamically allocated `HASTE_IMMUNITY` spell state.

## Relocated ability table compatibility

The shared ITM/SPL sanitizer now snapshots ability and effect sections before moving them. This preserves large relocated tables, including expanded Inquisitor Dispel Magic. A 255-header regression checks every original effect and a second application.
