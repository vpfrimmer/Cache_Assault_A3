faction_setLoadout = 
{
	_factionIndex = _this select 0;
	_unit = _this select 1;
	
	_class = _unit getVariable "class";

	switch _factionIndex do 
	{
		case 0: {[_unit] call loadout_CTRG};
		case 1: {[_unit] call loadout_KSK};
		case 2: {[_unit] call loadout_USSF};
		case 3: {[_unit] call loadout_UK};
		
		case 10: {[_unit] call loadout_FIA};
		case 11: {[_unit] call loadout_Takistani};
		case 12: {[_unit] call loadout_NPFD};
	};
};


// BLUFOR

loadout_CTRG = //
{
	// NADA, loadout par défaut
};

loadout_KSK = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	
	switch _class do 
	{
		case "sl": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_TL"};
		case "tl": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_TL"};
		case "grenadier": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_AT"};
		case "demo": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_Engineer"};
		case "auto": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_MG"};
		case "medic": {_unit setUnitLoadout "CUP_B_GER_Fleck_Medic"};
		case "marksman": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier_Sniper"};
		case "rifleman": {_unit setUnitLoadout "CUP_B_GER_Fleck_Soldier"};
	};
};

loadout_USSF = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	
	switch _class do 
	{
		case "sl": {_unit setUnitLoadout "CUP_B_FR_Commander"};
		case "tl": {_unit setUnitLoadout "CUP_B_FR_Soldier_TL"};
		case "grenadier": {_unit setUnitLoadout "CUP_B_FR_Soldier_GL"};
		case "demo": {_unit setUnitLoadout "CUP_B_FR_Soldier_Exp"};
		case "auto": {_unit setUnitLoadout "CUP_B_FR_Soldier_AR"};
		case "medic": {_unit setUnitLoadout "CUP_B_FR_Medic"};
		case "marksman": {_unit setUnitLoadout "CUP_B_FR_Soldier_Marksman"};
		case "rifleman": {_unit setUnitLoadout "CUP_B_FR_Soldier_Assault"};
	};
};

loadout_UK = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	
	switch _class do 
	{
		case "sl": {_unit setUnitLoadout "CUP_B_BAF_Soldier_SL_WDL"};
		case "tl": {_unit setUnitLoadout "CUP_B_BAF_Soldier_TL_WDL"};
		case "grenadier": {_unit setUnitLoadout "CUP_B_BAF_Soldier_GL_WDL"};
		case "demo": {_unit setUnitLoadout "CUP_B_BAF_Engineer_WDL"};
		case "auto": {_unit setUnitLoadout "CUP_B_BAF_Soldier_MG_WDL"};
		case "medic": {_unit setUnitLoadout "CUP_B_BAF_Medic_WDL"};
		case "marksman": {_unit setUnitLoadout "CUP_B_BAF_Soldier_scout_WDL"};
		case "rifleman": {_unit setUnitLoadout "CUP_B_BAF_Soldier_WDL"};
	};
};

// ----------------------------------------------------------------------------------------------------
// INDEPENDANT
loadout_FIA = 
{
	// NADA, loadout par défaut
};

loadout_Takistani = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	
	switch _class do 
	{
		case "sl": {_unit setUnitLoadout "CUP_O_TK_Officer"};
		case "tl": {_unit setUnitLoadout "CUP_O_TK_Soldier_SL"};
		case "grenadier": {_unit setUnitLoadout "CUP_O_TK_Soldier_GL"};
		case "auto": {_unit setUnitLoadout "CUP_O_TK_Soldier_AR"};
		case "medic": {_unit setUnitLoadout "CUP_O_TK_Medic"};
		case "marksman": {_unit setUnitLoadout "CUP_O_TK_INS_Sniper"};
		case "rifleman": {_unit setUnitLoadout "CUP_O_TK_Soldier"};
	};
};

loadout_NPFD = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	
	switch _class do 
	{
		case "sl": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_officer"};
		case "tl": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_TL"};
		case "grenadier": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_GL"};
		case "auto": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_AR"};
		case "medic": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_Medic"};
		case "marksman": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_sniper"};
		case "rifleman": {_unit setUnitLoadout "CPC_Duala_O_NPFD_soldier_1"};
	};
};