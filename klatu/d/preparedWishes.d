
APPEND ~WISH25~
	
	IF ~~ THEN BEGIN prep1
		SAY @0
		IF ~CombatCounterGT(0)~ THEN GOTO prepInCombat
		IF ~CombatCounter(0)~ THEN GOTO prep3
	END
	
	IF ~~ THEN BEGIN prepTooMany
		SAY @1
		IF ~~ THEN DO ~SetGlobal("kla#wpNumPrep","GLOBAL",4)~ GOTO 12
	END
	
	IF ~~ THEN BEGIN prepInCombat
		SAY @2
		IF ~~ THEN GOTO 12
	END
	
	IF ~~ THEN BEGIN prep3
		SAY @3
		IF ~~ THEN GOTO prep4
	END
	
	IF ~~ THEN BEGIN prep4
		SAY @4
		IF ~~ THEN GOTO prep5
	END
	
	IF ~~ THEN BEGIN prep5
		SAY @5
		IF ~~ THEN GOTO prep5a
	END
	
	IF ~~ THEN BEGIN prep5a
		SAY @6
		IF ~~ THEN GOTO prep6
	END
	
	IF ~~ THEN BEGIN prep6
		SAY @7
		IF ~~ THEN GOTO prep7
	END
	
	IF ~~ THEN BEGIN prep7
		SAY @8
		IF ~~ THEN GOTO prep8
	END
	
	IF ~~ THEN BEGIN prep8
		SAY @9
		IF ~PartyGoldGT(14999)~ THEN REPLY @10 DO ~TakePartyGold(15000) DestroyGold(15000)~ GOTO prep9
		IF ~~ THEN REPLY @11 GOTO prepAbort
	END
	
	IF ~~ THEN BEGIN prepAbort
		SAY @12
		IF ~~ THEN GOTO 12
	END
	
	IF ~~ THEN BEGIN prep9
		SAY @13
		IF ~~ THEN GOTO prep9a
	END
	
	IF ~~ THEN BEGIN prep9a
		SAY @14
		IF ~CheckStatGT(LastTalkedToBy,18,WIS) CheckStatGT(LastTalkedToBy,18,INT)~ THEN GOTO prepBoth
		IF ~CheckStatLT(LastTalkedToBy,19,WIS) CheckStatGT(LastTalkedToBy,18,INT)~ THEN GOTO prepInt
		IF ~CheckStatGT(LastTalkedToBy,18,WIS) CheckStatLT(LastTalkedToBy,19,INT)~ THEN GOTO prepWis
		IF ~CheckStatLT(LastTalkedToBy,19,WIS) CheckStatLT(LastTalkedToBy,19,INT)~ THEN GOTO prepNone
	END
	
	IF ~~ THEN BEGIN prepNone
		SAY @15
		IF ~~ THEN GOTO prepNone1
	END
	
	IF ~~ THEN BEGIN prepNone1
		SAY @16
		IF ~~ THEN DO ~ApplySpell(Myself,POOF_GONE)~ EXIT
	END
	
	IF ~~ THEN BEGIN prepBoth
		SAY @17
		IF ~~ THEN GOTO prepBoth1
	END
	
	IF ~~ THEN BEGIN prepBoth1
		SAY @18
		IF ~~ THEN REPLY @19 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp16"))~ GOTO prepEnd
		IF ~~ THEN REPLY @20 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp17"))~ GOTO prepEnd
		IF ~~ THEN REPLY @21 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp38"))~ GOTO prepEnd
		IF ~~ THEN REPLY @22 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp37"))~ GOTO prepEnd
		IF ~~ THEN REPLY @23 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp46"))~ GOTO prepEnd
		IF ~~ THEN REPLY @24 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp10"))~ GOTO prepEnd
		IF ~~ THEN REPLY @25 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp11"))~ GOTO prepEnd
		IF ~~ THEN REPLY @26 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp12"))~ GOTO prepEnd
		IF ~~ THEN REPLY @27 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp14"))~ GOTO prepEnd
		IF ~~ THEN REPLY @28 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp13"))~ GOTO prepEnd
		IF ~~ THEN REPLY @29 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp30"))~ GOTO prepEnd
		IF ~~ THEN REPLY @30 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp31"))~ GOTO prepEnd
		IF ~~ THEN REPLY @31 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp08"))~ GOTO prepEnd
		IF ~~ THEN REPLY @32 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp28"))~ GOTO prepEnd
		IF ~~ THEN REPLY @33 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp32"))~ GOTO prepEnd
		IF ~~ THEN REPLY @34 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp27"))~ GOTO prepEnd
		IF ~~ THEN REPLY @35 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp35"))~ GOTO prepEnd
	END
	
	IF ~~ THEN BEGIN prepInt
		SAY @36 
		IF ~~ THEN GOTO prepInt1
	END
	
	IF ~~ THEN BEGIN prepInt1
		SAY @37
		IF ~~ THEN REPLY @38 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp17"))~ GOTO prepEnd
		IF ~~ THEN REPLY @39 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp38"))~ GOTO prepEnd
		IF ~~ THEN REPLY @40 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp11"))~ GOTO prepEnd
		IF ~~ THEN REPLY @41 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp30"))~ GOTO prepEnd
		IF ~~ THEN REPLY @42 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp08"))~ GOTO prepEnd
		IF ~~ THEN REPLY @43 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp35"))~ GOTO prepEnd
		IF ~~ THEN REPLY @44 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp14"))~ GOTO prepEnd
	END
	
	IF ~~ THEN BEGIN prepWis
		SAY @45
		IF ~~ THEN GOTO prepWis1
	END
	
	IF ~~ THEN BEGIN prepWis1
		SAY @46
		IF ~~ THEN REPLY @47 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp16"))~ GOTO prepEnd
		IF ~~ THEN REPLY @48 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp12"))~ GOTO prepEnd
		IF ~~ THEN REPLY @49 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp37"))~ GOTO prepEnd
		IF ~~ THEN REPLY @50 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp31"))~ GOTO prepEnd
		IF ~~ THEN REPLY @51 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp28"))~ GOTO prepEnd
		IF ~~ THEN REPLY @52 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp27"))~ GOTO prepEnd
		IF ~~ THEN REPLY @53 DO ~ActionOverride(LastTalkedToBy,AddSpecialAbility("kla#wp13"))~ GOTO prepEnd
	END
	
	IF ~~ THEN BEGIN prepEnd
		SAY @54
		IF ~~ THEN DO ~IncrementGlobal("kla#wpNumPrep","GLOBAL",1) ApplySpell(Myself,POOF_GONE) DayNight(MIDNIGHT)~ EXIT
	END
	
END


EXTEND_BOTTOM WISH25 12
	IF ~GlobalLT("kla#wpNumPrep","GLOBAL",3)
	CheckStatGT(LastTalkedToBy,16,WIS)
	CheckStatGT(LastTalkedToBy,16,INT)~ 
	THEN REPLY @55 GOTO prep1
	
	IF ~Global("kla#wpNumPrep","GLOBAL",3)
	CheckStatGT(LastTalkedToBy,16,WIS)
	CheckStatGT(LastTalkedToBy,16,INT)~ 
	THEN REPLY @56 GOTO prepTooMany
END

