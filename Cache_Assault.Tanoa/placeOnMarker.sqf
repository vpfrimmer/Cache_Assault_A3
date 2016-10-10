/*
	Place l'objet renseigné dans la même position et la même orientation que le marqueur renseigné
	
	params :
	0 - le texte qui permettra de trouver le marqueur
	1 - l'objet qui sera déplacé
	3 - a 1, inverse de 180 degrés la direction du marqueur (pratique pour certains bunkers). ne fait rien à 0
*/

_markerName = _this select 0;
_object = _this select 1;
_inverseDirection = _this select 2;

waitUntil {time > 1};

{
	_text = markerText _x;
	
	if(_text isEqualTo _markerName) then 
	{
		_pos = markerPos _x;
		_dir = markerDir _x;
		
		if(_inverseDirection == 1) then {
			_dir = _dir + 180;
		};
		
		_object setPos _pos;
		_object setDir _dir;
	};
	
} forEach allMapMarkers;