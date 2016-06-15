waitUntil { time > 3 };
waitUntil { [] call acre_api_fnc_isInitialized }; 


if(side player == west) then { 
 [bluforFreq] call acre_api_fnc_setCurrentRadioChannelNumber; 
}; 
 
if(side player == resistance) then { 
 [indFreq] call acre_api_fnc_setCurrentRadioChannelNumber; 
};
