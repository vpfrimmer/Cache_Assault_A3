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
// si permis par les paramètres, sinon destruction

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

// Le nombre de caches désiré est récupéré
cacheCount = paramsArray select 2;

/* On définit les spots de spawn, tels que

Chaque cache est définie par un array [x, y, z] où
- x est l'objet de la cache posé dans l'éditeur
- y est un array contenant le nom des marqueurs possibles pour la cache (rajouter '_fia' ou '_nato' en fonction que l'on souhaite accéder au marqueur blufor ou indépendant)
- z est un array de triggers utilisés pour récupérer les positions possibles des caches. Ces triggers sont posés dans l'éditeur et ne servent pas de déclencheurs, juste de "balises de positionnement".

Exemple : le trigger t3_m2 définit la 2ème position possible de la cache c3, qui sera marquée sur map par le marker c3_m2_nato pour blufor, et c3_m2_fia pour les indépendants.
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
// La liste de toutes les caches est donc à cet instant contenue dans cacheArray

// On initialise l'array des caches sélectionnées
selectedCachesArray = [];

// Tant que le nombre de caches sélectionnées est inférieur au nombre de caches désirées, on ..
while {count selectedCachesArray < cacheCount} do 
{
	// .. tire un index au sort
	_randIndex = [0, count cacheArray - 1, "round"] call random_fnc; // TODO: ce random n'est pas équitable (osef ?)
	// .. récupère la cache tirée au sort
	_newCache = cacheArray select _randIndex;
	
	// .. retire la cache sélectionnée de cacheArray
	cacheArray = cacheArray - [_newCache];
	// .. ajoute la cache sélectionnée à selectedCachesArray
	selectedCachesArray pushBack _newCache;
};

// On détruit les caches qui n'ont pas été sélectionnées
{ 
	_cache = _x select 0;
	deleteVehicle _cache;
} forEach cacheArray;


// On initialise un array qui contiendra les marqueurs à afficher
selectedMarkers = [];

// Pour chaque cache sélectionnée, on..
{ 
	// .. récupère ses markers et en sélectionne un au hasard
	_markersArray = _x select 1;
	_randomMarkerIndex = [0, count _markersArray - 1, "round"] call random_fnc;
	_randomMarker = _markersArray select _randomMarkerIndex;
	
	// .. stocke le nom de ce marqueur dans selectedMarkers
	selectedMarkers pushBack _randomMarker;
	
	// .. on déplace la cache à l'endroit sélectionné
	_cache = _x select 0;
	_associatedTrigger = _x select 2;
	_associatedTrigger = _associatedTrigger select _randomMarkerIndex;
	_newPos = getPos _associatedTrigger;
	_cache setPos [_newPos select 0, _newPos select 1, _newPos select 2];

} forEach selectedCachesArray;


// On broadcast la liste des markers à afficher, histoire que tout le monde soit raccord
publicVariable "selectedMarkers";