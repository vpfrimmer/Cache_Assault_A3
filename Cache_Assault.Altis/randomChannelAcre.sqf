/*
	Ce script attend 3 secondes en partie, vérifie qu'Acre est bien initialisé, donne une 343 et change la radio à la bonne fréquence en fonction du camp du joueur.
*/

waitUntil { time > 3 };
waitUntil { [] call acre_api_fnc_isInitialized };

player addItem "ACRE_PRC343";

if(side player == west) then { 
 [bluforFreq] call acre_api_fnc_setCurrentRadioChannelNumber; 
}; 
 
if(side player == resistance) then { 
 [indFreq] call acre_api_fnc_setCurrentRadioChannelNumber; 
};
