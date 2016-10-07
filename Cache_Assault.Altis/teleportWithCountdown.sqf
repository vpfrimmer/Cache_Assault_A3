/*
	Ce script lance un compte à rebours. A la fin, les unités sont téléportées sur le marker 'nato_90'.
*/

// Le temps du compte à rebours
_timer = _this select 0;
// L'unité concernée (habituellement le joueur)
_unit = _this select 1;

while{time < _timer} do {
	// On calcule et affiche via un hint le temps restant (sans les virgules)
	_remaining = _timer - time;
	hintSilent(format["%1", round (_remaining * (10 ^ 0)) / (10 ^ 0)]);
};

// LE TP
_newPos = [(markerPos "nato_90" select 0) + (random 30) -15,(markerPos "nato_90" select 1)+ (random 30) -15,1.5];

// Si plongeur, va sur le marqueur SDV
if(isDiver == 1) then {
	_newPos = [(markerPos "nato_91" select 0) + (random 30) -15,(markerPos "nato_91" select 1)+ (random 30) -15,1.5]
};

_unit setPos _newPos;

// Pour être poli.
hintSilent "Bon courage !";

publicVariable "launchEH";

// Création du Stomper si choisi
if(isNil "stomper" && bStomper == 1) then 
{
	stomper = createVehicle ["B_UGV_01_F", [(markerPos "nato_90" select 0) + (random 30) -15,(markerPos "nato_90" select 1)+ (random 30) -15,1.5], [], 0,""];  
	createVehicleCrew stomper;
	publicVariable "stomper";
};

// Déplacement de l'hélico si choisi
if(bChopper == 1) then {
	bChopper = 2;
	publicVariable "bChopper";
	
	_tempPos = [(markerPos "nato_90" select 0) + (random 30) -15,(markerPos "nato_90" select 1)+ (random 30) -15,0];
	_chopperPos = [_tempPos, 0, 50, 8, 0, 35, 0] call BIS_fnc_findSafePos;
	chopper setPos _chopperPos;
};

// Création du SDV si choisi
if(bSDV == 1 && isNil "sdv") then {
	bSDV = 2;
	publicVariable "bSDV";
	
	_tempPos = [(markerPos "nato_91" select 0) + (random 30) -15,(markerPos "nato_91" select 1)+ (random 30) -15,0];
	sdv = createVehicle ["B_SDV_01_F", _tempPos, [], 0,""];
	sdv disableTIEquipment true;
	publicVariable "sdv";
};