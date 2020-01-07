---------------------------------------------
-- Arsenic
-- Version 0.3.27
-- Compatible avec Snowbot
-- https://forum.snowbot.eu/showthread.php?tid=1985
---------------------------------------------
-- Date enregistr� : 2019/03/30 00:49:41
-- Date export� : 02/04/2019 14:36:44
---------------------------------------------
-- Nom :      Crabe 
-- Zone :     amkna
-- Type :     
-- Version :  1
-- Cr�ateur : Ghz62360
---------------------------------------------



---------------------------------------------
-- Param�tres
---------------------------------------------
MIN_MONSTERS = 1
MAX_MONSTERS = 8
FORCE_MONSTERS = {63} -- Crabe
FORBIDDEN_MONSTERS = {31} -- Larve Bleue

OPEN_BAGS = false -- D�fense d'ouverture des sacs de r�colte
FOLLOW_NORMAL = true -- Les mules se d�placent en m�me temps, apr�s le chef



---------------------------------------------
-- Structure de base
---------------------------------------------
function move()
    return {

        -- D�placements
        { map = "1,-2", path = "right" },
        { map = "4,0", path = "right" },
        { map = "3,0", path = "right" },
        { map = "2,0", path = "right" },
        { map = "2,1", path = "right" },
        { map = "2,-1", path = "right" },
        { map = "1,-1", path = "right|bottom" },
        { map = "2,-3", path = "bottom" },
        { map = "6,-3", path = "bottom" },
        { map = "9,-2", path = "bottom" },
        { map = "10,0", path = "bottom" },
        { map = "11,1", path = "bottom" },
        { map = "12,1", path = "bottom" },
        { map = "12,3", path = "top" },
        { map = "11,3", path = "top" },
        { map = "10,3", path = "top" },
        { map = "9,2", path = "top" },
        { map = "8,0", path = "top" },
        { map = "7,0", path = "top" },
        { map = "6,0", path = "top" },
        { map = "5,0", path = "top" },
        { map = "3,-1", path = "top" },
        { map = "4,-1", path = "top" },
        { map = "7,-4", path = "bottom" },
        { map = "7,-3", path = "bottom" },
        { map = "5,-1", path = "top|right" },
        { map = "6,-1", path = "left|right" },
        { map = "12,2", path = "left" },
        { map = "11,2", path = "left|right" },
        { map = "10,2", path = "top|right" },
        { map = "10,1", path = "left|bottom" },
        { map = "3,-2", path = "top|left|right" },
        { map = "4,-2", path = "top|left|right" },
        { map = "5,-3", path = "right|bottom" },
        { map = "3,-3", path = "right|bottom" },
        { map = "5,-2", path = "top|left|right|bottom" },
        { map = "4,-3", path = "left|bottom" },
        { map = "6,-2", path = "left|right" },
        { map = "9,0", path = "top" },
        { map = "9,1", path = "top|right" },
        { map = "7,-1", path = "top|right" },
        { map = "7,-2", path = "left|right" },
        { map = "8,-2", path = "bottom" },
        { map = "8,-1", path = "top|right" },
        { map = "9,-1", path = "left|bottom" },

        -- Combats
        { map = "3,-2", path = "left|right", fight = true },
        { map = "3,-3", path = "right|bottom", fight = true },
        { map = "4,-3", path = "left|bottom", fight = true },
        { map = "5,-3", path = "left|bottom", fight = true },
        { map = "6,-2", path = "left|right", fight = true },
        { map = "5,-2", path = "top|left|right|bottom", fight = true },
        { map = "5,-1", path = "top|left", fight = true },
        { map = "6,-1", path = "left|right", fight = true },
        { map = "7,-1", path = "top|left", fight = true },
        { map = "8,-1", path = "left", fight = true },
        { map = "9,-1", path = "left", fight = true },
        { map = "9,0", path = "top", fight = true },
        { map = "9,1", path = "top", fight = true },
        { map = "9,0", path = "top|left", fight = true },
        { map = "9,1", path = "top|left", fight = true },
        { map = "10,1", path = "left", fight = true },
        { map = "10,2", path = "top", fight = true },
        { map = "11,2", path = "left", fight = true },
        { map = "12,2", path = "left", fight = true },
        { map = "9,0", path = "top|left", fight = true },
        { map = "9,1", path = "top|left", fight = true },
        { map = "11,2", path = "left", fight = true },
        { map = "12,2", path = "left", fight = true },
        { map = "-3,-10", path = "bottom", fight = true },

        -- Retour en banque
        { map = "88081177", path = "right" }, -- Map ext�rieure de la banque, MAPID OBLIGATOIRE
        { map = "99095051", path = "410" }, -- Map int�rieure de la banque pour sortir, MAPID OBLIGATOIRE
    }
end

function bank()
    return {
        { map = "9,-1", path = "left" },
        { map = "9,-1", path = "left" },
        { map = "7,-2", path = "left|bottom" },
        { map = "7,-2", path = "left|bottom" },
        { map = "8,-1", path = "left" },
        { map = "9,1", path = "top" },
        { map = "10,1", path = "left" },
        { map = "11,2", path = "left" },
        { map = "12,2", path = "left" },
        { map = "7,-3", path = "bottom" },
        { map = "7,-4", path = "bottom" },
        { map = "6,-2", path = "left|right|bottom" },
        { map = "6,-1", path = "left|right" },
        { map = "10,2", path = "top" },
        { map = "5,-1", path = "top|left|bottom" },
        { map = "5,-1", path = "top|bottom" },
        { map = "5,-1", path = "top" },
        { map = "5,-2", path = "left" },
        { map = "4,-2", path = "left" },
        { map = "3,-2", path = "left" },
        { map = "5,-3", path = "left" },
        { map = "4,-3", path = "bottom" },
        { map = "3,-3", path = "right" },
        { map = "9,0", path = "top" },
        { map = "9,0", path = "top" },
        { map = "9,0", path = "top" },
        { map = "7,-1", path = "top" },
        { map = "7,-1", path = "top" },
        { map = "8,-2", path = "left" },

        -- Retour en banque
        { map = "88081177", door = "216" }, -- Map ext�rieure de la banque, on utilise la porte de la banque, MAPID OBLIGATOIRE
        { map = "99095051", npcBank = true, path = "410" }, -- Map int�rieure de la banque, on parle au banquier, MAPID OBLIGATOIRE
    }
end

