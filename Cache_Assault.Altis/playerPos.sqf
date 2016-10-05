/*
	Ce script gère le positionnement lors du briefing pour l'équipe blufor.
	Il est lancé dans init.sqf
	
	A l'origine conçu par Scarlok et/ou Sparfell, un peu modifié par Random.
*/

// Si le joueur est un sl ou tl blufor (nommé dans l'éditeur), un clic sur map changera la position du marqueur d'insertion ('nato_90'), si son clic n'est pas dans la zone restreinte ('nato_4')
if (player in [sl_nato,tl_nato_1,tl_nato_2]) then {
	onMapSingleClick "
		if !(_pos inArea 'nato_4') then {'nato_90' setMarkerPos _pos;};
	";
};

// Le temps avant teleport est passé en paramètre
_time = _this select 0;

// Une fois la partie lancée, on ne peut plus changer le point d'insertion
waitUntil {time > 0};
onMapSingleClick "";

// Sécurité pour le JIP je suppose ?
if (time > 60) exitWith {};

// Pour les joueurs, on lance le script de teleport avec le temps en paramètre
if (hasInterface && side player == west) then {[_time, player] execVM "teleportWithCountdown.sqf"};

// Pour le serveur, on téléporte les IA
if (isServer) then {
	{
		if (!isPlayer _x && side _x == west) then {
			[_time, _x] execVM "teleportWithCountdown.sqf";
		};
	} foreach allUnits;
	    
    if(stomper == 1) then {
        [_time, stomper] execVM "teleportWithCountdown.sqf";
    };

};
