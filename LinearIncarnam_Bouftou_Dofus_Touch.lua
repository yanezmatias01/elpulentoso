-- Nom : Ayden
-- Zone : Incarnam
-- Type : Combat
-- Version : 1.0
-- Auteur : Ayden

GATHER = {}
OPEN_BAGS = true
AUTO_DELETE = {}

MAX_MONSTERS = 8
MIN_MONSTERS = 1

FORBIDDEN_MONSTERS = {}
FORCE_MONSTERS = {}

function GatherFight()
	for index, actualMap in pairs(mapsWithChangeMap) do
		if (map:onMap(actualMap.map)) then
			if actualMap.gather and actualMap.fight then
				return "both"
			elseif actualMap.gather then
				return "gather"
			elseif actualMap.forcegather then
				return "forcegather"
			elseif actualMap.fight then
				return "fight"
			elseif actualMap.forcefight then
				return "forcefight"
			end
			return "path"
		end
	end
	return false
end

function move()

	if GatherFight() == "both" then
		return {
			{map = map:currentMap(), custom = processMap, gather = true, fight = true}
		}
	elseif GatherFight() == "gather" then
		return {
			{map = map:currentMap(), custom = processMap, gather = true}
		}
	elseif GatherFight() == "forcegather" then
		return {
			{map = map:currentMap(), custom = processMap, forcegather = true}
		}
	elseif GatherFight() == "fight" then
		return {
			{map = map:currentMap(), custom = processMap, fight = true}
		}
	elseif GatherFight() == "forcefight" then
		return {
			{map = map:currentMap(), custom = processMap, forcefight = true}
		}
	elseif GatherFight() == "path" then
		return {
			{map = map:currentMap(), custom = processMap}
		}
	else
		global:printError("Aucune action sur la map : " .. map:currentMap() .. " | mapID : " .. map:currentMapId())
		global:disconnect()
	end
end

mapsWithChangeMap = {

{ map = "0,3", path = "top"},
{ map = "0,2", path = "left", fight = true},
{ map = "-1,2", path = "top", fight = true},
{ map = "-1,1", path = "top", fight = true},
{ map = "-1,0", path = "right", fight = true},
{ map = "0,0", path = "top", fight = true},
{ map = "0,-1", path = "right", fight = true},
{ map = "1,-1", path = "right", fight = true},
{ map = "2,-1", path = "bottom", fight = true},
{ map = "2,0", path = "bottom", fight = true},
{ map = "2,1", path = "right", fight = true},
{ map = "3,1", path = "bottom", fight = true},
{ map = "3,2", path = "left", fight = true},
{ map = "2,2", path = "left", fight = true},
{ map = "1,2", path = "top", fight = true},
{ map = "1,1", path = "left", fight = true},
{ map = "0,1", path = "bottom", fight = true},
{ map = "1,3", path = "left", fight = true},
-- Remonter à Incarnam de la Banque de Astrub --
{ map = "83887104", path = "396" },
{ map = "84674566", path = "left" },
{ map = "84674054", door = 359}, -- Statue féca remonte à incarnam
-- Temple incarnam jusque la sortie --
{ map = "-5,-1", path = "bottom"},
{ map = "-4,0", path = "right"},
{ map = "-3,1", path = "right"},
{ map = "-2,2", path = "bottom"},
}
function processMap()
	for index, actualMap in pairs(mapsWithChangeMap) do
		if (map:onMap(actualMap.map)) then
			if (type(actualMap.path) == "table") then
				if (not actualMap.toggle) then
					actualMap.toggle = {}
					for i = 1, #(actualMap.path) do
						table.insert(actualMap.toggle, false)
					end
				else
					toggleTemp = false
					for i = 1, #(actualMap.toggle) do
						toggleTemp = actualMap.toggle[i]
					end
					if (toggleTemp) then
						for i = 1, #(actualMap.toggle) do
							actualMap.toggle[i] = false
						end
					end
				end
				for i, action in pairs(actualMap.path) do
					if (not actualMap.toggle[i]) then
						if (type(action) == "string") then
							actualMap.toggle[i] = true
							return map:changeMap(action)
						elseif (type(action) == "number") then
							actualMap.toggle[i] = true
							return map:door(action)
						elseif (type(action) == "function") then
							actualMap.toggle[i] = true
							return action()
						end
					end
				end
			else
				if (actualMap.path) then
					return map:changeMap(actualMap.path)
				elseif (actualMap.door) then
					if (type(actualMap.door) == "string") then
						return map:door(tonumber(actualMap.door))
					elseif (type(actualMap.door) == "number") then
						return map:door(actualMap.door)
					end
				elseif (actualMap.custom) then
					return actualMap.custom()
				end
			end
		end
	end
end

function bank()
	banque = true
	return {
		-- Retour en Banque en étant sur l'ile incarnam complète Dofus Touch --
	{ map = "-1,0", path = "right"},
	{ map = "-1,1", path = "right"},
	{ map = "-1,2", path = "right"},
	{ map = "0,2", path = "bottom"},
	{ map = "0,1", path = "bottom"},
	{ map = "0,0", path = "bottom"},
	{ map = "0,-1", path = "bottom"},
	{ map = "1,-1", path = "bottom"},
	{ map = "1,0", path = "bottom"},
	{ map = "1,1", path = "bottom"},
	{ map = "1,2", path = "bottom"},
	{ map = "2,-1", path = "bottom"},
	{ map = "2,0", path = "bottom"},
	{ map = "2,1", path = "bottom"},
	{ map = "2,2", path = "bottom"},
	{ map = "3,1", path = "bottom"},
	{ map = "3,2", path = "bottom"},
	{ map = "4,-1", path = "bottom"},
	{ map = "4,0", path = "bottom"},
	{ map = "4,1", path = "bottom"},
	{ map = "4,2", path = "bottom"},
	{ map = "5,-1", path = "bottom"},
	{ map = "5,0", path = "bottom"},
	{ map = "5,1", path = "bottom"},
	{ map = "5,2", path = "bottom"},
	{ map = "6,-1", path = "bottom"},
	{ map = "6,0", path = "bottom"},
	{ map = "6,1", path = "bottom"},
	{ map = "6,2", path = "bottom"},
	{ map = "7,0", path = "bottom"},
	{ map = "7,1", path = "bottom"},
	{ map = "7,2", path = "bottom"},
	{ map = "8,1", path = "bottom"},
	{ map = "8,2", path = "bottom"},
	{ map = "0,4", path = "top"},
	{ map = "0,5", path = "top"},
	{ map = "0,6", path = "top"},
	{ map = "0,7", path = "top"},
	{ map = "-1,4", path = "right"},
	{ map = "-1,5", path = "right"},
	{ map = "-1,6", path = "right"},
	{ map = "1,4", path = "top"},
	{ map = "1,5", path = "top"},
	{ map = "1,6", path = "top"},
	{ map = "1,7", path = "top"},
	{ map = "1,8", path = "top"},
	{ map = "2,8", path = "top"},
	{ map = "2,7", path = "top"},
	{ map = "2,6", path = "top"},
	{ map = "2,5", path = "top"},
	{ map = "2,4", path = "top"},
	{ map = "3,8", path = "top"},
	{ map = "3,7", path = "top"},
	{ map = "3,6", path = "top"},
	{ map = "3,5", path = "top"},
	{ map = "3,4", path = "top"},
	{ map = "4,7", path = "top"},
	{ map = "4,6", path = "top"},
	{ map = "4,5", path = "top"},
	{ map = "4,4", path = "top"},
	{ map = "5,7", path = "top"},
	{ map = "5,6", path = "top"},
	{ map = "5,5", path = "top"},
	{ map = "5,4", path = "top"},
	{ map = "6,7", path = "top"},
	{ map = "6,6", path = "top"},
	{ map = "6,5", path = "top"},
	{ map = "6,4", path = "top"},
	{ map = "7,6", path = "top"},
	{ map = "7,5", path = "top"},
	{ map = "7,4", path = "top"},
-- Retour en Banque en étant sur l'ile incarnam complète Dofus Touch --	
		{ map = "0,3", path = "right"},
		{ map = "1,3", path = "right"},
		{ map = "2,3", path = "right"},
		{ map = "3,3", path = "right"},
		{ map = "4,3", path = "right"},
		{ map = "5,3", path = "right"},
		{ map = "6,3", path = "right"},
		{ map = "7,3", path = "right"},
		{ map = "8,3", path = "right"},
		{ map = "9,3", custom = DescendreAstrub}, -- Descend de incarnam vers astrub --
		{ map = "3,-19", path = "bottom"}, -- Statue Sadida --
		{ map = "3,-18", path = "bottom"},
        { map = "3,-17", path = "bottom"},
		{ map = "3,-16", path = "right"},
		{ map = "2,-20", path = "bottom"}, -- Statue Cra --
		{ map = "2,-19", path = "bottom"},
		{ map = "2,-18", path = "bottom"},
		{ map = "2,-17", path = "bottom"},
		{ map = "2,-16", path = "right"},
		{ map = "1,-21", path = "right"}, -- Statue Eniripsa --
		{ map = "2,-21", path = "bottom"},
		{ map = "-1,-14", path = "right"}, -- Statue Sacrieur -- 
		{ map = "0,-14", path = "right"},
		{ map = "1,-14", path = "right"},
		{ map = "2,-14", path = "right"},
		{ map = "3,-14", path = "top"},
		{ map = "3,-15", path = "top"},
		
		{map = "84674566", door = "303"}, --Devant banque Astrub--
		{map = "83887104", path = "396", custom = hiboux}, --A l'interieur de la banque avec dialogue banquier--
}
end
-- Fonction pour déplacer le bot jusque le phenix --
function phenix()
	return {}
end

-- Fonction téléportation incarnam vers Astrub via le portail de Astrub --
function talkToNpc()
    npc:npc(4398, 3)
    if not isInDialog() then
    end
    npc:reply(-1)
    npc:reply(-1)
end
-- Fonction qui sers a mettre en pause le bot. --
function sleep (n)
    local sec = tonumber(os.clock() + n);
    while (os.clock() < sec) do
    end
end
--Fonction qui sers a mettre un delai pour le dialogue avec les NPC--
function isInDialog()
  sleep(2)
end

-- Fonction pour dialog avec le banquier d'Astrub --
function hiboux()
	npc:npc(522,3)
	npc:reply(-1)
	exchange:putAllItems()
	global:leaveDialog()
	info_kamas()
	end
-- Fonction téléportation incarnam vers Astrub via Maitre Anemo pour Dofus Touch --
	function DescendreAstrub()
    npc:npc(888, 3)
    npc:reply(-1)
    npc:reply(-1)
    npc:reply(-1)
end

-- Fonction pour échanger avec un bot qui se trouve dans la banque --
function echange()
bot_id = 
pseudo = ""
mdp = ""

for i = 1, 10 do
chat:sendPrivateMessage(mdp,pseudo)
global:delay(1000)
exchange:LaunchExchangeWithPlayer(bot_id)
if not exchange:isInDialog() then
global:delay(2000)
global:printError("[Erreur] Impossible de lancer l'échange. (Tentative " .. i .. "/10)")
else
global:printSuccess("[Info] L'échange est lancé.")
global:delay(1000)
exchange:putAllItemsExchange()
global:printSuccess("[Info] Tu as bien échanger tes objets que tu avais dans ton inventaire")
global:delay(1000)
exchange:putkamas(0)
global:printSuccess("[Info] Tu as bien échanger" .. mille(character:kamas()) .. " Kamas")
global:delay(1000)
exchange:Ready()
global:printSuccess("[Info] L'échange est terminé.")
global:reconnect(0)
end
	end
end

-- Fonction pour savoir le nombre de kamas en banque --
	function info_kamas()
	exchange:getkamas(0)
	global:printSuccess("[Banque] : " .. mille(character:kamas()) .. " Kamas")
	end
-- Fonction pour savoir le nombre de kamas en banque --	
	function mille(v)
	local s = string.format("%d", math.floor(v))
	local pos = string.len(s) % 3
	if pos == 0 then pos = 3 end
	return string.sub(s, 1, pos) .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
	end