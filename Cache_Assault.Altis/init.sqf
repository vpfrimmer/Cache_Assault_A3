// Preprocess de la fonction de random pour utilisation future
random_fnc = compile preprocessFile "random.sqf";


// On masque tous les marqueurs en relation avec les caches
for "_x" from 1 to 100 do
{
	for "_y" from 1 to 100 do
	{
		format ["c%1_m%2_nato",_x,_y] setMarkerAlphaLocal 0;
		format ["c%1_m%2_fia",_x,_y] setMarkerAlphaLocal 0;
	};
};

// Pour chaque marqueur à afficher, on choisit lequel à afficher en fonction du camp du joueur
{
	switch (side player) do {
		case west: {
			(_x + '_nato') setMarkerAlphaLocal 1;
		};
		case resistance: { 
			(_x + '_fia') setMarkerAlphaLocal 1;
		};
	};
} forEach selectedMarkers;


// Récupération des paramètres
inb4CSAT = paramsArray select 0;
inb4Teleport = paramsArray select 1;


// Juste au cas où..
if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};


// On set le trigger pour le départ de renforts en fonction du paramètre
triggerBackup setTriggerTimeout [inb4CSAT - 150, inb4CSAT, inb4CSAT + 100, false];

// Si le joueur est à l'ouest (pun intended)
if(side player == west) then {

	// Si sa fréquence ACRE aléatoire n'a pas été définie, on lance un dé puis on broadcast
	if(isNil "bluforFreq") then {
		bluforFreq = [1, 50, "round"] call random_fnc;
		publicVariable "bluforFreq";
	};
	
	// On cache tous les marqueurs ennemis
	for "_x" from 1 to 100 do
	{
		format ["fia_%1",_x] setMarkerAlphaLocal 0;
	};
	
	// On active le script de teleport
	null = [inb4Teleport] execVM "playerPos.sqf";
	
	// GROS BRIEFING PAS BEAU (oui je sais, j'aurais pu le mettre dans un fichier à part)
	player createDiaryRecord ["Diary", 
	["Environnement", "Il est 5h15, le jour se lève et la brume du matin se dissipe doucement. Il fait beau pour l'instant, mais le temps ne va pas tarder à se détériorer."]];

	player createDiaryRecord ["Diary", 
	["Equipement", "Les démolisseurs possèdent chacun 4 charges explosives, 4 mines à fil, 1 détonateur classique, et 1 détonateur de l'homme mort.<br/><br/>Vous disposez tous de 343 par défaut assignées à un canal et un bloc aléatoires mais attention, l'ennemi utilise un matériel similaire et si vous deviez vous trouver sur le même canal du même bloc, les ondes seraient partagées :<br/><br/>-Pour changer de bloc, détachez la poignée de votre radio et manipulez le petit switch qui se cache en dessous.<br/>- Si par malchance vous mourrez, sachez que votre radio gardera son canal et son bloc, et que tout ennemi la récupérant serait à même de connaître ses paramètres."]];

	player createDiaryRecord ["Diary", 
	["Renseignements", "Les forces ennemies sont constituées d'une ou deux équipes d'insurgés aux moyens limités. Restez tout de même sur vos gardes, des postes fixes peuvent être présents.<br/><br/>Les renforts du CSAT arriveront entre 45 et 60 minutes (par défaut, si non modifié en paramètres)."]];
	
	player createDiaryRecord ["Diary", 
	["Insertion", "Les chefs de groupe peuvent définir le point d'insertion par un clic sur map (hors de la zone bleue). Vous y serez automatiquement transportés dans quelques minutes (un timer sera présent sur votre écran)."]];

	player createDiaryRecord ["Diary", 
	["Mission", "Vous faites partie d'une équipe chargée de détruire les armes stockées sur le site de l'hôtel avant l'arrivée des renforts et transports du CSAT.<br/>Les positions approximatives des trois caisses ont été marquées sur votre carte par des cercles rouges.<br/><br/>Une fois votre mission accomplie, extrayez-vous sur votre point d'insertion."]];

	player createDiaryRecord ["Diary", 
	["Situation", "Une guerre civile a éclatée entre le gouvernement local et une faction insurgée, proche du CSAT.<br/><br/>Un groupe insurgé attend actuellement sur le complexe hotelier du nord-est de l'île un transport pour plusieurs caisses d'armes stockées sur le site."]];
	
};

// Si le joueur est insurgé (#NuitDebout)
if(side player == resistance) then {

	// Si sa fréquence ACRE aléatoire n'a pas été définie, on lance un dé puis on broadcast
	if(isNil "indFreq") then {
		indFreq = [51, 100, "round"] call random_fnc;
		publicVariable "indFreq";
	};
	
	// On cache tous les marqueurs ennemis
	for "_x" from 1 to 100 do
	{
		format ["nato_%1",_x] setMarkerAlphaLocal 0;
	};
	
	// On lance un thread qui passe son temps à cacher le point d'insertion des blufor tant que la partie n'est pas lancée.
	// Pourquoi? Parce que setMarkerPos provoque un setMarkerAlpha 1 global.
	_hideYoBallsYo = [] spawn {
		while{time < 5} do
			{
				'nato_90' setMarkerAlphaLocal 0;
			};
	};
	
	// GROS BRIEFING PAS BEAU (oui je sais, j'aurais pu le mettre dans un fichier à part)
	player createDiaryRecord ["Diary", 
	["Environnement", "Il est 5h15, le jour se lève et la brume du matin se dissipe doucement. Il fait beau pour l'instant, mais le temps ne va pas tarder à se détériorer."]];

	player createDiaryRecord ["Diary", 
	["Equipement", "Un technical et deux mitrailleuses montables sont disponibles.<br/><br/>Des munitions sont présentes dans les caisses.<br/><br/>Vous disposez tous de 343 par défaut assignées à un canal et un bloc aléatoires mais attention, l'ennemi utilise un matériel similaire et si vous deviez vous trouver sur le même canal du même bloc, les ondes seraient partagées :<br/>-Pour changer de bloc, détachez la poignée de votre radio et manipulez le petit switch qui se cache en dessous.<br/>- Si par malchance vous mourrez, sachez que votre radio gardera son canal et son bloc, et que tout ennemi la récupérant serait à même de connaître ses paramètres."]];

	player createDiaryRecord ["Diary", 
	["Renseignements", "Les forces ennemies sont constituées d'une ou deux équipes d'infanterie. Nos sources ont confirmé qu'aucun véhicule n'a été engagé dans l'opération. Ils viennent de se mettre en mouvement et arriveront d'une direction inconnue. Vous disposez cependant de quelques minutes avant leur arrivée dans la région.<br/><br/>L'artillerie ennemie est presque à portée. Il vous est interdit de quitter la zone marquée d'un cercle rouge sous peine qu'elle ne profite de votre présence en terrain découvert pour vous engager."]];
	
	player createDiaryRecord ["Diary", 
	["Insertion", "Vous êtes insérés à l'entrée du complexe hotelier."]];

	player createDiaryRecord ["Diary", 
	["Mission", "Vous faites partie du groupe chargé de défendre les armes jusqu'à l'arrivée du CSAT d'ici un peu moins d'une heure (par défaut, si non modifié en paramètres).<br/>Vous venez d'apprendre l'envoi d'une équipe ennemie sur le complexe hotelier.<br/><br/>Les positions des caisses sont marquées sur vos cartes par des croix rouges. Ne laissez en aucun cas l'ennemi s'en emparer ou les détruire."]];

	player createDiaryRecord ["Diary", 
	["Situation", "Une guerre civile a éclatée entre le gouvernement local et une faction insurgée, proche du CSAT.<br/><br/>Un groupe insurgé attend actuellement sur le complexe hotelier du nord-est de l'île un transport pour plusieurs caisses d'armes stockées sur le site."]];

};

// On lance le script qui s'occupe de changer le canal de la radio du joueur
_null = execVM "randomChannelAcre.sqf";

// Lance le script du roster
[0,true,true] execVM "roster.sqf";