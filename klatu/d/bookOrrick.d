
TODO
TODO
TODO

APPEND ???
	IF ~~ foundBook0
		SAY ~~
	END
	
	IF ~~ foundBook1
		SAY ~~
	END
	
	IF ~~ foundBook2
		SAY ~~
	END
	
	IF ~~ noProgress
		SAY ~~
	END
	
	IF ~~ madeProgress
		SAY ~~
	END
	
	IF ~~ tellAboutBook
		SAY ~~
	END
	
	IF ~~ pleaseCharge
		SAY ~~
	END
	
	IF ~~ sellNotCharged
		SAY ~~
	END
	
	IF ~~ sell15000
		SAY ~~
	END
	
	IF ~~ sell10000
		SAY ~~
	END
	
	IF ~~ sell5000
		SAY ~~
	END
	
	IF ~~ sell1000
		SAY ~~
	END
END

EXTEND_BOTTOM ??? ???
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",0)~
		+ ~Found book.~ + foundBook0
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",1)~
		+ ~Found book.~ + foundBook1
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",2)~
		+ ~Found book.~ + foundBook2
	// lazarus is researching, timer not done
	+ ~OR(2)
			Global("kla#book01","GLOBAL",9)
			Global("kla#book01","GLOBAL",10)
		GlobalTimerNotExpired("kla#book01Timer","GLOBAL")~
		+ ~you done?~ + noProgress
	// lazarus is researching, timer done
	+ ~OR(2)
			Global("kla#book01","GLOBAL",9)
			Global("kla#book01","GLOBAL",10)
		GlobalTimerExpired("kla#book01Timer","GLOBAL")~
		+ ~you done?~ DO ~SetGlobal("kla#book01","GLOBAL",18)~ + madeProgress
	// lazarus knows not, player does, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		GlobalGT("kla#book01","GLOBAL",10)
		!Global("kla#book01","GLOBAL",18)
		!Global("kla#book01","GLOBAL",19)
		!Global("kla#book01","GLOBAL",20)
		!Global("kla#book01","GLOBAL",21)
		!Global("kla#book01","GLOBAL",22)
		!Global("kla#book01","GLOBAL",23)
		!Global("kla#book01","GLOBAL",24)
		!Global("kla#book01","GLOBAL",25)~
		+ ~cool book, ye ken?~ DO ~IncrementGlobal("kla#book01","GLOBAL",8)~ + tellAboutBook
	// lazarus knows, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please charge.~ + pleaseCharge
	// lazarus knows, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please buy.~ + sellNotCharged
	// lazarus knows, book fully charged, full magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		GlobalGT("kla#book01Points","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please buy.~ + sell15000
	// lazarus knows, book fully charged, half magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",95)
		GlobalGT("kla#book01Points","GLOBAL",47)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please buy.~ + sell10000
	// lazarus knows, book fully charged, some magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",47)
		GlobalGT("kla#book01Points","GLOBAL",5)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please buy.~ + sell5000
	// lazarus knows, book fully charged, no magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",5)
		OR(8)
			Global("kla#book01","GLOBAL",18)
			Global("kla#book01","GLOBAL",19)
			Global("kla#book01","GLOBAL",20)
			Global("kla#book01","GLOBAL",21)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ ~please buy.~ + sell1000
END



