/*-----------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
***	Author: Hardballer

***	Description : 
	Loadouts de la mission

*** Utilisation :
	1/ Copiez les fichiers 'loadout.sqf', 'initPlayerLocal.sqf' et 'inventory_briefing.sqf' dans le dossier de votre mission.
	2/ Modifiez le fichier loadout.sqf à votre convenance.
		- Vous pouvez creer vos loadouts dans l'arsenal virtuel de Arma 3, les exporter avec la commande ingame et les coller dans le script comme ci-dessous.
		- Une fois ceci fait, remplacez tout les 'this' par '_unit'.
	3/ Dans l'éditeur, placez la commande ci-dessous dans les init d'unités jouables pour leur attribuer le loadout souhaité :
		this setVariable ["loadout", "aaf_officer"];
		
	PS :Dans l'exemple ci-dessous les lignes des commentaires issues de l'exportation avec l'arsenal vitruel ont été supprimées pour une meilleure lisibilité.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/


hard_setLoadout = 
{
	_unit = _this select 0;
	_loadout = _unit getVariable "loadout";
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	
	switch _loadout do 
	{
		case "sl_nato": {[_unit] call loadoutSL_NATO};
		case "tl_nato": {[_unit] call loadoutTL_NATO};
		case "auto_nato": {[_unit] call loadoutAUTO_NATO};
		case "medic_nato": {[_unit] call loadoutMEDIC_NATO};
		case "grenadier_nato": {[_unit] call loadoutGRENADIER_NATO};
		case "demo_nato": {[_unit] call loadoutDEMO_NATO};
		case "marksman_nato": {[_unit] call loadoutMARKSMAN_NATO};
		
		case "sl_ind": {[_unit] call loadoutSL_IND};
		case "tl_ind": {[_unit] call loadoutTL_IND};
		case "auto_ind": {[_unit] call loadoutAUTO_IND};
		case "medic_ind": {[_unit] call loadoutMEDIC_IND};
		case "grenadier_ind": {[_unit] call loadoutGRENADIER_IND};
		case "soldier_ind": {[_unit] call loadoutSOLDIER_IND};
		case "marksman_ind": {[_unit] call loadoutMARKSMAN_IND};
	};
};


// --------------------------- NATO --------------------------------------
loadoutSL_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_3";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierL_CTRG";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	_unit addHeadgear "H_HelmetB_light";

	comment "Add weapons";
	_unit addWeapon "arifle_MX_Black_F";
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutTL_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierH_CTRG";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	_unit addHeadgear "H_HelmetB_light_black";
	_unit addGoggles "rhs_googles_yellow";

	comment "Add weapons";
	_unit addWeapon "arifle_MX_Black_F";
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutAUTO_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierH_CTRG";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
	_unit addBackpack "B_AssaultPack_blk";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
	_unit addHeadgear "H_HelmetB_light_black";

	comment "Add weapons";
	_unit addWeapon "arifle_MX_SW_Black_F";
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addPrimaryWeaponItem "bipod_01_F_blk";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutMEDIC_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierL_CTRG";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	_unit addBackpack "B_FieldPack_cbr";
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
	_unit addItemToBackpack "ACE_surgicalKit";
	_unit addItemToBackpack "ACE_personalAidKit";
	_unit addHeadgear "H_HelmetB_light_black";

	comment "Add weapons";
	_unit addWeapon "arifle_MXC_Black_F";
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutGRENADIER_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierH_CTRG";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
	for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
	_unit addHeadgear "H_HelmetB_light_black";

	comment "Add weapons";
	_unit addWeapon "arifle_MX_GL_Black_F";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutDEMO_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierH_CTRG";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
	for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	_unit addBackpack "B_Kitbag_rgr";
	_unit addItemToBackpack "ACE_Clacker";
	_unit addItemToBackpack "ACE_DeadManSwitch";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "APERSTripMine_Wire_Mag";};
	_unit addHeadgear "H_Watchcap_blk";

	comment "Add weapons";
	_unit addWeapon "arifle_MXC_Black_F";
	_unit addPrimaryWeaponItem "optic_Aco";
	_unit addWeapon "hgun_P07_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

loadoutMARKSMAN_NATO = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_XL50";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
	_unit addVest "V_PlateCarrierH_CTRG";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellBlue";
	_unit addItemToVest "ACE_M84";
	for "_i" from 1 to 8 do {_unit addItemToVest "20Rnd_762x51_Mag";};
	_unit addHeadgear "H_Watchcap_camo";

	comment "Add weapons";
	_unit addWeapon "srifle_EBR_F";
	_unit addPrimaryWeaponItem "muzzle_snds_B";
	_unit addPrimaryWeaponItem "optic_SOS";
	_unit addWeapon "hgun_P07_F";
	_unit addWeapon "Rangefinder";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";
	_unit linkItem "NVGoggles_OPFOR";
};

// --------------------------- IND --------------------------------------
loadoutSL_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_IG_leader";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_Chestrig_blk";
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addHeadgear "H_Watchcap_blk";

	comment "Add weapons";
	_unit addWeapon "arifle_TRG20_F";
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutTL_IND = //
{
	_unit = _this select 0;
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "U_IG_leader";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_TacVest_blk";
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addHeadgear "H_Booniehat_khk";

	comment "Add weapons";
	_unit addWeapon "arifle_TRG20_F";
	_unit addPrimaryWeaponItem "optic_ACO_grn";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutAUTO_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_IG_Guerilla2_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_TacVest_blk";
	_unit addItemToVest "200Rnd_65x39_cased_Box";
	_unit addBackpack "B_FieldPack_khk";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
	_unit addItemToBackpack "200Rnd_65x39_cased_Box";
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "LMG_Mk200_F";
	_unit addPrimaryWeaponItem "ACE_muzzle_mzls_H";
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit addPrimaryWeaponItem "bipod_03_F_blk";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutMEDIC_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_IG_Guerilla2_3";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_TacVest_blk";
	for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addBackpack "G_FieldPack_Medic";
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
	_unit addHeadgear "H_Cap_red";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutGRENADIER_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_IG_Guerilla2_3";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_PlateCarrierIA1_dgtl";
	for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 3 do {_unit addItemToVest "UGL_FlareWhite_F";};
	for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";};
	_unit addHeadgear "H_Bandanna_khk";

	comment "Add weapons";
	_unit addWeapon "arifle_TRG21_GL_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutSOLDIER_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_BG_Guerrilla_6_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "9Rnd_45ACP_Mag";
	_unit addVest "V_TacVest_camo";
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addItemToVest "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	_unit addHeadgear "H_HelmetIA";

	comment "Add weapons";
	_unit addWeapon "arifle_Mk20_F";
	_unit addWeapon "hgun_ACPC2_F";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};

loadoutMARKSMAN_IND = //
{
	_unit = _this select 0;
	
	_unit forceAddUniform "U_BG_Guerilla2_1";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACE_Flashlight_MX991";
	_unit addItemToUniform "ACE_tourniquet";
	_unit addItemToUniform "ACE_RangeCard";
	_unit addItemToUniform "ACE_Kestrel4500";
	_unit addItemToUniform "MiniGrenade";
	_unit addItemToUniform "SmokeShellGreen";
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_BandollierB_blk";
	for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "10Rnd_762x54_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_10Rnd_762x54_Tracer_mag";};
	_unit addHeadgear "H_Shemag_olive_hs";
	_unit addGoggles "G_Shades_Red";

	comment "Add weapons";
	_unit addWeapon "srifle_DMR_01_F";
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addPrimaryWeaponItem "bipod_02_F_blk";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
};