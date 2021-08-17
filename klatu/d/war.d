

BEGIN kla#bk01
IF ~Global("kla#book01","GLOBAL",0)~ bookIntro
	SAY @0
	++ @1 + bookInspect
	+ ~Race(LastTalkedToBy, ELF)~ + @2 + bookAllElf
	+ ~!Race(LastTalkedToBy, ELF)
		CheckStatGT(LastTalkedToBy, 99, LORE)~ + @2 + bookAllLore
	+ ~!Race(LastTalkedToBy, ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		CheckStatGT(LastTalkedToBy, 17, INT)~ + @2 + bookAllInt
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		!CheckStatGT(LastTalkedToBy, 17, INT)
		CheckStatGT(LastTalkedToBy, 49, LORE)~ + @2 + bookAllHalfelfLore
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 17, INT)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		CheckStatGT(LastTalkedToBy, 14, INT)~ + @2 + bookAllHalfelfInt
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, SORCERER)
		OR(2)
			Class(LastTalkedToBy, MAGE_ALL)
			Class(LastTalkedToBy, BARD)~ + @2 + bookAllHalfelfMage
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		Class(LastTalkedToBy, SORCERER)~ + @2 + bookSomeHalfelf
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, MAGE_ALL)
		!Class(LastTalkedToBy, BARD)~ + @2 + bookSomeHalfelf
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		CheckStatGT(LastTalkedToBy, 49, LORE)~ + @2 + bookSomeLore
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		CheckStatGT(LastTalkedToBy, 14, INT)~ + @2 + bookSomeInt
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, SORCERER)
		OR(2)
			Class(LastTalkedToBy, MAGE_ALL)
			Class(LastTalkedToBy, BARD)~ + @2 + bookSomeMage
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		Class(LastTalkedToBy, SORCERER)~ + @2 + bookNone
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, MAGE_ALL)
		!Class(LastTalkedToBy, BARD)~ + @2 + bookNone
	++ @3 + bookClose
END

IF ~Global("kla#book01","GLOBAL",1)~ bookIntro1
	SAY @4
	++ @1 + bookInspect1
	+ ~Race(LastTalkedToBy, ELF)~ + @2 + bookAllElf
	+ ~!Race(LastTalkedToBy, ELF)
		CheckStatGT(LastTalkedToBy, 99, LORE)~ + @2 + bookAllLore
	+ ~!Race(LastTalkedToBy, ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		CheckStatGT(LastTalkedToBy, 17, INT)~ + @2 + bookAllInt
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		!CheckStatGT(LastTalkedToBy, 17, INT)
		CheckStatGT(LastTalkedToBy, 49, LORE)~ + @2 + bookAllHalfelfLore
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 17, INT)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		CheckStatGT(LastTalkedToBy, 14, INT)~ + @2 + bookAllHalfelfInt
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, SORCERER)
		OR(2)
			Class(LastTalkedToBy, MAGE_ALL)
			Class(LastTalkedToBy, BARD)~ + @2 + bookAllHalfelfMage
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		Class(LastTalkedToBy, SORCERER)~ + @2 + bookSomeAgain
	+ ~Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, MAGE_ALL)
		!Class(LastTalkedToBy, BARD)~ + @2 + bookSomeAgain
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 99, LORE)
		CheckStatGT(LastTalkedToBy, 49, LORE)~ + @2 + bookSomeAgain
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		CheckStatGT(LastTalkedToBy, 14, INT)~ + @2 + bookSomeAgain
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, SORCERER)
		OR(2)
			Class(LastTalkedToBy, MAGE_ALL)
			Class(LastTalkedToBy, BARD)~ + @2 + bookSomeAgain
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		Class(LastTalkedToBy, SORCERER)~ + @2 + bookNone
	+ ~!Race(LastTalkedToBy, ELF)
		!Race(LastTalkedToBy, HALF_ELF)
		!CheckStatGT(LastTalkedToBy, 49, LORE)
		!CheckStatGT(LastTalkedToBy, 14, INT)
		!Class(LastTalkedToBy, MAGE_ALL)
		!Class(LastTalkedToBy, BARD)~ + @2 + bookNone
	++ @3 + bookClose
END

IF ~Global("kla#book01","GLOBAL",2)~ bookIntro2
	SAY @4
	++ @1 + bookInspect2
	++ @2 + bookOpen2
	++ @3 + bookClose
END

IF ~GlobalGT("kla#book01","GLOBAL",2)~ bookIntro3
	SAY @4
	+ ~GlobalGT("kla#book01Points","GLOBAL",17)~ + @1 + bookInspect33
	+ ~!GlobalGT("kla#book01Points","GLOBAL",17) GlobalGT("kla#book01Points","GLOBAL",11)~ + @1 + bookInspect32
	+ ~!GlobalGT("kla#book01Points","GLOBAL",11) GlobalGT("kla#book01Points","GLOBAL",5)~ + @1 + bookInspect31
	+ ~!GlobalGT("kla#book01Points","GLOBAL",5)~ + @1 + bookInspect30
	+ ~GlobalGT("kla#book01Points","GLOBAL",17)~ + @2 + bookCharged3
	+ ~!GlobalGT("kla#book01Points","GLOBAL",17) GlobalGT("kla#book01Points","GLOBAL",11)~ + @2 + bookCharged2
	+ ~!GlobalGT("kla#book01Points","GLOBAL",11) GlobalGT("kla#book01Points","GLOBAL",5)~ + @2 + bookCharged1
	+ ~!GlobalGT("kla#book01Points","GLOBAL",5)~ + @2 + bookCharged0
	++ @3 + bookClose
END

IF ~~ bookOpen2
	SAY @5
	=
	@6
	IF ~~ + bookIntro2
END

IF ~~ bookClose
	SAY @7
	IF ~~ EXIT
END

IF ~~ bookInspect
	SAY @8
	IF ~~ + bookIntro
END

IF ~~ bookInspect1
	SAY @8
	IF ~~ + bookIntro1
END

IF ~~ bookInspect2
	SAY @9
	=
	@10
	=
	@11
	=
	@12
	IF ~~ + bookIntro2
END

IF ~~ bookSomeAgain
	SAY @13
	= 
	@14
	IF ~~ + bookIntro1
END

// race elf
IF ~~ bookAllElf
	SAY @15
	IF ~~ + bookAll
END

// lore great
IF ~~ bookAllLore
	SAY @16
	IF ~~ + bookAll
END

// int great
IF ~~ bookAllInt
	SAY @17
	IF ~~ + bookAll
END

// race halfelf and lore good
IF ~~ bookAllHalfelfLore
	SAY @18
	IF ~~ + bookAll
END

// race halfelf and int good
IF ~~ bookAllHalfelfInt
	SAY @19
	IF ~~ + bookAll
END

// race halfelf and class wizard/bard
IF ~~ bookAllHalfelfMage
	SAY @20
	IF ~~ + bookAll
END

// race halfelf
IF ~~ bookSomeHalfelf
	SAY @21
	IF ~~ + bookSome
END

// lore good
IF ~~ bookSomeLore
	SAY @22
	IF ~~ + bookSome
END

// int good
IF ~~ bookSomeInt
	SAY @23
	IF ~~ + bookSome
END

// class wizard/bard
IF ~~ bookSomeMage
	SAY @24
	IF ~~ + bookSome
END

// too dumb
IF ~~ bookNone
	SAY @25
	=
	@26
	IF ~~ + bookIntro
END

// can read some
IF ~~ bookSome
	SAY @27
	=
	@28
	=
	@29
	=
	@30
	IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",1)~ + bookIntro1
END

// can read all
IF ~~ bookAll
	SAY @31
	=
	@32
	=
	@33
	=
	@34
	=
	@35
	=
	@36
	=
	@37
	IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",2)~ + bookIntro2
END

////////////////
IF ~~ bookInspect33
	SAY @9
	=
	@38
	=
	@39
	IF ~~ + bookIntro3
END

IF ~~ bookInspect32
	SAY @9
	=
	@38
	=
	@40
	IF ~~ + bookIntro3
END

IF ~~ bookInspect31
	SAY @9
	=
	@38
	=
	@41
	IF ~~ + bookIntro3
END

IF ~~ bookInspect30
	SAY @9
	=
	@38
	=
	@11
	IF ~~ + bookIntro3
END

IF ~~ bookCharged3
	SAY @39
	IF ~~ + bookIndex
END

IF ~~ bookCharged2
	SAY @42
	IF ~~ + bookIndex
END

IF ~~ bookCharged1
	SAY @43
	IF ~~ + bookIndex
END

IF ~~ bookCharged0
	SAY @44
	IF ~~ + bookIntro3
END

IF ~~ bookIndex
	SAY @45
	++ @46 + bookWeaponChoice
	++ @47 + bookHit
	++ @48 + bookDamage
	++ @49 + bookAC
	+ ~GlobalGT("kla#book01Points","GLOBAL",11) !CheckStatGT(LastTalkedToBy,18,WIS)~ + @50 + bookAPR
	+ ~GlobalGT("kla#book01Points","GLOBAL",11) CheckStatGT(LastTalkedToBy,18,WIS)~ + @50 + bookAPR2
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @51 + bookCrit
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @52 + bookStr
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @53 + bookDex
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @54 + bookCon
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @55 + bookInt
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @56 + bookWis
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @57 + bookCha
	+ ~GlobalGT("kla#book01Points","GLOBAL",11)~ + @58 + bookAny
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) !CheckStatGT(LastTalkedToBy,18,WIS)~ + @59 + bookMind
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) CheckStatGT(LastTalkedToBy,18,WIS)~ + @59 + bookMind2
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) !CheckStatGT(LastTalkedToBy,18,WIS)~ + @60 + bookRegen
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) CheckStatGT(LastTalkedToBy,18,WIS)~ + @60 + bookRegen2
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) !CheckStatGT(LastTalkedToBy,18,WIS)~ + @61 + bookFree
	+ ~GlobalGT("kla#book01Points","GLOBAL",17) CheckStatGT(LastTalkedToBy,18,WIS)~ + @61 + bookFree2
	++ @3 + bookClose
END

IF ~~ bookHit
	SAY @62
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko0", Myself))~ + bookDrain1Close
END

IF ~~ bookDamage
	SAY @63
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko1", Myself))~ + bookDrain1Close
END

IF ~~ bookAC
	SAY @64
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko2", Myself))~ + bookDrain1Close
END

IF ~~ bookAPR
	SAY @65
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko3", Myself))~ + bookDrain2Close
END

IF ~~ bookAPR2
	SAY @65
	=
	@66
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko3", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoh", Myself))~ + bookDrain2Close
END

IF ~~ bookCrit
	SAY @67
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko4", Myself))~ + bookDrain2Close
END

IF ~~ bookStr
	SAY @68
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko5", Myself))~ + bookDrain2Close
END

IF ~~ bookDex
	SAY @69
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko6", Myself))~ + bookDrain2Close
END

IF ~~ bookCon
	SAY @70
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko7", Myself))~ + bookDrain2Close
END

IF ~~ bookInt
	SAY @71
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko8", Myself))~ + bookDrain2Close
END

IF ~~ bookWis
	SAY @72
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bko9", Myself))~ + bookDrain2Close
END

IF ~~ bookCha
	SAY @73
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoa", Myself))~ + bookDrain2Close
END

IF ~~ bookAny
	SAY @74
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoi", Myself))~ + bookDrain2Close
END


IF ~~ bookMind
	SAY @75
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkob", Myself))~ + bookDrain3Close
END

IF ~~ bookMind2
	SAY @75
	=
	@76
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkob", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkof", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoj", Myself))~ + bookDrain3Close
END

IF ~~ bookRegen
	SAY @77
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoc", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkol", Myself))~ + bookDrain3Close
END

IF ~~ bookRegen2
	SAY @77
	=
	@78
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoc", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkol", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkoe", Myself))~ + bookDrain3Close
END

IF ~~ bookFree
	SAY @79
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkod", Myself))~ + bookDrain3Close
END

IF ~~ bookFree2
	SAY @79
	=
	@80
	IF ~~ DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkod", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkog", Myself))
			ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkok", Myself))~ + bookDrain3Close
END

IF ~~ bookWeaponChoice
	SAY @81
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYBASTARDSWORD)~ + @82 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk01", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYBASTARDSWORD)~ + @82 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk02", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYBASTARDSWORD)~ + @82 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk03", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYBASTARDSWORD)~ + @82 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk04", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYBASTARDSWORD)~ + @82 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk05", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYLONGSWORD)~ + @83 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk11", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYLONGSWORD)~ + @83 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk12", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYLONGSWORD)~ + @83 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk13", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYLONGSWORD)~ + @83 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk14", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYLONGSWORD)~ + @83 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk15", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSHORTSWORD)~ + @84 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk21", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSHORTSWORD)~ + @84 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk22", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYSHORTSWORD)~ + @84 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk23", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYSHORTSWORD)~ + @84 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk24", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYSHORTSWORD)~ + @84 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk25", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYAXE)~ + @85 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk31", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYAXE)~ + @85 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk32", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYAXE)~ + @85 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk33", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYAXE)~ + @85 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk34", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYAXE)~ + @85 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk35", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYTWOHANDEDSWORD)~ + @86 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk41", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYTWOHANDEDSWORD)~ + @86 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk42", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYTWOHANDEDSWORD)~ + @86 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk43", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYTWOHANDEDSWORD)~ + @86 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk44", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYTWOHANDEDSWORD)~ + @86 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk45", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYKATANA)~ + @87 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk51", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYKATANA)~ + @87 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk52", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYKATANA)~ + @87 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk53", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYKATANA)~ + @87 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk54", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYKATANA)~ + @87 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk55", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSCIMITARWAKISASHININJATO)~ + @88 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk61", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSCIMITARWAKISASHININJATO)~ + @88 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk62", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYSCIMITARWAKISASHININJATO)~ + @88 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk63", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYSCIMITARWAKISASHININJATO)~ + @88 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk64", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYSCIMITARWAKISASHININJATO)~ + @88 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk65", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYDAGGER)~ + @89 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk71", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYDAGGER)~ + @89 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk72", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYDAGGER)~ + @89 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk73", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYDAGGER)~ + @89 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk74", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYDAGGER)~ + @89 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk75", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYWARHAMMER)~ + @90 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk81", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYWARHAMMER)~ + @90 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk82", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYWARHAMMER)~ + @90 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk83", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYWARHAMMER)~ + @90 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk84", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYWARHAMMER)~ + @90 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk85", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, EXTRAPROFICIENCY1)~ + @91 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk91", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, EXTRAPROFICIENCY1)~ + @91 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk92", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, EXTRAPROFICIENCY1)~ + @91 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk93", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, EXTRAPROFICIENCY1)~ + @91 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk94", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, EXTRAPROFICIENCY1)~ + @91 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bk95", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSPEAR)~ + @92 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bka1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSPEAR)~ + @92 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bka2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYSPEAR)~ + @92 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bka3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYSPEAR)~ + @92 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bka4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYSPEAR)~ + @92 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bka5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYHALBERD)~ + @93 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkb1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYHALBERD)~ + @93 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkb2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYHALBERD)~ + @93 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkb3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYHALBERD)~ + @93 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkb4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYHALBERD)~ + @93 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkb5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYFLAILMORNINGSTAR)~ + @94 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkc1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYFLAILMORNINGSTAR)~ + @94 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkc2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYFLAILMORNINGSTAR)~ + @94 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkc3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYFLAILMORNINGSTAR)~ + @94 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkc4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYFLAILMORNINGSTAR)~ + @94 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkc5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYMACE)~ + @95 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkd1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYMACE)~ + @95 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkd2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYMACE)~ + @95 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkd3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYMACE)~ + @95 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkd4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYMACE)~ + @95 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkd5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYQUARTERSTAFF)~ + @96 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bke1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYQUARTERSTAFF)~ + @96 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bke2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYQUARTERSTAFF)~ + @96 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bke3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYQUARTERSTAFF)~ + @96 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bke4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYQUARTERSTAFF)~ + @96 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bke5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYCROSSBOW)~ + @97 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkf1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYCROSSBOW)~ + @97 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkf2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYCROSSBOW)~ + @97 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkf3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYCROSSBOW)~ + @97 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkf4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYCROSSBOW)~ + @97 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkf5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYLONGBOW)~ + @98 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkg1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYLONGBOW)~ + @98 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkg2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYLONGBOW)~ + @98 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkg3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYLONGBOW)~ + @98 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkg4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYLONGBOW)~ + @98 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkg5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSHORTBOW)~ + @99 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkh1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSHORTBOW)~ + @99 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkh2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYSHORTBOW)~ + @99 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkh3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYSHORTBOW)~ + @99 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkh4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYSHORTBOW)~ + @99 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkh5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYDART)~ + @100 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bki1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYDART)~ + @100 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bki2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYDART)~ + @100 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bki3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYDART)~ + @100 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bki4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYDART)~ + @100 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bki5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSLING)~ + @101 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkj1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSLING)~ + @101 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkj2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCYSLING)~ + @101 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkj3", Myself))~ + bookWeaponMaster
	+ ~CheckStat(LastTalkedToBy, 3, PROFICIENCYSLING)~ + @101 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkj4", Myself))~ + bookWeaponHighMaster
	+ ~CheckStat(LastTalkedToBy, 4, PROFICIENCYSLING)~ + @101 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkj5", Myself))~ + bookWeaponGrandMaster
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCY2HANDED)~ + @102 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkk1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCY2HANDED)~ + @102 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkk2", Myself))~ + bookWeaponSpecialized
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSWORDANDSHIELD)~ + @103 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkl1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSWORDANDSHIELD)~ + @103 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkl2", Myself))~ + bookWeaponSpecialized
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCYSINGLEWEAPON)~ + @104 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkm1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCYSINGLEWEAPON)~ + @104 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkm2", Myself))~ + bookWeaponSpecialized
	+ ~!CheckStatGT(LastTalkedToBy, 0, PROFICIENCY2WEAPON)~ + @105 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkn1", Myself))~ + bookWeaponProficient
	+ ~CheckStat(LastTalkedToBy, 1, PROFICIENCY2WEAPON)~ + @105 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkn2", Myself))~ + bookWeaponSpecialized
	+ ~CheckStat(LastTalkedToBy, 2, PROFICIENCY2WEAPON)~ + @105 DO ~ActionOverride(LastTalkedToBy,ApplySpellRES("kla#bkn3", Myself))~ + bookWeaponMaster
	++ @106 + bookIndex
	++ @3 + bookClose
END

IF ~~ bookWeaponProficient
	SAY @107
	IF ~~ + bookDrain1Close
END

IF ~~ bookWeaponSpecialized
	SAY @108
	IF ~~ + bookDrain1Close
END

IF ~~ bookWeaponMaster
	SAY @109
	IF ~~ + bookDrain1Close
END

IF ~~ bookWeaponHighMaster
	SAY @110
	IF ~~ + bookDrain1Close
END

IF ~~ bookWeaponGrandMaster
	SAY @111
	IF ~~ + bookDrain1Close
END

IF ~~ bookDrain1Close
	SAY @112
	IF ~~ DO ~IncrementGlobal("kla#book01Points","GLOBAL",-6)
			CreateVisualEffectObject("SPCHMPSI",LastTalkedToBy)
			ActionOverride(LastTalkedToBy,PlaySound("EFF_M77"))~ EXIT
END

IF ~~ bookDrain2Close
	SAY @113
	IF ~~ DO ~IncrementGlobal("kla#book01Points","GLOBAL",-12)
			CreateVisualEffectObject("SPCHMPSI",LastTalkedToBy)
			ActionOverride(LastTalkedToBy,PlaySound("EFF_M77"))~ EXIT
END

IF ~~ bookDrain3Close
	SAY @114
	IF ~~ DO ~IncrementGlobal("kla#book01Points","GLOBAL",-18)
			CreateVisualEffectObject("SPCHMPSI",LastTalkedToBy)
			ActionOverride(LastTalkedToBy,PlaySound("EFF_M77"))~ EXIT
END
