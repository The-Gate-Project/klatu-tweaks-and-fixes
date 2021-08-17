
// add to thalan.dlg state 3

APPEND THALAN
	IF ~~ thalanBook0
		SAY ~So you come to me without having exerted any effort on your part.~
		=
		~What have I done to deserve these unceasing interruptions? Pray tell, what was it that gave you the impression that I enjoy wasting my precious time with every scrap of text some fool peon stumbles across?~
		+ ~I-~ + thalanBook00
		+ ~But-~ + thalanBook00
		+ ~What-~ + thalanBook00
		+ ~You-~ + thalanBook00
	END
	
	IF ~~ thalanBook00
		SAY ~Was it my sunny disposition, perhaps? Mmh?~
		+ ~N-No?~ + thalanBook01
		+ ~Uhmm... yes?~ + thalanBook04
	END
	
	IF ~~ thalanBook01
		SAY ~Maybe you mistook my golems for a welcoming committee, then?~
		+ ~No, sir.~ + thalanBook02
		+ ~Yes, sir.~ + thalanBook04
	END
	
	IF ~~ thalanBook02
		SAY ~Or maybe you thought I lived in the back end of nowhere because I so enjoy unexpected company?~
		+ ~...I'm sorry, sir.~ + thalanBook03
		+ ~Who wouldn't?~ + thalanBook04
	END
	
	IF ~~ thalanBook03
		SAY ~...Oh, fine! Show me the damn book, so we can be done with this.~
		+ ~Here you go.~ + thalanBookGiven
		+ ~Nah, I changed my mind.~ + thalanBook04
	END
	
	IF ~~ thalanBook04
		SAY ~...Unbelievable.~
		=
		~Leave my home! Don't return unless you have some actual business to discuss.~ EXIT
	END
	
	IF ~~ thalanBookGiven
		SAY ~...Mhrm. Interesting. This tome is clearly magical, though much of its energy is inert.~
		=
		~And 'tis written in an elven dialect I am not familiar with. Where did you get this?~
		=
		~No matter. Not much I can tell you at the moment. Leave it here and return in a few days time. I should have something more insightful to say then.~
		IF ~GlobalLT("kla#book01","GLOBAL",2)~ DO ~TakePartyItem("kla#bk01") DestroyItem("kla#bk01") SetGlobal("kla#book01","GLOBAL",3) SetGlobalTimer("kla#book01Timer","GLOBAL",21600)~ EXIT
		IF ~!GlobalLT("kla#book01","GLOBAL",2)~ DO ~TakePartyItem("kla#bk01") DestroyItem("kla#bk01") SetGlobal("kla#book01","GLOBAL",4) SetGlobalTimer("kla#book01Timer","GLOBAL",21600)~ EXIT
	END
	
	IF ~~ thalanBook1
		SAY ~And of course you immediately thought of old Thalantyr, who clearly has nothing better to do than to do your reading for you. Feh! Why are you bothering me with this?~
		+ ~Well, the tome appears to be magical, but we were unable to really gain much insight. A mage of your experience might have more luck.~ + thalanBook03
		+ ~You are clearly in no mood. Perhaps later.~ + thalanBye
	END
	
	IF ~~ thalanBook2
		SAY ~I am sure that might be of interest to someone, but not to me. I am a mage and very busy. And I do not concern myself with such crude subject matter. Why would I have any insight?~
		+ ~This might surprise you, but the book contains some highly theoretical and rigorously researched chapters on a multitude of topics that I daresay even you might learn from. What concerns us, however, is the nature of the enchantment placed on it and we would seek your counsel.~ + thalanBook03
		+ ~You are clearly in no mood. Perhaps later.~ + thalanBye
	END
	
	IF ~~ thalanBye
		SAY ~Then stop pestering me and let get back to my studies.~ EXIT
	END
	
	IF ~~ thalanBookNotReady
		SAY ~Some. But there is still work to be done. So be patient and stop pestering me about it.~ EXIT
	END
	
	IF ~~ thalanBookReady
		SAY ~Yes. And I daresay I regret my earlier reluctance to inspect the tome.~
		=
		~Here, take the book back and guard it well. What you are holding there is a veritable treasure.~
		+ ~Thanks. So what did you learn?~ + DO ~GiveItemCreate("kla#bk01",LastTalkedToBy,1,0,0)~ thalanBookReady1
	END
	
	IF ~~ thalanBookReady1
		SAY ~The book itself is a collection of theoretical and practical analyses of all sorts of wartime strategies, combat maneuvers, survival tactics and other such matters. As such it would be valuable to any leader or commander in the Realms. And as a personal recollection of the author's campaign against the orcish hordes, it would be valuable to any historian worth a damn.~
		IF ~Global("kla#book01","GLOBAL",4)~ + thalanBookReady1b
		IF ~!Global("kla#book01","GLOBAL",4)~ + thalanBookReady2
	END
	
	IF ~~ thalanBookReady1b
		SAY ~This much you must have already gleamed from your own studies, if I am correct.~
		IF ~~ + thalanBookReady2
	END
	
	IF ~~ thalanBookReady2
		SAY ~But as you were surely hoping, the true value lies in the book's enchantment.~
		=
		~From what few references I was able find to the author, a certain weapons master named Kaylessa, I have come to believe that powerful magic was used in order to bind her experience to this tome and probably to other similar such artifacts. Such items were likely used to grant the reader part of her experience and skill.~
		=
		~Such a feat would have enabled any army to become a fearsome force in a short amount of time. However, enchantments of this sort are fickle and require vast amounts of magical energy. Frankly, I am surprised that the books magic has not died with its author.~
		+ ~So you think this book could be used to enhance someone's abilities on the battlefield?~ + thalanBookReady3
	END
	
	IF ~~ thalanBookReady3
		SAY ~That depends. Namely on the reader's quickness of mind and arcane affinity. A mage will likely have little trouble harnessing the book's secrets. But someone more... limited in perspective might find it hard to open their mind to such an invasive assault on the self. The knowledge would be imposed quite violently and a lesser will might break under the pressure.~
		=
		~But all of this is mere conjecture until put to the test. Unfortunately, the book's magic has faded almost completely and while awakening the enchantment is within my ability, it is well outside my budget.~
		+ ~What are my options, then?~ + thalanBookReady4
	END
	
	IF ~~ thalanBookReady4
		SAY ~Up to you. If you see no use for this tome, I would be ready to pay you 5,000 gp for it right now.~
		=
		~Or I can assist you in awakening its powers. For a fair price, of course. The more esoteric components required for such a ritual are not cheap.~
		+ ~5,000 gp?! Sold!~ + DO ~GivePartyGold(5000)~ + thalanBookReady5
		+ ~Make it 10,000 gp and we have a deal, old man.~ + thalanBookReady6
		+ ~What would be required for the ritual?~ + thalanBookReady7
	END
	
	IF ~~ thalanBookReady5
		SAY ~Here you go, then. A pleasure doing business.~ DO ~TakePartyItem("kla#bk01") DestroyItem("kla#bk01")~
		IF ~~ EXIT
	END
	
	IF ~~ thalanBookReady6
		SAY ~Bah. I can give you 7,500 gp. No more.~ 
		+ ~Good enough.~ + DO ~GivePartyGold(7500)~ + thalanBookReady5
		+ ~On second thought, I'd rather try to renew its energies.~ + thalanBookReady7
		IF ~~ EXIT
	END
	
	IF ~~ thalanBookReady7
		SAY ~Very well. We will require a vast amount of magical energies in order to wake the artifact's inert powers. Bring me any enchanted item you come across. But only non-descript ones, if you please. I am not inclined to destroy items with a history.~
		=
		~I have the rituals prepared and my personal stock of spell components will suffice. But you will need to compensate me for my services. I imagine that charging the book to its fullest potential will be quite expensive.~
		=
		~Return when you are ready to begin.~
		IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",5)~ EXIT
	END
	
	IF ~~ thalanBookCharge
		SAY ~Good. I have already prepared the rituals. Spell components I can take from my personal stock. But I need compensation.~
		=
		~I can transfuse minor enchantments for a fee of 1,000 gp. Items with more energy will require a fee of 2,000 gp. And truly powerful ones will cost you 3,000 gp. You may need to turn in more than one item in order to restore enough energy for the book to become useful to you, perhaps even dozens. I can only guess at the amount of energy this tome once held.~
		IF ~~ thalanBookCharge0
	END
	
	IF ~~ thalanBookCharge0
		SAY ~Some of the book's magic is still inert. What item of power can you offer me?~
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h02")~   + ~Take this Bastard Sword +1.~					DO ~TakePartyItem("sw1h02")   DestroyItem("sw1h02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h42")~   + ~Take this Bastard Sword +2.~					DO ~TakePartyItem("sw1h42")   DestroyItem("sw1h42")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h72")~   + ~Take this Bastard Sword +3.~					DO ~TakePartyItem("sw1h72")   DestroyItem("sw1h72")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h05")~   + ~Take this Long Sword +1.~						DO ~TakePartyItem("sw1h05")   DestroyItem("sw1h05")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h41")~   + ~Take this Long Sword +2.~						DO ~TakePartyItem("sw1h41")   DestroyItem("sw1h41")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h73")~   + ~Take this Long Sword +3.~						DO ~TakePartyItem("sw1h73")   DestroyItem("sw1h73")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h08")~   + ~Take this Short Sword +1.~					DO ~TakePartyItem("sw1h08")   DestroyItem("sw1h08")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h09")~   + ~Take this Short Sword +2.~					DO ~TakePartyItem("sw1h09")   DestroyItem("sw1h09")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h74")~   + ~Take this Short Sword +3.~					DO ~TakePartyItem("sw1h74")   DestroyItem("sw1h74")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("ax1h02")~   + ~Take this Battle Axe +1.~						DO ~TakePartyItem("ax1h02")   DestroyItem("ax1h02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ax1h03")~   + ~Take this Battle Axe +2.~						DO ~TakePartyItem("ax1h03")   DestroyItem("ax1h03")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ax1h17")~   + ~Take this Battle Axe +3.~						DO ~TakePartyItem("ax1h17")   DestroyItem("ax1h17")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw2h02")~   + ~Take this Two-Handed Sword +1.~				DO ~TakePartyItem("sw2h02")   DestroyItem("sw2h02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw2h11")~   + ~Take this Two-Handed Sword +2.~				DO ~TakePartyItem("sw2h11")   DestroyItem("sw2h11")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw2h20")~   + ~Take this Two-Handed Sword +3.~				DO ~TakePartyItem("sw2h20")   DestroyItem("sw2h20")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h44")~   + ~Take this Katana +1.~							DO ~TakePartyItem("sw1h44")   DestroyItem("sw1h44")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sw1h55")~   + ~Take this Katana +2.~							DO ~TakePartyItem("sw1h55")   DestroyItem("sw1h55")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h75")~   + ~Take this Katana +3.~							DO ~TakePartyItem("sw1h75")   DestroyItem("sw1h75")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h22")~   + ~Take this Scimitar +1.~						DO ~TakePartyItem("sw1h22")   DestroyItem("sw1h22")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h55")~ + ~Take this Scimitar +2.~						DO ~TakePartyItem("ohsw1h55") DestroyItem("ohsw1h55")~ + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sw1h76")~   + ~Take this Scimitar +3.~						DO ~TakePartyItem("sw1h76")   DestroyItem("sw1h76")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h47")~   + ~Take this Wakizashi +1.~						DO ~TakePartyItem("sw1h47")   DestroyItem("sw1h47")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h51")~ + ~Take this Wakizashi +2.~						DO ~TakePartyItem("ohsw1h51") DestroyItem("ohsw1h51")~ + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohsw1h52")~ + ~Take this Wakizashi +3.~						DO ~TakePartyItem("ohsw1h52") DestroyItem("ohsw1h52")~ + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sw1h49")~   + ~Take this Ninjatō +1.~						DO ~TakePartyItem("sw1h49")   DestroyItem("sw1h49")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohsw1h53")~ + ~Take this Ninjatō +2.~						DO ~TakePartyItem("ohsw1h53") DestroyItem("ohsw1h53")~ + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohsw1h54")~ + ~Take this Ninjatō +3.~						DO ~TakePartyItem("ohsw1h54") DestroyItem("ohsw1h54")~ + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("dagg02")~   + ~Take this Dagger +1.~							DO ~TakePartyItem("dagg02")   DestroyItem("dagg02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("dagg03")~   + ~Take this Dagger +2.~							DO ~TakePartyItem("dagg03")   DestroyItem("dagg03")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("dagg24")~   + ~Take this Dagger +3.~							DO ~TakePartyItem("dagg24")   DestroyItem("dagg24")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("hamm02")~   + ~Take this War Hammer +1.~						DO ~TakePartyItem("hamm02")   DestroyItem("hamm02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("hamm03")~   + ~Take this War Hammer +2.~						DO ~TakePartyItem("hamm03")   DestroyItem("hamm03")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("hamm12")~   + ~Take this War Hammer +3.~						DO ~TakePartyItem("hamm12")   DestroyItem("hamm12")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("ohblun50")~ + ~Take this Club +1.~							DO ~TakePartyItem("ohblun50") DestroyItem("ohblun50")~ + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohblun51")~ + ~Take this Club +2.~							DO ~TakePartyItem("ohblun51") DestroyItem("ohblun51")~ + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun31")~   + ~Take this Club +3.~							DO ~TakePartyItem("blun31")   DestroyItem("blun31")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("sper02")~   + ~Take this Spear +1.~							DO ~TakePartyItem("sper02")   DestroyItem("sper02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("sper05")~   + ~Take this Spear +2.~							DO ~TakePartyItem("sper05")   DestroyItem("sper05")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("sper06")~   + ~Take this Spear +3.~							DO ~TakePartyItem("sper06")   DestroyItem("sper06")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("halb02")~   + ~Take this Halberd +1.~						DO ~TakePartyItem("halb02")   DestroyItem("halb02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("halb07")~   + ~Take this Halberd +2.~						DO ~TakePartyItem("halb07")   DestroyItem("halb07")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("halb12")~   + ~Take this Halberd +3.~						DO ~TakePartyItem("halb12")   DestroyItem("halb12")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun03")~   + ~Take this Flail +1.~							DO ~TakePartyItem("blun03")   DestroyItem("blun03")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun13")~   + ~Take this Flail +2.~							DO ~TakePartyItem("blun13")   DestroyItem("blun13")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun32")~   + ~Take this Flail +3.~							DO ~TakePartyItem("blun32")   DestroyItem("blun32")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun07")~   + ~Take this Morning Star +1.~					DO ~TakePartyItem("blun07")   DestroyItem("blun07")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun15")~   + ~Take this Morning Star +2.~					DO ~TakePartyItem("blun15")   DestroyItem("blun15")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun34")~   + ~Take this Morning Star +3.~					DO ~TakePartyItem("blun34")   DestroyItem("blun34")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("blun05")~   + ~Take this Mace +1.~							DO ~TakePartyItem("blun05")   DestroyItem("blun05")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("blun21")~   + ~Take this Mace +2.~							DO ~TakePartyItem("blun21")   DestroyItem("blun21")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("blun33")~   + ~Take this Mace +3.~							DO ~TakePartyItem("blun33")   DestroyItem("blun33")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("staf02")~   + ~Take this Quarterstaff +1.~					DO ~TakePartyItem("staf02")   DestroyItem("staf02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("staf18")~   + ~Take this Quarterstaff +2.~					DO ~TakePartyItem("staf18")   DestroyItem("staf18")~   + thalanBookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("staf06")~   + ~Take this Staff Mace +2.~						DO ~TakePartyItem("staf06")   DestroyItem("staf06")~   + thalanBookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("staf07")~   + ~Take this Staff Spear +2.~					DO ~TakePartyItem("staf07")   DestroyItem("staf07")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("staf08")~   + ~Take this Martial Staff +3.~					DO ~TakePartyItem("staf08")   DestroyItem("staf08")~   + thalanBookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("staf19")~   + ~Take this Cleric's Staff +3.~					DO ~TakePartyItem("staf19")   DestroyItem("staf19")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("xbow02")~   + ~Take this Heavy Crossbow +1.~					DO ~TakePartyItem("xbow02")   DestroyItem("xbow02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("xbow07")~   + ~Take this Heavy Crossbow +2.~					DO ~TakePartyItem("xbow07")   DestroyItem("xbow07")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("xbow17")~   + ~Take this Heavy Crossbow +3.~					DO ~TakePartyItem("xbow17")   DestroyItem("xbow17")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("xbow05")~   + ~Take this Light Crossbow +1.~					DO ~TakePartyItem("xbow05")   DestroyItem("xbow05")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("xbow09")~   + ~Take this Light Crossbow +2.~					DO ~TakePartyItem("xbow09")   DestroyItem("xbow09")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("xbow18")~   + ~Take this Light Crossbow +3.~					DO ~TakePartyItem("xbow18")   DestroyItem("xbow18")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow02")~    + ~Take this Composite Longbow +1.~				DO ~TakePartyItem("bow02")    DestroyItem("bow02")~    + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow16")~    + ~Take this Composite Longbow +2.~				DO ~TakePartyItem("bow16")    DestroyItem("bow16")~    + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow24")~    + ~Take this Composite Longbow +3.~				DO ~TakePartyItem("bow24")    DestroyItem("bow24")~    + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow04")~    + ~Take this Longbow +1.~						DO ~TakePartyItem("bow04")    DestroyItem("bow04")~    + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow17")~    + ~Take this Longbow +2.~						DO ~TakePartyItem("bow17")    DestroyItem("bow17")~    + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow25")~    + ~Take this Longbow +3.~						DO ~TakePartyItem("bow25")    DestroyItem("bow25")~    + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("bow06")~    + ~Take this Shortbow +1.~						DO ~TakePartyItem("bow06")    DestroyItem("bow06")~    + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("bow18")~    + ~Take this Shortbow +2.~						DO ~TakePartyItem("bow18")    DestroyItem("bow18")~    + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("bow26")~    + ~Take this Shortbow +3.~						DO ~TakePartyItem("bow26")    DestroyItem("bow26")~    + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("slng02")~   + ~Take this Sling +1.~							DO ~TakePartyItem("slng02")   DestroyItem("slng02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("slng04")~   + ~Take this Sling +2.~							DO ~TakePartyItem("slng04")   DestroyItem("slng04")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("slng10")~   + ~Take this Sling +3.~							DO ~TakePartyItem("slng10")   DestroyItem("slng10")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("shld17")~   + ~Take this Buckler +1.~						DO ~TakePartyItem("shld17")   DestroyItem("shld17")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohshld50")~ + ~Take this Buckler +2.~						DO ~TakePartyItem("ohshld50") DestroyItem("ohshld50")~ + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohshld51")~ + ~Take this Buckler +3.~						DO ~TakePartyItem("ohshld51") DestroyItem("ohshld51")~ + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("shld02")~   + ~Take this Small Shield +1.~					DO ~TakePartyItem("shld02")   DestroyItem("shld02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld28")~   + ~Take this Small Shield +2.~					DO ~TakePartyItem("shld28")   DestroyItem("shld28")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("shld04")~   + ~Take this Medium Shield +1.~					DO ~TakePartyItem("shld04")   DestroyItem("shld04")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld29")~   + ~Take this Medium Shield +2.~					DO ~TakePartyItem("shld29")   DestroyItem("shld29")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("shld06")~   + ~Take this Large Shield +1.~					DO ~TakePartyItem("shld06")   DestroyItem("shld06")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("shld30")~   + ~Take this Large Shield +2.~					DO ~TakePartyItem("shld30")   DestroyItem("shld30")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("leat02")~   + ~Take this Leather Armor +1.~					DO ~TakePartyItem("leat02")   DestroyItem("leat02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("leat11")~   + ~Take this Leather Armor +2.~					DO ~TakePartyItem("leat11")   DestroyItem("leat11")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("leat12")~   + ~Take this Leather Armor +3.~					DO ~TakePartyItem("leat12")   DestroyItem("leat12")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("leat05")~   + ~Take this Studded Leather Armor +1.~			DO ~TakePartyItem("leat05")   DestroyItem("leat05")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("leat07")~   + ~Take this Studded Leather Armor +2.~			DO ~TakePartyItem("leat07")   DestroyItem("leat07")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("ohleat53")~ + ~Take this Studded Leather Armor +3.~			DO ~TakePartyItem("ohleat53") DestroyItem("ohleat53")~ + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("chan02")~   + ~Take this Chain Mail +1.~						DO ~TakePartyItem("chan02")   DestroyItem("chan02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("chan08")~   + ~Take this Chain Mail +2.~						DO ~TakePartyItem("chan08")   DestroyItem("chan08")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("chan07")~   + ~Take this Chain Mail +3.~						DO ~TakePartyItem("chan07")   DestroyItem("chan07")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("chan05")~   + ~Take this Splint Mail +1.~					DO ~TakePartyItem("chan05")   DestroyItem("chan05")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ohchan50")~ + ~Take this Splint Mail +2.~					DO ~TakePartyItem("ohchan50") DestroyItem("ohchan50")~ + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("plat02")~   + ~Take this Plate Mail +1.~						DO ~TakePartyItem("plat02")   DestroyItem("plat02")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("plat11")~   + ~Take this Plate Mail +2.~						DO ~TakePartyItem("plat11")   DestroyItem("plat11")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("plat05")~   + ~Take this Plate of the Dark +1.~				DO ~TakePartyItem("plat05")   DestroyItem("plat05")~   + thalanBookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("plat14")~   + ~Take this Full Plate Mail +1.~				DO ~TakePartyItem("plat14")   DestroyItem("plat14")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("plat23")~   + ~Take this Full Plate Mail +2.~				DO ~TakePartyItem("plat23")   DestroyItem("plat23")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("clck09")~   + ~Take this Mage Robe of Cold Resistance.~		DO ~TakePartyItem("clck09")   DestroyItem("clck09")~   + thalanBookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("clck10")~   + ~Take this Mage Robe of Fire Resistance.~		DO ~TakePartyItem("clck10")   DestroyItem("clck10")~   + thalanBookCharge1
		+ ~PartyGoldGT(999)  PartyHasItem("clck11")~   + ~Take this Mage Robe of Electric Resistance.~	DO ~TakePartyItem("clck11")   DestroyItem("clck11")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("clck12")~   + ~Take this Knave's Robe.~						DO ~TakePartyItem("clck12")   DestroyItem("clck12")~   + thalanBookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("clck13")~   + ~Take this Traveler's Robe.~					DO ~TakePartyItem("clck13")   DestroyItem("clck13")~   + thalanBookCharge2
		+ ~PartyGoldGT(1999) PartyHasItem("clck14")~   + ~Take this Adventurer's Robe.~					DO ~TakePartyItem("clck14")   DestroyItem("clck14")~   + thalanBookCharge2
		+ ~PartyGoldGT(2999) PartyHasItem("clck15")~   + ~Take this Robe of the Good Archmagi.~			DO ~TakePartyItem("clck15")   DestroyItem("clck15")~   + thalanBookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("clck16")~   + ~Take this Robe of the Neutral Archmagi.~		DO ~TakePartyItem("clck16")   DestroyItem("clck16")~   + thalanBookCharge3
		+ ~PartyGoldGT(2999) PartyHasItem("clck17")~   + ~Take this Robe of the Evil Archmagi.~			DO ~TakePartyItem("clck17")   DestroyItem("clck17")~   + thalanBookCharge3
		+ ~PartyGoldGT(999)  PartyHasItem("clck01")~   + ~Take this Cloak of Protection +1.~			DO ~TakePartyItem("clck01")   DestroyItem("clck01")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("clck02")~   + ~Take this Cloak of Protection +2.~			DO ~TakePartyItem("clck02")   DestroyItem("clck02")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("ring06")~   + ~Take this Ring of Protection +1.~				DO ~TakePartyItem("ring06")   DestroyItem("ring06")~   + thalanBookCharge1
		+ ~PartyGoldGT(1999) PartyHasItem("ring07")~   + ~Take this Ring of Protection +2.~				DO ~TakePartyItem("ring07")   DestroyItem("ring07")~   + thalanBookCharge2
		+ ~PartyGoldGT(999)  PartyHasItem("amul14")~   + ~Take this Amulet of Protection +1.~			DO ~TakePartyItem("amul14")   DestroyItem("amul14")~   + thalanBookCharge1
		+ ~Maybe another time.~ + thalanBookChargeBye
	END
	
	IF ~~ thalanBookChargeBye
		SAY ~Very well. Goodbye.~
		IF ~~ EXIT
	END
	
	IF ~~ thalanBookCharge1
		SAY ~A minor trinket, but it should suffice. Let me transfer the energies... There, it is done.~
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",94)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",1)
				IncrementGlobal("kla#book01Points","GLOBAL",1)
				TakePartyGold(1000)
				DestroyGold(1000)~ + thalanBookCharge0
		IF ~GlobalGT("kla#book01Charge","GLOBAL",94)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",1)
				IncrementGlobal("kla#book01Points","GLOBAL",1)
				TakePartyGold(1000)
				DestroyGold(1000)~ + thalanBookChargeDone
	END
	
	IF ~~ thalanBookCharge2
		SAY ~A powerful item, and an appropriate choice. Let me transfer the energies... There, it is done.~
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",93)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",2)
				IncrementGlobal("kla#book01Points","GLOBAL",2)
				TakePartyGold(2000)
				DestroyGold(2000)~ + thalanBookCharge0
		IF ~GlobalGT("kla#book01Charge","GLOBAL",93)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",2)
				IncrementGlobal("kla#book01Points","GLOBAL",2)
				TakePartyGold(2000)
				DestroyGold(2000)~ + thalanBookChargeDone
	END
	
	IF ~~ thalanBookCharge3
		SAY ~An impressive item, and it holds more than enough energy. Let me transfer the energies... There, it is done.~
		IF ~!GlobalGT("kla#book01Charge","GLOBAL",92)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",3)
				IncrementGlobal("kla#book01Points","GLOBAL",3)
				TakePartyGold(3000)
				DestroyGold(3000)~ + thalanBookCharge0
		IF ~GlobalGT("kla#book01Charge","GLOBAL",92)~ DO ~IncrementGlobal("kla#book01Charge","GLOBAL",3)
				IncrementGlobal("kla#book01Points","GLOBAL",3)
				TakePartyGold(3000)
				DestroyGold(3000)~ + thalanBookChargeDone
	END
	
	IF ~~ thalanBookChargeDone
		SAY ~This is it, I'm afraid. The book will not take any more energy. Use it well.~
		=
		~This has been an instructive venture. But now please excuse me, I must attend to my research.~
		IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",6)~ EXIT
	END
	
	IF ~~ thalanBookBuy1
		SAY ~This is it, I'm afraid. The book will not take any more energy. Use it well.~
		=
		~This has been an instructive venture. But now please excuse me, I must attend to my research.~
		IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",6)~ EXIT
	END
	
	IF ~~ thalanBookBuy2
		SAY ~Ha! You already used up all the energies and now you want to peddle this useless doorstopper to some hapless old fool?~
		=
		~No. ~
		IF ~~ DO ~SetGlobal("kla#book01","GLOBAL",6)~ EXIT
	END
	
END

EXTEND_BOTTOM THALAN 3
	+ ~Global("kla#book01","GLOBAL",0)
		PartyHasItem("kla#bk01")~ 
		+ ~We have found an old tome and can make neither head nor tail of it. Would you take a look?~ + thalanBook0
	+ ~Global("kla#book01","GLOBAL",1)
		PartyHasItem("kla#bk01")~ 
		+ ~We have found an old, elven tome. We managed to gleam the general contents, but maybe you could tell us more?~ + thalanBook1
	+ ~Global("kla#book01","GLOBAL",2)
		PartyHasItem("kla#bk01")~ 
		+ ~We have found an old war journal and compendium, written by an elven weapons master. We hoped you could tell us more, though.~ + thalanBook2
	+ ~OR(2) Global("kla#book01","GLOBAL",3) Global("kla#book01","GLOBAL",4) GlobalTimerNotExpired("kla#book01Timer","GLOBAL")~
		+ ~Have you made any progress with the elven manuscript?~ + thalanBookNotReady
	+ ~OR(2) Global("kla#book01","GLOBAL",3) Global("kla#book01","GLOBAL",4) GlobalTimerExpired("kla#book01Timer","GLOBAL")~
		+ ~Have you made any progress with the elven manuscript?~ + thalanBookReady
	+ ~Global("kla#book01","GLOBAL",5) PartyHasItem("kla#bk01")~
		+ ~We are ready to awaken more of the elven tome's energies.~ + thalanBookCharge
	+ ~Global("kla#book01","GLOBAL",5) PartyHasItem("kla#bk01")~
		+ ~Are you still interested in purchasing the elven tome from us?~ + thalanBookCharge
	+ ~Global("kla#book01","GLOBAL",6) PartyHasItem("kla#bk01") !GlobalGT("kla#book01Points","GLOBAL",5)~
		+ ~Are you still interested in purchasing the elven tome from us?~ + thalanBookCharge
	
	
	
END

// kla#book01
//  0 not examined book/too dumb
//  1 examined book a little
//  2 examined book proper

//  3 thalantyr is examining it, was 0 or 1 before
//  4 thalantyr is examining it, was 2 before
//  5 thalantyr has examined it
//  6 thalantyr was informed about book, was doghma
//  7 thalantyr was informed about book, was lazarus
//  8 thalantyr was informed about book, was orrick

//  9 doghma is examining it, was 0 or 1 before
// 10 doghma is examining it, was 2 before
// 11 doghma has examined it
// 12 doghma was informed about book, was thalantyr
// 13 doghma was informed about book, was lazarus
// 14 doghma was informed about book, was orrick

// 15 lazarus is examining it, was 0 or 1 before
// 16 lazarus is examining it, was 2 before
// 17 lazarus has examied it
// 18 lazarus was informed about book, was thalantyr
// 19 lazarus was informed about book, was doghma
// 20 lazarus was informed about book, was orrick

// 21 orrick is examining it, was 0 or 1 before
// 22 orrick is examining it, was 2 before
// 23 orrick has examied it
// 24 orrick was informed about book, was thalantyr
// 25 orrick was informed about book, was doghma
// 26 orrick was informed about book, was lazarus



// for each
// Global("kla#book01","GLOBAL",0)	please examine
// Global("kla#book01","GLOBAL",1)	please examine	
// Global("kla#book01","GLOBAL",2)	please examine

// thalantyr
// Global("kla#book01","GLOBAL",5) was examined by self
// OR(3)
// Global("kla#book01","GLOBAL",11)	was examined by doghma		Global("kla#book01","GLOBAL",6)
// Global("kla#book01","GLOBAL",17)	was examined by lazarus		Global("kla#book01","GLOBAL",7)
// Global("kla#book01","GLOBAL",23)	was examined by orrick		Global("kla#book01","GLOBAL",8)

// (4)
// Global("kla#book01","GLOBAL",5)
// Global("kla#book01","GLOBAL",6)
// Global("kla#book01","GLOBAL",7)
// Global("kla#book01","GLOBAL",8)	// knows the drill

// doghma
// Global("kla#book01","GLOBAL",11) was examined by self
// OR(3)
// Global("kla#book01","GLOBAL",5)	was examined by thalantyr	Global("kla#book01","GLOBAL",12)
// Global("kla#book01","GLOBAL",17)	was examined by lazarus		Global("kla#book01","GLOBAL",13)
// Global("kla#book01","GLOBAL",32)	was examined by orrick		Global("kla#book01","GLOBAL",14)

// (4)
// Global("kla#book01","GLOBAL",11)
// Global("kla#book01","GLOBAL",12)
// Global("kla#book01","GLOBAL",13)
// Global("kla#book01","GLOBAL",14)	// knows the drill

// lazarus
// Global("kla#book01","GLOBAL",17) was examined by self
// OR(3)
// Global("kla#book01","GLOBAL",5)	was examined by thalantyr	Global("kla#book01","GLOBAL",18)
// Global("kla#book01","GLOBAL",11)	was examined by doghma		Global("kla#book01","GLOBAL",19)
// Global("kla#book01","GLOBAL",32)	was examined by orrick		Global("kla#book01","GLOBAL",20)

// (4)
// Global("kla#book01","GLOBAL",17)
// Global("kla#book01","GLOBAL",18)
// Global("kla#book01","GLOBAL",19)
// Global("kla#book01","GLOBAL",20)	// knows the drill

// orrick
// Global("kla#book01","GLOBAL",23) was examined by self
// OR(3)
// Global("kla#book01","GLOBAL",5)	was examined by thalantyr	Global("kla#book01","GLOBAL",24)
// Global("kla#book01","GLOBAL",11)	was examined by doghma		Global("kla#book01","GLOBAL",25)
// Global("kla#book01","GLOBAL",17)	was examined by lazarus		Global("kla#book01","GLOBAL",26)

// (4)
// Global("kla#book01","GLOBAL",23)
// Global("kla#book01","GLOBAL",24)
// Global("kla#book01","GLOBAL",25)
// Global("kla#book01","GLOBAL",26)	// knows the drill



// table
//  0 unknown
//  1 little known
//  2 some known
//  3 thalan is researching, was 0 or 1
//  4 thalan is researching, was 2
//  5 doghma is researching, was 0 or 1
//  6 doghma is researching, was 2
//  7 lazarus is researching, was 0 or 1
//  8 lazarus is researching, was 2
//  9 orrick is researching, was 0 or 1
// 10 orrick is researching, was 2
// > 10 player knows

// T learns: +1
// D learns: +2
// L learns: +4
// O learns: +8

	O	L	D	T
	0	0	0	0		10
	0	0	0	1		11	T research
	0	0	2	0		12	D research
	0	0	2	1		13
	0	4	0	0		14	L research
	0	4	0	1		15
	0	4	2	0		16
	0	4	2	1		17
	8	0	0	0		18	O research
	8	0	0	1		19
	8	0	2	0		20
	8	0	2	1		21
	8	4	0	0		22
	8	4	0	1		23
	8	4	2	0		24
	8	4	2	1		25


// thalan knows
// OR(8)
// Global("kla#book01","GLOBAL",11)
// Global("kla#book01","GLOBAL",13)
// Global("kla#book01","GLOBAL",15)
// Global("kla#book01","GLOBAL",17)
// Global("kla#book01","GLOBAL",19)
// Global("kla#book01","GLOBAL",21)
// Global("kla#book01","GLOBAL",23)
// Global("kla#book01","GLOBAL",25)

// doghma knows
// OR(8)
Global("kla#book01","GLOBAL",12)
Global("kla#book01","GLOBAL",13)
Global("kla#book01","GLOBAL",16)
Global("kla#book01","GLOBAL",17)
Global("kla#book01","GLOBAL",20)
Global("kla#book01","GLOBAL",21)
Global("kla#book01","GLOBAL",24)
Global("kla#book01","GLOBAL",25)

// lazarus knows
// OR(8)
Global("kla#book01","GLOBAL",14)
Global("kla#book01","GLOBAL",15)
Global("kla#book01","GLOBAL",16)
Global("kla#book01","GLOBAL",17)
Global("kla#book01","GLOBAL",22)
Global("kla#book01","GLOBAL",23)
Global("kla#book01","GLOBAL",24)
Global("kla#book01","GLOBAL",25)

// orrick knows
// OR(8)
Global("kla#book01","GLOBAL",18)
Global("kla#book01","GLOBAL",19)
Global("kla#book01","GLOBAL",20)
Global("kla#book01","GLOBAL",21)
Global("kla#book01","GLOBAL",22)
Global("kla#book01","GLOBAL",23)
Global("kla#book01","GLOBAL",24)
Global("kla#book01","GLOBAL",25)






// thalan knows not, player does
// GlobalGT("kla#book01","GLOBAL",10)
// !Global("kla#book01","GLOBAL",11)
// !Global("kla#book01","GLOBAL",13)
// !Global("kla#book01","GLOBAL",15)
// !Global("kla#book01","GLOBAL",17)
// !Global("kla#book01","GLOBAL",19)
// !Global("kla#book01","GLOBAL",21)
// !Global("kla#book01","GLOBAL",23)
// !Global("kla#book01","GLOBAL",25)

// doghma knows not, player does
// GlobalGT("kla#book01","GLOBAL",10)
// !Global("kla#book01","GLOBAL",12)
// !Global("kla#book01","GLOBAL",13)
// !Global("kla#book01","GLOBAL",16)
// !Global("kla#book01","GLOBAL",17)
// !Global("kla#book01","GLOBAL",20)
// !Global("kla#book01","GLOBAL",21)
// !Global("kla#book01","GLOBAL",24)
// !Global("kla#book01","GLOBAL",25)

// lazarus knows not, player does
// GlobalGT("kla#book01","GLOBAL",10)
// !Global("kla#book01","GLOBAL",14)
// !Global("kla#book01","GLOBAL",15)
// !Global("kla#book01","GLOBAL",16)
// !Global("kla#book01","GLOBAL",17)
// !Global("kla#book01","GLOBAL",22)
// !Global("kla#book01","GLOBAL",23)
// !Global("kla#book01","GLOBAL",24)
// !Global("kla#book01","GLOBAL",25)

// orrick knows not, player does
// GlobalGT("kla#book01","GLOBAL",10)
// !Global("kla#book01","GLOBAL",18)
// !Global("kla#book01","GLOBAL",19)
// !Global("kla#book01","GLOBAL",20)
// !Global("kla#book01","GLOBAL",21)
// !Global("kla#book01","GLOBAL",22)
// !Global("kla#book01","GLOBAL",23)
// !Global("kla#book01","GLOBAL",24)
// !Global("kla#book01","GLOBAL",25)



// what if you find book twice, turn in for res with T then go to D



