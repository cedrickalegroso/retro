Config = {}

Config.Locale = 'en'   

-- Distance before text is shown
Config.TextDrawDistance = 5  

-- Time in seconds before player gets out of bed 
Config.BedTime = 10

Config.Locations = {
	PillBoxHospital = {
		Coords = {x = -435.85504150391, y = -326.05004882812, z = 35.91077041626}
	}
}

ConfigLi = {}
ConfigLi.Locale = 'en'

ConfigLi.MenuAlign = 'top-left'
ConfigLi.DrawDistance = 100

ConfigLi.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
ConfigLi.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

ConfigLi.UseBlips = true -- true = Use License Shop Blips
ConfigLi.RequireDMV = true -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.

ConfigLi.AdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop
ConfigLi.LicenseAircraft = 150000
ConfigLi.LicenseBoating = 75000

ConfigLi.AdvancedWeaponShop = false -- Set to true if using esx_advancedweaponshop
ConfigLi.LicenseMelee = 1
ConfigLi.LicenseHandgun = 10
ConfigLi.LicenseSMG = 100
ConfigLi.LicenseShotgun = 50
ConfigLi.LicenseAssault = 250
ConfigLi.LicenseLMG = 1000
ConfigLi.LicenseSniper = 1500

ConfigLi.DMVSchool = true -- Set to true if using esx_dmvschool
ConfigLi.SellDMV = true -- Set to true if ConfigLi.RequireDMV = false & you want players to be able to buy Drivers Permit
ConfigLi.LicenseCommercial = 35000
ConfigLi.LicenseDrivers = 10000
ConfigLi.LicenseDriversP = 20000
ConfigLi.LicenseMotocycle = 28500

ConfigLi.Drugs = false -- Set to true if using esx_drugs
ConfigLi.LicenseWeed = 10000

ConfigLi.WeaponShop = false -- Set to true if using esx_weaponshop
ConfigLi.LicenseWeapon = 1000

ConfigLi.Zones = {
	LicenseShops = {
		Coords = {
			vector3(241.0, -1378.9, 32.7),
			--vector3(438.68, -980.16, 29.69)
		}
	}
}


ConfigDrugef = {}
ConfigDrugef.TickTime = 100
ConfigDrugef.UpdateClientTime = 5000


ConfigDrug              	= {}
ConfigDrug.MarkerType   	= 1
ConfigDrug.DrawDistance 	= 100.0
ConfigDrug.ZoneSize     	= {x = 2.5, y = 2.5, z = 0.5}
ConfigDrug.MarkerColor  	= {r = 100, g = 204, b = 100}
ConfigDrug.KeyStopAction 	= 'C'
-- Show blip in map?
ConfigDrug.ShowBlips    	= false

ConfigDrug.Locale 			= 'en'

-- Before add any drug/item here you have to add the translation of the item
ConfigDrug.Drugs = {
	-- Translated name
	[_U('weed')] = {
		Item			= 'weed',				 	-- Item to pickup
		ItemTransform	= 'weed_pooch', 			-- Item to transform
		AlertCops		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 15,			-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
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
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,					-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
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
			Processing 		= {x = 3334.4580078125,	y = 5164.4731445312,	z = 17.510663223267,	name = _U('processing', _U('meth')),	sprite = 499,	color = 26, callPolice = false, callPoliceChance = 100},
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
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
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
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,						-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
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
	},
	

			


}


ConfigBODYBAG  =   {}

-- KEY LIST --

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--[[

	Version: 0.1.2

	If you are still having issues, or you have questions/comments,
	Visit the thread on the FiveM Forums @ https://https://forum.fivem.net/t/release-bodybag-for-pd-ems/
	Continuing Development by BTNGaming & Deviljin112
	Your ideas, are our creations!

]]--

--[[

    If you want to use Command set Use_Command to TRUE and Use_Keybind to FALSE
    If you want to use Automatic System where bag is applied on death set Use_Command to FALSE and Use_Keybind to FALSE
    If you want to use Keybind System set Use_Command to FALSE and Use_Keybind to TRUE

	To change command name see top of Client.lua

	To add more jobs or remove a job, simply go to line 61 or 121 in client.lua
	Then to add the following line inside the brackets after ConfigBODYBAG.job_2:

	"or PlayerData.job.name == ConfigBODYBAG.job_3"

	to add 4th job after ConfigBODYBAG.job_3 add
	"or PlayerData.job.name == ConfigBODYBAG.job_4"
	without the ""

	To remove a job simply do the opposite of the above and remove
	"or PlayerData.job.name == ConfigBODYBAG.job_2"
	From inside of the brackets

	REMEMBER when adding a new job make sure to uncomment it below and add its name below
	You can add unlimited amount of jobs simply add another ConfigBODYBAG.job_
	and follow steps above

]]--

-- ESX or not
ConfigBODYBAG.use_esx = true

-- Command or ( Automatic / Keybind = False )
ConfigBODYBAG.use_command = true

-- Automatic or Keybind
ConfigBODYBAG.use_keybind = false

-- What key to be used (list of all available keys above)
ConfigBODYBAG.keybind = Keys["L"]

-- Job Restriction ( ESX ONLY )
ConfigBODYBAG.restrict_job = true

-- If above is true, set job names here (to add more see above)
ConfigBODYBAG.job_1 = "police"
ConfigBODYBAG.job_2 = "ambulance"
-- ConfigBODYBAG.job_3 = ( Needs to be coded in. INSTRUCTIONS ON LINE 24+ )
-- ConfigBODYBAG.job_4 = ( Needs to be coded in. INSTRUCTIONS ON LINE 24+ )

-- Update Frequency for Automatic Bag Spawn
ConfigBODYBAG.freq_bag_on = 1000

-- Update Frequency for Automatic Bag De-Spawn (Player Revived / Respawned)
ConfigBODYBAG.freq_bag_off = 1000

-- Bag Model
ConfigBODYBAG.bag_model = "xm_prop_body_bag"
ConfigBODYBAG.bag_hash = `xm_prop_body_bag`


-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

ConfigDRUGBUSI = {}

-- Police Settings:
ConfigDRUGBUSI.PoliceJobs = {"police", "lspd"}	-- Jobs that can't do bankrobberies etc, but can secure the banks.
ConfigDRUGBUSI.NotifyCops = true				-- Notify police when stealing job vehicle

-- Alert Blip
ConfigDRUGBUSI.AlertBlipShow = true			-- enable or disable blip on map on police notify
ConfigDRUGBUSI.AlertBlipTime = 20			-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
ConfigDRUGBUSI.AlertBlipRadius = 50.0		-- set radius of the police notify blip
ConfigDRUGBUSI.AlertBlipAlpha = 250			-- set alpha of the blip
ConfigDRUGBUSI.AlertBlipColor = 3			-- set blip color

-- Marker settings for ALL drug labs:
ConfigDRUGBUSI.MarkerSettings = {
	enable = true,
	drawDist = 10.0,
	type = 20,
	scale = {x = 0.7, y = 0.7, z = 0.7},
	color = {r = 240, g = 52, b = 52, a = 100}
}

-- Blip Settings for drug labs:
ConfigDRUGBUSI.BlipSettings = {
	enable = true,
	sprite = 492,
	display = 4,
	scale = 0.65,
	color = 0
} 

-- Buttons:
ConfigDRUGBUSI.KeyToManageLab			= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToPurchaseLab			= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToRobLab				= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToRaidLab				= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToLaptop				= 47 		-- Default: [G]
ConfigDRUGBUSI.KeyToLeaveLab			= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToDeliverStockVeh		= 38		-- Default: [E]
ConfigDRUGBUSI.KeyToLockpickJobVeh		= 47 		-- Default: [G]
ConfigDRUGBUSI.KeyToDeliverJobVeh		= 38		-- Default: [E]

-- General Settings:
ConfigDRUGBUSI.PayDrugLabWithCash 		= true		-- Set to false to use bank money instead
ConfigDRUGBUSI.RecieveSoldLabCash       = true      -- Set to false to receive bank money on sale of drug lab
ConfigDRUGBUSI.OwnedLabBlip 			= true		-- Blip for owned lab (source player)
ConfigDRUGBUSI.PlayerLabsBlip 		    = true		-- Blip to view other players' owned labs
ConfigDRUGBUSI.PurchasableLabBlip 	    = true		-- Blip to show labs forsale
ConfigDRUGBUSI.SellPercent              = 0.75      -- Means player gets 75% in return from original paid price
ConfigDRUGBUSI.SupplyLevelPrice			= 15000		-- Set price to purchase one level of supplies in drug lab
ConfigDRUGBUSI.StockLevelPrice			= 30000		-- Set sell price for each level of stuck in drug lab
ConfigDRUGBUSI.ProductionMinutes		= 10		-- Set value in minutes for interval of producing one level of supplies into one level of stock.
ConfigDRUGBUSI.SellMultiplier = { 1.0, 1.1, 1.2, 1.3, 1.5 } -- set stovk value multiplier for each level of stock upon sale

-- Robbery Settings:
ConfigDRUGBUSI.RobLabWhenPlayerOffline	= true		-- Set to false to disable robbing a drug lab where owner of the lab is offline.
ConfigDRUGBUSI.WaitTimeUntilHack 		= 10		-- Set time in seconds, until hacking device is ready. This is time the owner of lab has to react on it an take down possible intruders.
ConfigDRUGBUSI.mHackingBlocks			= 3			-- Set amount of hacking blocks in mhacking
ConfigDRUGBUSI.mHackingSeconds			= 30		-- Set amount of seconds for mHacking minigame

-- Police Settings:
ConfigDRUGBUSI.RaidLabWhenPlayerOffline	= true		-- Set to false to disable police raiding a drug lab where owner of the lab is offline.
ConfigDRUGBUSI.WaitTimeUntilRaid		= 10		-- Set time in seconds, until police enter the lab. This is time the owner of lab has to react on it an take down possible police.

-- Defined shell props // do not touch this if you dont know what u are doing
ConfigDRUGBUSI.ShellProps = {
	['lab_coke'] = `shell_coke2`,
	['lab_meth'] = `shell_meth`,
	['lab_weed'] = `shell_weed2`,
}

-- Labs:
ConfigDRUGBUSI.DrugLabs = {
    [1] = { pos = {-1463.08,-381.48,38.87}, h = 45.87, prop = 'lab_meth', price = 15000, delivery = {-1457.22,-383.84,38.48,120.0} },
    [2] = { pos = {-1453.27,-387.31,38.19}, h = 212.3, prop = 'lab_coke', price = 20000, delivery = {-1457.22,-383.84,38.48,120.0} },
    [3] = { pos = {-1468.15,-387.05,38.81}, h = 48.29, prop = 'lab_weed', price = 10000, delivery = {-1464.83,-389.52,38.56,132.12} },
}

-- Offset spots relative to the spawned shell object. Do not mess with this, if you don't know what u are doing.
-- Read more about offsets here: https://runtime.fivem.net/doc/natives/?_0x1899F328B0E12848
ConfigDRUGBUSI.Offsets = {
	['lab_coke'] = { entry = {-6.25, 8.42, -1.0},  h = 180.81, laptop = {-8.61, -0.93, -1.0}, animPos = {-8.0, -0.93, -1.0}, animHead = 88.4 },
	['lab_meth'] = { entry = {-6.25, 8.42, -1.0},  h = 180.81, laptop = {-8.59, 1.50, -1.0}, animPos = {-8.0, 1.60, -1.0}, animHead = 91.62 },
	['lab_weed'] = { entry = {17.59, 11.75, -2.0}, h = 89.85,  laptop = {-3.47, -3.88, -1.0}, animPos = {-3.97, -3.88, -1.0}, animHead = 272.33 },
}

-- Job Vehicles:
ConfigDRUGBUSI.JobVehicles = { "rumpo2", "rumpo", "speedo", "pony", "burrito4", "burrito3" }
ConfigDRUGBUSI.StockSellVeh = 'mule3'

-- Job Delivery Marker Setting:
ConfigDRUGBUSI.DeliveryMarker = { enable = true, drawDist = 10.0, type = 27, scale = { x = 5.0, y = 5.0, z = 1.0 }, color = { r = 244, g = 208, b = 63, a = 100 } }

-- Steal Supplies:
ConfigDRUGBUSI.StealSupplies = {
	[1] = {
		location = {-1657.33,3083.83,31.12},
		heading = 138.36,
		anim = {pos = {-1656.47,3082.35,31.08}, h = 52.82},
		started = false,
		goons = {
			[1] = { pos = {-1653.32,3082.84,31.2}, 	h = 157.13, ped = 'G_M_Y_Lost_02', 		animDict = 'amb@world_human_cop_idles@female@base', 					animName = 'base', 				weapon = 'WEAPON_PISTOL', },
			[2] = { pos = {-1660.67,3087.39,31.18}, h = 172.6, 	ped = 'G_M_Y_MexGang_01', 	animDict = 'rcmme_amanda1', 											animName = 'stand_loop_cop', 	weapon = 'WEAPON_PISTOL', },
			[3] = { pos = {-1653.54,3088.9,31.4}, 	h = 162.59, ped = 'G_M_Y_SalvaBoss_01', animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', 	animName = 'base', 				weapon = 'WEAPON_PISTOL', },
		},
	},
	[2] = {
		location = {-1576.35,5169.86,19.58},
		heading = 155.36,
		anim = {pos = {-1574.97,5168.63,19.57}, h = 58.56},
		started = false,
		goons = {
			[1] = { pos = {-1578.98,5173.11,19.57}, h = 146.12, ped = 'G_M_Y_Lost_02', 		animDict = 'amb@world_human_cop_idles@female@base', 					animName = 'base', 				weapon = 'WEAPON_HEAVYPISTOL', },
			[2] = { pos = {-1571.95,5169.48,19.55}, h = 159.6, 	ped = 'G_M_Y_MexGang_01', 	animDict = 'rcmme_amanda1', 											animName = 'stand_loop_cop', 	weapon = 'WEAPON_MICROSMG', },
			[3] = { pos = {-1582.8,5172.02,19.56}, 	h = 197.48, ped = 'G_M_Y_SalvaBoss_01', animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', 	animName = 'base', 				weapon = 'WEAPON_MINISMG', },
		},
	},
}

ConfigDRUGBUSI.SellStock = {
	[1] = { 
		started = false,
		location = {2546.4,-279.8,92.99},
	},
	[2] = { 
		started = false,
		location = {2776.03,2809.02,41.51},
	},
}


ConfigTV = {}

ConfigTV['URL'] = 'https://www.youtube.com/embed/%s?autoplay=1&controls=1&disablekb=1&fs=0&rel=0&showinfo=0&iv_load_policy=3&start=%s'
-- ConfigTV['URL'] = 'https://www.youtube.com/watch?v=%s&t=%s' -- use this if you want to be able to play copyrighted stuff. please note that ads will pop up every now and again, and full screen doesn't work
ConfigTV['API'] = {
    ['URL'] = 'https://www.googleapis.com/youtube/v3/videos?id=%s&part=contentDetails&key=%s',
    ['Key'] = ''
}
ConfigTV['DurationCheck'] = false -- this will automatically delete the browser (good for ram i guess?) once the video has finished (REQUIRES YOU TO ADD AN API KEY!!!!!)

ConfigTV['Objects'] = {
    {
        ['Object'] = 'prop_tv_flat_01',
        ['Scale'] = 0.05,
        ['Offset'] = vec3(-0.925, -0.055, 1.0),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_michael',
        ['Scale'] = 0.035,
        ['Offset'] = vec3(-0.675, -0.055, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_trev_tv_01',
        ['Scale'] = 0.012,
        ['Offset'] = vec3(-0.225, -0.01, 0.26),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03b',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.062, 0.18),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_03',
        ['Scale'] = 0.016,
        ['Offset'] = vec3(-0.3, -0.01, 0.4),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02b',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
    {
        ['Object'] = 'prop_tv_flat_02',
        ['Scale'] = 0.026,
        ['Offset'] = vec3(-0.5, -0.012, 0.525),
        ['Distance'] = 7.5,
    },
}

Strings = {
    ['VideoHelp'] = 'Type ~b~/tv ~y~youtube id~s~ to play a video.\nExample: ~b~/tv ~y~3hqjseATp4g~s~',
    ['VolumeHelp'] = 'Type ~b~/volume ~y~(0-10)~s~ to change the volume.\nExample: ~b~/volume ~y~5~s~\n\nType ~b~/tv ~y~youtube id~s~ to change the video.\nExample: ~b~/tv ~y~3hqjseATp4g~s~\n\nType ~b~/destroy~s~ to stop the video\n\n~INPUT_CONTEXT~ Sync video time',
}

-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

ConfigBankrob = {}

-- Police Settings:
ConfigBankrob.PoliceJobs = {"police", "lspd"}	-- Jobs that can't do bankrobberies etc, but can secure the banks.

-- Alert Blip
ConfigBankrob.AlertBlipShow = true			-- enable or disable blip on map on police notify
ConfigBankrob.AlertBlipTime = 20			-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
ConfigBankrob.AlertBlipRadius = 50.0		-- set radius of the police notify blip
ConfigBankrob.AlertBlipAlpha = 250			-- set alpha of the blip
ConfigBankrob.AlertBlipColor = 3			-- set blip color

-- Minigames:
ConfigBankrob.mHacking = true				-- set to false to disable mhacking at the first keypad. // MUST ADD YOUR OWN THEN!!
ConfigBankrob.utkFingerPrint = true		-- set to false to disable utku fingerprint at the second keypad. // MUST ADD YOUR OWN THEN!!
ConfigBankrob.ChanceHackerDeviceBack = 50	-- set chance in % of getting hackerDevice back upon successful hacking.

-- Items:
ConfigBankrob.HackItem = "hackerDevice"
ConfigBankrob.LockPick = "lockpick"
ConfigBankrob.HammerWireCutter = "shovel"
ConfigBankrob.AccessCard = "pacificID"

-- Buttons:
ConfigBankrob.KeyHackTerminal = 38			-- Button for first keypad
ConfigBankrob.KeyHackVault = 311			-- Button for second keypad
ConfigBankrob.KeyOpenVaultDoor = 38		-- Button to open door
ConfigBankrob.KeyCloseVaultDoor = 38		-- Button to close door
ConfigBankrob.KeySecureVaultDoor = 47		-- Button to secure vault door

-- Other:
ConfigBankrob.HasItemLabel = true			-- set to false if your ESX vers. doesnt support item labels.

-- Banks:
ConfigBankrob.Banks = {
    [1] = {
        name = "Fleeca Bank [Legion Square]", postal = "8170",
        blip = {enable = true, bName = "Fleeca Bank [Legion Square]", display = 4, sprite = 431, color = 5, scale = 0.7},
        inUse = true, minCops = 3,
        vault = { pos = {147.349,-1046.24,29.3681}, model = 2121050683, oHeadMin = 124.0, oHeadMax = 154.0, cHeadMin = 235.0, cHeadMax = 265.0 },
        door = { pos = {149.561, -1047.35, 29.34634}, model = -1591004109 },
        keypads = {
            [1] = { pos = {147.349,-1046.24,29.3681}, hacked = false },
            [2] = { pos = {148.52,-1046.574,29.59628}, hacked = false },
		},
		deskDoor = { pos = {145.562,-1041.337,29.36801}, model = -131754413, heading = 249.84619, lockpicked = false, oHeadMin = 160.0, oHeadMax = 180.0, cHeadMin = 235.0, cHeadMax = 265.0},
		deskCash = {
			[1] = {pos = {151.13,-1042.02,29.37}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {149.7,-1041.48,29.37}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {148.08,-1040.85,29.37}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {135.60,-1046.45,29.63}, disabled = true, animPos = {135.34,-1047.09,29.15}, animHeading = 340.66, freeTime = 60, hackSuccess = {enable = true, time = 30}}
    },
    [2] = {
        name = "Fleeca Bank [Alta]",postal = "7193",
        blip = {enable = true, bName = "Fleeca Bank [Alta]", display = 4, sprite = 431, color = 5, scale = 0.7},
        inUse = false, minCops = 3,
        vault = { pos = {311.6992,-284.5561,54.1648}, model = 2121050683, oHeadMin = 124.0, oHeadMax = 154.0, cHeadMin = 235.0, cHeadMax = 265.0 },
        door = { pos = {313.8916,-285.7734,54.14302}, model = -1591004109 },
        keypads = {
            [1] = { pos = {311.6992,-284.5561,54.1648}, hacked = false },
            [2] = { pos = {312.8784,-284.991,54.39302}, hacked = false },
        },
		deskDoor = { pos = {310.0,-279.73,54.16}, model = -131754413, heading = 249.865966, lockpicked = false, oHeadMin = 160.0, oHeadMax = 180.0, cHeadMin = 235.0, cHeadMax = 265.0},
		deskCash = {
			[1] = {pos = {315.42,-280.26,54.16}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {313.7,-279.59,54.16}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {312.08,-279.07,54.16}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {258.66,-308.09,49.65}, disabled = false, animPos = {258.92,-307.33,49.65}, animHeading = 162.16, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[3] = {
		name = "Fleeca Bank [Burton]",postal = "7185",
		blip = { enable = true, bName = "Fleeca Bank [Burton]", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {-353.32,-55.47687,49.03565}, model = 2121050683, oHeadMin = 124.0, oHeadMax = 154.0, cHeadMin = 235.0, cHeadMax = 265.0 },
		door = { pos = {-351.097, -56.46866, 49.01482}, model = -1591004109 },
		keypads = {
            [1] = { pos = {-353.32,-55.47687,49.03565}, hacked = false },
            [2] = { pos = {-352.2206, -55.77902, 49.2348}, hacked = false },
        },
		deskDoor = { pos = {-355.19,-50.56,49.04}, model = -131754413, heading = 250.85983, lockpicked = false, oHeadMin = 160.0, oHeadMax = 180.0, cHeadMin = 235.0, cHeadMax = 265.0},
		deskCash = {
			[1] = {pos = {-349.61,-51.04,49.04}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {-351.3,-50.47,49.04}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {-353.09,-49.86,49.04}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {-355.77,-50.22,54.42}, disabled = false, animPos = {-356.54,-49.91,54.42}, animHeading = 249.03, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[4] = {
		name = "Fleeca Bank [Rockford Hills]",postal = "7175",
		blip = { enable = true, bName = "Fleeca Bank [Rockford Hills]", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {-1210.31,-336.334,37.781}, model = 2121050683, oHeadMin = 170.0, oHeadMax = 200.0, cHeadMin = 277.0, cHeadMax = 307.0 },
		door = { pos = {-1208.084, -335.4738, 37.75928}, model = -1591004109 },
		keypads = {
            [1] = { pos = {-1210.31,-336.334,37.781}, hacked = false },
            [2] = { pos = {-1209.306, -335.7388, 37.97926}, hacked = false },
        },
		deskDoor = { pos = {-1215.11,-334.23,37.78}, model = -131754413, heading = 296.8637, lockpicked = false, oHeadMin = 205.0, oHeadMax = 225.0, cHeadMin = 277.0, cHeadMax = 307.0},
		deskCash = {
			[1] = {pos = {-1210.58,-330.75,37.78}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {-1211.99,-331.45,37.78}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {-1213.63,-332.28,37.78}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {-1217.14,-332.99,42.12}, disabled = false, animPos = {-1216.5,-332.63,42.12}, animHeading = 119.32, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[5] = {
		name = "Fleeca Bank [Grand Senora Desert]",postal = "4024",
		blip = { enable = true, bName = "Fleeca Bank [Grand Senora Desert]", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {1175.544,2712.855,38.088}, model = 2121050683, oHeadMin = 320.0, oHeadMax = 350.0, cHeadMin = 80.0, cHeadMax = 110.0 },
		door = { pos = {1173.07, 2713.166, 38.06626}, model = -1591004109 },
		keypads = {
            [1] = { pos = {1175.544,2712.855,38.088}, hacked = false },
            [2] = { pos = {1174.376,2712.854,38.26626}, hacked = false },
		},
		deskDoor = { pos = {1178.84,2708.87,38.09}, model = -131754413, heading = 90.0, lockpicked = false, oHeadMin = 0.0, oHeadMax = 25.0, cHeadMin = 80.0, cHeadMax = 110.0},
		deskCash = {
			[1] = {pos = {1173.16,2707.75,38.09}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {1174.9,2707.76,38.09}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {1176.59,2707.73,38.09}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {1158.18,2708.96,37.98}, disabled = false, animPos = {1157.47,2708.92,37.98}, animHeading = 269.46, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[6] = {
		name = "Fleeca Bank [Great Ocean Highway]",postal = "5070",
		blip = { enable = true, bName = "Fleeca Bank [Great Ocean Highway]", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {-2956.473,482.2,15.99}, model = -63539571, oHeadMin = 230.0, oHeadMax = 260.0, cHeadMin = 340.0, cHeadMax = 370.0 },
		door = { pos = {-2956.226, 484.5746, 15.67534}, model = -1591004109, },
		keypads = {
            [1] = { pos = {-2956.473,482.2,15.99}, hacked = false },
            [2] = { pos = {-2956.44, 483.3556, 15.87528}, hacked = false },
		},
		deskDoor = { pos = {-2960.67,479.08,15.7}, model = -131754413, heading = 357.54295, lockpicked = false, oHeadMin = 260.0, oHeadMax = 280.0, cHeadMin = 340.0, cHeadMax = 370.0},
		deskCash = {
			[1] = {pos = {-2961.67,484.62,15.7}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {-2961.76,482.99,15.7}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {-2961.83,481.25,15.7}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {-2948.05,481.05,15.44}, disabled = false, animPos = {-2947.25,480.95,15.26}, animHeading = 90.32, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[7] = {
		name = "Blaine County Savings Bank",postal = "1055",
		blip = { enable = true, bName = "BCS Bank", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {-105.9,6472.11,31.9}, model = -1185205679, oHeadMin = 140.0, oHeadMax = 170.0, cHeadMin = 30.0, cHeadMax = 60.0 },
		door = { pos = {-105.817, 6475.618, 31.62672}, model = 1309269072 },
		keypads = {
            [1] = { pos = {-105.9,6472.11,31.9}, hacked = false },
            [2] = { pos = {-105.5096, 6475.232, 32.00}, hacked = false },
		},
		deskDoor = { pos = {-109.36,6468.74,31.63}, model = -1184592117, heading = 45.00006, lockpicked = false, oHeadMin = 315.0, oHeadMax = 335.0, cHeadMin = 35.0, cHeadMax = 65.0},
		deskCash = {
			[1] = {pos = {-113.64,6471.79,31.63}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {-112.32,6470.43,31.63}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {-111.27,6469.37,31.63}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {-109.45,6483.29,31.47}, disabled = false, animPos = {-110.0,6483.8,31.47}, animHeading = 224.89, freeTime = 60, hackSuccess = {enable = true, time = 30}}
	},
	[8] = {
		name = "Pacific Standard Public Deposit Bank", postal = "7090",
		blip = { enable = true, bName = "PSPD Bank", display = 4, sprite = 431, color = 5, scale = 0.7 },
		inUse = false, minCops = 3,
		vault = { pos = {252.8114,228.4967,102.0833}, model = 961976194, oHeadMin = 20.0, oHeadMax = 40.0, cHeadMin = 150.0, cHeadMax = 165.0 },
		door = { pos = {262.1650,221.76,106.2851}, model = 746855201 },
		keypads = {
			[1] = { pos = {262.3505,223.0325,106.7842}, hacked = false },
			[2] = { pos = {252.8114,228.4967,102.0833}, hacked = false },
		},
		deskDoor = { pos = {257.01,220.54,106.29}, model = -222270721, heading = 340.0, lockpicked = false, oHeadMin = 49.0, oHeadMax = 69.0, cHeadMin = 330.0, cHeadMax = 350.0},
		deskCash = {
			[1] = {pos = {242.64,226.22,106.29}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[2] = {pos = {247.76,224.27,106.29}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}},
			[3] = {pos = {252.88,222.43,106.29}, robbed = false, reward = {dirty = true, min = 2000, max = 5000}}, 
		},
		powerBox = {pos = {255.50,227.14,151.63}, disabled = false, animPos = {255.22,226.35,151.63}, animHeading = 339.25, freeTime = 60, hackSuccess = {enable = true, time = 30}},
		safe = {cracked = false},
	},
}

-- DRILL SECTION:

ConfigBankrob.DrillItem = "drill"		-- item name from database
ConfigBankrob.DrillStopKey = 178		-- button to stop drill

ConfigBankrob.ChanceToKeepDrill = 25	-- set chance in % of keeping drill after successfull drill finish.

ConfigBankrob.SafeItemRewards = {
	[1] = { item = "goldbar", chance = 65, min = 1, max = 3},
	[2] = { item = "goldwatch", chance = 85, min = 15, max = 20},
	[3] = { item = "goldnecklace", chance = 40, min = 10, max = 14},
	[4] = { item = "diamond", chance = 25, min = 1, max = 2},
}

ConfigBankrob.SafeMoneyReward = {{
	dirtyCash = true,			-- set to false to receive normal cash
	minAmount = 15,				-- this value is multiplied with 1000 in script, so 15 means 15.000$
	maxAmount = 30,				-- this value is multiplied with 1000 in script, so 30 means 30.000$
}}

ConfigBankrob.Safes = {
	-- Fleeca Bank (Great Ocean Highway):
	[1] = { pos = {-2954.138,481.9888,15.6753}, AnimPos = {-2954.136,482.8257,15.67532}, AnimHeading = 174.28378295898, robbed = false, failed = false },
	[2] = { pos = {-2952.124,484.4436,15.67539}, AnimPos = {-2952.935,484.3697,15.67539}, AnimHeading = 263.67068481445, robbed = false, failed = false },
	[3] = { pos = {-2954.121,486.7845,15.67542}, AnimPos = {-2954.104,485.9754,15.6754}, AnimHeading = 355.06997680664, robbed = false, failed = false },
	[4] = { pos = {-2958.85,484.0662,15.6753}, AnimPos = {-2958.034,484.128,15.6753}, AnimHeading = 89.174713134766, robbed = false, failed = false },
	[5] = { pos = {-2957.4,486.2582,15.67534}, AnimPos = {-2957.432,485.405,15.67534}, AnimHeading = 354.07684326172, robbed = false, failed = false },
	
	-- Fleeca Bank (Grand Senora Desert):
	[6] = { pos = {1175.632,2715.207,38.06627}, AnimPos = {1174.726,2715.25,38.06627}, AnimHeading = 266.26025390625, robbed = false, failed = false },
	[7] = { pos = {1173.126,2717.204,38.0663}, AnimPos = {1173.09,2716.304,38.0663}, AnimHeading = 356.55850219727, robbed = false, failed = false },
	[8] = { pos = {1170.816,2715.171,38.06633}, AnimPos = {1171.683,2715.196,38.06633}, AnimHeading = 87.711120605469, robbed = false, failed = false },
	[9] = { pos = {1173.77,2710.368,38.06626}, AnimPos = {1173.77,2711.246,38.06626}, AnimHeading = 180.11283874512, robbed = false, failed = false },
	[10] = { pos = {1171.362,2711.888,38.06626}, AnimPos = {1172.23,2711.848,38.06626}, AnimHeading = 88.924171447754, robbed = false, failed = false },
	
	-- Blaine County Savings Bank:
	[11] = { pos = {-102.59,6475.231,31.62672}, AnimPos = {-103.1672,6475.829,31.65008}, AnimHeading = 220.24415588379, robbed = false, failed = false },
	[12] = { pos = {-103.0840,6478.672,31.62672}, AnimPos = {-103.6711,6478.08,31.62672}, AnimHeading = 318.58407592773, robbed = false, failed = false },
	[13] = { pos = {-106.8801,6478.354,31.62672}, AnimPos = {-106.2137,6477.688,31.62672}, AnimHeading = 43.0051612854, robbed = false, failed = false },
	[14] = { pos = {-107.3154,6473.156,31.6267}, AnimPos = {-106.8056,6473.856,31.6267}, AnimHeading = 137.65379333496, robbed = false, failed = false },
	[15] = { pos = {-107.9968,6475.834,31.6267}, AnimPos = {-107.3258,6475.314,31.6267}, AnimHeading = 48.860725402832, robbed = false, failed = false },
	
	-- Fleeca Bank (Legion Square):
	[16] = { pos = {146.485,-1048.443,29.34629}, AnimPos = {147.2295,-1048.667,29.3463}, AnimHeading = 68.842262268066, robbed = false, failed = false },
	[17] = { pos = {148.1023,-1051.246,29.34637}, AnimPos = {148.3918,-1050.358,29.34637}, AnimHeading = 155.65719604492, robbed = false, failed = false },
	[18] = { pos = {150.9744,-1050.026,29.34639}, AnimPos = {150.1801,-1049.772,29.34639}, AnimHeading = 249.98104858398, robbed = false, failed = false },
	[19] = { pos = {149.7868,-1044.556,29.34628}, AnimPos = {149.6842,-1045.262,29.34628}, AnimHeading = 342.73184204102, robbed = false, failed = false },
	[20] = { pos = {151.5238,-1046.762,29.34632}, AnimPos = {150.7966,-1046.51,29.34632}, AnimHeading = 247.81353759766, robbed = false, failed = false },
	
	-- Fleeca Bank (Alta):
	[21] = { pos = {310.7052,-286.8021,54.14304}, AnimPos = {311.6111,-287.0925,54.14304}, AnimHeading = 68.989158630371, robbed = false, failed = false },
	[22] = { pos = {312.5067,-289.5924,54.14307}, AnimPos = {312.7517,-288.7129,54.14307}, AnimHeading = 159.08302307129, robbed = false, failed = false },
	[23] = { pos = {315.2691,-288.2983,54.1431}, AnimPos = {314.4778,-288.1304,54.1431}, AnimHeading = 253.56311035156, robbed = false, failed = false },
	[24] = { pos = {314.250,-282.9718,54.143}, AnimPos = {313.9552,-283.6234,54.143}, AnimHeading = 342.52990722656, robbed = false, failed = false },
	[25] = { pos = {315.8612,-285.0188,54.143}, AnimPos = {315.1184,-284.787,54.143}, AnimHeading = 248.85200500488, robbed = false, failed = false },
	
	-- Fleeca Bank (Burton):
	[26] = { pos = {-354.3059,-57.70284,49.0148}, AnimPos = {-353.4183,-57.87337,49.01482}, AnimHeading = 68.584251403809, robbed = false, failed = false },
	[27] = { pos = {-352.5196,-60.42201,49.01486}, AnimPos = {-352.1959,-59.51867,49.01486}, AnimHeading = 159.24656677246, robbed = false, failed = false },
	[28] = { pos = {-349.625,-59.11305,49.01488}, AnimPos = {-350.4966,-58.94504,49.01488}, AnimHeading = 254.33476257324, robbed = false, failed = false },
	[29] = { pos = {-350.7996,-53.70058,49.01478}, AnimPos = {-351.0674,-54.45698,49.01478}, AnimHeading = 344.00854492188, robbed = false, failed = false },
	[30] = { pos = {-349.2906,-55.90288,49.0148}, AnimPos = {-349.9846,-55.67392,49.0148}, AnimHeading = 247.43865966796, robbed = false, failed = false },
	
	-- Fleeca Bank (Rockford Hills):
	[31] = { pos = {-1209.453,-338.4711,37.75927}, AnimPos = {-1208.604,-338.0278,37.75927}, AnimHeading = 115.5665512085, robbed = false, failed = false },
	[32] = { pos = {-1206.101,-339.1532,37.7593}, AnimPos = {-1206.626,-338.3526,37.7593}, AnimHeading = 206.15647888184, robbed = false, failed = false },
	[33] = { pos = {-1205.041,-336.1968,37.75933}, AnimPos = {-1205.828,-336.7115,37.75933}, AnimHeading = 299.26043701172, robbed = false, failed = false },
	[34] = { pos = {-1209.892,-333.4096,37.75926}, AnimPos = {-1209.52,-333.9354,37.75926}, AnimHeading = 26.248168945312, robbed = false, failed = false },
	[35] = { pos = {-1207.252,-333.5498,37.75926}, AnimPos = {-1207.788,-333.9974,37.75926}, AnimHeading = 298.41012573242, robbed = false, failed = false },
	
	-- Pacific Standard Public Deposit Bank:
	[36] = { pos = {258.645,218.8373,101.6834}, AnimPos = {258.4535,218.0434,101.6834}, AnimHeading = 340.15432739258, robbed = false, failed = false },
	[37] = { pos = {260.9536,217.9817,101.6834}, AnimPos = {260.6777,217.1929,101.6834}, AnimHeading = 335.23226928711, robbed = false, failed = false },
	[38] = { pos = {256.9889,214.1322,101.6834}, AnimPos = {257.2587,214.9102,101.6834}, AnimHeading = 158.06999206543, robbed = false, failed = false },
	[39] = { pos = {259.2212,213.3388,101.6834}, AnimPos = {259.4739,214.1086,101.6834}, AnimHeading = 159.97286987305, robbed = false, failed = false },
	[40] = { pos = {263.3824,216.9818,101.6834}, AnimPos = {263.1836,216.3488,101.6834}, AnimHeading = 342.95043945312, robbed = false, failed = false },
	[41] = { pos = {265.2072,216.3506,101.6834}, AnimPos = {265.049,215.6598,101.6834}, AnimHeading = 344.45587158204, robbed = false, failed = false },
	[42] = { pos = {266.8224,214.623,101.6834}, AnimPos = {266.2266,214.8334,101.6834}, AnimHeading = 247.95391845704, robbed = false, failed = false },
	[43] = { pos = {265.9872,212.3818,101.6834}, AnimPos = {265.467,212.5886,101.6834}, AnimHeading = 253.22686767578, robbed = false, failed = false },
	[44] = { pos = {263.7534,211.7626,101.6834}, AnimPos = {263.988,212.3554,101.6834}, AnimHeading = 158.84526062012, robbed = false, failed = false },
	[45] = { pos = {261.5878,212.6732,101.6834}, AnimPos = {261.7706,213.2954,101.6834}, AnimHeading = 158.96224975586, robbed = false, failed = false },
}

-- Camera Interaction Buttons:
ConfigBankrob.CamLeft = 174	-- Arrow Left
ConfigBankrob.CamRight = 175	-- Arrow Right
ConfigBankrob.CamUp = 172		-- Arrow Up
ConfigBankrob.CamDown = 173	-- Arrow Down
ConfigBankrob.CamExit = 178	-- DEL

ConfigBankrob.Camera = {
	[1] = {pos = {153.15,-1042.05,29.37}, heading = 44.32, name = 'Fleeca Bank [Legion Square] Cam #1'},
	[2] = {pos = {143.1,-1042.76,29.37}, heading = 235.08, name = 'Fleeca Bank [Legion Square] Cam #2'},
	[3] = {pos = {149.73,-1051.26,29.35}, heading = 16.87, name = 'Fleeca Bank [Legion Square] Cam #3'},
	--
	[4] = {pos = {317.63,-280.51,54.16}, heading = 46.96, name = 'Fleeca Bank [Alta] Cam #1'},
	[5] = {pos = {307.43,-281.14,54.16}, heading = 229.91, name = 'Fleeca Bank [Alta] Cam #2'},
	[6] = {pos = {314.07,-289.63,54.14}, heading = 24.06, name = 'Fleeca Bank [Alta] Cam #3'},
	--
	[7] = {pos = {-347.51,-51.26,49.04}, heading = 44.82, name = 'Fleeca Bank [Burton] Cam #1'},
	[8] = {pos = {-357.61,-51.92,49.04}, heading = 230.92, name = 'Fleeca Bank [Burton] Cam #2'},
	[9] = {pos = {-350.91,-60.51,49.01}, heading = 28.09, name = 'Fleeca Bank [Burton] Cam #3'},
	--
	[10] = {pos = {-1209.33,-329.2,37.78}, heading = 83.18, name = 'Fleeca Bank [Rockford Hills] Cam #1'},
	[11] = {pos = {-1215.84,-336.86,37.78}, heading = 270.99, name = 'Fleeca Bank [Rockford Hills] Cam #2'},
	[12] = {pos = {-1205.0,-338.07,37.76}, heading = 66.41, name = 'Fleeca Bank [Rockford Hills] Cam #3'},
	--
	[13] = {pos = {1171.39,2706.91,38.09}, heading = 243.26, name = 'Fleeca Bank [Grand Senora Desert] Cam #1'},
	[14] = {pos = {1180.68,2710.88,38.09}, heading = 63.94, name = 'Fleeca Bank [Grand Senora Desert] Cam #2'},
	[15] = {pos = {1171.55,2716.84,38.07}, heading = 226.04, name = 'Fleeca Bank [Grand Senora Desert] Cam #3'},
	--
	[16] = {pos = {-2962.26,486.62,15.7}, heading = 158.82, name = 'Fleeca Bank [Great Ocean Highway] Cam #1'},
	[17] = {pos = {-2958.7,477.21,15.7}, heading = 341.95, name = 'Fleeca Bank [Great Ocean Highway] Cam #2'},
	[18] = {pos = {-2952.44,485.95,15.68}, heading = 134.42, name = 'Fleeca Bank [Great Ocean Highway] Cam #3'},
	--
	[19] = {pos = {-108.86,6461.75,31.63}, heading = 357.17, name = 'Blaine County Savings Bank Cam #1'},
	[20] = {pos = {-103.91,6466.68,31.63}, heading = 89.7, name = 'Blaine County Savings Bank Cam #2'},
	[21] = {pos = {-102.28,6468.39,31.63}, heading = 29.87, name = 'Blaine County Savings Bank Cam #3'},
	[22] = {pos = {-104.54,6479.56,31.63}, heading = 176.15, name = 'Blaine County Savings Bank Cam #4'},
	--
	[23] = {pos = {233.11,221.94,106.29}, heading = 207.24, name = 'Pacific Standard Bank Cam #1'},
	[24] = {pos = {241.76,214.98,106.29}, heading = 283.2, name = 'Pacific Standard Bank Cam #2'},
	[25] = {pos = {258.99,204.19,110.29}, heading = 320.66, name = 'Pacific Standard Bank Cam #3'},
	[26] = {pos = {252.48,229.25,106.29}, heading = 157.75, name = 'Pacific Standard Bank Cam #4'},
	[27] = {pos = {252.0,225.43,101.68}, heading = 271.93, name = 'Pacific Standard Bank Cam #5'},
	--
}