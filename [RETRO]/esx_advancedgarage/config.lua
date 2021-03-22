Config = {}
Config.Locale = 'en'

Config.Main = {
	MenuAlign = 'top-left', -- Menu Align. Current will show on Top Left.
	DrawDistance = 20, -- Draw Distance to Markers.
	AdvVehShop = true, -- Set to true if using esx_advancedvehicleshop.
	Commands = false, -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
	ParkVehicles = false, -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
	KickCheaters = true, -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
	CustomKickMsg = false, -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.
	GiveSocMoney = true, -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
	ShowVehLoc = true, -- true = Will show Location of Vehicles in the Garage Menus.
	Spacers = true, -- true = Shows Spacers in Menus.
	PoundTimer = false, -- true = Uses Pound Timer
	PoundWait = 5, -- How many Minutes someone must wait before Opening Pound Menu Again.
	JPoundTimer = true, -- true = Uses Job Pound Timer
	JPoundWait = 2.5, -- How many Minutes someone must wait before Opening Job Pound Menu Again.
	DamageMult = false, -- true = Costs more to Store a Broken/Damaged Vehicle.
	MultAmount = 999999999999999 -- Higher Number = Higher Repair Price.
}

Config.Blips = {
	Garages = {Sprite = 290, Color = 38, Display = 2, Scale = 1.0}, -- Public Garage Blip.
	PGarages = {Sprite = 290, Color = 53, Display = 2, Scale = 1.0}, -- Private Garage Blip.
	Pounds = {Sprite = 67, Color = 64, Display = 2, Scale = 1.0}, -- Pound Blip.
	JGarages = {Sprite = 290, Color = 49, Display = 2, Scale = 1.0}, -- Job Garage Blip.
	JPounds = {Sprite = 67, Color = 49, Display = 2, Scale = 1.0}, -- Job Pound Blip.
}

Config.Ambulance = {
	Garages = true, -- true = Allows use of Ambulance Garages.
	Pounds = true, -- true = Allows use of Ambulance Pounds.
	Blips = false, -- true = Use Ambulance Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Ambulance Pound.
	Markers = {
		Points = {type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Police = {
	Garages = true, -- true = Allows use of Police Garages.
	Pounds = true, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Police Pound.
	Markers = {
		Points = {Type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0} -- Red Color / Standard Size Circle.
	}
}


Config.Cuatro = {
	Garages = true, -- true = Allows use of Police Garages.
	Pounds = true, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Police Pound.
	Markers = {
		Points = {Type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0} -- Red Color / Standard Size Circle.
	}
}



Config.Vermillion = {
	Garages = true, -- true = Allows use of Police Garages.
	Pounds = true, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Police Pound.
	Markers = {
		Points = {Type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Gordo = {
	Garages = true, -- true = Allows use of Police Garages.
	Pounds = true, -- true = Allows use of Police Pounds.
	Blips = false, -- true = Use Police Blips.
	PoundP = 80, -- How much it Costs to get Vehicles from Police Pound.
	Markers = {
		Points = {Type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0} -- Red Color / Standard Size Circle.
	}
}




Config.Mechanic = {
	Garages = false, -- true = Allows use of Mechanic Garages.
	Pounds = false, -- true = Allows use of Mechanic Pounds.
	Blips = false, -- true = Use Mechanic Blips.
	PoundP = 0, -- How much it Costs to get Vehicles from Mechanic Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.
	}
}

Config.Aircrafts = {
	Garages = true, -- true = Allows use of Aircraft Garages.
	Blips = true, -- true = Use Aircraft Blips.
	PoundP = 10000, -- How much it Costs to get Vehicles from Aircraft Pound.
	Markers = {
		Points = {Type = 34, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 34, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 34, r = 0, g = 0, b = 100, x = 1.0, y = 1.0, z = 1.0}-- Blue Color / Standard Size Circle.
	}
}

Config.Boats = {
	Garages = true, -- true = Allows use of Boat Garages.
	Blips = true, -- true = Use Boat Blips.
	PoundP = 500, -- How much it Costs to get Vehicles from Boat Pound.
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
	}
}

Config.Cars = {
	Garages = true, -- true = Allows use of Car Garages.
	Blips = true, -- true = Use Car Blips.
	PoundP = 15000, -- How much it Costs to get Vehicles from Car Pound.
	Markers = {
		Points = {Type = 36, r = 0, g = 255, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 36, r = 255, g = 0, b = 0, x = 1.0, y = 1.0, z = 1.0}, -- Red Color / Big Size Circle.
		Pounds = {Type = 36, r = 0, g = 0, b = 100, x = 1.0, y = 1.0, z = 1.0} -- Blue Color / Standard Size Circle.
	}
}

Config.Pvt = {
	Garages = false, -- Set to true if using esx_property & want Private Car Garages for Properties
	Markers = {
		Points = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0}, -- Green Color / Standard Size Circle.
		Delete = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Red Color / Big Size Circle.
	}
}

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance

Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(294.65768432617,-613.02038574219,43.419040679932),
		Spawner = vector3(296.5671081543,-610.99108886719,43.265029907227),
		Spawner2 = vector3(297.8427734375,-608.36242675781,43.27311706543),
		Deleter = vector3(298.55462646484,-605.46508789062,43.250991821289),
		Deleter2 = vector3(0,0,0),
		Heading = 59.79,
		Heading2 = 59.79
	},

	Los_Santos2 = {
		Marker = vector3(334.21896362305,-589.435546875,28.796840667725),
		Spawner = vector3(329.44317626953,-590.72143554688,28.796836853027),
		Spawner2 = vector3(325.77890014648,-589.46948242188,28.796838760376),
		Deleter = vector3(322.47225952148,-588.83404541016,28.796842575073),
		Deleter2 = vector3(0,0,0),
		Heading = 336.79,
		Heading2 = 336.79
	},


	Paleto = {
		Marker = vector3(-239.20602416992,6327.9194335938,32.400386810303),
		Spawner = vector3(-240.3772277832,6335.5908203125,32.338436126709),
		Spawner2 = vector3(-232.51626586914,6327.7646484375,31.922264099121),
		Deleter = vector3(-230.62710571289,6325.7104492188,31.595506668091),
		Deleter2 = vector3(0,0,0),
		Heading = 223.79,
		Heading2 = 223.79
	}

	
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(-497.35, -346.19, 34.5),
		Spawner = vector3(-491.43, -341.91, 35.37),
		Heading = 261.34
	},

	Los_Santos1 = {
		Marker = vector3(-259.15762329102,6347.671875,32.426456451416),
		Spawner = vector3(-251.57678222656,6346.2055664062,32.411022186279),
		Heading = 225.34
	}

	
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(461.55520629883,-984.53009033203,25.699853897095),
		Spawner = vector3(451.84747314453,-978.73168945312,25.699789047241),
		Spawner2 = vector3(451.84747314453,-978.73168945312,25.699789047241),
		Deleter = vector3(446.11090087891,-986.13348388672,25.699806213379),
		Deleter2 = vector3(445.76358032227,-988.70385742188,25.699806213379),
		Heading = 87.46,
		Heading2 = 87.53
	},

	Los_Santos2 = {
		Marker = vector3(462.21063232422,-985.16949462891,43.691989898682),
		Spawner = vector3(449.76077270508,-981.37780761719,43.691715240479),
		Spawner2 = vector3(481.53237915039,-982.36651611328,41.008014678955),
		Deleter = vector3(449.76077270508,-981.37780761719,43.691715240479),
		Deleter2 = vector3(481.53237915039,-982.36651611328,41.008014678955),
		Heading = 87.46,
		Heading2 = 87.53
	},

	Los_Santos3 = {
		Marker = vector3(1861.7069091797,3682.4443359375,33.781761169434),
		Spawner = vector3(1864.6092529297,3680.9348144531,33.660026550293),
		Spawner2 = vector3(1868.0649414062,3683.1433105469,33.676746368408),
		Deleter = vector3(1853.8057861328,3675.8627929688,33.756072998047),
		Deleter2 = vector3(1851.0299072266,3673.76171875,33.762752532959),
		Heading = 211.46,
		Heading2 = 211.53
	},

	Los_Santos4 = {
		Marker = vector3(-444.96429443359,6024.5366210938,31.490114212036),
		Spawner = vector3(-440.29006958008,6027.4135742188,31.340724945068),
		Spawner2 = vector3(-435.60971069336,6029.123046875,31.340545654297),
		Deleter = vector3(-459.48120117188,6020.556640625,31.340545654297),
		Deleter2 = vector3(-462.49069213867,6009.4155273438,31.340536117554),
		Heading = 45.46,
		Heading2 = 45.53
	},



	
	
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(436.37054443359,-973.89514160156,25.699813842773),
		Spawner = vector3(430.90042114258,-976.06103515625,25.699813842773),
		Heading = 180.3
	},

	Los_Santos1 = {
		Marker = vector3(449.93756103516,-972.76422119141,43.691799163818),
		Spawner = vector3(449.46591186523,-980.58386230469,43.691791534424),
		Heading = 180.3
	},

	Los_Santos2 = {
		Marker = vector3(1845.9777832031,3672.8322753906,33.694873809814),
		Spawner = vector3(1847.8706054688,3667.5710449219,33.877265930176),
		Heading = 180.3
	}

	
	
}
-- End of Police


-- Start of Police
Config.CuatroGarages = {
	Los_Santos = {
		Marker = vector3(-1920.1807861328,2048.2360839844,140.73526000977),
		Spawner = vector3(-1921.3120117188,2044.4719238281,140.73506164551),
		Spawner2 = vector3(-1923.1037597656,2040.5821533203,140.73454284668),
		Deleter = vector3(-1890.5834960938,2046.0651855469,140.86418151855),
		Deleter2 = vector3(-1895.5225830078,2035.0688476562,140.74145507812),
		Heading = 253.46,
		Heading2 = 253.53
	}
}

Config.CuatroPounds = {
	Los_Santos = {
		Marker = vector3(-1922.9987792969,2049.1645507812,140.734375),
		Spawner = vector3(-1920.4888916016,2057.0458984375,140.7345123291),
		Heading = 253.34
	}
}
-- End of Police


-- Start of Police
Config.VermillionGarages = {
	Los_Santos = {
		Marker = vector3(-1918.7770996094,2057.26171875,140.7353515625),
		Spawner = vector3(-1920.2712402344,2052.9479980469,140.73504638672),
		Spawner2 = vector3(-1921.2047119141,2048.7651367188,140.73489379883),
		Deleter = vector3(-1922.2924804688,2044.3559570312,140.73480224609),
		Deleter2 = vector3(-1923.1486816406,2040.9197998047,140.73471069336),
		Heading = 247.46,
		Heading2 = 247.53
	}
}

Config.VermillionPounds = {
	Los_Santos = {
		Marker = vector3(-1907.8629150391,2021.3817138672,140.78504943848),
		Spawner = vector3(-1907.4641113281,2016.7550048828,140.96748352051),
		Heading = 247.34
	}
}
-- End of Police


-- Start of Police
Config.GordoGarages = {
	Los_Santos = {
		Marker = vector3(2598.34765625,6178.3559570312,168.04647827148),
		Spawner = vector3(2596.9711914062,6182.9609375,167.32032775879),
		Spawner2 = vector3(2587.4111328125,6206.435546875,165.56039428711),
		Deleter = vector3(2595.5024414062,6186.734375,166.42364501953),
		Deleter2 = vector3(2596.6462402344,6182.556640625,167.26573181152),
		Heading = 260.46,
		Heading2 = 260.53
	},

	Los_Santos2 = {
		Marker = vector3(2354.7189941406,5881.4545898438,47.317527770996),
		Spawner = vector3(2351.7687988281,5878.0620117188,47.36385345459),
		Spawner2 = vector3(2346.6655273438,5885.4184570312,47.515377044678),
		Deleter = vector3(2357.279296875,5877.9399414062,47.225955963135),
		Deleter2 = vector3(0,0,0),
		Heading = 40.00,
		Heading2 = 40.00
	},



	
}

Config.GordoPounds = {
	Los_Santos = {
		Marker = vector3(2560.970703125,6177.8046875,163.37550354004),
		Spawner = vector3(2567.1704101562,6177.5483398438,163.7770690918),
		Heading = 15.34
	},
	Los_Santosheli = {
		Marker = vector3(2584.3950195312,6202.1025390625,165.62110900879),
		Spawner = vector3(2591.15234375,6202.8061523438,165.56037902832),
		Heading = 15.34
	}
}
-- End of Police

-- Start of Mechanic
Config.MechanicGarages = {
	Los_Santos = {
		Marker = vector3(-344.25, -123.4, 38.01),
		Spawner = vector3(-370.1, -108.28, 37.68),
		Deleter = vector3(-370.1, -108.28, 37.68),
		Heading = 73.9
	}
}

Config.MechanicPounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Mechanic

-- Start of Aircrafts
Config.AircraftGarages = {
	Los_Santos_Airport = {
		Marker = vector3(-1617.14, -3145.52, 12.99),
		Spawner = vector3(-1657.99, -3134.38, 12.99),
		Deleter = vector3(-1642.12, -3144.25, 12.99),
		Heading = 330.11
	},
	Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	},
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2082.36, 4806.06, 40.07),
		Heading = 115.04
	},
	Magsd_Airport = {
		Marker = vector3(-65.279479980469,831.89154052734,241.08987426758),
		Spawner = vector3(-58.9714012146,832.66180419922,241.08984375),
		Deleter = vector3(-58.9714012146,832.66180419922,241.08984375),
		Heading = 115.04
	}
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	},
	Mags_Santos_Airport = {
		Marker = vector3(-53.026336669922,833.00952148438,241.08984375),
		Spawner = vector3(-58.739070892334,833.21258544922,241.08984375),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-2747.5554199219,-131.3731842041,1.404477596283),
		Spawner = vector3(-2746.8215332031,-150.65480041504,-0.20030078291893),
		Deleter = vector3(-2756.6845703125,-156.58641052246,0.27232328057289),
		Heading = 220.0
	},
	Los_Santos_2_Dock = {
		Marker = vector3(-807.19519042969,-1497.162109375,0.5952169895172),
		Spawner = vector3(-815.96893310547,-1500.5059814453,-0.39989048242569),
		Deleter = vector3(-805.44311523438,-1490.9565429688,-0.39990240335464),
		Heading = 45.0
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1333.2, 4269.92, 30.5),
		Spawner = vector3(1334.61, 4264.68, 29.86),
		Deleter = vector3(1323.73, 4269.94, 29.86),
		Heading = 87.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-283.74, 6629.51, 6.3),
		Spawner = vector3(-290.46, 6622.72, -0.47),
		Deleter = vector3(-304.66, 6607.36, -0.47),
		Heading = 52.0
	}
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 4.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	},
	--[[Sandy_Shores_Dock = {
	--	Marker = vector3(1299.36, 4217.93, 32.91),
	--	Spawner = vector3(1294.35, 4226.31, 29.86),
	--	Heading = 345.0
	}--,
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 6.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	}]]--
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {
	Los_Santos = {
		Marker = vector3(57.005374908447, -874.60827636719, 30.435195922852),
		Spawner = vector3(50.975471496582, -872.10034179688, 30.456581115723),
		Deleter = vector3(23.489368438721, -878.90435791016, 30.271905899048),
		Heading = 161.84
	},

	
	Sandy_Shores = {
		Marker = vector3(1881.4498291016, 2590.9709472656, 45.672061920166),
		Spawner = vector3(1877.6890869141, 2599.8620605469, 45.672061920166),
		Deleter = vector3(1722.66, 3713.74, 33.21),
		Heading = 21.22
	},
	Paleto_Bay = {
		Marker = vector3(328.25357055664,-204.51435852051,54.086315155029),
		Spawner = vector3(323.84490966797,-213.07200622559,54.086315155029),
		Deleter = vector3(331.82696533203,-206.60105895996,54.086307525635),
		Heading = 315.01
	},

	Paleto_Bay1 = {
		Marker = vector3(-1891.2762451172,2041.9123535156,140.93254089355),
		Spawner = vector3(-1890.1765136719,2045.4749755859,140.87138366699),
		Deleter = vector3(-1883.3322753906,2031.1728515625,140.56007385254),
		Heading = 65.01
	},
	
	The_Lost = {
		Marker = vector3(962.77,-122.58,74.35),
		Spawner = vector3(966.04,-109.58,74.36),
		Deleter = vector3(0,0,0),
		Heading = 226.25
	},
	Grove_Mech = {
	Marker = vector3(-55.51,-1848.09,26.39),
		Spawner = vector3(-52.18,-1849.05,26.28),
		Deleter = vector3(-43.71,-1839.85,26.19),
		Heading = 318.65
	},
	Mount_Zonah = {
	Marker = vector3(349.29772949219,-622.71228027344,29.293960571289),
		Spawner = vector3(346.35772705078,-620.81433105469,29.293956756592),
		Deleter = vector3(343.08911132812,-619.46044921875,29.293954849243),
		Heading = 156.78
	},
	Riri_Bay = {
		Marker = vector3(-3200.2980957031,841.06652832031,8.9349088668823),
		Spawner = vector3(-3204.1435546875,843.68707275391,7.9348993301392),
		Deleter = vector3(-3201.3295898438,836.18048095703,8.9348993301392),
		Heading = 132.0
	},

	Gordo = {
		Marker = vector3(2496.0717773438,6115.7578125,167.04512023926),
		Spawner = vector3(2485.73828125,6119.0473632812,167.57499694824),
		Deleter = vector3(2493.859375,6123.685546875,163.44665527344),
		Heading = 125.0
	},
	Magitbay = {
		Marker = vector3(-102.5821762085,819.88983154297,235.72581481934),
		Spawner = vector3(-103.76957702637,824.73309326172,234.72528076172),
		Deleter = vector3(-107.10875701904,824.41345214844,235.72468566895),
		Heading = 8.14
	},
	Mech_Paleto = {
		Marker = vector3(115.96,6633.76,32.01),
		Spawner = vector3(123.83,6620.55,31.82),
		Deleter = vector3(111.74,6607.34,31.88),
		Heading = 314.20
	},
	Mech_Sandy = {
		Marker = vector3(1446.93,3575.29,35.59),
		Spawner = vector3(1437.36,3575.16,35.43),
		Deleter = vector3(1430.06,3570.56,35.53),
		Heading = 10.24
	}
	
}
Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(-56.369331359863,-1825.5596923828,26.905891418457),
		Spawner = vector3(-44.662986755371,-1840.5386962891,26.207845687866),
		Heading = 138.54
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 38.65),
		Spawner = vector3(1627.84, 3788.45, 38.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 31.94),
		Spawner = vector3(-230.08, 6190.24, 31.49),
		Heading = 140.24
	},
	City = {
		Marker = vector3(-775.76477050781,-194.34117126465,37.283695220947),
		Spawner = vector3(-778.91241455078,-198.19789123535,37.283695220947),
		Heading = 24
	},

	Gordo = {
		Marker = vector3(2500.2651367188,6118.3715820312,166.75288391113),
		Spawner = vector3(2481.794921875,6115.5756835938,169.03796386719),
		Heading = 125.0
	},

	Mech_Paleto= {
		Marker = vector3(114.49,6635.29,31.97),
		Spawner = vector3(123.83,6620.55,31.82),
		Heading = 314.20
	},
	Mech_Sandy = {
		Marker = vector3(1414.15,3564.15,35.82),
		Spawner = vector3(1413.11,3565.91,35.41),
		Heading = 14.93
	},
	--[[

	CUATRO = {
		Marker = vector3(-1919.4547119141,2048.3176269531,140.73526000977),
		Spawner = vector3(-778.91241455078,-198.19789123535,37.283695220947),
		Heading = 24
	}
	--]]--
}
-- End of Cars

-- Start of Private Cars
Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	MazeBankBuilding_Main = {
		Private = "MazeBankBuilding",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveRich = {
		Private = "ExecutiveRich",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveCool = {
		Private = "ExecutiveCool",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	MazeBankBuilding_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		Marker = vector3(-60.38, -790.31, 43.23),
		Spawner = vector3(-44.03, -787.36, 43.19),
		Deleter = vector3(-58.88, -778.63, 43.18),
		Heading = 254.322
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	LomBank_Main = {
		Private = "LomBank",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	LomBank_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		Marker = vector3(-1545.17, -566.24, 24.85),
		Spawner = vector3(-1551.88, -581.38, 24.71),
		Deleter = vector3(-1538.56, -576.05, 24.71),
		Heading = 331.176
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	MazeBankWest_Main = {
		Private = "MazeBankWest",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	MazeBankWest_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		Marker = vector3(-1368.14, -468.01, 30.6),
		Spawner = vector3(-1376.93, -474.32, 30.5),
		Deleter = vector3(-1362.07, -471.98, 30.5),
		Heading = 97.95
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	IntegrityWay_Main = {
		Private = "IntegrityWay",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay28 = {
		Private = "IntegrityWay28",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	IntegrityWay_IntegrityWay30 = {
		Private = "IntegrityWay30",
		Marker = vector3(-14.1, -614.93, 34.86),
		Spawner = vector3(-7.35, -635.1, 34.72),
		Deleter = vector3(-37.57, -620.39, 34.07),
		Heading = 66.632
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	DellPerroHeights_Main = {
		Private = "DellPerroHeights",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	DellPerroHeights_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		Marker = vector3(-1477.15, -517.17, 33.74),
		Spawner = vector3(-1483.16, -505.1, 31.81),
		Deleter = vector3(-1452.61, -508.78, 30.58),
		Heading = 299.89
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	MiltonDrive_Main = {
		Private = "MiltonDrive",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern1Apartment = {
		Private = "Modern1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern2Apartment = {
		Private = "Modern2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern3Apartment = {
		Private = "Modern3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody1Apartment = {
		Private = "Mody1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody2Apartment = {
		Private = "Mody2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody3Apartment = {
		Private = "Mody3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal1Apartment = {
		Private = "Regal1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal2Apartment = {
		Private = "Regal2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal3Apartment = {
		Private = "Regal3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		Marker = vector3(-795.96, 331.83, 84.5),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	RichardMajesticApt2_Main = {
		Private = "RichardMajesticApt2",
		Marker = vector3(-887.5, -349.58, 33.53),
		Spawner = vector3(-886.03, -343.78, 33.53),
		Deleter = vector3(-894.32, -349.33, 33.53),
		Heading = 206.79
	},
	WildOatsDrive_Main = {
		Private = "WildOatsDrive",
		Marker = vector3(-178.65, 503.45, 135.85),
		Spawner = vector3(-189.98, 505.8, 133.48),
		Deleter = vector3(-189.28, 500.56, 132.93),
		Heading = 282.62
	},
	WhispymoundDrive_Main = {
		Private = "WhispymoundDrive",
		Marker = vector3(123.65, 565.75, 183.04),
		Spawner = vector3(130.11, 571.47, 182.42),
		Deleter = vector3(131.97, 566.77, 181.95),
		Heading = 270.71
	},
	NorthConkerAvenue2044_Main = {
		Private = "NorthConkerAvenue2044",
		Marker = vector3(348.18, 443.01, 146.7),
		Spawner = vector3(358.39, 437.06, 144.27),
		Deleter = vector3(351.38, 438.86, 145.66),
		Heading = 285.911
	},
	NorthConkerAvenue2045_Main = {
		Private = "NorthConkerAvenue2045",
		Marker = vector3(370.69, 430.76, 144.11),
		Spawner = vector3(392.88, 434.54, 142.17),
		Deleter = vector3(389.72, 429.95, 141.81),
		Heading = 264.94
	},
	HillcrestAvenue2862_Main = {
		Private = "HillcrestAvenue2862",
		Marker = vector3(-688.71, 597.57, 142.64),
		Spawner = vector3(-683.72, 609.88, 143.28),
		Deleter = vector3(-685.26, 601.08, 142.36),
		Heading = 338.06
	},
	HillcrestAvenue2868_Main = {
		Private = "HillcrestAvenue2868",
		Marker = vector3(-752.75, 624.90, 141.2),
		Spawner = vector3(-749.32, 628.61, 141.48),
		Deleter = vector3(-754.28, 631.58, 141.2),
		Heading = 197.14
	},
	HillcrestAvenue2874_Main = {
		Private = "HillcrestAvenue2874",
		Marker = vector3(-859.01, 695.95, 147.93),
		Spawner = vector3(-863.68, 698.72, 147.05),
		Deleter = vector3(-855.66, 698.77, 147.81),
		Heading = 341.77
	},
	MadWayneThunder_Main = {
		Private = "MadWayneThunder",
		Marker = vector3(-1290.95, 454.52, 96.66),
		Spawner = vector3(-1297.62, 459.28, 96.48),
		Deleter = vector3(-1298.09, 468.95, 96.0),
		Heading = 285.652
	},
	TinselTowersApt12_Main = {
		Private = "TinselTowersApt12",
		Marker = vector3(-616.74, 56.38, 42.73),
		Spawner = vector3(-620.59, 60.10, 42.73),
		Deleter = vector3(-621.13, 52.69, 42.73),
		Heading = 109.316
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	MedEndApartment1_Main = {
		Private = "MedEndApartment1",
		Marker = vector3(240.23, 3102.84, 41.49),
		Spawner = vector3(233.58, 3094.29, 41.49),
		Deleter = vector3(237.52, 3112.63, 41.39),
		Heading = 93.91
	},
	MedEndApartment2_Main = {
		Private = "MedEndApartment2",
		Marker = vector3(246.08, 3174.63, 41.72),
		Spawner = vector3(234.15, 3164.37, 41.54),
		Deleter = vector3(240.72, 3165.53, 41.65),
		Heading = 102.03
	},
	MedEndApartment3_Main = {
		Private = "MedEndApartment3",
		Marker = vector3(984.92, 2668.95, 39.06),
		Spawner = vector3(993.96, 2672.68, 39.06),
		Deleter = vector3(994.04, 2662.1, 39.13),
		Heading = 0.61
	},
	MedEndApartment4_Main = {
		Private = "MedEndApartment4",
		Marker = vector3(196.49, 3027.48, 42.89),
		Spawner = vector3(203.1, 3039.47, 42.08),
		Deleter = vector3(192.24, 3037.95, 42.89),
		Heading = 271.3
	},
	MedEndApartment5_Main = {
		Private = "MedEndApartment5",
		Marker = vector3(1724.49, 4638.13, 42.31),
		Spawner = vector3(1723.98, 4630.19, 42.23),
		Deleter = vector3(1733.66, 4635.08, 42.24),
		Heading = 117.88
	},
	MedEndApartment6_Main = {
		Private = "MedEndApartment6",
		Marker = vector3(1670.76, 4740.99, 41.08),
		Spawner = vector3(1673.47, 4756.51, 40.91),
		Deleter = vector3(1668.46, 4750.83, 40.88),
		Heading = 12.82
	},
	MedEndApartment7_Main = {
		Private = "MedEndApartment7",
		Marker = vector3(15.24, 6573.38, 31.72),
		Spawner = vector3(16.77, 6581.68, 31.42),
		Deleter = vector3(10.45, 6588.04, 31.47),
		Heading = 222.6
	},
	MedEndApartment8_Main = {
		Private = "MedEndApartment8",
		Marker = vector3(-374.73, 6187.06, 30.54),
		Spawner = vector3(-377.97, 6183.73, 30.49),
		Deleter = vector3(-383.31, 6188.85, 30.49),
		Heading = 223.71
	},
	MedEndApartment9_Main = {
		Private = "MedEndApartment9",
		Marker = vector3(-24.6, 6605.99, 30.45),
		Spawner = vector3(-16.0, 6607.74, 30.18),
		Deleter = vector3(-9.36, 6598.86, 30.47),
		Heading = 35.31
	},
	MedEndApartment10_Main = {
		Private = "MedEndApartment10",
		Marker = vector3(-365.18, 6323.95, 28.9),
		Spawner = vector3(-359.49, 6327.41, 28.83),
		Deleter = vector3(-353.47, 6334.57, 28.83),
		Heading = 218.58
	}
	-- End of VENT Custom Garages
}
-- End of Private Cars
