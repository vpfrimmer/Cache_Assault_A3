[true] call acre_api_fnc_setSpectator;

//Anti mouettes
{
   if(_x isKindOf "seagull") then {
      _x setPos [0,0,500];
      hideobjectglobal _x;
      _x enablesimulationglobal false;
   };
} forEach nearestObjects [player, [], 250];
 
 
// intégration mode Spectator
 
["Initialize", [player]] call BIS_fnc_EGSpectator;

// Terminate old spectator
("BIS_fnc_respawnSpectator" call bis_fnc_rscLayer) cuttext ["","plain"];