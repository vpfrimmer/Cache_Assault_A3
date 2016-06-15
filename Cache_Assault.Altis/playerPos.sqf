if (player in [sl_nato,tl_nato_1,tl_nato_2]) then {
	onMapSingleClick "
		if !(_pos inArea 'nato_4') then {'nato_90' setMarkerPos _pos; if(side player == resistance) then {'nato_90' setMarkerAlphaLocal 0};};
	";
};

_time = _this select 0;

waitUntil {time > 0};
onMapSingleClick "";
if (time > 60) exitWith {};
if (hasInterface && side player == west) then {[_time, player] execVM "teleportWithCountdown.sqf"};

if (isServer) then {
	{
		if (!isPlayer _x && side _x == west) then {
			[_time, _x] execVM "teleportWithCountdown.sqf";
		};
	} foreach allUnits;
};
