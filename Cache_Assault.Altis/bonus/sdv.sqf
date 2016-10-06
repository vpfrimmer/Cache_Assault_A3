bStomper = 1;
publicVariable "bSDV";

// Permet de bouger le point d'insertion du SDV. Ouvre la map, ajoute un OnMapSingleClick permettant le déplacement du point, et ferme la map
demoSDV addAction ["Définir le point d'insertion SDV", {openMap true; onMapSingleClick "!(_pos inArea 'nato_4') then {'nato_90' setMarkerPos _pos; openMap false;};";}];
// Permet de devenir plongeur. Change le loadout du joueur, puis retire l'action
diverActionIndex = demoSDV addAction ["Devenir plongeur", {player setVariable ["loadout", "diver_nato", true];[player] call hard_setLoadout;player setVariable ["loadout_done", true, true]; demoSDV removeAction diverActionIndex; isDiver = 1;}];

areBonusAuthorized = 0;
publicVariable "areBonusAuthorized";
removeAllActions tab;