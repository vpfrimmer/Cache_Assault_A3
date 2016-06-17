faction_setLoadout = 
{
	_factionIndex = _this select 0;
	_unit = _this select 1;

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
		case "sl": {[_unit, "CUP_B_GER_Fleck_Soldier_TL"] call instantiateAndCopy};
		case "tl": {[_unit, "CUP_B_GER_Fleck_Soldier_TL"] call instantiateAndCopy};
		case "grenadier": {[_unit, "CUP_B_GER_Fleck_Soldier_AT"] call instantiateAndCopy};
		case "demo": {[_unit, "CUP_B_GER_Fleck_Soldier_Engineer"] call instantiateAndCopy};
		case "auto": {[_unit, "CUP_B_GER_Fleck_Soldier_MG"] call instantiateAndCopy};
		case "medic": {[_unit, "CUP_B_GER_Fleck_Medic"] call instantiateAndCopy};
		case "marksman": {[_unit, "CUP_B_GER_Fleck_Soldier_Sniper"] call instantiateAndCopy};
		case "rifleman": {[_unit, "CUP_B_GER_Fleck_Soldier"] call instantiateAndCopy};
	};
};

loadout_USSF = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	switch _class do 
	{
		case "sl": {[_unit, "CUP_B_FR_Commander"] call instantiateAndCopy};
		case "tl": {[_unit, "CUP_B_FR_Soldier_TL"] call instantiateAndCopy};
		case "grenadier": {[_unit, "CUP_B_FR_Soldier_GL"] call instantiateAndCopy};
		case "demo": {[_unit, "CUP_B_FR_Soldier_Exp"] call instantiateAndCopy};
		case "auto": {[_unit, "CUP_B_FR_Soldier_AR"] call instantiateAndCopy};
		case "medic": {[_unit, "CUP_B_FR_Medic"] call instantiateAndCopy};
		case "marksman": {[_unit, "CUP_B_FR_Soldier_Marksman"] call instantiateAndCopy};
		case "rifleman": {[_unit, "CUP_B_FR_Soldier_Assault"] call instantiateAndCopy};
	};
};

loadout_UK = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	switch _class do 
	{
		case "sl": {[_unit, "CUP_B_BAF_Soldier_SL_WDL"] call instantiateAndCopy};
		case "tl": {[_unit, "CUP_B_BAF_Soldier_TL_WDL"] call instantiateAndCopy};
		case "grenadier": {[_unit, "CUP_B_BAF_Soldier_GL_WDL"] call instantiateAndCopy};
		case "demo": {[_unit, "CUP_B_BAF_Engineer_WDL"] call instantiateAndCopy};
		case "auto": {[_unit, "CUP_B_BAF_Soldier_MG_WDL"] call instantiateAndCopy};
		case "medic": {[_unit, "CUP_B_BAF_Medic_WDL"] call instantiateAndCopy};
		case "marksman": {[_unit, "CUP_B_BAF_Soldier_scout_WDL"] call instantiateAndCopy};
		case "rifleman": {[_unit, "CUP_B_BAF_Soldier_WDL"] call instantiateAndCopy};
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
		case "sl": {[_unit, "CUP_O_TK_Officer"] call instantiateAndCopy};
		case "tl": {[_unit, "CUP_O_TK_Soldier_SL"] call instantiateAndCopy};
		case "grenadier": {[_unit, "CUP_O_TK_Soldier_GL"] call instantiateAndCopy};
		case "auto": {[_unit, "CUP_O_TK_Soldier_AR"] call instantiateAndCopy};
		case "medic": {[_unit, "CUP_O_TK_Medic"] call instantiateAndCopy};
		case "marksman": {[_unit, "CUP_O_TK_INS_Sniper"] call instantiateAndCopy};
		case "rifleman": {[_unit, "CUP_O_TK_Soldier"] call instantiateAndCopy};
	};
};

loadout_NPFD = 
{
	_unit = _this select 0;
	_class = _unit getVariable "class";
	
	switch _class do 
	{
		case "sl": {[_unit, "CPC_Duala_O_NPFD_soldier_officer"] call instantiateAndCopy};
		case "tl": {[_unit, "CPC_Duala_O_NPFD_soldier_TL"] call instantiateAndCopy};
		case "grenadier": {[_unit, "CPC_Duala_O_NPFD_soldier_GL"] call instantiateAndCopy};
		case "auto": {[_unit, "CPC_Duala_O_NPFD_soldier_AR"] call instantiateAndCopy};
		case "medic": {[_unit, "CPC_Duala_O_NPFD_soldier_Medic"] call instantiateAndCopy};
		case "marksman": {[_unit, "CPC_Duala_O_NPFD_soldier_sniper"] call instantiateAndCopy};
		case "rifleman": {[_unit, "CPC_Duala_O_NPFD_soldier_1"] call instantiateAndCopy};
	};
};

instantiateAndCopy = 
{
	_unit = _this select 0;
	_classname = _this select 1;	
	_grp = createGroup west;
	
	_tempUnit = _grp createUnit [_classname, [0,0,0], [], 100, "FORM"]; 
 
	_unit setUnitLoadout (getUnitLoadout _tempUnit);
	deleteVehicle _tempUnit;	
};

