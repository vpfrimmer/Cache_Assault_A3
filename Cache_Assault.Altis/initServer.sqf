// Preprocess de la fonction de random et loadout pour utilisation future
random_fnc = compile preprocessFile "random.sqf";
placeOnMarker_fnc = compile preprocessFile "placeOnMarker.sqf";

// ------------------------------------------------------------------------
// BONUS BLUFOR

bStomper = 0;
publicVariable "bStomper";
bChopper = 0;
publicVariable "bChopper";

areBonusAuthorized = paramsArray select 3;
publicVariable "areBonusAuthorized";


// ------------------------------------------------------------------------
// PLACEMENT DES BUNKERS
// si permis par les param�tres, sinon destruction

_isBunkerAuthorized = 0;
if(_isBunkerAuthorized == 1) then 
{
	['bunker1', bunker1, 1] spawn placeOnMarker_fnc;
	['bunker2', bunker2, 1] spawn placeOnMarker_fnc;
	['bunker3', bunker3, 0] spawn placeOnMarker_fnc;
}
else 
{
	deleteVehicle bunker1;
	deleteVehicle bunker2;
	deleteVehicle bunker3;
};

// ------------------------------------------------------------------------
// CHOIX DES CACHES

// Le nombre de caches d�sir� est r�cup�r�
cacheCount = paramsArray select 2;

/* On d�finit les spots de spawn, tels que

Chaque cache est d�finie par un array [x, y, z] o�
- x est l'objet de la cache pos� dans l'�diteur
- y est un array contenant le nom des marqueurs possibles pour la cache (rajouter '_fia' ou '_nato' en fonction que l'on souhaite acc�der au marqueur blufor ou ind�pendant)
- z est un array de triggers utilis�s pour r�cup�rer les positions possibles des caches. Ces triggers sont pos�s dans l'�diteur et ne servent pas de d�clencheurs, juste de "balises de positionnement".

Exemple : le trigger t3_m2 d�finit la 2�me position possible de la cache c3, qui sera marqu�e sur map par le marker c3_m2_nato pour blufor, et c3_m2_fia pour les ind�pendants.
*/

c1Spots = ['c1_m1', 'c1_m2', 'c1_m3'];
c1Triggers = [t1_m1, t1_m2, t1_m3];

c2Spots = ['c2_m1', 'c2_m2', 'c2_m3'];
c2Triggers = [t2_m1, t2_m2, t2_m3];

c3Spots = ['c3_m1', 'c3_m2', 'c3_m3'];
c3Triggers = [t3_m1, t3_m2, t3_m3];

c4Spots = ['c4_m1', 'c4_m2', 'c4_m3'];
c4Triggers = [t4_m1, t4_m2, t4_m3];

c5Spots = ['c5_m1', 'c5_m2', 'c5_m3'];
c5Triggers = [t5_m1, t5_m2, t5_m3];

c6Spots = ['c6_m1', 'c6_m2', 'c6_m3'];
c6Triggers = [t6_m1, t6_m2, t6_m3];

cacheArray = [[c1, c1Spots, c1Triggers], [c2, c2Spots, c2Triggers], [c3, c3Spots, c3Triggers], [c4, c4Spots, c4Triggers], [c5, c5Spots, c5Triggers], [c6, c6Spots, c6Triggers]];
// La liste de toutes les caches est donc � cet instant contenue dans cacheArray

// On initialise l'array des caches s�lectionn�es
selectedCachesArray = [];

// Tant que le nombre de caches s�lectionn�es est inf�rieur au nombre de caches d�sir�es, on ..
while {count selectedCachesArray < cacheCount} do 
{
	// .. tire un index au sort
	_randIndex = [0, count cacheArray - 1, "round"] call random_fnc; // TODO: ce random n'est pas �quitable (osef ?)
	// .. r�cup�re la cache tir�e au sort
	_newCache = cacheArray select _randIndex;
	
	// .. retire la cache s�lectionn�e de cacheArray
	cacheArray = cacheArray - [_newCache];
	// .. ajoute la cache s�lectionn�e � selectedCachesArray
	selectedCachesArray pushBack _newCache;
};

// On d�truit les caches qui n'ont pas �t� s�lectionn�es
{ 
	_cache = _x select 0;
	deleteVehicle _cache;
} forEach cacheArray;


// On initialise un array qui contiendra les marqueurs � afficher
selectedMarkers = [];

// Pour chaque cache s�lectionn�e, on..
{ 
	// .. r�cup�re ses markers et en s�lectionne un au hasard
	_markersArray = _x select 1;
	_randomMarkerIndex = [0, count _markersArray - 1, "round"] call random_fnc;
	_randomMarker = _markersArray select _randomMarkerIndex;
	
	// .. stocke le nom de ce marqueur dans selectedMarkers
	selectedMarkers pushBack _randomMarker;
	
	// .. on d�place la cache � l'endroit s�lectionn�
	_cache = _x select 0;
	_associatedTrigger = _x select 2;
	_associatedTrigger = _associatedTrigger select _randomMarkerIndex;
	_newPos = getPos _associatedTrigger;
	_cache setPos [_newPos select 0, _newPos select 1, _newPos select 2];

} forEach selectedCachesArray;


// On broadcast la liste des markers � afficher, histoire que tout le monde soit raccord
publicVariable "selectedMarkers";