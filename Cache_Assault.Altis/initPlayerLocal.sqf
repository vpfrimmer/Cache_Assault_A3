playerUnit = _this select 0;	// unité du joueur (sélectionnée dans l'écran des slots)
playerIsJIP = _this select 1;	// boolean (true ou false). True = le joueur se connecte en cours de partie.
enableSaving [false, false]; // supprime la sauvegarde
call compile preprocessFileLineNumbers "loadout.sqf";
if !(isNil {playerUnit getVariable "loadout"}) then // La variable loadout doit être placer dans l'éditeur [init de l'unité] => this setVariable ["loadout", "aaf_sl"];
{
	if (isNil {playerUnit getVariable "loadout_done"}) then // loadout_done inexistant, on lance la function loadout
	{
		[playerUnit] call hard_setLoadout;
		playerUnit setVariable ["loadout_done", true, true]; // loadout_done permet de vérifier si le loadout a été fait afin d'éviter les doublons en cas de déco / reco.
	};
};

playerUnit action ["WeaponOnBack", playerUnit]; // pour que le joueur ait l'arme baissée

// Certains loadouts possèdent des optiques thermiques. Dans le doute..
player disableTIEquipment true;

if !(isMultiplayer) then
{
	{
		if !(isNil {_x getVariable "loadout"}) then 
		{
			if (isNil {_x getVariable "loadout_done"}) then 
			{
				[_x] call hard_setLoadout;
				_x setVariable ["loadout_done", true, true];
			};
		};
	} foreach allUnits;
};

[] execVM "inventory_briefing.sqf"; // lancement du script qui affiche le loadout lors du briefing.

waitUntil {time > 1};
if ((uniform playerUnit) == "") then {
call compile preprocessFileLineNumbers "loadout.sqf"; 
[playerUnit] call hard_setLoadout;
playerUnit setVariable ["loadout_done", true, true];
playerUnit action ["WeaponOnBack", playerUnit];
};

