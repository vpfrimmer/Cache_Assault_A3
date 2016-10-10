// Preprocess de la fonction de random et loadout pour utilisation future
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

// Récupération des paramètres
inb4CSAT = paramsArray select 0;
inb4Teleport = paramsArray select 1;

// Juste au cas où..
if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
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

// On set le trigger pour le départ de renforts en fonction du paramètre
triggerBackup setTriggerTimeout [inb4CSAT - 150, inb4CSAT, inb4CSAT + 100, false];

// Si le joueur est à l'ouest (pun intended)
if(side player == west) then {

	// Si les bonus sont autorisés..
	if(areBonusAuthorized == 1) then 
	{
		// On ajoute les addAction qui vont bien sur le tableau à côté de la caisse
		tab addAction ["Drone Stomper", "bonus\stomper.sqf"];
		tab addAction ["Grenades HuntIR", "bonus\huntir.sqf"];
		tab addAction ["Littlebird", "bonus\littlebird.sqf"];
		tab addAction ["Insertion en SDV", "bonus\sdv.sqf"];
	};
	
	// Une fois un bonus choisi, enlève toutes les actions disponibles
	"areBonusAuthorized" addPublicVariableEventHandler {
		removeAllActions tab;				
	};
	
	// Ajoute les actions au sdv "de démo" si l'insertion en SDV est choisie
	isDiver = 0;
	"bSDV" addPublicVariableEventHandler {
		// Permet de bouger le point d'insertion du SDV. Ouvre la map, ajoute un OnMapSingleClick permettant le déplacement du point, et ferme la map
		demoSDV addAction ["Définir le point d'insertion SDV", {openMap true; onMapSingleClick "if !(_pos inArea 'nato_4') then {'nato_91' setMarkerPos _pos; onMapSingleClick '';};";}];
		// Permet de devenir plongeur. Change le loadout du joueur, puis retire l'action
		diverActionIndex = demoSDV addAction ["Devenir plongeur", {player setVariable ["loadout", "diver_nato", true];[player] call hard_setLoadout;player setVariable ["loadout_done", true, true]; demoSDV removeAction diverActionIndex; isDiver = 1;}];
	};

	// Si sa fréquence ACRE aléatoire n'a pas été définie, on lance un dé puis on broadcast
	if(isNil "bluforFreq") then {
		bluforFreq = [1, 49] call BIS_fnc_randomInt;
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

	if(areBonusAuthorized == 1) then 
	{
		player createDiaryRecord ["Diary", 
		["Bonus", "Les bonus sont activés. Vous pouvez choisir lequel utiliser via le menu molette sur un panneau d'affichage à votre apparition.<br/><br/>Liste des bonus disponibles :<br/><br/>- Drone Stomper : Une console de contrôle drône apparait dans la caisse, et un Stomper non-armé sera envoyé avec vous sur le terrain.<br/><br/>- Grenades HuntIR : Ajoute 10 grenades HuntIR, une console, et un lanceur à la caisse d'objets.<br/><br/>- Littlebird : Un MH-6 Littlebird équipé de fastrope, de parachutes et d'un pod de caméra (non thermique) sera envoyé avec vous sur le terrain.<br/><br/>- Insertion auxiliaire en SDV : Ajoute deux actions molette à un SDV disponible au démarrage.<br/>    La première sert à définir un point sur carte où un SDV sera inséré.<br/>    La deuxième sert à devenir plongeur et abandonner votre rôle actuel.<br/>    Votre loadout sera entièrement changé, à l'exception de votre sac et son contenu. L'action est irréversible et vous serez envoyés sur le point d'insertion SDV au départ."]];
	};
	
	player createDiaryRecord ["Diary", 
	["Equipement", "Les démolisseurs possèdent chacun 4 charges explosives, 4 mines à fil, 1 détonateur classique, et 1 détonateur de l'homme mort.<br/><br/>Vous disposez tous de 343 par défaut assignées à un canal et un bloc aléatoires mais attention, l'ennemi utilise un matériel similaire et si vous deviez vous trouver sur le même canal du même bloc, les ondes seraient partagées :<br/><br/>-Pour changer de bloc, détachez la poignée de votre radio et manipulez le petit switch qui se cache en dessous.<br/>- Si par malchance vous mourrez, sachez que votre radio gardera son canal et son bloc, et que tout ennemi la récupérant serait à même de connaître ses paramètres.<br/>Une caisse est disponible à votre point d'insertion. Elle contient entre autres équipements 3 radios 148."]];

	player createDiaryRecord ["Diary", 
	["Renseignements", "Les forces ennemies sont constituées d'une ou deux équipes d'insurgés aux moyens limités. Restez tout de même sur vos gardes, des postes fixes peuvent être présents."]];
	
	player createDiaryRecord ["Diary", 
	["Insertion", "N'importe qui peut définir le point d'insertion par un clic sur map (hors de la zone bleue) pendant le briefing. Vous y serez automatiquement transportés dans quelques minutes (un timer sera présent sur votre écran). Ce point est invisible à l'équipe adverse."]];

	player createDiaryRecord ["Diary", 
	["Mission", "Vous faites partie d'une équipe chargée de détruire les armes stockées sur le site insurgé avant l'arrivée des renforts et transports du CSAT.<br/>Les positions approximatives des trois caisses ont été marquées sur votre carte par des cercles rouges.<br/><br/>Une fois votre mission accomplie, extrayez-vous sur votre point d'insertion."]];

	player createDiaryRecord ["Diary", 
	["Situation", "Une guerre civile a éclatée entre le gouvernement local et une faction insurgée, proche du CSAT.<br/><br/>Un groupe insurgé attend actuellement sur une zone sensible un transport pour plusieurs caisses d'armes stockées sur le site."]];
	
};

// Si le joueur est insurgé (#NuitDebout)
if(side player == resistance) then {

	// Si sa fréquence ACRE aléatoire n'a pas été définie, on lance un dé puis on broadcast
	if(isNil "indFreq") then {
		indFreq = [50, 100] call BIS_fnc_randomInt;
		publicVariable "indFreq";
	};
	
	// On cache tous les marqueurs ennemis
	for "_x" from 1 to 100 do
	{
		format ["nato_%1",_x] setMarkerAlphaLocal 0;
	};
	
	// On lance un thread qui passe son temps à cacher le(s) point(s) d'insertion des blufor.
	// Pourquoi? Parce que setMarkerPos provoque un setMarkerAlpha 1 global.
	_hideYoBallsYo = [] spawn {
		while{true} do
			{
				'nato_90' setMarkerAlphaLocal 0;
				'nato_91' setMarkerAlphaLocal 0;
			};
	};
	
	// GROS BRIEFING PAS BEAU (oui je sais, j'aurais pu le mettre dans un fichier à part)
	player createDiaryRecord ["Diary", 
	["Environnement", "Il est 5h15, le jour se lève et la brume du matin se dissipe doucement. Il fait beau pour l'instant, mais le temps ne va pas tarder à se détériorer."]];
	
	_isBunkerAuthorized = 0;
	if(_isBunkerAuthorized == 1) then {
		player createDiaryRecord ["Diary", 
		["Bunkers", "Trois positions défensives sont plaçables pendant ce briefing à l'aide de marqueurs.<br/>Pour ce faire, placez un marqueur de type 'flèche', orientez le dans la direction que vous souhaitez donner au bunker, et nommez le du nom de la défense désirée, comme sur l'exemple ci-dessous.<br/><img image='bunkerExemple.jpg'/><br/><br/>Liste des défenses disponibles :<br/><br/>bunker1<br/><img image='bunker1.jpg'/><br/><br/>bunker2<br/><img image='bunker2.jpg'><br/><br/>bunker3<br/><img image='bunker3.jpg'>"]];
	};

	player createDiaryRecord ["Diary", 
	["Equipement", "Un technical et deux mitrailleuses montables sont disponibles.<br/>Des pelles pour tranchées et une centaine de sacs de sable vides sont trouvables à l'intérieur du technical<br/><br/>Vous disposez tous de 343 par défaut assignées à un canal et un bloc aléatoires mais attention, l'ennemi utilise un matériel similaire et si vous deviez vous trouver sur le même canal du même bloc, les ondes seraient partagées :<br/>-Pour changer de bloc, détachez la poignée de votre radio et manipulez le petit switch qui se cache en dessous.<br/>- Si par malchance vous mourrez, sachez que votre radio gardera son canal et son bloc, et que tout ennemi la récupérant serait à même de connaître ses paramètres."]];

	player createDiaryRecord ["Diary", 
	["Renseignements", "Les forces ennemies sont constituées d'une ou deux équipes d'infanterie. Ils viennent de se mettre en mouvement et arriveront d'une direction inconnue. Vous disposez cependant de quelques minutes avant leur arrivée dans la région.<br/>Nous n'avons aucune information sur leurs moyens et équipement, préparez-vous à tout.<br/><br/>L'artillerie ennemie est presque à portée. Il vous est interdit de quitter la zone marquée d'un cercle rouge sous peine qu'elle ne profite de votre présence en terrain découvert pour vous engager."]];
	
	player createDiaryRecord ["Diary", 
	["Insertion", "Vous êtes insérés à l'entrée du complexe hotelier."]];

	player createDiaryRecord ["Diary", 
	["Mission", "Vous faites partie du groupe chargé de défendre les armes jusqu'à l'arrivée du CSAT.<br/>Vous venez d'apprendre l'envoi d'une équipe ennemie sur le complexe hotelier.<br/><br/>Les positions des caisses sont marquées sur vos cartes par des croix rouges. Ne laissez en aucun cas l'ennemi s'en emparer ou les détruire."]];

	player createDiaryRecord ["Diary", 
	["Situation", "Une guerre civile a éclatée entre le gouvernement local et une faction insurgée, proche du CSAT.<br/><br/>Un groupe insurgé attend actuellement sur une zone sensible un transport pour plusieurs caisses d'armes stockées sur le site."]];

};

// On lance le script qui s'occupe de changer le canal de la radio du joueur
_null = execVM "randomChannelAcre.sqf";

// Lance le script du roster
[0,true,true] execVM "roster.sqf";