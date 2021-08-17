
APPEND %outer_dialog%
	IF ~~ helpSort1
		SAY @0
			= @1
		IF ~~ DO ~ChangeAIScript("KLA#SORT",CLASS)
SetGlobal("kla#AISorting","GLOBAL",1)
SetGlobal("kla#AISortingCount","GLOBAL",0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)
CreateCreature("kl#csort",[-1.-1],0)~ EXIT
	END
	
	IF WEIGHT #-5000 ~!Global("kla#AISorting","GLOBAL",0)~ helpSort2
		SAY @2
		IF ~~ EXIT
	END
END

EXTEND_BOTTOM %outer_dialog% 1
	+ ~~ + @3 + helpSort1
END
