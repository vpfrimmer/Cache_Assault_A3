_min = _this select 0;
_max = _this select 1;
_base = toLower(_this select 2);
if !(typeName _min == typeName 0) exitWith {
	["#0: Must be a NUMBER"] call bis_fnc_error;
};
if !(typeName _max == typeName 0) exitWith {
	["#1: Must be a NUMBER"] call bis_fnc_error;
};
if (_min > _max) then {
	private ["_tmp1", "_tmp2"];
	_tmp1 = _min;
	_tmp2 = _max;
	_max = _tmp1;
	_min = _tmp2;
};
_return = random _max;
if (_base == 'round') Then {
	_return = round(_return);
};
if (_base == 'floor') Then {
	_return = floor(_return);
};
if (_base == 'ceil' ) Then {
	_return = ceil(_return);
};
if (_return < _min) Then {
	_return = _min + (random (_max - _min));
};

_return