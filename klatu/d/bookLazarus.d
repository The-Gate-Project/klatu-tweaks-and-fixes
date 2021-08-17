
APPEND 25SPELL
	IF ~~ foundBook0
		SAY @0
		=
		@1
		=
		@2
		=
		@3
		++ @4 + foundBook00
		++ @5 + goodbye
	END
	
	IF ~~ foundBook00
		SAY @6
		=
		@7
		++ @8 DO ~TakePartyItem("kla#bk01")
							DestroyItem("kla#bk01")
							SetGlobal("kla#book01","GLOBAL",7)
							SetGlobalTimer("kla#book01Timer","GLOBAL",21600)~ + bookReceived
		++ @9 + goodbye
	END
	
	IF ~~ bookReceived
		SAY @10
		IF ~~ EXIT
	END
	
	IF ~~ goodbye
		SAY @11
		IF ~~ EXIT
	END
	
	IF ~~ noProgress
		SAY @12
		IF ~~ EXIT
	END
	
	IF ~~ madeProgress
		SAY @13
		=
		@14
		=
		@15
		++ @16 DO ~GiveItemCreate("kla#bk01",LastTalkedToBy,1,0,0)~ + madeProgress1
	END
	
	IF ~~ madeProgress1
		SAY @17
		=
		@18
		=
		@19
		=
		@20
		=
		@21
		++ @22 + madeProgress2
	END
	
	IF ~~ madeProgress2
		SAY @23
		=
		@24
		++ @25 + madeProgress3
	END
	
	IF ~~ madeProgress3
		SAY @26
		=
		@27
		=
		@28
		IF ~~ EXIT
	END
	
	IF ~~ tellAboutBook
		SAY @29
		=
		@30
		=
		@31
		=
		@32
		IF ~~ EXIT
	END
	
	IF ~~ pleaseCharge
		SAY @33
		IF ~~ + bookCharge0
	END
	
	IF ~~ bookCharge0
		SAY @34
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h02")~   + @1000 DO ~TakePartyItem("sw1h02")   DestroyItem("sw1h02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h42")~   + @1001 DO ~TakePartyItem("sw1h42")   DestroyItem("sw1h42")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h72")~   + @1002 DO ~TakePartyItem("sw1h72")   DestroyItem("sw1h72")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h05")~   + @1003 DO ~TakePartyItem("sw1h05")   DestroyItem("sw1h05")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h41")~   + @1004 DO ~TakePartyItem("sw1h41")   DestroyItem("sw1h41")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h73")~   + @1005 DO ~TakePartyItem("sw1h73")   DestroyItem("sw1h73")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h08")~   + @1006 DO ~TakePartyItem("sw1h08")   DestroyItem("sw1h08")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h09")~   + @1007 DO ~TakePartyItem("sw1h09")   DestroyItem("sw1h09")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h74")~   + @1008 DO ~TakePartyItem("sw1h74")   DestroyItem("sw1h74")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("ax1h02")~   + @1009 DO ~TakePartyItem("ax1h02")   DestroyItem("ax1h02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ax1h03")~   + @1010 DO ~TakePartyItem("ax1h03")   DestroyItem("ax1h03")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ax1h17")~   + @1011 DO ~TakePartyItem("ax1h17")   DestroyItem("ax1h17")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw2h02")~   + @1012 DO ~TakePartyItem("sw2h02")   DestroyItem("sw2h02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw2h11")~   + @1013 DO ~TakePartyItem("sw2h11")   DestroyItem("sw2h11")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw2h20")~   + @1014 DO ~TakePartyItem("sw2h20")   DestroyItem("sw2h20")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h44")~   + @1015 DO ~TakePartyItem("sw1h44")   DestroyItem("sw1h44")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h55")~   + @1016 DO ~TakePartyItem("sw1h55")   DestroyItem("sw1h55")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h75")~   + @1017 DO ~TakePartyItem("sw1h75")   DestroyItem("sw1h75")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h22")~   + @1018 DO ~TakePartyItem("sw1h22")   DestroyItem("sw1h22")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h55")~ + @1019 DO ~TakePartyItem("ohsw1h55") DestroyItem("ohsw1h55")~ + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h76")~   + @1020 DO ~TakePartyItem("sw1h76")   DestroyItem("sw1h76")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h47")~   + @1021 DO ~TakePartyItem("sw1h47")   DestroyItem("sw1h47")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h51")~ + @1022 DO ~TakePartyItem("ohsw1h51") DestroyItem("ohsw1h51")~ + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohsw1h52")~ + @1023 DO ~TakePartyItem("ohsw1h52") DestroyItem("ohsw1h52")~ + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h49")~   + @1024 DO ~TakePartyItem("sw1h49")   DestroyItem("sw1h49")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h53")~ + @1025 DO ~TakePartyItem("ohsw1h53") DestroyItem("ohsw1h53")~ + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohsw1h54")~ + @1026 DO ~TakePartyItem("ohsw1h54") DestroyItem("ohsw1h54")~ + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("dagg02")~   + @1027 DO ~TakePartyItem("dagg02")   DestroyItem("dagg02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("dagg03")~   + @1028 DO ~TakePartyItem("dagg03")   DestroyItem("dagg03")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("dagg24")~   + @1029 DO ~TakePartyItem("dagg24")   DestroyItem("dagg24")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("hamm02")~   + @1030 DO ~TakePartyItem("hamm02")   DestroyItem("hamm02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("hamm03")~   + @1031 DO ~TakePartyItem("hamm03")   DestroyItem("hamm03")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("hamm12")~   + @1032 DO ~TakePartyItem("hamm12")   DestroyItem("hamm12")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("ohblun50")~ + @1033 DO ~TakePartyItem("ohblun50") DestroyItem("ohblun50")~ + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohblun51")~ + @1034 DO ~TakePartyItem("ohblun51") DestroyItem("ohblun51")~ + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun31")~   + @1035 DO ~TakePartyItem("blun31")   DestroyItem("blun31")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sper02")~   + @1036 DO ~TakePartyItem("sper02")   DestroyItem("sper02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sper05")~   + @1037 DO ~TakePartyItem("sper05")   DestroyItem("sper05")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sper06")~   + @1038 DO ~TakePartyItem("sper06")   DestroyItem("sper06")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("halb02")~   + @1039 DO ~TakePartyItem("halb02")   DestroyItem("halb02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("halb07")~   + @1040 DO ~TakePartyItem("halb07")   DestroyItem("halb07")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("halb12")~   + @1041 DO ~TakePartyItem("halb12")   DestroyItem("halb12")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun03")~   + @1042 DO ~TakePartyItem("blun03")   DestroyItem("blun03")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun13")~   + @1043 DO ~TakePartyItem("blun13")   DestroyItem("blun13")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun32")~   + @1044 DO ~TakePartyItem("blun32")   DestroyItem("blun32")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun07")~   + @1045 DO ~TakePartyItem("blun07")   DestroyItem("blun07")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun15")~   + @1046 DO ~TakePartyItem("blun15")   DestroyItem("blun15")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun34")~   + @1047 DO ~TakePartyItem("blun34")   DestroyItem("blun34")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun05")~   + @1048 DO ~TakePartyItem("blun05")   DestroyItem("blun05")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun21")~   + @1049 DO ~TakePartyItem("blun21")   DestroyItem("blun21")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun33")~   + @1050 DO ~TakePartyItem("blun33")   DestroyItem("blun33")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("staf02")~   + @1051 DO ~TakePartyItem("staf02")   DestroyItem("staf02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("staf18")~   + @1052 DO ~TakePartyItem("staf18")   DestroyItem("staf18")~   + bookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("staf06")~   + @1053 DO ~TakePartyItem("staf06")   DestroyItem("staf06")~   + bookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("staf07")~   + @1054 DO ~TakePartyItem("staf07")   DestroyItem("staf07")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("staf08")~   + @1055 DO ~TakePartyItem("staf08")   DestroyItem("staf08")~   + bookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("staf19")~   + @1056 DO ~TakePartyItem("staf19")   DestroyItem("staf19")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("xbow02")~   + @1057 DO ~TakePartyItem("xbow02")   DestroyItem("xbow02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("xbow07")~   + @1058 DO ~TakePartyItem("xbow07")   DestroyItem("xbow07")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("xbow17")~   + @1059 DO ~TakePartyItem("xbow17")   DestroyItem("xbow17")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("xbow05")~   + @1060 DO ~TakePartyItem("xbow05")   DestroyItem("xbow05")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("xbow09")~   + @1061 DO ~TakePartyItem("xbow09")   DestroyItem("xbow09")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("xbow18")~   + @1062 DO ~TakePartyItem("xbow18")   DestroyItem("xbow18")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow02")~    + @1063 DO ~TakePartyItem("bow02")    DestroyItem("bow02")~    + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow16")~    + @1064 DO ~TakePartyItem("bow16")    DestroyItem("bow16")~    + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow24")~    + @1065 DO ~TakePartyItem("bow24")    DestroyItem("bow24")~    + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow04")~    + @1066 DO ~TakePartyItem("bow04")    DestroyItem("bow04")~    + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow17")~    + @1067 DO ~TakePartyItem("bow17")    DestroyItem("bow17")~    + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow25")~    + @1068 DO ~TakePartyItem("bow25")    DestroyItem("bow25")~    + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow06")~    + @1069 DO ~TakePartyItem("bow06")    DestroyItem("bow06")~    + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow18")~    + @1070 DO ~TakePartyItem("bow18")    DestroyItem("bow18")~    + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow26")~    + @1071 DO ~TakePartyItem("bow26")    DestroyItem("bow26")~    + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("slng02")~   + @1072 DO ~TakePartyItem("slng02")   DestroyItem("slng02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("slng04")~   + @1073 DO ~TakePartyItem("slng04")   DestroyItem("slng04")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("slng10")~   + @1074 DO ~TakePartyItem("slng10")   DestroyItem("slng10")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("shld17")~   + @1075 DO ~TakePartyItem("shld17")   DestroyItem("shld17")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohshld50")~ + @1076 DO ~TakePartyItem("ohshld50") DestroyItem("ohshld50")~ + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohshld51")~ + @1077 DO ~TakePartyItem("ohshld51") DestroyItem("ohshld51")~ + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("shld02")~   + @1078 DO ~TakePartyItem("shld02")   DestroyItem("shld02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld28")~   + @1079 DO ~TakePartyItem("shld28")   DestroyItem("shld28")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("shld04")~   + @1080 DO ~TakePartyItem("shld04")   DestroyItem("shld04")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld29")~   + @1081 DO ~TakePartyItem("shld29")   DestroyItem("shld29")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("shld06")~   + @1082 DO ~TakePartyItem("shld06")   DestroyItem("shld06")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld30")~   + @1083 DO ~TakePartyItem("shld30")   DestroyItem("shld30")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("leat02")~   + @1084 DO ~TakePartyItem("leat02")   DestroyItem("leat02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("leat11")~   + @1085 DO ~TakePartyItem("leat11")   DestroyItem("leat11")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("leat12")~   + @1086 DO ~TakePartyItem("leat12")   DestroyItem("leat12")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("leat05")~   + @1087 DO ~TakePartyItem("leat05")   DestroyItem("leat05")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("leat07")~   + @1088 DO ~TakePartyItem("leat07")   DestroyItem("leat07")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohleat53")~ + @1089 DO ~TakePartyItem("ohleat53") DestroyItem("ohleat53")~ + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("chan02")~   + @1090 DO ~TakePartyItem("chan02")   DestroyItem("chan02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("chan08")~   + @1091 DO ~TakePartyItem("chan08")   DestroyItem("chan08")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("chan07")~   + @1092 DO ~TakePartyItem("chan07")   DestroyItem("chan07")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("chan05")~   + @1093 DO ~TakePartyItem("chan05")   DestroyItem("chan05")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohchan50")~ + @1094 DO ~TakePartyItem("ohchan50") DestroyItem("ohchan50")~ + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("plat02")~   + @1095 DO ~TakePartyItem("plat02")   DestroyItem("plat02")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("plat11")~   + @1096 DO ~TakePartyItem("plat11")   DestroyItem("plat11")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("plat05")~   + @1097 DO ~TakePartyItem("plat05")   DestroyItem("plat05")~   + bookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("plat14")~   + @1098 DO ~TakePartyItem("plat14")   DestroyItem("plat14")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("plat23")~   + @1099 DO ~TakePartyItem("plat23")   DestroyItem("plat23")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("clck09")~   + @1100 DO ~TakePartyItem("clck09")   DestroyItem("clck09")~   + bookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("clck10")~   + @1101 DO ~TakePartyItem("clck10")   DestroyItem("clck10")~   + bookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("clck11")~   + @1102 DO ~TakePartyItem("clck11")   DestroyItem("clck11")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("clck12")~   + @1103 DO ~TakePartyItem("clck12")   DestroyItem("clck12")~   + bookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("clck13")~   + @1104 DO ~TakePartyItem("clck13")   DestroyItem("clck13")~   + bookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("clck14")~   + @1105 DO ~TakePartyItem("clck14")   DestroyItem("clck14")~   + bookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("clck15")~   + @1106 DO ~TakePartyItem("clck15")   DestroyItem("clck15")~   + bookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("clck16")~   + @1107 DO ~TakePartyItem("clck16")   DestroyItem("clck16")~   + bookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("clck17")~   + @1108 DO ~TakePartyItem("clck17")   DestroyItem("clck17")~   + bookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("clck01")~   + @1109 DO ~TakePartyItem("clck01")   DestroyItem("clck01")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("clck02")~   + @1110 DO ~TakePartyItem("clck02")   DestroyItem("clck02")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("ring06")~   + @1111 DO ~TakePartyItem("ring06")   DestroyItem("ring06")~   + bookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ring07")~   + @1112 DO ~TakePartyItem("ring07")   DestroyItem("ring07")~   + bookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("amul14")~   + @1113 DO ~TakePartyItem("amul14")   DestroyItem("amul14")~   + bookCharge1
		++ @35 + bookChargeBye
	END
	
	IF ~~ bookChargeBye
		SAY @36
		IF ~~ EXIT
	END
	
	IF ~~ bookCharge1
		SAY @37
		=
		@38
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",94)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",1)
				IncrementGlobal("kla#book01Points","GLOBAL",1)
				TakePartyGold(1000)
				DestroyGold(1000)~ EXIT
		IF ~GlobalGT("kla#book01Charge","GLOBAL",94)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",1)
				IncrementGlobal("kla#book01Points","GLOBAL",1)
				TakePartyGold(1000)
				DestroyGold(1000)~ + bookChargeDone
	END
	
	IF ~~ bookCharge2
		SAY @39
		=
		@38
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",93)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",2)
				IncrementGlobal("kla#book01Points","GLOBAL",2)
				TakePartyGold(2000)
				DestroyGold(2000)~ EXIT
		IF ~GlobalGT("kla#book01Charge","GLOBAL",93)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",2)
				IncrementGlobal("kla#book01Points","GLOBAL",2)
				TakePartyGold(2000)
				DestroyGold(2000)~ + bookChargeDone
	END
	
	IF ~~ bookCharge3
		SAY @40
		=
		@38
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",92)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",3)
				IncrementGlobal("kla#book01Points","GLOBAL",3)
				TakePartyGold(3000)
				DestroyGold(3000)~ EXIT
		IF ~GlobalGT("kla#book01Charge","GLOBAL",92)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",3)
				IncrementGlobal("kla#book01Points","GLOBAL",3)
				TakePartyGold(3000)
				DestroyGold(3000)~ + bookChargeDone
	END
	
	IF ~~ bookChargeDone
		SAY @41
		=
		@42
		IF ~~ EXIT
	END
	
	IF ~~ dealA
		SAY @43
		++ @44 DO ~TakePartyItem("kla#bk01")
				DestroyItem("kla#bk01")
				GivePartyGold(5000)~ + dealDone
		++ @45 + noSellBye
	END
	
	IF ~~ dealB
		SAY @46
		++ @44 DO ~TakePartyItem("kla#bk01")
				DestroyItem("kla#bk01")
				GivePartyGold(15000)~ + dealDone
		++ @45 + noSellBye
	END
	
	IF ~~ dealC
		SAY @47
		++ @44 DO ~TakePartyItem("kla#bk01")
				DestroyItem("kla#bk01")
				GivePartyGold(10000)~ + dealDone
		++ @45 + noSellBye
	END
	
	IF ~~ dealD
		SAY @48
		++ @44 DO ~TakePartyItem("kla#bk01")
				DestroyItem("kla#bk01")
				GivePartyGold(5000)~ + dealDone
		++ @45 + noSellBye
	END
	
	IF ~~ dealE
		SAY @49
		++ @44 DO ~TakePartyItem("kla#bk01")
				DestroyItem("kla#bk01")
				GivePartyGold(5000)~ + dealDone
		++ @45 + noSellBye
	END
	
	IF ~~ dealDone
		SAY @50
		=
		@51
		IF ~~ EXIT
	END
	
	IF ~~ noSellBye
		SAY @52
		IF ~~ EXIT
	END
END

EXTEND_BOTTOM 25SPELL 1
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",0)~
		+ @53 + foundBook0
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",1)~
		+ @54 + foundBook0
	+ ~PartyHasItem("kla#bk01") Global("kla#book01","GLOBAL",2)~
		+ @55 + foundBook0
	// lazarus is researching, timer not done
	+ ~Global("kla#book01","GLOBAL",7)
		GlobalTimerNotExpired("kla#book01Timer","GLOBAL")~
		+ @56 + noProgress
	// lazarus is researching, timer done
	+ ~Global("kla#book01","GLOBAL",7)
		GlobalTimerExpired("kla#book01Timer","GLOBAL")~
		+ @56 DO ~SetGlobal("kla#book01","GLOBAL",14)~ + madeProgress
	// lazarus knows not, player does, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		GlobalGT("kla#book01","GLOBAL",10)
		!Global("kla#book01","GLOBAL",14)
		!Global("kla#book01","GLOBAL",15)
		!Global("kla#book01","GLOBAL",16)
		!Global("kla#book01","GLOBAL",17)
		!Global("kla#book01","GLOBAL",22)
		!Global("kla#book01","GLOBAL",23)
		!Global("kla#book01","GLOBAL",24)
		!Global("kla#book01","GLOBAL",25)~
		+ @57 DO ~IncrementGlobal("kla#book01","GLOBAL",4)~ + tellAboutBook
	// lazarus knows, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @58 + pleaseCharge
	// lazarus knows, book not fully charged
	+ ~PartyHasItem("kla#bk01")
		!GlobalGT("kla#book01Charge","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @59 + dealA
	// lazarus knows, book fully charged, full magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		GlobalGT("kla#book01Points","GLOBAL",95)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @59 + dealB
	// lazarus knows, book fully charged, half magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",95)
		GlobalGT("kla#book01Points","GLOBAL",47)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @59 + dealC
	// lazarus knows, book fully charged, some magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",47)
		GlobalGT("kla#book01Points","GLOBAL",5)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @59 + dealD
	// lazarus knows, book fully charged, no magic
	+ ~PartyHasItem("kla#bk01")
		GlobalGT("kla#book01Charge","GLOBAL",95)
		!GlobalGT("kla#book01Points","GLOBAL",5)
		OR(8)
			Global("kla#book01","GLOBAL",14)
			Global("kla#book01","GLOBAL",15)
			Global("kla#book01","GLOBAL",16)
			Global("kla#book01","GLOBAL",17)
			Global("kla#book01","GLOBAL",22)
			Global("kla#book01","GLOBAL",23)
			Global("kla#book01","GLOBAL",24)
			Global("kla#book01","GLOBAL",25)~
		+ @59 + dealE
END
