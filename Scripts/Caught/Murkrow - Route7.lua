-- Copyright sader fawall sader1992@hotmail.com

name = "Charmander - Cinnabar mansion 3"
author = "sader1992"
description = [[Start anywhere between Celadon City and Route 7.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Celadon" then
			moveToMap("Celadon City")
		elseif getMapName() == "Celadon City" then
			moveToMap("Route 7")
		elseif getMapName() == "Route 7" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 7" then
			moveToMap("Celadon City")
		elseif getMapName() == "Celadon City" then
			moveToMap("Pokecenter Celadon")
		elseif getMapName() == "Pokecenter Celadon" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and ( isOpponentShiny() or getOpponentName() == "Murkrow")then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end