Config = {}

Config.Settings = {
    ActionDistance  = 5.0,

    Blip = {
        Type = 357,
        Scale = 0.9,
        Color = 29
    },
	
	Impound = {
        Blip = {
            Type = 477,
            Scale = 0.8,
            Color = 64
        },
        InfinityRelease = true, -- Wenn es auf true ist kann man seine Fahrzeuge ohne Wartezeit freigeben.
        NextReleaseTimer = 2, -- In Minuten / Wird nur benutzt wenn man InfinityRelease aus hat.
        Price = 500 -- $ Mach den Preis auf 0 damit seine Fahrzeuge gratis ausparken kann!
    },
}

Config.Messages = {
    ['VehicleParked']       = "✔️ Das Fahrzeug wurde eingeparkt.",
    ['VehicleParkOut']      = "✔️ Das Fahrzeug wurde ausgeparkt.",
    ['ERROR']               = "Es ist ein Fehler aufgetreten! Versuche es erneut.",
    ['Control']             = "Drücke ~INPUT_CONTEXT~ um die Garage zu öffnen",
    ['VehicleAlreadyExist'] = "Das Fahrzeug konnte nicht ausgeparkt werden, da es bereits ausgeparkt befindet!",
    ['CantReleaseVehicle']  = "Du kannst nur alle " .. Config.Settings['Impound'].NextReleaseTimer .. ' Minuten ein Fahrzeug freigeben!',
    ['NotEnoughtMoney']     = "Du hast nicht genügend Geld dabei!",
    
}

Config.Impounds = {
    ['ChampionImpound'] = {
        Blip            = true,
        label           = "Los Santos",
        Position        = vector3(408.04, -1625.0, (29.29 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(397.21, -1643.32, 29.29),
            heading     = 323.63,
			position	= vector3 (402.02, -1647.26, 29.29),
			heading		= 322.74,
			position	= vector3 (406.9, -1651.2, 29.29),
			heading		= 322.86
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 232.38,
        },
    },
    ['ChampionImpound2'] = {
        Blip            = true,
        label           = "Paleto Bay",
        Position        = vector3(105.28, 6613.51, (32.4 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(118.87, 6600.24, 32.01),
            heading     = 278.35,
			position	= vector3 (127.73, 6589.95, 31.94),
			heading		= 273.89,
			position	= vector3 (145.89, 6600.14, 31.85),
			heading		= 180.91
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 228.94,
        },
    },
    ['ChampionImpound3'] = {
        Blip            = true,
        label           = "Airport",
        Position        = vector3(-1621.97, -3152.41, (13.99 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(-1655.37, -3148.41, 13.99),
            heading     = 327.72
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 50.69,
        },
    },

    ['ChampionImpound4'] = {
        Blip            = true,
        label           = "Sandy Shores",
        Position        = vector3(1508.41, 3765.04, (34.15 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(1514.21, 3756.5, 34.0),
            heading     = 119.39
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 214.64,
        },
    },

    ['ChampionImpound5'] = {
        Blip            = true,
        label           = "Cayo Perico",
        Position        = vector3(4440.39, -4481.39, (4.31 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(4450.27, -4507.0, 4.18),
            heading     = 109.96
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 200.55,
        },
    },

    ['ChampionImpound6'] = {
        Blip            = true,
        label           = "Boot Impound 1",
        Position        = vector3(4898.18, -5168.74, (2.46 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(4803.91, -5150.27, 1.50),
            heading     = 334.14
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 154.64,
        },
    },

    ['ChampionImpound7'] = {
        Blip            = true,
        label           = "Boot Impound 2 Los Sanots",
        Position        = vector3(-769.53, -1425.68, (1.6 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(-766.6, -1402.91, 1.50),
            heading     = 136.48
			
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 243.86,
        },
    },
}

Config.Garages = {
    ['ChampionGarage1'] = {
		Blip            = true,
        label           = 'Meeting Point',     
        Position        = vector3(219.7, -811.47, (30.73 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(223.33, -804.64, 30.65),
            heading     = 253.07,
			position  	= vector3 (224.67, -799.45, 30.65),
			heading		= 257.23,
			position	= vector3 (233.99, -799.95, 30.5),
			heading		= 70.06,
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 253.38,
        },
        FindCarDistance = 15.0,
    },
    
    ['ChampionGarage2'] = {
		Blip            = true,
        label           = 'Paleto Bay',     
        Position        = vector3(52.64, 6338.98, (31.38 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(31.03, 6333.69, 31.23),
            heading     = 11.67,
			position	= vector3 (24.44, 6329.48, 31.23),
			heading		= 17.9,
			position	= vector3 (25.3, 6345.51, 31.24),
			heading		= 30.32
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 29.8,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage3'] = {
		Blip            = true,
        label           = 'Harmony',     
        Position        = vector3(618.65, 2786.58, (43.48 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(617.12, 2793.62, 42.12),
            heading     = 9.27,
			position	= vector3 (609.58, 2793.53, 42.1),
			heading		= 7.46,
			position	= vector3 (601.66, 2793.72, 42.1),
			heading		= 4.73
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 4.72,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage4'] = {
		Blip            = true,
        label           = 'Vespucci',     
        Position        = vector3(-1184.58, -1508.91, (4.65 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(-1184.89, -1493.05, 4.38),
            heading     = 123.31,
			position	= vector3 (-1188.87, -1488.18, 4.38),
			heading		= 123.35,
			position	= vector3 (-1178.79, -1489.11, 4.38),
			heading		= 301.83
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 35.08,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage5'] = {
		Blip            = true,
        label           = 'Universität',     
        Position        = vector3(-1686.25, 58.73, (64.13 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(-1685.43, 48.79, 64.04),
            heading     = 162.89,
			position	= vector3 (-1680.08, 43.77, 63.65),
			heading		= 163.74,
			position	= vector3 (-1694.31, 57.3, 64.7),
			heading		= 160.07
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 166.8,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage6'] = {
		Blip            = true,
        label           = 'Sandy Shores',     
        Position        = vector3(1949.49, 3754.92, (32.2 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(1962.56, 3767.29, 32.2),
            heading     = 32.3,
			position	= vector3 (1955.64, 3763.22, 32.2),
			heading		= 30.27,
			position	= vector3 (1949.08, 3759.82, 32.21),
			heading		= 36.27
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 28.77,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage7'] = {
		Blip            = true,
        label           = 'Casino',     
        Position        = vector3(922.33, -41.96, (78.76 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3(918.5, -41.63, 78.76),
            heading     = 59.49,
			position	= vector3 (916.3, -44.39, 78.76),
			heading		= 59.94,
			position	= vector3 (914.28, -47.19, 78.76),
			heading		= 62.43
        },
        Ped             = {
            name        = 'mp_m_waremech_01',
            heading     = 58.26,
        },
        FindCarDistance = 10.0,
    },
	
	['ChampionGarage8'] = {
		Blip            = true,
        label           = 'Helikopter',     
        Position        = vector3 (-1127.13, -2873.96, (13.95 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1112.41, -2884.04, 13.95),
            heading     = 330.27,
			position	= vector3 (-1145.88, -2864.7, 13.95),
			heading		= 329.19,
			position	= vector3 (-1178.34, -2845.9, 13.95),
			heading		= 333.51
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 242.46,
        },
        FindCarDistance = 100.0,
    },
	
	['ChampionGarage9'] = {
		Blip            = true,
        label           = 'Flugzeuge',     
        Position        = vector3 (-1231.34, -3376.29, (13.95 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1270.51, -3397.71, 13.94),
            heading     = 330.54,
			position	= vector3 (-1285.72, -3387.66, 13.94),
			heading		= 329.8
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 333.72,
        },
        FindCarDistance = 200.0,
    },
	
	['ChampionGarage10'] = {
		Blip            = true,
        label           = 'Sandy Flugzeuge',     
        Position        = vector3 (1727.22, 3291.02, (41.18 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1702.62, 3250.93, 40.98),
            heading     = 106.62,
			position	= vector3 (1755.9, 3266.76, 41.28),
			heading		= 99.77
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 199.16,
        },
        FindCarDistance = 200.0,
    },
	
	['ChampionGarage11'] = {
		Blip            = true,
        label           = 'Sandy Helikopter',     
        Position        = vector3 (1787.42, 3237.6, (42.47 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1770.31, 3239.86, 42.12),
            heading     = 100.79
        },
        Ped             = {
            name        = 's_m_y_airworker',
            heading     = 1787.42,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage12'] = {
		Blip            = true,
        label           = 'Lagerhalle',     
        Position        = vector3 (62.38, -2565.64, (6.0 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (70.81, -2559.01, 6.0),
            heading     = 4.63,
			position	= vector3 (77.05, -2558.61, 6.0),
			heading		= 6.7,
			position	= vector3 (83.85, -2558.58, 6.0),
			heading		= 2.69
        },
        Ped             = {
            name        = 's_m_y_construct_02',
            heading     = 2.76,
        },
        FindCarDistance = 50.0,
    },

	
	['ChampionGarage14'] = {
		Blip            = true,
        label           = 'Bennys',     
        Position        = vector3 (-178.74, -1282.41, (31.3 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-188.87, -1284.31, 31.23),
            heading     = 268.91,
			position	= vector3 (-188.94, -1295.29, 31.3),
			heading		= 273.3
        },
        Ped             = {
            name        = 's_m_y_valet_01',
            heading     = 183.87,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage15'] = {
		Blip            = true,
        label           = 'Fahrzeughändler',     
        Position        = vector3 (-26.64, -1089.86, (26.42 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-10.17, -1084.01, 26.7),
            heading     = 161.64,
			position	= vector3 (-16.21, -1082.53, 26.7),
			heading		= 163.02
        },
        Ped             = {
            name        = 's_m_y_valet_01',
            heading     = 67.7,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage16'] = {
		Blip            = true,
        label           = 'Krankenhaus',     
        Position        = vector3 (276.66, -341.97, (44.92 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (266.9, -332.51, 44.92),
            heading     = 249.71,
			position	= vector3 (269.08, -325.87, 44.92),
			heading		= 249.81
        },
        Ped             = {
            name        = 's_m_m_bouncer_01',
            heading     = 339.3,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage17'] = {
		Blip            = true,
        label           = 'Sandy Shores 2',     
        Position        = vector3 (1365.01, 3604.56, (34.81 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1365.57, 3593.15, 34.9),
            heading     = 290.51,
			position	= vector3 (1363.13, 3600.49, 34.89),
			heading		= 291.54
        },
        Ped             = {
            name        = 'a_m_m_og_boss_01',
            heading     = 203.42,
        },
        FindCarDistance = 50.0,
    },
		
	['ChampionGarage18'] = {
		Blip            = true,
        label           = 'LKW',     
        Position        = vector3 (100.62, -1072.97, (29.37 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (137.32, -1080.03, 29.19),
            heading     = 90.97,
			position    = vector3 (137.91, -1063.56, 29.19),
            heading     = 95.6,
        },
        Ped             = {
            name        = 'mp_m_execpa_01',
            heading     = 341.44,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage19'] = {
		Blip            = true,
        label           = 'Ballas',     
        Position        = vector3 (118.47, -1951.08, (20.75 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (109.43, -1942.46, 20.8),
            heading     = 51.56
        },
        Ped             = {
            name        = 'csb_ballasog',
            heading     = 53.53,
        },
        FindCarDistance = 50.0,
    },
	
	['ChampionGarage20'] = {
		Blip            = true,
        label           = 'LSC',     
        Position        = vector3 (-368.67, -101.59, (39.54 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-361.6, -119.75, 38.7),
            heading     = 72.27
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 165.33,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage21'] = {
		Blip            = true,
        label           = 'Impound Garage',     
        Position        = vector3 (371.42, -1612.74, (29.29 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (378.17, -1614.1, 29.29),
            heading     = 228.59
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 321.95,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage22'] = {
		Blip            = true,
        label           = 'SG Garage',     
        Position        = vector3 (1852.11, 2589.92, (45.67 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1870.47, 2588.32, 45.67),
            heading     = 228.59
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 271.54,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage23'] = {
		Blip            = true,
        label           = 'Staatsbank',     
        Position        = vector3 (-21.91, 217.75, (106.59 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-26.25, 207.91, 106.55),
            heading     = 347.88
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 166.62,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage24'] = {
		Blip            = true,
        label           = 'Fabrik',     
        Position        = vector3 (722.65, -2016.4, (29.29 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-26.25, 207.91, 106.55),
            heading     = 354.51
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 265.33,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage25'] = {
		Blip            = true,
        label           = 'Marabunta Grande 13',     
        Position        = vector3 (1196.22, -1769.13, (39.56 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1191.44, -1758.21, 38.67),
            heading     = 354.51
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 336.21,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage26'] = {
		Blip            = true,
        label           = 'Schleife',     
        Position        = vector3 (-72.77, 908.45, (203.79 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-70.15, 900.27, 235.58),
            heading     = 116.58
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 207.44,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage27'] = {
		Blip            = true,
        label           = 'Farm',     
        Position        = vector3 (-41.99, 1883.13, (195.67 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-46.25, 1877.19, 196.52),
            heading     = 121.42
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 207.44,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage28'] = {
		Blip            = true,
        label           = 'Strom',     
        Position        = vector3 (2763.4, 1364.93, (24.52 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (2743.43, 1368.62, 24.52),
            heading     = 121.42
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 93.97,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage29'] = {
		Blip            = true,
        label           = 'Farm',     
        Position        = vector3 (2435.05, 5012.12, (46.85 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (2452.26, 5032.72, 45.9),
            heading     = 121.42
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 317.31,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage30'] = {
		Blip            = true,
        label           = 'Triaden',     
        Position        = vector3 (1407.68, 1114.62, (114.84 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1392.88, 1117.7, 114.84),
            heading     = 89.93
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 360.00,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage31'] = {
		Blip            = true,
        label           = 'Garage',     
        Position        = vector3 (-1135.3, 2682.27, (18.37 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1156.5, 2675.06, 18.09),
            heading     = 218.86
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 133.48,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage32'] = {
		Blip            = true,
        label           = 'Verkäufer',     
        Position        = vector3 (1213.27, 1843.03, (78.91 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1216.98, 1823.66, 79.09),
            heading     = 32.39
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 222.72,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage33'] = {
		Blip            = true,
        label           = 'Vinewood',     
        Position        = vector3 (781.64, 1296.72, (361.36 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (793.43, 1275.01, 360.3),
            heading     = 263.46
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 174.09,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage34'] = {
		Blip            = true,
        label           = 'Observatorium',     
        Position        = vector3 (-404.21, 1199.08, (325.98 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-407.28, 1205.92, 325.64),
            heading     = 263.46
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 164.08,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage35'] = {
		Blip            = true,
        label           = 'Blane Tanke',     
        Position        = vector3 (1465.94, 6542.79, (14.23 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (1450.69, 6548.56, 15.15),
            heading     = 147.05
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 92.14,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage36'] = {
		Blip            = true,
        label           = 'Berg',     
        Position        = vector3 (-1111.31, 4937.35, (218.39 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1116.19, 4924.65, 218.14),
            heading     = 243.54
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 155.74,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage37'] = {
		Blip            = true,
        label           = 'Hafen',     
        Position        = vector3 (786.71, -2985.99, (6.02 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (781.57, -2977.02, 5.8),
            heading     = 243.54
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 93.42,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage38'] = {
		Blip            = true,
        label           = 'Hafen 2',     
        Position        = vector3 (156.35, -3038.25, (7.03 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (167.46, -3048.69, 5.86),
            heading     = 243.54
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 270.77,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage37'] = {
		Blip            = true,
        label           = 'Pier',     
        Position        = vector3 (-1591.62, -1058.51, (13.02 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1581.95, -1038.27, 13.02),
            heading     = 243.54
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 312.18,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage38'] = {
		Blip            = true,
        label           = 'Garage',     
        Position        = vector3 (-2341.65, 268.71, (169.47 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-2331.92, 277.79, 169.47),
            heading     = 289.99
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 344.6,
        },
        FindCarDistance = 50.0,
    },
    
    ['ChampionGarage39'] = {
		Blip            = true,
        label           = 'Villa',     
        Position        = vector3 (-2783.67, 1423.69, (100.93 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-2785.6, 1431.81, 100.83),
            heading     = 231.76
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 325.51,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage40'] = {
		Blip            = true,
        label           = 'Villa 2',     
        Position        = vector3 (-2583.2, 1926.12, (167.31 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-2595.13, 1930.27, 167.3),
            heading     = 274.62
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 101.19,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage41'] = {
		Blip            = true,
        label           = 'Irish Mob',     
        Position        = vector3 (-1928.7, 2060.27, (140.84 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1918.96, 2057.07, 140.74),
            heading     = 257.71
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 348.64,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage42'] = {
		Blip            = true,
        label           = 'Army',     
        Position        = vector3 (-2350.21, 3343.31, (32.97 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-2353.18, 3360.24, 32.83),
            heading     = 257.71
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 342.19,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage43'] = {
		Blip            = true,
        label           = 'Yakuza',     
        Position        = vector3 (-1522.25, 877.56, (181.75 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1505.2, 886.6, 182.08),
            heading     = 283.13
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 300.47,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage44'] = {
		Blip            = true,
        label           = 'Bar',     
        Position        = vector3 (-2195.93, 4271.06, (48.56 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-2209.41, 4275.34, 48.04),
            heading     = 55.41
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 158.22,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage45'] = {
		Blip            = true,
        label           = 'Trevor',     
        Position        = vector3 (-87.7, 3625.22, (39.86 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-77.27, 3623.87, 39.71),
            heading     = 196.31
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 81.55,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage46'] = {
		Blip            = true,
        label           = 'Ballas',     
        Position        = vector3 (-47.04, -1846.17, (26.18 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-51.9, -1833.09, 26.57),
            heading     = 323.44
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 50.25,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage47'] = {
		Blip            = true,
        label           = 'Vatos Locos',     
        Position        = vector3 (-365.83, 42.71, (50.98 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-373.4, 39.54, 50.94),
            heading     = 90.01
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 177.47,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage48'] = {
		Blip            = true,
        label           = 'Vinewood',     
        Position        = vector3 (-1455.53, -691.28, (26.34 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1448.23, -683.65, 26.36),
            heading     = 309.69
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 323.39,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage49'] = {
		Blip            = true,
        label           = 'Cayo Perico',     
        Position        = vector3 (5005.91, -5196.94, (2.51 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (5015.14, -5185.18, 2.52),
            heading     = 309.69
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 305.39,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage50'] = {
		Blip            = true,
        label           = 'Cayo Perico2',     
        Position        = vector3 (4967.09, -5600.68, (23.7 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (4968.61, -5612.01, 23.62),
            heading     = 146.98
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 146.98,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage51'] = {
		Blip            = true,
        label           = 'Cayo Perico3',     
        Position        = vector3 (5048.77, -4595.43, (2.92 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (5048.56, -4602.83, 2.96),
            heading     = 162.14
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 166.56,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage52'] = {
		Blip            = true,
        label           = 'Cayo Perico Flughafen',     
        Position        = vector3 (4502.58, -4540.29, (4.13 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (4501.36, -4546.13, 4.03),
            heading     = 16.62
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 16.62,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage53'] = {
		Blip            = true,
        label           = 'Boot Garage',     
        Position        = vector3 (4972.96, -5175.88, (2.46 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (4923.78, -5151.44, 0.03),
            heading     = 66.50
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 340.19,
        },
        FindCarDistance = 50.0,
    },

    
    ['ChampionGarage54'] = {
		Blip            = true,
        label           = 'Boot Garage Los Sanots',     
        Position        = vector3 (-782.0, -1441.0, (1.6 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-815.54, -1437.1, 1.00),
            heading     = 97.99
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 229.52,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage55'] = {
		Blip            = true,
        label           = 'LSMD',     
        Position        = vector3 (352.49, -624.07, (29.35 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (339.87, -624.73, 29.29),
            heading     = 249.35
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 64.85,
        },
        FindCarDistance = 50.0,
    },

    ['ChampionGarage56'] = {
		Blip            = true,
        label           = 'Orga',     
        Position        = vector3 (-1788.42, 459.59, (128.31 - 1 + 0.02)), -- x, y, z (Damit der NPC auf dem Boden steht, wird die Höhe um 1 reduziert und um 0.02 erhöht.)
        VehicleSpawn    = {
            position    = vector3 (-1804.7, 456.88, 128.29),
            heading     = 128.29
        },
        Ped             = {
            name        = 'ig_benny',
            heading     = 128.29,
        },
        FindCarDistance = 50.0,
    },
}