Config = {}
Config.Locale = 'en'

Config.MenuAlign = 'top-left'
Config.DrawDistance = 100

Config.UseCommand = false -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
Config.ParkVehicles = true -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = false -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.GiveSocietyMoney = true -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
Config.ShowVehicleLocation = true -- true = Will show Location of Vehicles in the Garage Menus.
Config.ShowSpacers = true -- true = Shows Spacers in Menus.

Config.PointMarker = {Type = 27, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Green Color / Standard Size Circle.
Config.DeleteMarker = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Red Color / Big Size Circle.
Config.PoundMarker = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
Config.JPoundMarker = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.

Config.GarageBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 1.0} -- Public Garage Blip.
Config.PGarageBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 1.0} -- Private Garage Blip.
Config.PoundBlip = {Sprite = 67, Color = 64, Display = 2, Scale = 1.0} -- Pound Blip.
Config.JGarageBlip = {Sprite = 290, Color = 49, Display = 2, Scale = 1.0} -- Job Garage Blip.
Config.JPoundBlip = {Sprite = 67, Color = 49, Display = 2, Scale = 1.0} -- Job Pound Blip.

Config.PoundWait = 5 -- How many Minutes someone must wait before Opening Pound Menu Again.
Config.JPoundWait = 2.5 -- How many Minutes someone must wait before Opening Job Pound Menu Again.

Config.UseDamageMult = true -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 10 -- Higher Number = Higher Repair Price.

Config.UsingAdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop

Config.UseAmbulanceGarages = true -- true = Allows use of Ambulance Garages.
Config.UseAmbulancePounds = true -- true = Allows use of Ambulance Pounds.
Config.UseAmbulanceBlips = true -- true = Use Ambulance Blips.
Config.AmbulancePoundPrice = 5000 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.UsePoliceGarages = true -- true = Allows use of Police Garages.
Config.UsePolicePounds = true -- true = Allows use of Police Pounds.
Config.UsePoliceBlips = true -- true = Use Police Blips.
Config.PolicePoundPrice = 5000 -- How much it Costs to get Vehicle from Police Pound.


Config.UseSCFGarages = true -- true = Allows use of Police Garages.
Config.UseSCFPounds = false -- true = Allows use of Police Pounds.
Config.UseSCFBlips = true -- true = Use Police Blips.
Config.SCFPoundPrice = 5000 -- How much it Costs to get Vehicle from Police Pound.

Config.UseAircraftGarages = true -- true = Allows use of Aircraft Garages.
Config.UseAircraftBlips = true -- true = Use Aircraft Blips.
Config.AircraftPoundPrice = 1000000 -- How much it Costs to get Vehicle from Aircraft Pound.

Config.UseBoatGarages = true -- true = Allows use of Boat Garages.
Config.UseBoatBlips = true -- true = Use Boat Blips.
Config.BoatPoundPrice = 500 -- How much it Costs to get Vehicle from Boat Pound.

Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UseCarBlips = true -- true = Use Car Blips.
Config.CarPoundPrice = 5000 -- How much it Costs to get Vehicle from Car Pound.

Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(309.68, -1436.01, 28.95),
		Spawner = vector3(303.02, -1445.17, 28.95),
		Spawner2 = vector3(299.21, -1431.21, 28.95),
		Deleter = vector3(294.22, -1439.38, 28.95),
		Deleter2 = vector3(282.7, -1429.41, 28.95),
		Heading = 237.55,
		Heading2 = 237.55
	}
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(456.88, -1017.29, 27.50),
		Spawner = vector3(434.28, -1015.8, 28.83),
		Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(434.27, -996.41, 24.90),
		Deleter2 = vector3(450.31, -996.4, 24.90),
		Heading = 90.46,
		Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Police


-- Start of SCF
Config.SCFGarages = {
	Los_Santos = {
		Marker = vector3(-1533.0, 82.1, 56.77),
		Spawner = vector3(-1533.0, 82.1, 56.77),
		Spawner2 = vector3(-1528.16, 80.11, 56.77),
		Deleter = vector3(-1520.98, 97.4, 56.77),
		Deleter2 = vector3(450.31, -996.4, 56.77),
		Heading = 328.99,
		Heading2 = 5.06
	}
}

Config.SCFPounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of SCF

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
	}
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-735.87, -1325.08, 0.6),
		Spawner = vector3(-718.87, -1320.18, -0.47),
		Deleter = vector3(-731.15, -1334.71, -0.47),
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
	}
	--[[Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 32.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	},
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
		Marker = vector3(56.7, -874.29, 29.44),
		Spawner = vector3(50.6, -872.94, 29.44),
		Deleter = vector3(21.24, -876.57, 29.44),
		Heading = 336.55
	},
	Sandy_Shores = {
		Marker = vector3(1737.59, 3710.2, 33.14),
		Spawner = vector3(1737.84, 3719.28, 33.04),
		Deleter = vector3(1722.66, 3713.74, 33.21),
		Heading = 21.22
	},
	Paleto_Bay = {
		Marker = vector3(105.36, 6613.59, 31.40),
		Spawner = vector3(128.78, 6622.99, 30.78),
		Deleter = vector3(126.36, 6608.41, 30.86),
		Heading = 315.01
	}
}

Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 28.29),
		Spawner = vector3(405.64, -1643.4, 27.61),
		Heading = 229.54
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 37.65),
		Spawner = vector3(1627.84, 3788.45, 33.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 30.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	}
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

------------------------
--ADVANCED VEHICLESHOP
-----------------------
Config.UseAmbulanceShop = true -- true = Use Ambulance Shop | false = Does Opposite
Config.UseAmbulanceBlip = false -- true = Use Ambulance Blip | false = Does Opposite
Config.AmbulanceBlip = {Coords = vector3(299.38, -580.76, 43.26), Sprite = 326, Color = 1, Display = 4, Scale = 1.0}
Config.AmbulanceHeli = 'polmav'
Config.AmbulanceHeli2 = 'firehawk'

Config.UsePoliceShop = true -- true = Use Police Shop | false = Does Opposite
Config.UsePoliceBlip = true -- true = Use Police Blip | false = Does Opposite
Config.PoliceBlip = {Coords = vector3(457.24, -1017.26, 28.35), Sprite = 326, Color = 3, Display = 4, Scale = 1.0}
Config.PoliceHeli = 'polmav'

Config.UseAircraftShop = true -- true = Use Aircraft Shop | false = Does Opposite
Config.UseAircraftBlip = true -- true = Use Aircraft Blip | false = Does Opposite
Config.AircraftBlip = {Coords = vector3(-940.0, -2963.1, 18.8), Sprite = 90, Color = 4, Display = 4, Scale = 1.0}

Config.UseBoatShop = true -- true = Use Boat Shop | false = Does Opposite
Config.UseBoatBlip = true -- true = Use Boat Blip | false = Does Opposite
Config.BoatBlip = {Coords = vector3(-714.3, -1297.3, 4.1), Sprite = 410, Color = 3, Display = 4, Scale = 1.0}

Config.UseCarShop = true -- true = Use Car Shop | false = Does Opposite
Config.UseCarBlip = true -- true = Use Car Blip | false = Does Opposite
Config.CarBlip = {Coords = vector3(-33.7, -1102.0, 25.4), Sprite = 326, Color = 2, Display = 4, Scale = 1.0}

Config.UseTruckShop = true -- true = Use Truck Shop | false = Does Opposite
Config.UseTruckBlip = true -- true = Use Truck Blip | false = Does Opposite
Config.TruckBlip = {Coords = vector3(900.4, -1155.0, 24.1), Sprite = 67, Color = 2, Display = 4, Scale = 1.0}

-- You will need to setup your own callback for VIP Shop
Config.UseVIPShop = false -- true = Use VIP Shop | false = Does Opposite
Config.UseVIPBlip = false -- true = Use VIP Blip | false = Does Opposite
Config.VIPBlip = {Coords = vector3(-32.75, -1656.01, 28.49), Sprite = 326, Color = 5, Display = 4, Scale = 1.0}

Config.ResellPercentage = 50 -- The Resell % of Vehicles Sold | Example: $10,000 / 50% = $5,000 Back
Config.LicenseEnable = true -- Requires licenses to buy Aircrafts, Boats, Cars, & Trucks.

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters = 3
Config.PlateNumbers = 3
Config.PlateUseSpace = true

-- ShopEntering = Marker for Accessing Shop | ShopInside = Marker for Viewing Vehicles
-- ShopOutside = Marker for Purchasing Vehicles | ResellVehicle = Marker for Selling Vehicles

Config.ZonesVEHICLESHOP = {
	-- Ambulance Shop
	ShopEnteringAmbulance = {
		Pos    = vector3(371.23, -1429.46, 31.51),
		Marker = {r = 255, g = 0, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 27,
		ShopId = 1
	},
	ShopInsideAmbulance = {
		Pos     = vector3(334.89, -1639.38, 98.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 320.14,
		Type    = -1,
		ShopId  = 1
	},
	ShopOutsideAmbulance = {
		Pos     = vector3(391.74, -1619.0, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 318.34,
		Type    = -1,
		ShopId  = 1
	},
	ShopOutsideAmbulanceHeli = {
		Pos     = vector3(362.75, -1598.33, 35.95),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 311.87,
		Type    = -1,
		ShopId  = 1
	},
	ResellVehicleAmbulance = {
		Pos    = vector3(385.08, -1634.17, 28.29),
		Marker = {r = 255, g = 0, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 1
	},
	ResellVehicleAmbulanceHeli = {
		Pos    = vector3(366.78, -1589.45, 35.95),
		Marker = {r = 255, g = 0, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 1
	},
	-- Police Shop
	ShopEnteringPolice = {
		Pos    = vector3(447.25, -975.57, 29.90),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 27,
		ShopId = 2
	},
	ShopInsidePolice = {
		Pos     = vector3(334.89, -1639.38, 98.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 320.14,
		Type    = -1,
		ShopId  = 2
	},
	ShopOutsidePolice = {
		Pos     = vector3(391.74, -1619.0, 28.29),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 318.34,
		Type    = -1,
		ShopId  = 2
	},
	ShopOutsidePoliceHeli = {
		Pos     = vector3(362.75, -1598.33, 35.95),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 311.87,
		Type    = -1,
		ShopId  = 2
	},
	ResellVehiclePolice = {
		Pos    = vector3(387.82, -1636.33, 28.29),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 2
	},
	ResellVehiclePoliceHeli = {
		Pos    = vector3(371.38, -1592.91, 35.95),
		Marker = {r = 0, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 2
	},
	-- Aircraft Shop
	ShopEnteringAircraft = {
		Pos    = vector3(-940.0, -2963.1, 18.8),
		Marker = {r = 145, g = 0, b = 255},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 3
	},
	ShopInsideAircraft = {
		Pos     = vector3(-1874.7, -3137.5, 14.9), -- vector3(-1075.0, -2933.2, 14.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 333.95, -- 59.9
		Type    = -1,
		ShopId  = 3
	},
	ShopOutsideAircraft = {
		Pos     = vector3(-965.2, -2983.5, 14.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 59.9,
		Type    = -1,
		ShopId  = 3
	},
	ResellVehicleAircraft = {
		Pos    = vector3(-1003.2, -2920.7, 12.9),
		Marker = {r = 145, g = 0, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 3
	},
	-- Boat Shop
	ShopEnteringBoat = {
		Pos    = vector3(-714.3, -1297.3, 4.1),
		Marker = {r = 0, g = 17, b = 255},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 4
	},
	ShopInsideBoat = {
		Pos     = vector3(-716.1, -1350.7, -0.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 138.4,
		Type    = -1,
		ShopId  = 4
	},
	ShopOutsideBoat = {
		Pos     = vector3(-717.7, -1339.2, -0.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 90.0,
		Type    = -1,
		ShopId  = 4
	},
	ResellVehicleBoat = {
		Pos    = vector3(-725.3, -1327.8, -0.4),
		Marker = {r = 0, g = 17, b = 255},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 4
	},
	-- Car Shop
	ShopEnteringCar = {
		Pos    = vector3(-33.7, -1102.0, 25.4),
		Marker = {r = 0, g = 255, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 5
	},
	ShopInsideCar = {
		Pos     = vector3(-47.5, -1097.2, 25.4),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = -20.0,
		Type    = -1,
		ShopId  = 5
	},
	ShopOutsideCar = {
		Pos     = vector3(-26.8, -1083.5, 26.6),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 70.68,
		Type    = -1,
		ShopId  = 5
	},
	ResellVehicleCar = {
		Pos    = vector3(-44.6, -1080.7, 25.6),
		Marker = {r = 0, g = 255, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 5
	}, 
	-- Truck Shop
	ShopEnteringTruck = {
		Pos    = vector3(900.4, -1155.0, 24.1),
		Marker = {r = 0, g = 255, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 6
	},
	ShopInsideTruck = {
		Pos     = vector3(927.5, -1226.8, 24.6),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 102.93,
		Type    = -1,
		ShopId  = 6
	},
	ShopOutsideTruck = {
		Pos     = vector3(994.7, -1186.4, 24.5),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 93.19,
		Type    = -1,
		ShopId  = 6
	},
	ResellVehicleTruck = {
		Pos    = vector3(879.2, -1168.5, 24.0),
		Marker = {r = 0, g = 255, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 6
	}
	-- VIP Shop
	--[[ShopEnteringVIP = {
		Pos    = vector3(-32.75, -1656.01, 28.49),
		Marker = {r = 255, g = 222, b = 0},
		Size   = {x = 1.5, y = 1.5, z = 1.0},
		Type   = 1,
		ShopId = 7
	},
	ShopInsideVIP = {
		Pos     = vector3(-37.54, -1664.57, 28.49),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 138.9,
		Type    = -1,
		ShopId  = 7
	},
	ShopOutsideVIP = {
		Pos     = vector3(-43.08, -1678.28, 28.42),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 45.03,
		Type    = -1,
		ShopId  = 7
	},
	ResellVehicleVIP= {
		Pos    = vector3(-21.1, -1678.0, 28.48),
		Marker = {r = 255, g = 222, b = 0},
		Size   = {x = 3.0, y = 3.0, z = 1.0},
		Type   = 1,
		ShopId = 7
	}]]--
}

-----------
-- CHANGING ROOMM
-----------
Config.MarkerSize   = { x = 1.0, y = 1.0, z = 1.0 }
Config.MarkerColor  = { r = 234, g = 35, b = 35 }
Config.MarkerType   = 27

Config.Room = {
	
	vector3(429.661,-811.554,28.591),
	vector3(-119.53133392334,-1780.7321777344,28.938479995728),
	vector3(-819.987,-1067.44,11.328),
	vector3(-1447.1,-240.396,49.819),
	vector3(3.917,6506.042,31.878),
	vector3(118.674,-224.98,54.558),
	vector3(1698.673,4818.352,42.063),
	vector3(620.432,2766.495,42.088),
  vector3(-3177.755,1043.381,20.863),
  vector3(-1889.5599365234,2060.9504394531,139.99999999027),
  vector3(-2734.2880859375,-94.493133544922,16.196044540405), --ver
  vector3(993.59,-135.82,73.10), --thelost
  vector3(-1407.8740234375,632.34246826172,196.52646484375), --riri
  vector3(-1435.3162841797,660.93664550781,196.59989929199), --riri2
  vector3(-68.592948913574,829.22790527344,231.32997131348), --mag

  vector3(1201.7416992188,2714.5510253906,37.222560882568), --mag
  vector3(463.3381652832,-999.15411376953,29.989514160156), --PD
  
  
  --neww
  vector3(301.66177368164,-598.90185546875,42.484091949463), 
  --neww
  vector3(-1100.0157470703,2717.6098632812,19.107847213745), 
}

Config.MecanoRoom = {
	vector3(-204.492,-1342.204,34.0),
}



-----------
-- MONEY WASH
-----------

local second = 1000
local minute = 60 * second
local hour = 60 * minute

--[[ 
	Below are the zones for laundering. You can set multiple zones just follow the format below. 
	Failure to do so will result in the script breaking.
	Set the job to 'any' if you want anybody to use the location. Otherwise set the required job you want to use for the location
	Any job not allowed to use the location WILL NOT see a marker or get a popup to use it.

	
	EXAMPLE LOCATION!!! JUST COPY THIS AND PASTE TO ADD MORE LOCATIONS!
		
	{
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			--'any', -- SET THE 'any' TAG TO ALLOW ALL JOBS INCLUDING POLICE TO USE THE LOCATION
			--'miner',
			--'cardealer'
		},
		TaxRate = 0.50, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
	},
	
]]

Config.ZonesMoneywash = {
	
	['LaundryMat'] = {	 -- -1139.4580078125,4964.8662109375,222.24336242676
		Pos = { 
			{x = -1139.4580078125 , y = 4964.8662109375 , z = 221.44336242676},
		},
		
		Jobs = {
			'any', -- set to 'any' to allow the location for any player regardless of job
			--'miner'
		},
		TaxRate = 0.95, -- set taxrate per spot. Default is 0.5 or 50% of the dirty you will get back in clean
		enableTimer = false, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 120, g = 120, b = 0},
		Type = 27,
	
	},
	
	['Warehouse'] = {
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			'any', -- set to 'any' to allow the location for any player regardless of job
			--'fueler'
		},
		TaxRate = 0.95, -- set taxrate per spot. Default is 0.85 or 85% of the dirty you will get back in clean
		enableTimer = true, -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
		timer = 5 * second, -- Actual Timer for the spot. The * amount will determine if its hours, second, or minutes. which are found above. DEFAULT: 5 * second
		Size = {x = 1.5, y = 1.5, z = 1.5},
		Color = {r = 255, g = 120, b = 0},
		Type = 1,
	
	}
}


-----------
-- CLOTESHOP
-----------


Config.Price = 500

Config.DrawDistanceShopsClotheshop = 100.0
Config.MarkerSizeShopsClotheshop   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColorShopsClotheshop  = {r = 102, g = 102, b = 204}
Config.MarkerTypeShopsClotheshop   = 1

Config.ZonesClotheshop = {}

Config.ShopsClotheshop = {
	{x=450.94549560547,    y=-993.27056884766, z=29.689338684082},
	{x=-438.32656860352,    y=-307.99685668945, z=34.910533905029},
  {x=72.254,    y=-1399.102, z=28.376},
  {x=-703.776,  y=-152.258,  z=36.415},
  {x=-167.863,  y=-298.969,  z=38.733},
  {x=428.694,   y=-800.106,  z=28.491},
  {x=-829.413,  y=-1073.710, z=10.328},
  {x=-1447.797, y=-242.461,  z=48.820},
  {x=11.632,    y=6514.224,  z=30.877},
  {x=123.646,   y=-219.440,  z=53.557},
  {x=1696.291,  y=4829.312,  z=41.063},
  {x=618.093,   y=2759.629,  z=41.088},
  {x=1190.550,  y=2713.441,  z=37.222},
  {x=-1193.429, y=-772.262,  z=16.324},
  {x=-3172.496, y=1048.133,  z=19.863},
  {x=-1108.441, y=2708.923,  z=18.107},
  {x=1858.9041748047, y=3687.8701171875,  z=34.267036437988},
  {x=2435.4169921875, y=4965.6123046875,  z=46.810600280762},
  {x= -118.51884460449, y=-1778.9310302734,  z=28.838459014893},
  {x=  -2732.46484375, y=-96.557830810547,  z=16.096044540405}, --ver
  {x= 992.18, y= -135.3, z=73.10}, --thelost
  
  {x= -1406.2397460938, y= 630.17895507812, z=196.12646484375}, --riri
}

for i=1, #Config.ShopsClotheshop, 1 do

	Config.ZonesClotheshop['Shop_' .. i] = {
	 	Pos   = Config.ShopsClotheshop[i],
	 	Size  = Config.MarkerSizeShopsClotheshop,
	 	Color = Config.MarkerColorShopsClotheshop,
	 	Type  = Config.MarkerTypeShopsClotheshop
  }

end


-----------
-- HOLDUP
-----------


Config.MarkerHOLDUP = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequiredHOLDUP = 2
Config.TimerBeforeNewRobHOLDUP    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistanceHOLDUP    = 30   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoneyHOLDUP = true -- give black money? If disabled it will give cash instead

StoresHOLDUP  = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(8000, 12000),
		nameOfStore = "24/7. (Paleto Bay)",
		blockOfStore = "1000",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(8000, 12000),
		nameOfStore = "24/7. (Sandy Shores)",
		blockOfStore = "3008",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(8000, 12000),
		nameOfStore = "24/7. (Little Seoul)",
		blockOfStore = "8140",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(8000, 12000),
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		blockOfStore = "3845",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(8000, 12000),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		blockOfStore = "5067",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(8000, 12000),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		blockOfStore = "8198",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(8000, 12000),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		blockOfStore = "8092",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(8000, 12000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		blockOfStore = "9094",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(8000, 12000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		blockOfStore = "7302",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
}



-----------
-- HOLDUP
-----------

Config.NumberOfCopsRequiredholdapbank = 4

BanksHoldap = {
	
	["blainecounty"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = math.random(1000000,2500000),
		nameofbank = "Blaine County Savings",
		blockOfbank = "1055",
		lastrobbed = 0
	},
	["butcherlab"] = { -- -96.387763977051,6219.5595703125,31.025026321411
		position = { ['x'] = -96.387763977051, ['y'] = 6219.5595703125, ['z'] = 31.025026321411 },
		reward = math.random(3000000,6000000),
		nameofbank = "Butcher Lab",
		blockOfbank = "1025",
		lastrobbed = 0
	},



}


---
-- SAKIT
--

Config.secondiTosse = 10000    --seconds to cough
Config.secondiStomaco = 10000  --seconds to stomach disease
Config.secondiPelle = 10000    --seconds to skin disease

Config.MinSecTosse = 30
Config.MaxSecTosse = 60

Config.MinSecStomaco = 30
Config.MaxSecStomaco = 60

Config.secondiPelleMalata = 60

Config.milliSecondiTosse = Config.secondiTosse * 1000
Config.milliSecondiStomaco = Config.secondiStomaco * 1000
Config.milliSecondiPelle = Config.secondiPelle * 1000
Config.MinMillSecTosse = Config.MinSecTosse * 1000
Config.MaxMillSecTosse = Config.MaxSecTosse * 1000
Config.MinMillSecStomaco = Config.MinSecStomaco * 1000
Config.MaxMillSecStomaco = Config.MaxSecStomaco * 1000
Config.milliSecondiPelleMalata = Config.secondiPelleMalata * 1000


---
-- DOORKLOCK
---


Config.DoorListLOCK = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},


	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


		-- To locker room & roof
		{
			objHash = GetHashKey('v_ilev_ph_gendoor004'),
			objHeading = 90.0,
			objCoords = vector3(376.47, -1424.99, 32.51),
			textCoords = vector3(376.47, -1424.99, 32.51),
			authorizedJobs = {'police'},
			locked = true,
			maxDistance = 1.25
		},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 180.0,
		objCoords = vector3(467.85922241211,-1004.0796508789,24.914720535278),
		textCoords = vector3(467.83016967773,-1003.1382446289,24.914722442627),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(472.03045654297,-1003.0119628906,24.91471862793),
		textCoords = vector3(472.03045654297,-1003.0119628906,24.91471862793),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 180.0,
		objCoords = vector3(476.37176513672,-1004.024230957,24.91471862793),
		textCoords = vector3(476.32104492188,-1002.9448852539,24.91471862793),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	

	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(480.58520507812,-1003.0162353516,24.91471862793),
		textCoords = vector3(480.58520507812,-1003.0162353516,24.91471862793),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(467.81387329102,-995.94262695312,24.91471862793),
		textCoords = vector3(468.03283691406,-997.04522705078,24.91471862793),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(472.00936889648,-995.92749023438,24.91471862793),
		textCoords = vector3(472.27529907227,-997.07867431641,24.91471862793),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(476.30093383789,-995.92614746094,24.914712905884),
		textCoords = vector3(476.48471069336,-997.11761474609,24.914712905884),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(480.67794799805,-995.96148681641,24.914712905884),
		textCoords = vector3(480.68814086914,-997.04602050781,24.914712905884),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},



	
	

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},


		

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(481.92269897461,-1004.1541748047,26.32303237915),
		textCoords = vector3(481.92269897461,-1004.1541748047,26.32303237915),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(485.06686401367,-1007.8806762695,26.321605682373),
		textCoords = vector3(485.06686401367,-1007.8806762695,26.321605682373),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		},

	
	},


	

	{
		objHash = GetHashKey('hei_heist_apart2_door'),
		objHeading = 200.0,
		objCoords = vector3(2540.3525390625,6154.9926757812,164.27241516113),
		textCoords = vector3(2540.3525390625,6154.9926757812,164.27241516113),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	


		-- Armory
		{
			objHash = GetHashKey('v_ilev_gendoor02'),
			objHeading = 200.0,
			objCoords = vector3(376.47, -1425.13, 32.51),
			textCoords = vector3(376.47, -1425.13, 32.51),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},
		
	


			-- Back (double doors)
	{
		textCoords = vector3(373.66, -1407.11, 32.51),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor003'), objHeading = -40.0, objCoords  = vector3(373.99, -1407.65, 32.51)},
			{objHash = GetHashKey('v_ilev_ph_gendoor003'), objHeading = 140.0, objCoords  = vector3(373.05, -1406.83, 32.51)}
		}
	},


	


				-- Back (double doors)
				{
					textCoords = vector3(445.91775512695,-996.89526367188,30.689321517944),
					authorizedJobs = {'police'},
					locked = true,
					maxDistance = 4,
					doors = {
						{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(446.55715942383,-996.55181884766,30.689338684082)},
						{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(445.91775512695,-996.89526367188,30.689321517944)}
					}
				},


					-- Armory


					-- Back (double doors)
					{
						textCoords = vector3(445.82147216797,-999.31201171875,30.723693847656),
						authorizedJobs = {'police'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('v_ilev_gtdoor'), objHeading = 180.0, objCoords  = vector3(4445.82147216797,-999.31201171875,30.723693847656)},
							{objHash = GetHashKey('v_ilev_gtdoor02'), objHeading = -40.0, objCoords  = vector3(445.82147216797,-999.31201171875,30.723693847656)}
						}
					},
	
	

					{
						textCoords = vector3(-1886.6115722656,2050.42578125,141.00416564941),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = -20.0, objCoords  = vector3(-1886.2253417969,2050.9016113281,141.00610351562)},
							{objHash = 1077118233, objHeading = 160.0, objCoords  = vector3(-1886.7864990234,2050.5285644531,141.00663757324)}
						}
					},
	


					{
						textCoords = vector3(-1889.0762939453,2051.5949707031,141.00611877441),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = 160.0, objCoords  = vector3(-1889.84765625,2051.8637695312,141.00547790527)},
							{objHash = 1077118233, objHeading = -20.0, objCoords  = vector3(-1889.0762939453,2051.5949707031,141.00611877441)}
						}
					},

					{
						textCoords = vector3(-1908.5750732422,2072.9340820312,140.40840148926),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = -40.0, objCoords  = vector3(-1908.3228759766,2071.7727050781,140.40213012695)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 140.0, objCoords  = vector3(-1908.5750732422,2072.9340820312,140.40840148926)}
						}
					},
	
					{
						textCoords = vector3(-1911.0247802734,2074.8581542969,140.40838623047),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 140.0, objCoords  = vector3(-1911.6895751953,2075.1577148438,140.39413452148)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading =  -40.0, objCoords  = vector3(-1911.0247802734,2074.8581542969,140.40838623047)}
						}
					},
	

					{
						textCoords = vector3(-1902.2431640625,2085.4819335938,140.40843200684),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = -40.0, objCoords  = vector3(-1901.4577636719,2085.486328125,140.42842102051)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 140.0, objCoords  = vector3(-1902.2431640625,2085.4819335938,140.40843200684)}
						}
					},
	
					{
						textCoords = vector3(-1899.3912353516,2083.6940917969,140.40075683594),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 140.0, objCoords  = vector3(-1899.8471679688,2084.2331542969,140.40098571777)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = -40.0, objCoords  = vector3(-1899.3912353516,2083.6940917969,140.40075683594)}
						}
					},
					

					{
						textCoords = vector3(-1910.9897460938,2079.7580566406,140.39552307129),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = -310.0, objCoords  = vector3(-1910.9897460938,2079.7580566406,140.39552307129)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 230.0, objCoords  = vector3(-1911.6015625,2079.4453125,140.39572143555)}
						}
					},

					{
						textCoords = vector3(-1906.8060302734,2084.5939941406,140.39680480957),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = 50.0, objCoords  = vector3(-1906.6121826172,2084.8967285156,140.39511108398)},
							{objHash = GetHashKey('ball_prop_italy3'), objHeading = -130.0, objCoords  = vector3(-1907.1239013672,2084.1201171875,140.4080657959)}
						}
					},
					

					
					{
						textCoords = vector3(-1874.6326904297,2069.6062011719,141.01164245605),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = -20.0, objCoords  = vector3(-1874.0834960938,2069.7102050781,141.00784301758)},
							{objHash = 1077118233, objHeading = 160.0, objCoords  = vector3(-1874.6326904297,2069.6062011719,141.01164245605)}
						}
					},
					
					{
						textCoords = vector3(-1886.1031494141,2074.1647949219,141.01058959961),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = -20.0, objCoords  = vector3(-1885.3786621094,2073.8298339844,141.03274536133)},
							{objHash = 1077118233, objHeading = 160.0, objCoords  = vector3(-1886.1031494141,2074.1647949219,141.01058959961)}
						}
					},

					{
						textCoords = vector3(-1893.7469482422,2075.2705078125,141.00769042969),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = -40.0, objCoords  = vector3(-1893.021484375,2075.0756835938,141.00621032715)},
							{objHash = 1077118233, objHeading = 140.0, objCoords  = vector3(-1893.7469482422,2075.2705078125,141.00769042969)}
						}
					},
					

					{
						textCoords = vector3(-1860.4918212891,2054.48828125,140.97677612305),
						authorizedJobs = {'vermillion'},
						locked = true,
						maxDistance = 4,
						doors = {
							{objHash = 1077118233, objHeading = 0.0, objCoords  = vector3(-1859.6417236328,2053.6911621094,141.00624084473)},
							{objHash = 1077118233, objHeading = -180.0, objCoords  = vector3(-1860.4918212891,2054.48828125,140.97677612305)}
						}
					},
					
					

						-- HP
	{
		objHash = 493136920,
		objHeading = -65.0,
		objCoords = vector3(-448.67770385742,-316.81927490234,34.910785675049),
		textCoords = vector3(-448.03100585938,-316.58544921875,34.910774230957),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = 854291622,
		objHeading = -20.0,
		objCoords = vector3(361.13403320312,-589.72045898438,43.284061431885),
		textCoords = vector3(361.13403320312,-589.72045898438,43.284061431885),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 493136920,
		objHeading = -70.0,
		objCoords = vector3(-452.7673034668,-292.21322631836,-130.8791809082),
		textCoords = vector3(-452.7673034668,-292.21322631836,-130.8791809082),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 493136920,
		objHeading = 110.0,
		objCoords = vector3(-457.8293762207,-292.81924438477,-130.87934875488),
		textCoords = vector3(-457.8293762207,-292.81924438477,-130.87934875488),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 493136920,
		objHeading = 115.0,
		objCoords = vector3(-449.60986328125,-300.66403198242,-130.87915039062),
		textCoords = vector3(-449.60986328125,-300.66403198242,-130.87915039062),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 493136920,
		objHeading = 110.0,
		objCoords = vector3(-451.61410522461,-308.38369750977,-130.87915039062),
		textCoords = vector3(-451.61410522461,-308.38369750977,-130.87915039062),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 493136920,
		objHeading = -70.0,
		objCoords = vector3(-447.32205200195,-306.34808349609,-130.87928771973),
		textCoords = vector3(-447.32205200195,-306.34808349609,-130.87928771973),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},


	

	{
		objHash = 493136920,
		objHeading = 111.0,
		objCoords = vector3(-443.20367431641,-316.65228271484,34.910820007324),
		textCoords = vector3(-443.20367431641,-316.65228271484,34.910820007324),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	--[[NEWPD]]--
	
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(484.90411376953,-1007.8468017578,26.32276725769),
		textCoords = vector3(484.90411376953,-1007.8468017578,26.32276725769),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = -1406685646,
		objHeading = 0.0,
		objCoords = vector3(441.21328735352,-977.65759277344,30.790342330933),
		textCoords = vector3(441.21328735352,-977.65759277344,30.790342330933),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -96679321,
		objHeading = 180.0,
		objCoords = vector3(441.26547241211,-986.44348144531,30.782032012939),
		textCoords = vector3(441.26547241211,-986.44348144531,30.782032012939),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},



	
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(486.07348632812,-1012.1759033203,26.32301902771),
		textCoords = vector3(486.07348632812,-1012.1759033203,26.32301902771),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(483.24560546875,-1012.0230712891,26.308046340942),
		textCoords = vector3(483.24560546875,-1012.0230712891,26.308046340942),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(480.18051147461,-1012.0516967773,26.322208404541),
		textCoords = vector3(480.18051147461,-1012.0516967773,26.322208404541),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(477.12753295898,-1012.0049438477,26.3005027771),
		textCoords = vector3(477.12753295898,-1012.0049438477,26.3005027771),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = -53345114,
		objHeading = -180.0,
		objCoords = vector3(481.54153442383,-1003.8466186523,26.273405075073),
		textCoords = vector3(481.54153442383,-1003.8466186523,26.273405075073),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -53345114,
		objHeading = -90.0,
		objCoords = vector3(476.7522277832,-1008.1102905273,26.322149276733),
		textCoords = vector3(476.7522277832,-1008.1102905273,26.322149276733),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	
	--DOORS BACK PD

	

	{
		textCoords = vector3(468.67840576172,-1014.8131713867,26.386682510376),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -692649124, objHeading = 180.0, objCoords  = vector3(469.00671386719,-1014.2437744141,26.42449760437)},
			{objHash = -692649124, objHeading = 0.0, objCoords  = vector3(467.94839477539,-1013.8379516602,26.390390396118)}
		}
	},


	{
		textCoords = vector3(470.81771850586,-1009.0859375,26.273124694824),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = 149284793, objHeading = 90.0, objCoords  = vector3(471.19134521484,-1009.500793457,26.373008728027)},
			{objHash = 149284793, objHeading = -90.0, objCoords  = vector3(471.3381652832,-1008.6209106445,26.373979568481)}
		}
	},

	{
		textCoords = vector3(468.82095336914,-1000.5321044922,26.373985290527),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -288803980, objHeading = 180.0, objCoords  = vector3(469.20724487305,-1000.6148681641,26.373924255371)},
			{objHash = -288803980, objHeading = 0.0, objCoords  = vector3(468.25048828125,-1000.7696533203,26.370897293091)}
	
		}
	},


	{
		textCoords = vector3(313.14379882812,-571.89184570312,43.288494110107),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1700911976, objHeading = -20.0, objCoords  = vector3(313.69961547852,-572.07653808594,43.283962249756)},
			{objHash = -434783486, objHeading = -20.0, objCoords  = vector3(312.67456054688,-571.56072998047,43.28409576416)}
	
		}
	},

	{
		textCoords = vector3(318.98623657227,-574.29833984375,43.28409576416),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1700911976, objHeading = -20.0, objCoords  = vector3(318.98623657227,-574.29833984375,43.28409576416)},
			{objHash = -434783486, objHeading = -20.0, objCoords  = vector3(318.98623657227,-574.29833984375,43.28409576416)}
	
		}
	},

	{
		textCoords = vector3(324.43603515625,-576.1474609375,43.284114837646),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1700911976, objHeading = -20.0, objCoords  = vector3(324.43603515625,-576.1474609375,43.284114837646)},
			{objHash = -434783486, objHeading = -20.0, objCoords  = vector3(324.43603515625,-576.1474609375,43.284114837646)}
	
		}
	},

	{
		objHash = 854291622,
		objHeading = -20.0,
		objCoords = vector3(307.67657470703,-570.146484375,43.28409576416),
		textCoords = vector3(307.67657470703,-570.146484375,43.28409576416),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	
	
	
	

	--MAINDOOR

	{
		textCoords = vector3(434.38510131836,-981.94909667969,30.710998535156),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1547307588, objHeading = -90.0, objCoords  = vector3(434.59484863281,-981.46197509766,30.713104248047)},
			{objHash = -1547307588, objHeading = 90.0, objCoords  = vector3(435.00540161133,-982.39617919922,30.689506530762)}
		}
	},
	
	{
		textCoords = vector3(457.05773925781,-971.80017089844,30.709812164307),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1547307588, objHeading = 180.0, objCoords  = vector3(457.47692871094,-972.05389404297,30.709812164307)},
			{objHash = -1547307588, objHeading = 0.0, objCoords  = vector3(456.55413818359,-972.26196289062,30.709785461426)}
		}
	},

	{
		textCoords = vector3(441.86456298828,-999.21752929688,30.725294113159),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -1547307588, objHeading = -180.0, objCoords  = vector3(442.38534545898,-998.95629882812,30.725801467896)},
			{objHash = -1547307588, objHeading = 0.0, objCoords  = vector3(441.46054077148,-998.78619384766,30.726587295532)}
		}
	},



	{
		textCoords = vector3(-259.11511230469,6315.021484375,32.458763122559),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = -131296141, objHeading = -225.0, objCoords  = vector3(-259.49673461914,6315.3330078125,32.459453582764)},
			{objHash = -131296141, objHeading = -45.0, objCoords  = vector3(-258.75970458984,6314.3540039062,32.458862304688)}
		}
	},
	--PD PARKING
	{
		objHash = 1830360419,
		objHeading = -90.0,
		objCoords = vector3(464.46496582031,-975.21905517578,26.295503616333),
		textCoords = vector3(464.46496582031,-975.21905517578,26.295503616333),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = 749848321,
		objHeading = 45.0,
		objCoords = vector3(-14.478174209595,6481.1772460938,31.473348617554),
		textCoords = vector3(-14.478174209595,6481.1772460938,31.473348617554),
		authorizedJobs = {'government'},
		locked = true,
		maxDistance = 1.25
	},

	

	{
		objHash = 631614199,
		objHeading = -45.0,
		objCoords = vector3(-431.92468261719,6000.212890625,31.716190338135),
		textCoords = vector3(-431.92468261719,6000.212890625,31.716190338135),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = 631614199,
		objHeading = -45.0,
		objCoords = vector3(-428.53656005859,5997.056640625,31.716196060181),
		textCoords = vector3(-428.53656005859,5997.056640625,31.716196060181),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	


	{
		objHash = 1830360419,
		objHeading = 90.0,
		objCoords = vector3(464.34381103516,-996.80541992188,26.373168945312),
		textCoords = vector3(464.34381103516,-996.80541992188,26.373168945312),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	
	--PD TOP
	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(464.119140625,-983.78356933594,43.773113250732),
		textCoords = vector3(463.89389038086,-984.03198242188,43.691703796387),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	

	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},


	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(419.74124145508,-1022.0051269531,29.811546325684),
		textCoords = vector3(419.748046875,-1025.3812255859,31.685228347778),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},


	{
		objHash = -131296141,
		objHeading = -135.0,
		objCoords = vector3(-256.6858215332,6323.1967773438,32.427276611328),
		textCoords = vector3(-256.6858215332,6323.1967773438,32.427276611328),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},



	--MAGTIBAY
	{
		objHash = -1119680854,
		objHeading = 10.0,
		objCoords = vector3(-78.367332458496,822.72808837891,227.78700256348),
		textCoords = vector3(-78.367332458496,822.72808837891,227.78700256348),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -1119680854,
		objHeading = 45.0,
		objCoords = vector3(-51.539855957031,828.08715820312,231.39669799805),
		textCoords = vector3(-51.539855957031,828.08715820312,231.39669799805),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = -1119680854,
		objHeading = 10.0,
		objCoords = vector3(-70.787666320801,823.99786376953,231.41041564941),
		textCoords = vector3(-70.787666320801,823.99786376953,231.41041564941),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -1119680854,
		objHeading = 45.0,
		objCoords = vector3(-49.605251312256,830.12072753906,235.74108886719),
		textCoords = vector3(-49.605251312256,830.12072753906,235.74108886719),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = -1119680854,
		objHeading = 10.0,
		objCoords = vector3(-69.142837524414,824.28656005859,235.74029541016),
		textCoords = vector3(-69.142837524414,824.28656005859,235.74029541016),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	

	{
		objHash = -1119680854,
		objHeading = 10.0,
		objCoords = vector3(-80.774963378906,822.26672363281,235.73062133789),
		textCoords = vector3(-80.774963378906,822.26672363281,235.73062133789),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = -1119680854,
		objHeading = 10.0,
		objCoords = vector3(-97.39119720459,816.16510009766,235.75161743164),
		textCoords = vector3(-97.39119720459,816.16510009766,235.75161743164),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = 110411286,
		objHeading = 100.0,
		objCoords = vector3(-85.148475646973,834.7548828125,235.92178344727),
		textCoords = vector3(-85.148475646973,834.7548828125,235.92178344727),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	

	{
		objHash = -1186396713,
		objHeading = -80.0,
		objCoords = vector3(-90.627296447754,821.79290771484,240.20416259766),
		textCoords = vector3(-90.627296447754,821.79290771484,240.20416259766),
		authorizedJobs = {'magtibay'},
		locked = true,
		maxDistance = 1.25
	},
	



	
	
	
	{
		objHash = GetHashKey('prop_lrggate_02'),
		objCoords = vector3(287.76290893555,-574.35302734375,43.155288696289),
		textCoords = vector3(287.76290893555,-574.35302734375,43.155288696289),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},
}


---
-- DRUGS
---

Config.MarkerTypeDRUGS  = 27
Config.DrawDistanceDRUGS = 100.0
Config.ZoneSizeDRUGS    = {x = 3.0, y = 3.0, z = 1.0}
Config.MarkerColorDRUGS  = {r = 087, g = 166, b = 057}
Config.ShowBlipsDRUGS   = true  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsCoke  = 0
Config.RequiredCopsMeth  = 0
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 0

Config.TimeToFarmDRUGS   = 20 * 1000
Config.TimeToProcessDRUGS = 20 * 1000
Config.TimeToSellDRUGS  = 20  * 1000


Config.ZonesDRUGS = {
	CokeField =			{x = 1671.54,	y = 6648.65,	z = 9.80,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x = -2017.19,	y = 559.6,	z = 107.50,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	MethField =			{x = -1384.19,	y = 4634.73,	z = 77.0,	name = _U('meth_field'),		sprite = 499,	color = 26},
	MethProcessing =	{x = 3334.4580078125,	y = 5164.4731445312,	z = 17.510663223267,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	WeedField =			{x = -750.2,	y = 4321.54,	z = 141.50,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = 1714.57,	y = -1598.12,	z = 112.85,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	OpiumField =		{x = 1705.06,	y = 3845.58,	z = 34.10,	name = _U('opium_field'),		sprite = 51,	color = 60},
	OpiumProcessing =	{x = -58.77,	y = -2245.28,	z = 8.45,	name = _U('opium_processing'),	sprite = 51,	color = 60},
	MethDealer =	{x =1961.1517333984,	y = 5185.060546875,	z = 47.250878143311,	name = _U('meth_dealer'),	sprite = 51,	color = 60},
	OpiumDealer =	{x = 2328.91,	y = 2571.36,	z = 46.0,	name = _U('opium_dealer'),	sprite = 51,	color = 60},
	WeedDealer =	{x = 448.45,	y = 3521.1,	z = 33.20,	name = _U('weed_dealer'),	sprite = 51,	color = 60},
	CokeDealer =	{x = -1969.54,	y = -516.39,	z = 11.0,	name = _U('coke_dealer'),	sprite = 51,	color = 60}

}

----
--Duty
---

Config.DrawDistanceDUTY              = 100.0
--language currently available EN and SV

Config.ZonesDUTY = {
	
	PoliceDuty = {
		Pos   = { x =   461.77478027344, y = -996.36682128906, z = 29.78949508667 },
		Size  = { x = 1.5, y = 1.5, z = 1.5 },
		Color = { r = 0, g = 255, b = 0 },  
		Type  = 27,
		job = 'police'
	  },


	  PoliceDuty1 = {
		Pos   = { x =  1852.8643798828, y = 3687.5358886719, z =33.367032623291 },
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 0, g = 255, b = 0 },  
		Type  = 27,
		job = 'police'
	  },


	  --1852.8643798828,3687.5358886719,34.267032623291
	 
	  AmbulanceDuty = {
		Pos = vec3(304.91290283203,-601.02331542969,42.384091949463),
		Size = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 27,
		job = 'ambulance'
	  },
	  

	  AmbulanceDuty1 = {
		Pos = { x =  -253.58500671387, y = 6330.9711914062, z = 31.531541442871 },
		Size = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 27,
		job = 'ambulance'
	  },

	  -- 1429.3273925781,3552.8073730469,37.849979400635
	  -- -253.58500671387,6330.9711914062,32.431541442871 
	  GrooveDuty = { -- -223.23361206055,-1319.9327392578,30.890314102173
		Pos = { x =  -223.23361206055, y = -1319.9327392578, z = 29.990314102173 },
		Size = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 27,
		job = 'groove'
	  },


	  GrooveDuty2 = { -- ,,
		Pos = { x =  98.064094543457, y = 6619.3251953125, z = 31.935314178467 },
		Size = { x = 1.5, y = 1.5, z = 1.5 },
		Color = { r = 0, g = 255, b = 0 },
		Type = 27,
		job = 'groove'
	  },
}

---
--JAILE
---

Config.JailPositions = {
	["Cell"] = { ["x"] = 1799.8345947266, ["y"] = 2489.1350097656, ["z"] = -119.02998352051, ["h"] = 179.03021240234 }
}

Config.Cutscene = {
	["PhotoPosition"] = { ["x"] = 402.91567993164, ["y"] = -996.75970458984, ["z"] = -99.000259399414, ["h"] = 186.22499084473 },

	["CameraPos"] = { ["x"] = 402.88830566406, ["y"] = -1003.8851318359, ["z"] = -97.419647216797, ["rotationX"] = -15.433070763946, ["rotationY"] = 0.0, ["rotationZ"] = -0.31496068835258, ["cameraId"] = 0 },

	["PolicePosition"] = { ["x"] = 402.91702270508, ["y"] = -1000.6376953125, ["z"] = -99.004028320313, ["h"] = 356.88052368164 }
}

Config.PrisonWork = {
	["DeliverPackage"] = { ["x"] = 1027.2347412109, ["y"] = -3101.419921875, ["z"] = -38.999870300293, ["h"] = 267.89135742188 },

	["Packages"] = {
		[1] = { ["x"] = 1003.6661987305, ["y"] = -3108.4221191406, ["z"] = -38.999866485596, ["state"] = true },
		[2] = { ["x"] = 1006.0420532227, ["y"] = -3103.0024414063, ["z"] = -38.999866485596, ["state"] = true },
		[3] = { ["x"] = 1015.7958374023, ["y"] = -3102.8337402344, ["z"] = -38.99991607666, ["state"] = true },
		[4] = { ["x"] = 1012.8907470703, ["y"] = -3108.2907714844, ["z"] = -38.999912261963, ["state"] = true },
		[5] = { ["x"] = 1018.2017822266, ["y"] = -3109.1982421875, ["z"] = -38.999897003174, ["state"] = true },
		[6] = { ["x"] = 1018.0194091797, ["y"] = -3096.5700683594, ["z"] = -38.999897003174, ["state"] = true },
		[7] = { ["x"] = 1015.6422119141, ["y"] = -3091.7392578125, ["z"] = -38.999897003174, ["state"] = true },
		[8] = { ["x"] = 1010.7862548828, ["y"] = -3096.6135253906, ["z"] = -38.999897003174, ["state"] = true },
		[9] = { ["x"] = 1005.7819824219, ["y"] = -3096.8415527344, ["z"] = -38.999897003174, ["state"] = true },
		[10] = { ["x"] = 1003.4543457031, ["y"] = -3096.7048339844, ["z"] = -38.999897003174, ["state"] = true }
	}
}

Config.Teleports = {
	["Prison Work"] = { 
		["x"] = 992.51770019531, 
		["y"] = -3097.8413085938, 
		["z"] = -38.995861053467, 
		["h"] = 81.15771484375, 
		["goal"] = { 
			"Jail" 
		} 
	},

	["Boiling Broke"] = { 
		["x"] = 1845.6022949219, 
		["y"] = 2585.8029785156, 
		["z"] = 45.672061920166, 
		["h"] = 92.469093322754, 
		["goal"] = { 
			"Security" 
		} 
	},

	["Jail"] = { 
		["x"] = 1800.6979980469, 
		["y"] = 2483.0979003906, 
		["z"] = -122.68814849854, 
		["h"] = 271.75274658203, 
		["goal"] = { 
			"Prison Work", 
			"Security", 
			"Visitor" 
		} 
	},

	["Security"] = { 
		["x"] = 1706.7625732422,
		["y"] = 2581.0793457031, 
		["z"] = -69.407371520996, 
		["h"] = 267.72802734375, 
		["goal"] = { 
			"Jail",
			"Boiling Broke"
		} 
	},

	["Visitor"] = {
		["x"] = 1699.7196044922, 
		["y"] = 2574.5314941406, 
		["z"] = -69.403930664063, 
		["h"] = 169.65020751953, 
		["goal"] = { 
			"Jail" 
		} 
	}
}

----
--RUSKI
---

Config.ArrestDistance				= 2.0  




ConfigDrugv2              	= {}
ConfigDrugv2.MarkerType   	= 1
ConfigDrugv2.DrawDistance 	= 100.0
ConfigDrugv2.ZoneSize     	= {x = 2.5, y = 2.5, z = 0.5}
ConfigDrugv2.MarkerColor  	= {r = 100, g = 204, b = 100}
ConfigDrugv2.KeyStopAction 	= 'C'
-- Show blip in map?
ConfigDrugv2.ShowBlips    	= true

ConfigDrugv2.Locale 			= 'en'

-- Before add any drug/item here you have to add the translation of the item
ConfigDrugv2.Drugs = {
	-- Translated name
	[_U('weed')] = {
		Item			= 'weed',				 	-- Item to pickup
		ItemTransform	= 'weed_pooch', 			-- Item to transform
		AlertCops		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 10,						-- Time to process in seconds
		TimeToSell		= 10,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= true,						-- Effect after consume
		Zones			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online

			

			Field 			= {x =-750.19445800781,	y = 4321.5400390625,	z = 140.96272277832,	name = _U('field', _U('weed')),			sprite = 496,	color = 52, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 1714.57,	y = -1598.12,	z = 112.85,	name = _U('processing', _U('weed')),	sprite = 496,	color = 52, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x = 448.45,	y = 3521.1,	z = 32.60, h = 45.24,	name = _U('dealer', _U('weed')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('meth')] = {
		Item			= 'meth',				 	-- Item to pickup
		ItemTransform	= 'meth_pooch', 			-- Item to transform
		AlertCops 		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 10,						-- Time to process in seconds
		TimeToSell		= 10,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= true,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field 			= {x = -1384.19,	y = 4634.73,	z = 77.0,	        name = _U('field', _U('meth')),			sprite = 499,	color = 26, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 3334.4580078125,	y = 5164.4731445312,	name = _U('processing', _U('meth')),	sprite = 499,	color = 26, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x =1961.1517333984,	y = 5185.060546875,	z = 47.250878143311, h = 45.24,	name = _U('dealer', _U('meth')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('opium')] = {
		Item			= 'opium',				 	-- Item to pickup
		ItemTransform	= 'opium_pooch', 			-- Item to transform
		AlertCops 		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 20,						-- Time to farm in seconds
		TimeToProcess 	= 15,						-- Time to process in seconds
		TimeToSell		= 25,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= true,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online

	
			Field 			= {x = 1705.06,	y = 3845.58,	z = 34.10,	name = _U('field', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -58.77,	y = -2245.28,	z = 8.45,	name = _U('processing', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = 2328.91,	y = 2571.36,	z = 45.95, h = 45.24, name = _U('dealer', _U('opium')),	sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('coke')] = {
		Item			= 'coke',				 	-- Item to pickup
		ItemTransform	= 'coke_pooch', 			-- Item to transform
		AlertCops		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 25,						-- Time to farm in seconds
		TimeToProcess 	= 30,						-- Time to process in seconds
		TimeToSell		= 20,						-- Time to sell in seconds
		Usable			= true,						-- Can it be consumed?
		UseEffect		= true,						-- Effect after consume
		Zones 			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online
			Field 			= {x = 1671.54,	y = 6648.65,	z = 9.80,	name = _U('field', _U('coke')),			sprite = 501,	color = 40, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -2017.19,	y = 559.6,	z = 107.50,	name = _U('processing', _U('coke')),	sprite = 478,	color = 40, callPolice = false, callPoliceChance = 100},
		    Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
		}
	}
}
