
Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x =  182.25828552246, y = -989.26470947266, z = 30.091928482056}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = 445.75109863281, y = -998.01141357422, z = 30.689334869385}




-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(176.89372253418,-991.19769287109,30.091924667358) },
	{ type = "cleaning", coords = vector3(180.8443145752,-992.43322753906,30.091924667358) },
	{ type = "cleaning", coords = vector3(184.12532043457,-991.93402099609,30.091924667358) },
	{ type = "cleaning", coords = vector3(188.35847473145,-990.32415771484,30.091926574707) },
	{ type = "cleaning", coords = vector3(177.88012695312,-992.31408691406,30.0919265747076) },
	{ type = "cleaning", coords = vector3(174.39834594727,-990.68676757812,30.091926574707) },
	{ type = "cleaning", coords = vector3(172.48815917969,-990.50012207031,30.091926574707) },
	{ type = "cleaning", coords = vector3(171.69451904297,-988.08209228516,30.091926574707) },
	{ type = "gardening", coords = vector3(172.65768432617,-995.56451416016,29.291736602783) },
	{ type = "gardening", coords = vector3(176.72611999512,-995.24090576172,29.291736602783) },
	{ type = "gardening", coords = vector3(180.34838867188,-996.75769042969,29.291736602783) },
	{ type = "gardening", coords = vector3(184.02500915527,-998.26519775391,29.291736602783) },
	{ type = "gardening", coords = vector3(188.85736083984,-1000.2845458984,29.291738510132) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 153, ['torso_2']  = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 11,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}

---
--ZIPTIES
---

local second = 1000
local minute = 60 * second

Config.EnableZiptieTimer = true
Config.ZiptieTimer       = 900000 -- 15 mins

---
--ATM
---

Config.ShowBlipsBANK = true
Config.OnlyBank = false
Config.Animation = false
Config.AnimationTime = 2500 -- Miliseconds

Config.Bank = {
    {id = 108, x = 150.266, y = -1040.203, z = 29.374},
    {id = 108, x = -1212.980, y = -330.841, z = 37.787},
    {id = 108, x = -2962.582, y = 482.627, z = 15.703},
    {id = 108, x = -112.202, y = 6469.295, z = 31.626},
    {id = 108, x = 314.187, y = -278.621, z = 54.170},
    {id = 108, x = -351.534, y = -49.529, z = 49.042},
    {id = 108, x = 241.727, y = 220.706, z = 106.286},
    {id = 108, x = 1175.0643310547, y = 2706.6435546875, z = 38.094036102295}
}
Config.ATM = {
    {id = 277, x = 1967.333, y = 3744.293, z = 32.272},
    {id = 277, x = 540.0420, y = 2671.007, z = 42.177},
    {id = 277, x = 2558.683, y = 349.6010, z = 108.050},
    {id = 277, x = 112.9290, y = -818.710, z = 31.386},
    {id = 277, x = -56.1935, y = -1752.53, z = 29.452},
    {id = 277, x = 314.187, y = -278.621, z = 54.170},
    {id = 277, x = 24.589, y = -946.056, z = 29.357},
    {id = 277, x = -1570.197, y = -546.651, z = 34.955},
   {id = 277, x = 33.232, y = -1347.849, z = 29.497},
   {id = 277, x = 129.216, y = -1292.347, z = 29.269},
   {id = 277, x = 287.645, y = -1282.646, z = 29.659},
    {id = 277, x = 289.012, y = -1256.545, z = 29.440},
   {id = 277, x = 295.839, y = -895.640, z = 29.217},
    {id = 277, x = 1686.753, y = 4815.809, z = 42.008},
    {id = 277, x = -302.408, y = -829.945, z = 32.417},
    {id = 277, x = -31.37, y = -1659.8, z = 29.48},
    {id = 277, x = 5.134, y = -919.949, z = 29.557},
    {id = 277, x = 1003.7, y = -2304.21, z = 35.32},
    {id = 277, x = 440.51, y = -975.66, z = 30.69}
}

---
-- RAD
---


Config.gsrUpdate                = 1 * 1000          -- Change first number only, how often a new shot is logged dont set this to low keep it above 1 min - raise if you experience performance issues (default: 1 min).
Config.waterClean               = true              -- Set to false if you dont want water to clean off GSR from people who shot
Config.waterCleanTime           = 30 * 1000         -- Change first number only, Set time in water needed to clean off GSR (default: 30 sec).
Config.gsrTime                  = 30 * 60           -- Change The first number only, if you want the GSR to be auto removed faster output is minutes (default: 30 min).
Config.gsrAutoRemove            = 10 * 60 * 1000    -- Change first number only, to set the auto clean up in minuets (default: 10 min).
Config.gsrUpdateStatus          = 5 * 60 * 1000     -- Change first number only, to change how often the client updates hasFired variable dont set it very high... 5-10 min should be fine. (default: 5 min).
Config.UseCharName				= true				-- This will show the suspects name in the PASSED or FAILED notification. Allows cop to make sure they checked the right person.

Config.weaponChecklist = {
		--Get models id here : https://pastebin.com/0wwDZgkF
		0x3656C8C1, -- stunGun
		0x678B81B1, -- nightStick
		0x84BD7BFD, -- crowBar
		0x60EC506, 	-- Fire Extinguisher
	}


---
--BOXER
---

MF_Boxer = {}
local MFB = MF_Boxer

MFB.Version = '1.0.11'

TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...)
  while not ESX do 
    TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj; end) 
    Citizen.Wait(0)
  end
end)

MFB.JobName = "boxer"
MFB.JobTitle = "Boxer"
MFB.ShowBlips = true

MFB.InteractDist = 1.0
MFB.DrawTextDist = 10.0
MFB.UsingSkelly = true

MFB.RingSideLoc = vector3(-34.99,-1230.97,30.06)
MFB.RingInLoc = vector3(-31.98,-1230.80,30.06)
MFB.PlayerRingLoc = vector3(-33.88,-1228.94,30.06)
MFB.OpponentRingLoc = vector3(-29.66,-1233.18,30.06)
MFB.OpponentSpawnLoc = vector3(-43.76,-1246.45,29.33)
MFB.DummyPos = vector3(-40.78,-1232.39,29.33)
MFB.OpponentModel = 'a_m_y_runner_01'

MFB.RewardTraining = true -- should we reward the player for completing training?
MFB.TrainingReward = 100 -- per opponent defeated

MFB.RoundTime = 0.5 -- minutes
MFB.RoundCount = 4 -- rounds : min recommended >= 2 else bugs
MFB.BreakTime = 10 -- seconds

MFB.Blips = {
  [1] = {
    pos = vector3(-33.46,-1222.09,29.33),
    sprite = 409,
    col = 1,
    title = 'Boxing Gym',
    job = "boxer",
  },
}

MFB.Markers = {
  [1] = {
    pos = vector3(-43.64,-1231.48,29.40),
    text = "Bas [~r~E~s~] Menüyü aç.",
    action = "Menu",
  },
  [2] = {
    pos = vector3(-37.9,-1231.26,29.33),
    text = "Bas [~r~E~s~] antreman için.",
    action = "Train",
  },
}

MFB.MaleOutfit = {["moles_2"]=0,[".*"]=-1,["lipstick_3"]=0,["chest_3"]=0,["arms_2"]=0,["bodyb_1"]=0,["watches_1"]=-1,["chain_2"]=0,["complexion_2"]=0,["arms"]=15,["bags_1"]=0,["lipstick_1"]=0,["makeup_4"]=0,["bproof_1"]=0,["skin"]=0,["chain_1"]=0,["makeup_2"]=0,["blush_2"]=0,["bodyb_2"]=0,["lipstick_4"]=0,["shoes_1"]=34,["face"]=0,["chest_1"]=0,["mask_2"]=0,["sun_1"]=0,["tshirt_2"]=0,["bracelets_1"]=-1,["watches_2"]=0,["bproof_2"]=0,["tshirt_1"]=15,["helmet_1"]=-1,["decals_1"]=0,["age_2"]=0,["lipstick_2"]=0,["blemishes_2"]=0,["makeup_1"]=0,["blemishes_1"]=0,["moles_1"]=0,["torso_1"]=91,["decals_2"]=0,["torso_2"]=0,["pants_1"]=16,["age_1"]=0,["blush_1"]=0,["helmet_2"]=0,["bracelets_2"]=0,["blush_3"]=0,["sex"]=0,["complexion_1"]=0,["bags_2"]=0,["chest_2"]=0,["pants_2"]=0,["shoes_2"]=0,["makeup_3"]=0,["sun_2"]=0,["mask_1"]=0}
--
--TRUCK
--

-- Police Settings:
Config.RequiredPoliceOnline = 4		-- required police online for players to do missions
Config.PoliceDatabaseName = "police"	-- set the exact name from your jobs database for police
Config.PoliceNotfiyEnabled = true		-- police notification upon truck robbery enabled (true) or disabled (false)
Config.PoliceBlipShow = true			-- enable or disable blip on map on police notify
Config.PoliceBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.PoliceBlipRadius = 50.0			-- set radius of the police notify blip
Config.PoliceBlipAlpha = 250			-- set alpha of the blip
Config.PoliceBlipColor = 5				-- set blip color

-- Set cooldown timer, which player has to wait before being able to do a mission again, in minutes here:
Config.CooldownTimer = 120

-- Enable or disable player wearing a 'heist money bag' after the robbery:
Config.EnablePlayerMoneyBag = true

-- Hacking Settings:
Config.EnableAnimationB4Hacking = true			-- enable/disable hacking or typing animation
Config.HackingBlocks = 2					-- amount of blocks u have to match
Config.HackingSeconds = 30						-- seconds to hack

-- Mission Cost Settings:
Config.MissionCost = 100		-- taken from bank account // set to 0 to disable mission cost

-- Reward Settings:
Config.MinReward = 250000						-- set minimum reward amount
Config.MaxReward = 320000						-- set maximum reward amount
Config.RewardInDirtyMoney = true			-- reward as dirty money (true) or as normal cash (false)
Config.EnableItemReward = false 				-- requires to add your desired items into your items table in database
Config.ItemName1 = "PutItemNameHere"				-- exact name of your item1
Config.ItemMinAmount1 = 50					-- set minimum reward amount of item1
Config.ItemMaxAmount1 = 300					-- set maximum reward amount of item1
Config.EnableRareItemReward = false			-- add another item as reward but this has only 25% chance 
Config.ItemName2 = "PutItemNameHere"				-- exact name of your item2
Config.ItemMinAmount2 = 1					-- set minimum reward amount of item2
Config.ItemMaxAmount2 = 3					-- set maximum reward amount of item2
Config.RandomChance = 2						-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.

-- Mission Blip Settings:
Config.EnableMapBlip = true							-- set between true/false
Config.BlipNameOnMap = "Armored Truck Mission"		-- set name of the blip
Config.BlipSprite = 67								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.7								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/

-- Armored Truck Blip Settings:
Config.BlipNameForTruck = "Armored Truck"			-- set name of the blip
Config.BlipSpriteTruck = 1							-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipColourTruck = 5							-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/
Config.BlipScaleTruck = 0.9							-- set blip scale/size on your map

-- Mission Start Location:
Config.MissionSpot = {
	{ ["x"] = 1275.55, ["y"] = -1710.4, ["z"] = 54.77, ["h"] = 0 },
}

-- Mission Marker Settings:
Config.MissionMarker = 27 												-- marker type
Config.MissionMarkerColor = { r = 240, g = 52, b = 52, a = 100 } 		-- rgba color of the marker
Config.MissionMarkerScale = { x = 1.25, y = 1.25, z = 1.25 }  			-- the scale for the marker on the x, y and z axis
Config.Draw3DText = "Press ~g~[E]~s~ for ~y~Mission~s~"					-- set your desired text here

-- Control Keys
Config.KeyToStartMission = 38	-- default: [E] // set key to start the mission
Config.KeyToOpenTruckDoor = 47
Config.KeyToRobFromTruck = 38										

-- ESX.ShowNotifications:
Config.NoMissionsAvailable = "No ~y~missions~s~ are currently available, please try again later!"
Config.HackingFailed = "You ~r~failed~s~ the hacking~s~"
Config.TruckMarkedOnMap = "~y~Armored Truck~s~ is marked on your map"
Config.KillTheGuards = "~r~Kill~s~ the guards in the ~y~Armored Truck~s~"
Config.MissionCompleted = "~g~Mission Completed:~s~ You successfully ~r~robbed~s~ the ~y~Armored Truck~s~"
Config.BeginToRobTruck = "Go to the ~y~Armored Truck~s~ and begin to rob"
Config.GuardsNotKilledYet = "Take out the ~b~driver~s~ and/or the ~b~passenger~s~ from the ~y~Armored Truck~s~"
Config.TruckIsNotStopped = "Stop the ~y~Armored Truck~s~ before ~r~robbing~s~!"
Config.NotEnoughMoney = "You need ~g~$"..Config.MissionCost.."~s~ on your ~b~bank-account~s~ to get a ~y~mission~s~"
Config.NotEnoughPolice = "To do ~y~missions~s~ there needs to be at least: ~b~"..Config.RequiredPoliceOnline.. " cops~s~ online!"
Config.CooldownMessage = "You can do another ~y~mission~s~ in: ~b~%s minutes~s~"
Config.RewardMessage = "You received ~g~$%s ~s~ from the ~y~Armored Truck~s~"
Config.Item1Message = "You received ~b~%sx~s~ Gold Watches from the ~y~Armored Truck~s~"
Config.Item2Message = "You received ~b~%sx~s~ Gold Bars from the ~y~Armored Truck~s~"
Config.DispatchMessage = "^3 10-90 ^0 on a Armored Truck at ^5%s^0"

-- ESX.ShowHelpNotifications:
Config.OpenTruckDoor = "Press ~INPUT_DETONATE~ to open the door"
Config.RobFromTruck = "Press ~INPUT_PICKUP~ to rob from the Truck"

-- ProgressBars text
Config.Progress1 = "RETRIEVING TRUCK INFO"
Config.Progress2 = "PLANTING C4"
Config.Progress3 = "TIME UNTIL DETONATION"
Config.Progress4 = "ROBBING THE TRUCK"

-- ProgressBar Timers, in seconds:
Config.RetrieveMissionTimer = 7.5	-- time from pressed E to receving location on the truck
Config.DetonateTimer = 10			-- time until bomb is detonated
Config.RobTruckTimer = 10			-- time spent to rob the truck

-- Guards Weapons:
Config.DriverWeapon = "WEAPON_PUMPSHOTGUN"		-- weapon for driver
Config.PassengerWeapon = "WEAPON_SMG" 			-- weapon for passenger

-- Armored Truck Spawn Locations
Config.ArmoredTruck = 
{
	{ 
		Location = vector3(-1327.479736328,-86.045326232910,49.31), 
		InUse = false
	},
	{ 
		Location = vector3(-2075.888183593,-233.73908996580,21.10), 
		InUse = false
	},
	{ 
		Location = vector3(-972.1781616210,-1530.9045410150,4.890), 
		InUse = false
	},
	{ 
		Location = vector3(798.184265136720,-1799.8173828125,29.33), 
		InUse = false
	},
	{ 
		Location = vector3(1247.0718994141,-344.65634155273,69.08), 
		InUse = false
	}
}

---
--HUMANE
-- -95.364471435547,6219.2119140625,31.025022506714

Config.NumberOfCopsRequiredHumane = 0

BanksHumane = {
	["humane_labs"] = {
		position = { ['x'] = 3536.17, ['y'] = 3660.11, ['z'] = 28.12 },
		reward = math.random(400000,900000),
		nameofbank = "Humane Labs",
		lastrobbed = 0
	},

	["butcher_labs"] = {
		position = { ['x'] = -95.364471435547, ['y'] = 6219.2119140625, ['z'] = 31.025022506714 },
		reward = math.random(400000,900000),
		nameofbank = "Humane Labs",
		lastrobbed = 0
	},
}


--
-- PACIFICC
--



---
--FUEL
---

-- Are you using ESX? Turn this to true if you would like fuel & jerry cans to cost something.
Config.UseESX = true

-- What should the price of jerry cans be?
Config.JerryCanCost = 100
Config.RefillCost = 2500 -- If it is missing half of it capacity, this amount will be divided in half, and so on.

-- Fuel decor - No need to change this, just leave it.
Config.FuelDecor = "_FUEL_LEVEL"

-- What keys are disabled while you're fueling.
Config.DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323}

-- Want to use the HUD? Turn this to true.
Config.EnableHUD = false

-- Configure blips here. Turn both to false to disable blips all together.
Config.ShowNearestGasStationOnly = true
Config.ShowAllGasStations = false

-- Modify the fuel-cost here, using a multiplier value. Setting the value to 2.0 would cause a doubled increase.
Config.CostMultiplier = 1.0

-- Configure the strings as you wish here.
Config.Strings = {
	ExitVehicle = "Exit the vehicle to refuel",
	EToRefuel = "Press ~g~E ~w~to refuel vehicle",
	JerryCanEmpty = "Jerry can is empty",
	FullTank = "Tank is full",
	PurchaseJerryCan = "Press ~g~E ~w~to purchase a jerry can for ~g~$" .. Config.JerryCanCost,
	CancelFuelingPump = "Press ~g~E ~w~to cancel the fueling",
	CancelFuelingJerryCan = "Press ~g~E ~w~to cancel the fueling",
	NotEnoughCash = "Not enough cash",
	RefillJerryCan = "Press ~g~E ~w~ to refill the jerry can for ",
	NotEnoughCashJerryCan = "Not enough cash to refill jerry can",
	JerryCanFull = "Jerry can is full",
	TotalCost = "Cost",
}

if not Config.UseESX then
	Config.Strings.PurchaseJerryCan = "Press ~g~E ~w~to grab a jerry can"
	Config.Strings.RefillJerryCan = "Press ~g~E ~w~ to refill the jerry can"
end

Config.PumpModels = {
	[-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

-- Blacklist certain vehicles. Use names or hashes. https://wiki.gtanet.work/index.php?title=Vehicle_Models
Config.Blacklist = {
	--"Adder",
	--276773164
}

-- Do you want the HUD removed from showing in blacklisted vehicles?
Config.RemoveHUDForBlacklistedVehicle = true

-- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
Config.Classes = {
	[0] = 1.0, -- Compacts
	[1] = 1.0, -- Sedans
	[2] = 1.0, -- SUVs
	[3] = 1.0, -- Coupes
	[4] = 1.0, -- Muscle
	[5] = 1.0, -- Sports Classics
	[6] = 1.0, -- Sports
	[7] = 1.0, -- Super
	[8] = 1.0, -- Motorcycles
	[9] = 1.0, -- Off-road
	[10] = 1.0, -- Industrial
	[11] = 1.0, -- Utility
	[12] = 1.0, -- Vans
	[13] = 0.0, -- Cycles
	[14] = 1.0, -- Boats
	[15] = 1.0, -- Helicopters
	[16] = 1.0, -- Planes
	[17] = 1.0, -- Service
	[18] = 1.0, -- Emergency
	[19] = 1.0, -- Military
	[20] = 1.0, -- Commercial
	[21] = 1.0, -- Trains
}

-- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
Config.FuelUsage = {
	[1.0] = 1.4,
	[0.9] = 1.2,
	[0.8] = 1.0,
	[0.7] = 0.9,
	[0.6] = 0.8,
	[0.5] = 0.7,
	[0.4] = 0.5,
	[0.3] = 0.4,
	[0.2] = 0.2,
	[0.1] = 0.1,
	[0.0] = 0.0,
}

Config.GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}


Config.RequiredCopsRobJEWEL1 = 0
Config.RequiredCopsSellJEWEL1 = 0

-- ,,

StoresJEWEL = { -- -16.764709472656,6481.6108398438,31.476449966431
	["jewelry"] = {
		position = { ['x'] =-16.764709472656, ['y'] = 6481.6108398438, ['z'] = 31.476449966431 },       
		reward = math.random(10,500),
		nameofstore = "jewelry",
		lastrobbed = 0
	}
}

--
--LICENSE
---

Config.MenuAlignLi = 'top-left'
Config.DrawDistanceLi = 100

Config.MarkerInfoli = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
Config.BlipLicenseShopli = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

Config.UseBlipsli = true -- true = Use License Shop Blips
Config.RequireDMVli = true -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.

Config.AdvancedVehicleShopli = true -- Set to true if using esx_advancedvehicleshop
Config.LicenseAircraftli = 250000
Config.LicenseBoatingli = 150000

Config.AdvancedWeaponShopli = false -- Set to true if using esx_advancedweaponshop
Config.LicenseMeleeli = 1
Config.LicenseHandgun = 10
Config.LicenseSMG = 100
Config.LicenseShotgun = 50
Config.LicenseAssault = 250
Config.LicenseLMG = 1000
Config.LicenseSniper = 1500

Config.DMVSchoolli = true -- Set to true if using esx_dmvschool
Config.SellDMVli = true -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
Config.LicenseCommercialli = 35000
Config.LicenseDriversli = 10000
Config.LicenseDriversPli = 20000
Config.LicenseMotocycleli = 28500

Config.Drugs = false -- Set to true if using esx_drugs
Config.LicenseWeed = 10000

Config.WeaponShop = false -- Set to true if using esx_weaponshop
Config.LicenseWeapon = 1000

Config.Zonesli = {
	LicenseShops = {
		Coords = {
			vector3(241.0, -1378.9, 32.7),
			vector3(438.68, -980.16, 29.69)
		}
	}
}


---
--jobs
----


Config.DrawDistanceJobs = 1000.0


Config.PlatesJobs = {
  taxi = "TAXI",
  fisherman = "FISH",
  police = "LSPD",
  ambulance = "EMS",
  mecano = "MECH",
  fueler = "FUEL",
  lumberjack = "BUCH",
  miner = "MINE",
  reporter = "JOUR",
  slaughterer = "ABAT",
  tailor = "COUT"
}

Config.Jobs = {}

Config.PublicZonesJobs = {
  EnterBuilding = {
    Pos   = { x = -118.21381378174, y = -607.14227294922, z = 35.280723571777 },
    Size  = {x = 3.0, y = 3.0, z = 0.2},
    Color = {r = 204, g = 204, b = 0},
    Marker= 1,
    Blip  = false,
    Name  = "San Andreas Times",
    Type  = "teleport",
    Hint  = "Press ~INPUT_PICKUP~ to enter the building.",
    Teleport = { x = -139.09838867188, y = -620.74865722656, z = 167.82052612305 }
  },

  ExitBuilding = {
    Pos   = { x = -139.45831298828, y = -617.32312011719, z = 167.82052612305 },
    Size  = {x = 3.0, y = 3.0, z = 0.2},
    Color = {r = 204, g = 204, b = 0},
    Marker= 1,
    Blip  = false,
    Name  = "San Andreas Times",
    Type  = "teleport",
    Hint  = "Press ~INPUT_PICKUP~ to go to the entrance of the building.",
    Teleport = { x = -113.07, y = -604.93, z = 35.28 },
  },
}

----
--Joblis
----

Config.DrawDistanceJli = 100.0
Config.ZoneSizeJli     = {x = 1.0, y = 1.0, z = 0.5}
Config.MarkerColorJli  = {r = 100, g = 100, b = 204}
Config.MarkerTypeJli   = 27


Config.ZonesJli = {  -- 1851.34375,3683.1677246094,34.267059326172 	vector3(-556.43432617188, -188.23449707031, 37.980075073242)
	vector3(1851.34375,3683.1677246094,34.267059326172 )
}


---
--TATTOO
--


Config.TextToOpenMenu = "Press ~g~E~w~ to get tattoo."
Config.TextGoBackIntoMenu = "< Go back"
--Config.KeyToOpenMenu = Keys["E"]
Config.MoneySymbol = "£"

----
---BARBER
----


Config.PriceBAR = 150

Config.DrawDistanceBAR = 100.0
Config.MarkerSizeBAR   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColorBAR  = {r = 102, g = 102, b = 204}
Config.MarkerTypeBAR   = 1


Config.ZonesBAR = {}

Config.ShopsBAR = {
  {x = -814.308,  y = -183.823,  z = 36.568},
  {x = 136.826,   y = -1708.373, z = 28.291},
  {x = -1282.604, y = -1116.757, z = 5.990},
  {x = 1931.513,  y = 3729.671,  z = 31.844},
  {x = 1212.840,  y = -472.921,  z = 62.208},
  {x = -32.885,   y = -152.319,  z = 56.076},
  {x = -278.077,  y = 6228.463,  z = 30.695},
}

for i=1, #Config.ShopsBAR, 1 do

	Config.ZonesBAR['Shop_' .. i] = {
	 	Pos   = Config.ShopsBAR[i],
	 	Size  = Config.MarkerSizeBAR,
	 	Color = Config.MarkerColorBAR,
	 	Type  = Config.MarkerTypeBAR
  }

end


---discammo


Config.EnableInventoryHUD = true
Config.ReloadTime = 2000 --ms

Config.Ammo = {
    {
        name = 'disc_ammo_pistol',
        weapons = {
            `WEAPON_PISTOL`,
            `WEAPON_APPISTOL`,
            `WEAPON_SNSPISTOL`,
            `WEAPON_COMBATPISTOL`,
            `WEAPON_HEAVYPISTOL`,
            `WEAPON_MACHINEPISTOL`,
            `WEAPON_MARKSMANPISTOL`,
            `WEAPON_PISTOL50`,
            `WEAPON_VINTAGEPISTOL`
        },
        count = 30
    },
    {
        name = 'disc_ammo_pistol_large',
        weapons = {
            `WEAPON_PISTOL`,
            `WEAPON_APPISTOL`,
			`WEAPON_SNSPISTOL`,
            `WEAPON_COMBATPISTOL`,
            `WEAPON_HEAVYPISTOL`,
            `WEAPON_MACHINEPISTOL`,
            `WEAPON_MARKSMANPISTOL`,
            `WEAPON_PISTOL50`,
            `WEAPON_VINTAGEPISTOL`
        },
        count = 60
    },
	{
        name = 'disc_ammo_shotgun',
        weapons = {
            `WEAPON_ASSAULTSHOTGUN`,
	    `WEAPON_AUTOSHOTGUN`,
            `WEAPON_BULLPUPSHOTGUN`,
	    `WEAPON_DBSHOTGUN`,
            `WEAPON_HEAVYSHOTGUN`,
            `WEAPON_PUMPSHOTGUN`,
            `WEAPON_SAWNOFFSHOTGUN`
        },
        count = 12
    },
	{
        name = 'disc_ammo_shotgun_large',
        weapons = {
            `WEAPON_ASSAULTSHOTGUN`,
	    `WEAPON_AUTOSHOTGUN`,
            `WEAPON_BULLPUPSHOTGUN`,
	    `WEAPON_DBSHOTGUN`,
            `WEAPON_HEAVYSHOTGUN`,
            `WEAPON_PUMPSHOTGUN`,
            `WEAPON_SAWNOFFSHOTGUN`
        },
        count = 18
    },
	{
        name = 'disc_ammo_smg',
        weapons = {
            `WEAPON_ASSAULTSMG`,
	    `WEAPON_MICROSMG`,
            `WEAPON_MINISMG`,
            `WEAPON_SMG`
        },
        count = 45
    },
	{
        name = 'disc_ammo_smg_large',
        weapons = {
            `WEAPON_ASSAULTSMG`,
	    `WEAPON_MICROSMG`,
            `WEAPON_MINISMG`,
            `WEAPON_SMG`
        },
        count = 65
    },
	{
        name = 'disc_ammo_rifle',
        weapons = {
            `WEAPON_ADVANCEDRIFLE`,
	    `WEAPON_ASSAULTRIFLE`,
            `WEAPON_BULLPUPRIFLE`,
            `WEAPON_CARBINERIFLE`,
	    `WEAPON_SPECIALCARBINE`,
	    `WEAPON_COMPACTRIFLE`
        },
        count = 45
    },
	{
        name = 'disc_ammo_rifle_large',
        weapons = {
            `WEAPON_ADVANCEDRIFLE`,
	    `WEAPON_ASSAULTRIFLE`,
            `WEAPON_BULLPUPRIFLE`,
            `WEAPON_CARBINERIFLE`,
	    `WEAPON_SPECIALCARBINE`,
	    `WEAPON_COMPACTRIFLE`
        },
        count = 65
    },
	{
        name = 'disc_ammo_snp',
        weapons = {
            `WEAPON_SNIPERRIFLE`,
	    `WEAPON_HEAVYSNIPER`,
            `WEAPON_MARKSMANRIFLE`
        },
        count = 10
    },
	{
        name = 'disc_ammo_snp_large',
        weapons = {
            `WEAPON_SNIPERRIFLE`,
	    `WEAPON_HEAVYSNIPER`,
            `WEAPON_MARKSMANRIFLE`
        },
        count = 15
    }
}

----= base disc

Config.DrawDistances = 30
Config.Draw3DDistance = 5


---------ACCC

Config.PriceAcce = 100

Config.EnableControlsAcce = true

Config.DrawDistanceAcce = 100.0
Config.SizeAcce   = {x = 1.5, y = 1.5, z = 1.0}
Config.ColorAcce  = {r = 102, g = 102, b = 204}
Config.TypeAcce   = 1

-- Fill this if you want to see the blips,
-- If you have esx_clothesshop you should not fill this
-- more than it's already filled.
Config.ShopsBlipsAcce = {
	Ears = {
		Pos = nil,
		Blip = nil
	},
	Mask = {
		Pos = { 
			vector3(-1338.1, -1278.2, 3.8),
		},
		Blip = {sprite = 362, color = 2}
	},
	Helmet = {
		Pos = nil,
		Blip = nil
	},
	Glasses = {
		Pos = nil,
		Blip = nil
	}
}

Config.ZonesAcce = {
	Ears = {
		Pos = {
			vector3(80.3, -1389.4, 28.4),
			vector3(-163.0, -302.0, 38.8),
			vector3(-163.0,-302.0, 38.8),
			vector3(420.7, -809.6, 28.6),
			vector3(-817.0, -1075.9, 10.4),
			vector3(-1451.3, -238.2, 48.9),
			vector3(-0.7, 6513.6, 30.9),
			vector3(123.4, -208.0, 53.6),
			vector3(1687.3, 4827.6, 41.1),
			vector3(622.8, 2749.2, 41.2),
			vector3(1200.0, 2705.4,	37.3),
			vector3(-1199.9, -782.5, 16.4),
			vector3(-3171.8, 1059.6, 19.9),
			vector3(-1095.6, 2709.2, 18.2),
		}},
	
	Mask = {
		Pos = {
			vector3(-1338.1, -1278.2, 3.8),
		}},
	
	Helmet = {
		Pos = {
			vector3(81.5, -1400.6, 28.4),
			vector3(-705.8, -159.0,	36.5),
			vector3(-161.3, -295.7,	38.8),
			vector3(419.3, -800.6, 28.6),
			vector3(-824.3, -1081.7, 10.4),
			vector3(-1454.8, -242.9, 48.9),
			vector3(4.7, 6520.9, 30.9),
			vector3(121.0, -223.2, 53.3),
			vector3(1689.6, 4818.8,	41.1),
			vector3(613.9, 2749.9, 41.2),
			vector3(1189.5, 2703.9,	37.3),
			vector3(-1204.0, -774.4, 16.4),
			vector3(-3164.2, 1054.7, 19.9),
			vector3(-1103.1, 2700.5, 18.2),
		}},
	
	Glasses = {
		Pos = {
			vector3(75.2, -1391.1, 28.4),
			vector3(-713.1, -160.1, 36.5),
			vector3(-156.1, -300.5,	38.8),
			vector3(425.4, -807.8, 28.6),
			vector3(-820.8, -1072.9, 10.4),
			vector3(-1458.0, -236.7, 48.9),
			vector3(3.5, 6511.5, 30.9),
			vector3(131.3, -212.3, 53.6),
			vector3(1694.9, 4820.8,	41.1),
			vector3(613.9, 2768.8, 41.2),
			vector3(1198.6, 2711.0, 37.3),
			vector3(-1188.2, -764.5, 16.4),
			vector3(-3173.1,  1038.2, 19.9),
			vector3(-1100.4, 2712.4, 18.2),
		}}
}
