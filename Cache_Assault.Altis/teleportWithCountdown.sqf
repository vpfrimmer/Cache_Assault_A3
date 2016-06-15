_timer = _this select 0;
_unit = _this select 1;

while{time < _timer} do {
	_remaining = _timer - time;
	hintSilent(format["%1", round (_remaining * (10 ^ 0)) / (10 ^ 0)]);
};

_unit setPos [(markerPos "nato_90" select 0) + (random 30) -15,(markerPos "nato_90" select 1)+ (random 30) -15,1.5];

hintSilent "Bon courage !";