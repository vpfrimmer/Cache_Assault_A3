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
_unit setPos [(markerPos "nato_90" select 0) + (random 30) -15,(markerPos "nato_90" select 1)+ (random 30) -15,1.5];

// Pour être poli.
hintSilent "Bon courage !";