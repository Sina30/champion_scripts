APIAC = {}
--//Basic Security\\--
APIAC.Spectate = true -- Detects a user that is spectating someone else without permissions
APIAC.AntiArmor = false -- ANTI ARMOR ABOVE X VALUE
APIAC.ArmorValue = 100 -- Set Value (0-100)
APIAC.BlacklistedKey = true -- It means if someone press blacklisted key u will get log :D
APIAC.BlacklistedKeyKick = false -- if u set it true it will automatic kick player.
APIAC.BlacklistedKeys = { --key from: https://docs.fivem.net/docs/game-references/controls/
}
APIAC.NuiDevtoolsProtection = true
APIAC.AntiNoclip = true -- NEW!
APIAC.AntiGodmode = true -- NEW!
APIAC.AntiTeleport = true -- Detecting player which tried to teleport to example. Waypoint or to someone else. (No it dont detecting admin.) (BAN)
APIAC.AntiNewCommands = false -- if u turn it on dont start/restart/stop any scripts!
APIAC.AntiFreecam = true -- Anti freecam ( dont use it if you use kascharacter for example ) NEW! (BAN)
APIAC.AntiAttachPedToPlayer = true -- If someone attach ped to player then it will be deleted!
APIAC.AntiPedWithBlacklistedWeapon = true -- If someone spawn ped with blacklisted weapon it will be delted! NEW
APIAC.AntiAttachPropToPed = true -- if SOMEONE attach prop to someone else it will be deleted! NEW
APIAC.AsiDetection = true -- NEW! (BAN)
APIAC.AntiBlips = true -- NEW! (BAN)
APIAC.BlipsValue = 10 -- u can set value how many blips someone can see above this value it result ban!
APIAC.AntiTeleportToBlip = true -- new!
APIAC.AntiPlayerExplode = true -- NEW! IT DISABLES EXPLOSION ON PLAYER!
APIAC.AntiTazeWithMenu = true -- NEW! It checking shoot distance (BAN)
APIAC.AntiNightVision = true -- NEW! It checking if someone using night vision and is not in heli (BAN)
APIAC.AntiThermalVision = true -- NEW! It checking if someone using thermal vision and is not in heli (BAN)
APIAC.AntiDamageBoost = false -- NEW! It checking if someone set his damage above APIAC.AntiDamageValue
APIAC.AntiDamageValue = 8.0
APIAC.AntiSuperJump = true -- NEW! It checking if someone got superjump!
APIAC.AntiSuperJumpBan = true -- NEW! if ban then it will ban if u set false then u will get only logs.
APIAC.AntiInfinityAmmo = true -- Checking if someone got infinity ammo!
APIAC.AntiInfinityAmmoLog = true -- u will get only logs from inifnity ammo!
APIAC.AntiInfinityAmmoBan = true -- Player will be banned and logged when using infinity ammo!
APIAC.AntiInfinityStamina = false -- NEW!
APIAC.AntiInvisible = true -- NEW!
--//Ammo Options\\--
APIAC.AmmoChecker = true
APIAC.MaxAmmo = 300 -- default value, if you got enlarged magazine then set to 340
--//Vehicle options\\--
APIAC.AntiVehicleAndWeaponSpawn = true -- This checking what player type to spawn. 
APIAC.AntiVehicleHashChanger = true -- Detects if a player tried to change his vehicle hash model
APIAC.AntiVehiclePlateChanger = true -- Detects if a player tried to change his vehicle plate
APIAC.DestroyedVehicledDelete = true -- If someone explode vehicle/jet etc. api will delete it because its not longer needed! 
--//Resource Injection Protection\\-- --ANTI RESTART BOOLS (DO NOT RESTART SCRIPTS IF YOU ENALBED THESE!!!)
APIAC.AntiResourceInjection = false -- This script will check if a player tries to start/stop/restart script (do not restart scripts if this is enabled)
--//Blacklisted Weapons\\-- LIST OF BLOCKED WEAPONS
APIAC.BlacklistedWeaponBan = false -- if detect APIAC.NumberOfBlacklistedWeaponBan (example. 5 ) blacklist weapon then ban ( to prevent ban all on server ) NEW! 
APIAC.CountBlacklistedWeapons = 5
APIAC.BlacklistedWeaponsTable = { -- U can add/delete some weapons if u want!
	[GetHashKey("WEAPON_DAGGER")] = true,
	[GetHashKey("WEAPON_BOTTLE")] = true,
	[GetHashKey("WEAPON_CROWBAR")] = true,
	[GetHashKey("WEAPON_GOLFCLUB")] = true,
	[GetHashKey("WEAPON_HAMMER")] = true,
	[GetHashKey("WEAPON_HATCHET")] = true,
	[GetHashKey("WEAPON_KNUCKLE")] = true,
	[GetHashKey("WEAPON_SWITCHBLADE")] = true,
	[GetHashKey("WEAPON_WRENCH")] = true,
	[GetHashKey("WEAPON_POOLCUE")] = true,
	[GetHashKey("WEAPON_STONE_HATCHET")] = true,
	[GetHashKey("WEAPON_PISTOL_MK2")] = true,
	[GetHashKey("WEAPON_APPISTOL")] = true,
	[GetHashKey("WEAPON_SNSPISTOL")] = true,
	[GetHashKey("WEAPON_SNSPISTOL_MK2")] = true,
	[GetHashKey("WEAPON_VINTAGEPISTOL")] = true,
	[GetHashKey("WEAPON_FLAREGUN")] = true,
	[GetHashKey("WEAPON_MARKSMANPISTOL")] = true,
	[GetHashKey("WEAPON_REVOLVER")] = true,
	[GetHashKey("WEAPON_REVOLVER_MK2")] = true,
	[GetHashKey("WEAPON_DOUBLEACTION")] = true,
	[GetHashKey("WEAPON_RAYPISTOL")] = true,
	[GetHashKey("WEAPON_CERAMICPISTOL")] = true,
	[GetHashKey("WEAPON_NAVYREVOLVER")] = true,
	[GetHashKey("WEAPON_GADGETPISTOL")] = true,
	[GetHashKey("WEAPON_MICROSMG")] = true,
	[GetHashKey("WEAPON_SMG_MK2")] = true,
	[GetHashKey("WEAPON_ASSAULTSMG")] = true,
	[GetHashKey("WEAPON_COMBATPDW")] = true,
	[GetHashKey("WEAPON_MINISMG")] = true,
	[GetHashKey("WEAPON_RAYCARBINE")] = true,
	[GetHashKey("WEAPON_PUMPSHOTGUN_MK2")] = true,
	[GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = true,
	[GetHashKey("WEAPON_ASSAULTSHOTGUN")] = true,
	[GetHashKey("WEAPON_BULLPUPSHOTGUN")] = true,
	[GetHashKey("WEAPON_MUSKET")] = true,
	[GetHashKey("WEAPON_HEAVYSHOTGUN")] = true,
	[GetHashKey("WEAPON_DBSHOTGUN")] = true,
	[GetHashKey("WEAPON_AUTOSHOTGUN")] = true,
	[GetHashKey("WEAPON_COMBATSHOTGUN")] = true,
	[GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = true,
	[GetHashKey("WEAPON_CARBINERIFLE_MK2")] = true,
	[GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = true,
	[GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = true,
	[GetHashKey("WEAPON_COMPACTRIFLE")] = true,
	[GetHashKey("WEAPON_MILITARYRIFLE")] = true,
	[GetHashKey("WEAPON_MG")] = true,
	[GetHashKey("WEAPON_COMBATMG")] = true,
	[GetHashKey("WEAPON_COMBATMG_MK2")] = true,
	[GetHashKey("WEAPON_SNIPERRIFLE")] = true,
	[GetHashKey("WEAPON_HEAVYSNIPER")] = true,
	[GetHashKey("WEAPON_HEAVYSNIPER_MK2")] = true,
	[GetHashKey("WEAPON_MARKSMANRIFLE")] = true,
	[GetHashKey("WEAPON_MARKSMANRIFLE_MK2")] = true,
	[GetHashKey("WEAPON_RPG")] = true,
	[GetHashKey("WEAPON_GRENADELAUNCHER")] = true,
	[GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")] = true,
	[GetHashKey("WEAPON_MINIGUN")] = true,
	[GetHashKey("WEAPON_FIREWORK")] = true,
	[GetHashKey("WEAPON_RAILGUN")] = true,
	[GetHashKey("WEAPON_HOMINGLAUNCHER")] = true,
	[GetHashKey("WEAPON_COMPACTLAUNCHER")] = true,
	[GetHashKey("WEAPON_RAYMINIGUN")] = true,
	[GetHashKey("WEAPON_GRENADE")] = true,
	[GetHashKey("WEAPON_BZGAS")] = true,
	[GetHashKey("WEAPON_MOLOTOV")] = true,
	[GetHashKey("WEAPON_STICKYBOMB")] = true,
	[GetHashKey("WEAPON_PROXMINE")] = true,
	[GetHashKey("WEAPON_SNOWBALL")] = true,
	[GetHashKey("WEAPON_PIPEBOMB")] = true,
	[GetHashKey("WEAPON_BALL")] = true,
	[GetHashKey("WEAPON_SMOKEGRENADE")] = true,
	[GetHashKey("WEAPON_FLARE")] = true,
	[GetHashKey("WEAPON_PETROLCAN")] = true,
	[GetHashKey("WEAPON_PARACHUTE")] = true,
	[GetHashKey("WEAPON_FIREEXTINGUISHER")] = true,
	[GetHashKey("WEAPON_HAZARDCAN")] = true
}

--//Anti Model Changer\\--
APIAC.AntiModelChanger = true
APIAC.AntiModelChangerTable = { -- Peds, animals, etc.
	[GetHashKey("s_m_y_swat_01")] = true,
	[GetHashKey("a_m_y_mexthug_01")] = true, 
    [GetHashKey("a_c_cat_01")] = true, 
    [GetHashKey("a_c_boar")] = true, 
    [GetHashKey("a_c_sharkhammer")] = true, 
    [GetHashKey("a_c_coyote")] = true, 
    [GetHashKey("a_c_chimp")] = true,  
    [GetHashKey("a_c_cow")] = true, 
    [GetHashKey("a_c_deer")] = true, 
    [GetHashKey("a_c_dolphin")] = true, 
    [GetHashKey("a_c_fish")] = true, 
    [GetHashKey("a_c_hen")] = true, 
    [GetHashKey("a_c_humpback")] = true, 
    [GetHashKey("a_c_killerwhale")] = true, 
    [GetHashKey("a_c_mtlion")] = true,
    [GetHashKey("a_c_rabbit_01")] = true,  
    [GetHashKey("a_c_rhesus")] = true,  
    [GetHashKey("a_c_sharktiger")] = true, 
	[GetHashKey("u_m_y_zombie_01")] = true
}
--//Anti Blacklisted cars\\--
APIAC.CarsBL = { -- add more if u want
	[GetHashKey("RHINO")] = true,
	[GetHashKey("HYDRA")] = true,
	[GetHashKey("vigilante")] = true,
	[GetHashKey("hydra")] = true,
	[GetHashKey("buzzard")] = true,
	[GetHashKey("deluxo")] = true,
	[GetHashKey("avenger")] = true,
	[GetHashKey("akula")] = true,
	[GetHashKey("apc")] = true,
	[GetHashKey("barrage")] = true,
	[GetHashKey("caracara")] = true,
	[GetHashKey("cargobob")] = true,
	[GetHashKey("chernobog")] = true,
	[GetHashKey("jet")] = true,
	[GetHashKey("airjet")] = true,
	[GetHashKey("hunter")] = true,
	[GetHashKey("insurgent")] = true,
	[GetHashKey("starling")] = true,
	[GetHashKey("lazer")] = true,
	[GetHashKey("bombushka")] = true,
	[GetHashKey("savage")] = true,
	[GetHashKey("rhino")] = true,
	[GetHashKey("oppressor")] = true,
	[GetHashKey("oppressor2")] = true,
	[GetHashKey("khanjali")] = true
}

-------------------------------------------------------------------------------
--------------------- ___  ______ _____       ___    _____ --------------------
---------------------/ _ \ | ___ \_   _|     / _ \  /  __ \ -------------------
--------------------/ /_\ \| |_/ / | |______/ /_\ \ | /  \/--------------------
--------------------|  _  ||  __/  | |______|  _  | | |    --------------------
--------------------| | | || |    _| |_     | | | | | \__/\--------------------
--------------------\_| |_/\_|    \___/     \_| |_/  \____/--------------------
-------------------------------------------------------------------------------
