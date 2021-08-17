APPEND ~WSMITH01~
	IF ~~ THEN BEGIN glvHayes1
		SAY @0
		IF ~~ THEN GOTO glvHayes2
	END

	IF ~~ THEN BEGIN glvHayes2
		SAY @1
		IF ~~ THEN GOTO glvHayes3
	END

	IF ~~ THEN BEGIN glvHayes3
		SAY @2
		IF ~PartyGoldGT(7499)~ THEN REPLY @3 DO ~TakePartyGold(7500) DestroyGold(7500)~ GOTO 56
		IF ~~ THEN REPLY @4 DO ~SetGlobal("kla#glvh","GLOBAL",0)~ GOTO 12
	END

	IF WEIGHT #-500 ~Global("kla#glvh","GLOBAL",1)~ THEN BEGIN glvHayesDone
		SAY @5
		IF ~~ THEN DO ~SetGlobal("kla#glvh","GLOBAL",0)~ EXIT
	END
END

EXTEND_BOTTOM WSMITH01 58
	IF ~PartyHasItem("ohnrobe1")~ THEN REPLY @6
	DO ~SetGlobal("kla#glvh","GLOBAL",1)~ GOTO glvHayes1
END
