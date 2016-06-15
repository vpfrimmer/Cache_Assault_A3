// Bugfix pour certains AR qui spawnent sans sac
if(player in [auto1, auto2, auto3, auto4]) then {
	if( isNull (unitBackpack player) ) then {
		player addBackpack "B_AssaultPack_rgr";
	};
};

// Stuff ACE de base
for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
player addItem "ACE_tourniquet";
player addItem "ACE_EarPlugs";
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};

// On donne leur stuff médical aux médics des deux équipes
if (player in [medic1, medic2, medic3, medic4]) then {
	clearAllItemsFromBackpack player;
	
	_unit = player;
	
	_unit addItemToBackpack "ACE_personalAidKit";
   for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_fieldDressing";};
   for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_packingBandage";};
   for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
   for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_quikclot";};
   for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV_250";};
   for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_salineIV_500";};
   for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
   for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_morphine";};
   for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_epinephrine";};
   for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
};

// On donne de quoi faire boom aux démos
if (player in [demo1, demo2]) then {
	clearAllItemsFromBackpack player;
	
	_unit = player;
	
	_unit addItemToBackpack "ACE_personalAidKit";
   for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
   for "_i" from 1 to 4 do {_unit addItemToBackpack "APERSTripMine_Wire_Mag";};
   player addItemToBackpack "ACE_M26_Clacker";
   player addItemToBackpack "ACE_DeadManSwitch";
   player addItemToBackpack "ACE_DefusalKit";
};

// On donne une rangetable aux marksmen
if(player in [sniper1, sniper2]) then {
	player addItem "ACE_RangeCard";
};


// Lancement du script qui affiche le loadout lors du briefing.
[] execVM "inventory_briefing.sqf"; 