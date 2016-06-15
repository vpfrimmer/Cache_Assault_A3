// Le serveur s'occupe de définir les caches à utiliser en fonction du paramètre et par la magie de l'aléatoire et broadcast ses décisions lorsqu'il a fini

random_fnc = compile preprocessFile "random.sqf";

cacheCount = paramsArray select 2;

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

selectedCachesArray = [];

while {count selectedCachesArray < cacheCount} do 
{
	_randIndex = [0, count cacheArray - 1, "round"] call random_fnc;
	_newCache = cacheArray select _randIndex;
	
	cacheArray = cacheArray - [_newCache];
	selectedCachesArray pushBack _newCache;
};

publicVariable "cacheArray";
publicVariable "selectedCachesArray";