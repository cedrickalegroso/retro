Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = true -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 30

Config.Locale                     = 'en'

Config.thelostStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(966.82,-126.38,74.35),
			Sprite  = 226,
			Display = 4,
			Scale   = 1.2,
			Colour  = 75
		},

		Cloakrooms = {
			vector3(0, 0, 0)
		},

		Armories = {
			vector3(989.47,-136.84,74.07)
		},

		Vehicles = {
			{
				Spawner = vector3(982.14,-129.27,74.06),
				InsideShop = vector3(987.41,-128.16,74.06),
				SpawnPoints = {
					{coords = vector3(991.91,-125.17,74.06), heading = 57.59, radius = 6.0},
					{coords = vector3(991.14,-128.33,74.06), heading = 90.0, radius = 6.0},
					{coords = vector3(982.43,-135.58,74.06), heading = 90.0, radius = 6.0},
				--	{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-2720.0949707031,-61.464767456055,18.85729598999),
				InsideShop = vector3(-1878.6215820312,3003.4211425781,32.810466766357),
				SpawnPoints = {
					{coords = vector3(-2726.9990234375,-59.13060760498,18.899234771729), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(954.42,-114.74,75.01)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_COMBATPISTOL', price = 10},
		{weapon = 'WEAPON_STUNGUN', price = 10},
		{weapon = 'WEAPON_NIGHTSTICK', price = 10},
		{weapon = 'WEAPON_FLASHLIGHT', price = 10},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10},
		{weapon = 'WEAPON_FLARE', price = 10},
	},

	officer = {
		{weapon = 'WEAPON_COMBATPISTOL', price = 10},
		{weapon = 'WEAPON_STUNGUN', price = 10},
		{weapon = 'WEAPON_NIGHTSTICK', price = 10},
		{weapon = 'WEAPON_FLASHLIGHT', price = 10},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10},
		{weapon = 'WEAPON_CARBINERIFLE', price = 10},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10},
		{weapon = 'WEAPON_FLARE', price = 10},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 10},
	},

	sergeant = {
		{weapon = 'WEAPON_COMBATPISTOL', price = 10},
		{weapon = 'WEAPON_STUNGUN', price = 10},
		{weapon = 'WEAPON_NIGHTSTICK', price = 10},
		{weapon = 'WEAPON_FLASHLIGHT', price = 10},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10},
		{weapon = 'WEAPON_CARBINERIFLE', price = 10},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10},
		{weapon = 'WEAPON_FLARE', price = 10},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 10},
	},

	lieutenant = {
		{weapon = 'WEAPON_COMBATPISTOL', price = 10},
		{weapon = 'WEAPON_STUNGUN', price = 10},
		{weapon = 'WEAPON_NIGHTSTICK', price = 10},
		{weapon = 'WEAPON_FLASHLIGHT', price = 10},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10},
		{weapon = 'WEAPON_CARBINERIFLE', price = 10},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10},
		{weapon = 'WEAPON_FLARE', price = 10},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 10},
	},

	boss = {
		{weapon = 'WEAPON_COMBATPISTOL', price = 10},
		{weapon = 'WEAPON_STUNGUN', price = 10},
		{weapon = 'WEAPON_NIGHTSTICK', price = 10},
		{weapon = 'WEAPON_FLASHLIGHT', price = 10},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 10},
		{weapon = 'WEAPON_CARBINERIFLE', price = 10},
		{weapon = 'WEAPON_SMOKEGRENADE', price = 10},
		{weapon = 'WEAPON_FLARE', price = 10},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 10},
	}
}



Config.AuthorizedVehicles = {

	recruit = {
		{ model = 'motoc', label = 'Honda Motocompo', price = 400 }

	},

	officer = {
		{ model = 'motoc', label = 'Honda Motocompo', price = 400 }
	},

	sergeant = {
		{ model = 'motoc', label = 'Honda Motocompo', price = 400 }

	},

	lieutenant = {
		{ model = 'motoc', label = 'Honda Motocompo', price = 400 }


	},

	boss = {
		    { model = 'ddc', label = 'Ducati Diavel', price = 400 },
			{ model = 'motoc', label = 'Honda Motocompo', price = 400 }

	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	tyro = {},

	soldier = {
		--{ model = 'buzzard2', label = 'Gang Buzzard',  price = 400 }
	},

	captain = {
		--{ model = 'buzzard2', label = 'Gang Buzzard',  price = 400 }
	},

	boss = {
		--{ model = 'buzzard2', label = 'Gang Buzzard',  price = 400 }
	},

	
}

Config.CustomPeds = {
	shared = {
		{label = 'Police', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'},
		{label = 'PoliceBLK', maleModel = 's_m_y_ranger_01', femaleModel = 's_m_y_ranger_01'},
		{label = 'PoliceWTE', maleModel = 's_m_y_barman_01', femaleModel = 's_m_y_barman_01'},
		{label = 'SWAT', maleModel = 's_m_y_blackops_01', femaleModel = 's_m_y_blackops_01'},
		{label = 'SWAT2', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'},
		{label = 'PCSO', maleModel = 's_m_y_sheriff_01', femaleModel = 's_m_y_sheriff_01'},
		{label = 'PCSO2', maleModel = 's_m_m_chemsec_01', femaleModel = 's_m_m_chemsec_01'},
		{label = 'Detective', maleModel = 's_m_m_ciasec_01', femaleModel = 's_m_m_ciasec_01'},
		{label = 'Detective2', maleModel = 's_m_m_fibsec_01', femaleModel = 's_m_m_fibsec_01'},
		{label = 'Dog Handler', maleModel = 's_m_m_prisguard_01', femaleModel = 's_m_m_prisguard_01'},
		{label = 'Highway', maleModel = 's_m_y_hwaycop_01', femaleModel = 's_m_y_hwaycop_01'},
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 3,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
