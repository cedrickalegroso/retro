Config = {}
Config.Locale = "en"

Config.TextLog = {
    Use = true,
    Webhook = "https://discord.com/api/webhooks/811777491181371412/vxDx_fCYEpa8I7E5VmSg2rQ_JAO9wsRaJ56dfzLEveqUTXD7T2EKHx3A8o912PnvyRBP"
}

Config.HandcuffEvent = "esx_policejob:handcuff" -- SET HADNCUFF EVENT HERE TO LOCK INVENTORY WHEN CUFFED

Config.PowerHungry = true -- SET true IF YOU ARE SO POWER HUNGRY YOU DO NOT WANT PLAYERS TO CHOSE THEIR OWN INVENTORY KEYBIND

Config.Use = {
    -- SET ALL USE INFORMATION HERE:LICENSES(SHOULD THE SCRIPT USE THE LICENSE SYSTEM FOR ANY SHOPS), SOCIETIES(SHOULD THE SCRIPT USE THE SOCIETY SYSTEM FOR ANY SHOPS),
    -- FORCESEARCH(SHOULD THE SCRIPT ALLOW ANY PLAYER TO SEARCH ANY OTHER PLAYER THEY ARE IMMEDIATELY NEXT TO),
    -- ADMINSEARCH(POWERFUL ADMIN TOOL:SHOULD SCRIPT ALLOW PLAYERS WITH COMMAND ABILITIES TO SEARCH ANY INVENTORY USING ITS DATABASE ID OR IN THE CASE OF PLAYERS THEIR SERVER ID),
    -- NONNPCVEHICLES(SHOULD THE SCRIPT ALLOW CREATING AND USING INVENTORIES FOR VEHICLES THAT ARE NOT OWNED BY ANY PLAYER), CASHIN(SHOULD THE SCRIPT ALLOW CASH IN THE LISTED INVENTORIES?),
    -- ACCOUNTSIN(SHOULD THE SCRIPT ALLOW ACCOUNT MONEY IN THE INVENTORIES?)
    Licenses = true,
    Societies = false,
    ForceSearch = true,
    AdminSearch = true,
    NonNPCVehicles = true,
    CashIn = {
        trunk = true,
        gbox = true,
        property = true,
        stash = true,
        safe = true
    },
    AccountsIn = {
        trunk = true,
        gbox = true,
        property = true,
        stash = true,
        safe = true
    }
}

Config.MailboxOptions = {
    AllowTheft = false
}

Config.IncludeOptions = {
    -- SET ALL NON-ITEM INCLUDED OPTIONS HERE:CASH(INCLUDE PLAYER CASH IN THEIR INVENTORY? WILL ALWAYS SHOW CASH IN SECONDARY IF PRESENT), DIRTY(INCLUDE
    -- PLAYER BLACK_MONEY IN THEIR INVENTORY? WILL ALWAYS SHOW BLACK_MONEY IN SECONDARY IF PRESENT), WEAPONS(INCLUDE PLAYER WEAPONS IN THEIR INVENTORY? DOES NOT CREATE WEAPONS
    -- AS ITEMS, SIMPLY ADD THEM AS OPTIONS TO DROP/GIVE/PLACE IN SECONDARY INVENTORY. WILL ALWAYS SHOW WEAPONS IN SECONDARY IF PRESENT)
    Cash = true,
    Dirty = true,
    Weapons = true
}

Config.OpenKeyName = "comma" -- SET KEY MAPPED VALUE FOR OPEN INVENTORY COMMAND(PLAYERS CAN ADJUST THEIR OWN KEY MAP VALUE IN GAME)

Config.CurrencyIcon = " " -- SET CURRENCY ICON FOR NON HTML INSTANCES(NOTIFCATIONS MOSTLY)

-- List of item names that will close ui when used
Config.CloseUiItems = {
    "headbag",
    "fishingrod",
    "tunerlaptop",
    "binoculars",
    "cigar",
    "fixkit",
    "cocaine",
    "meth",
    "lowcalrounds",
    "shotcalrounds",
    "midcalrounds",
    "highcalrounds",
    "speccalrounds"
}

Config.Weight = {
    -- SET ALL WEIGHT INFORMATION HERE:ADDWEAPONSTOPLAYERWEIGHT(SHOULD THE SCRIPT ADD WEAPON WEIGHT TO THE PLAYER INVENTORY?), MAILBOXWEIGHT(WEIGHT FOR HOME MAILBOXES), STASHWEIGHT(WEIGHT FOR STASHES),
    -- DEFAULTWEIGHT(WEIGHT TO GIVE INVENTORY IF NO CUSTOM WEIGHT IS FOUND), WEAPONWEIGHTS(HOW MUCH DOES EACH WEAPON WEIGH?), VEHICLELIMITS(CLASSES(HOW MUCH WEIGHT SHOULD EACH VEHICLE CLASS HOLD IN THE GLOVEBOX AND TRUNK?),
    -- CUSTOMWEIGHT(CAR MODELS AND THEIR CUSTOM WEIGHT VALUES)), HOUSES(SHELLS(SHELL SPECIFIC WEIGHTS FOR HOUSING))
    AddWeaponsToPlayerWeight = false,
    MailboxWeight = 100,
    StashWeight = 5000,
    DefaultWeight = 500,
    ItemWeights = {
        ["lockpick"] = 3,
        ["illegalcashbank"] = 5,
        ["aluminum"] = 3,
        ["absinthe"] = 3,
        ["licenseplate"] = 3,
        ["lockpick"] = 3,
        ["sandwhich"] = 5,
        ["RetroID"] = 5,
        ["RetroWallet"] = 5,
        ["coke_pooch"] = 5,
        ["coke_pooch"] = 5,
        ["coke10g"] = 5,
        ["coke1g"] = 5,
        ["cokebrick"] = 5,
        ["cola"] = 5,
        ["vodka"] = 5,
        ["tequila"] = 5,
        ["hotdog"] = 5,
        ["handcuffs"] = 8,
        ["cuffs"] = 8,
        ["key"] = 4,
        ["rope"] = 3,
        ["gold"] = 15,
        ["fuel"] = 15,
        ["diamond"] = 15,
        ["iron"] = 10,
        ["copper"] = 10,
        ["turtle"] = 10,
        ["fish"] = 10,
        ["fishbait"] = 10,
        ["turtlebait"] = 10,
        ["fishingrod"] = 25,
        ["retro_drivecard"] = 4,
        ["retro_guncard"] = 4,
        ["retro_idcard"] = 4,
        ["retro_coin"] = 1,
        ["retro_car"] = 1,
        ["stress"] = 10,
        ["pepsibp"] = 8,
        ["hersheys"] = 4,
        ["retro_rwo"] = 1,
        ["hifi"] = 15,
        ["lighter"] = 5,
        ["taco"] = 8,
        ["rccola"] = 8,
        ["cupcake"] = 10,
        ["radio"] = 7,
        ["phone"] = 7,
        ["bread"] = 3,
        ["burger"] = 5,
        ["water"] = 3,
        ["bread"] = 3,
        ["armor"] = 75,
        ["armor2"] = 75,
        ["advancedlockpick"] = 10,
        ["airbag"] = 15,
        ["alive_chicken"] = 10,
        ["amphetamines"] = 6,
        ["amphetamines_pooch"] = 12,
        ["anti"] = 8,
        ["sciroppo"] = 8,
        ["antibiotico"] = 8,
        ["antibioticorosacea"] = 8,
        ["apple"] = 3,
        ["armbrace"] = 7,
        ["neckbrace"] = 7,
        ["legbrace"] = 7,
        ["bodybandage"] = 7,
        ["banana"] = 3,
        ["bandage"] = 6,
        ["bandage2"] = 5,
        ["BankDriller"] = 35,
        ["bankid"] = 5,
        ["bankidcard"] = 5,
        ["battery"] = 15,
        ["beer"] = 6,
        ["binoculars"] = 7,
        ["blowpipe"] = 7,
        ["blue_phone"] = 5,
        ["bluray"] = 15,
        ["bodybandage"] = 7,
        ["book"] = 5,
        ["boomdlugie"] = 10,
        ["camera"] = 15,
        ["camp"] = 50,
        ["cannabinoid"] = 50,
        ["cannabis"] = 10,
        ["cardriri"] = 10,
        ["cashregbypass"] = 5,
        ["casio"] = 5,
        ["cburger"] = 3,
        ["champagne"] = 5,
        ["chips"] = 3,
        ["chocolate"] = 3,
        ["cigarette"] = 3,
        ["cigarett"] = 3,
        ["drill"] = 10,
        ["drugbags"] = 3,
        ["drugItem"] = 3,
        ["essence"] = 20,
        ["disc_ammo_pistol"] = 15,
        ["disc_ammo_pistol_large"] = 25,
        ["disc_ammo_rifle"] = 15,
        ["disc_ammo_rifle_large"] = 25,
        ["disc_ammo_shotgun"] = 15,
        ["disc_ammo_shotgun_large"] = 25,
        ["disc_ammo_smg"] = 15,
        ["disc_ammo_smg_large"] = 25,
        ["disc_ammo_snp"] = 15,
        ["disc_ammo_snp_large"] = 25,
        ["repairkit"] = 30,
        ["fixkit"] = 30,
        ["firstaid"] = 15,
        ["firstaidkit"] = 15,
        ["carokit"] = 25,
        ["hackerDevice"] = 25,
        ["carokit"] = 50,
        ["medikit"] = 30,
        ["hydrocodone"] = 15,
        ["jewels"] = 5,
        ["joint2g"] = 5,
        ["kastetbalas"] = 5,
        ["kastetdiament"] = 5,
        ["kastetdollar"] = 5,
        ["kastethate"] = 5,
        ["kastetpimp"] = 5,
        ["kastetpink"] = 5,
        ["kastetplayer"] = 5,
        ["kastetvagos"] = 5,
        ["ketamine"] = 5,
        ["ketamine_pooch"] = 5,
        ["kompensator"] = 5,
        ["laptop"] = 5,
        ["marijuana"] = 5,
        ["marijuana_pooch"] = 5,
        ["keys"] = 5,
        ["meth"] = 5,
        ["meth10g"] = 5,
        ["meth1g"] = 5,
        ["methbrick"] = 5,
        ["methburn"] = 5,
        ["meth_packaged"] = 5,
        ["meth_pooch"] = 5,
        ["meth_raw"] = 5,
        ["milk"] = 5,
        ["mleko"] = 5,
        ["zlom"] = 30,
        ["ziptie"] = 3,
        ["zetony"] = 5,
        ["zebradlugie"] = 8,
        ["yusuf"] = 8,
        ["yakult"] = 3,
        ["xbox"] = 15,
        ["wool"] = 15,
        ["woodheavyp"] = 8,
        ["wooddlugie"] = 8,
        ["opium"] = 5,
        ["opium_pooch"] = 25,
        ["weed"] = 5,
        ["weed_packaged"] = 15,
        ["weed_pooch"] = 25,
        ["wood"] = 5,
        ["vicodin"] = 12,
        ["vehgps"] = 15,
        ["vape"] = 15,
        ["turtlebait"] = 15,
        ["Suppressor"] = 15,
        ["grip"] = 15,
        ["pfizer"] = 5,
        ["battery"] = 8,
        ["muffler"] = 10,
        ["hood"] = 25,
        ["trunk"] = 25,
        ["doors"] = 25,
        ["engine"] = 20,
        ["waterpump"] = 12,
        ["oilpump"] = 13,
        ["speakers"] = 15,
        ["rims"] = 15,
        ["subwoofer"] = 8,
        ["moneda"] = 8,
        ["morphine"] = 8,
        ["nitro"] = 5,
        ["nswitch"] = 5,
        ["opona"] = 5,
        ["oxy"] = 5,
        ["orange"] = 5,
        ["apple"] = 5,
        ["grapes"] = 5,
        ["banana"] = 5,
        ["slaughtered_chicken"] = 10,
        ["packaged_banana"] = 10,
        ["packaged_apple"] = 10,
        ["packaged_grapes"] = 10,
        ["packaged_orange"] = 10,
        ["packaged_chicken"] = 10,
        ["packaged_plank"] = 10,
        ["powiekszonymagazynek"] = 10,
        ["VaultDoorBypass"] = 25,
        ["VaultDoorBypass1"] = 25,
        ["VaultDoorBypass2"] = 25,
        ["VaultDoorCrowBar"] = 25,
        ["washed_stone"] = 15,
        ["10ct_gold_chain"] = 75,
        ["2ct_gold_chain"] = 75,
        ["5ct_gold_chain"] = 75,
        ["8ct_gold_chain"] = 75,
        ["adrenaline"] = 10,
        ["WEAPON_KNIFE"] = 5,
        ["WEAPON_PISTOL"] = 10,
        ["WEAPON_STUNGUN"] = 6,
        ["WEAPON_FLAREGUN"] = 8,
        ["WEAPON_PISTOL_MK2"] = 15,
        ["WEAPON_COMBATPISTOL"] = 8,
        ["WEAPON_HEAVYPISTOL"] = 25,
        ["WEAPON_VINTAGEPISTOL"] = 20,
        ["WEAPON_MARKSMANPISTOL"] = 25,
        ["WEAPON_DOUBLEACTION"] = 30,
        ["WEAPON_MICROSMG"] = 20,
        ["WEAPON_MACHINEPISTOL"] = 15,
        ["WEAPON_MINISMG"] = 15,
        ["WEAPON_APPISTOL"] = 15,
        ["WEAPON_PISTOL50"] = 25,
        ["WEAPON_REVOLVER"] = 30,
        ["WEAPON_REVOLVER_MK2"] = 20,
        ["WEAPON_COMBATPDW"] = 25,
        ["WEAPON_SMG"] = 20,
        ["WEAPON_SMG_MK2"] = 25,
        ["WEAPON_ASSAULTSMG"] = 25,
        ["WEAPON_CARBINERIFLE"] = 35,
        ["WEAPON_GUSENBERG"] = 35,
        ["WEAPON_SPECIALCARBINE"] = 35,
        ["WEAPON_BULLPUPRIFLE"] = 35,
        ["WEAPON_COMPACTRIFLE"] = 35,
        ["WEAPON_DBSHOTGUN"] = 25,
        ["WEAPON_MUSKET"] = 45,
        ["WEAPON_ASSAULTRIFLE"] = 25,
        ["WEAPON_ASSAULTRIFLE_MK2"] = 35,
        ["WEAPON_CARBINERIFLE_MK2"] = 35,
        ["WEAPON_ADVANCEDRIFLE"] = 20,
        ["WEAPON_SPECIALCARBINE_MK2"] = 35,
        ["WEAPON_BULLPUPRIFLE_MK2"] = 35,
        ["WEAPON_PUMPSHOTGUN"] = 20,
        ["WEAPON_PETROL"] = 20,
        ["WEAPON_PETROLCAN"] = 20,
        ["WEAPON_SAWNOFFSHOTGUN"] = 25,
        ["WEAPON_COMBATMG_MK2"] = 35,
        ["WEAPON_PUMPSHOTGUN_MK2"] = 35,
        ["WEAPON_BULLPUPSHOTGUN"] = 20,
        ["WEAPON_AUTOSHOTGUN"] = 25,
        ["WEAPON_ASSAULTSHOTGUN"] = 25,
        ["WEAPON_HEAVYSHOTGUN"] = 50,
        ["WEAPON_MARKSMANRIFLE"] = 50,
        ["WEAPON_MARKSMANRIFLE_MK2"] = 75,
        ["WEAPON_SNIPERRIFLE"] = 50,
        ["WEAPON_HEAVYSNIPER"] = 75,
        ["WEAPON_HEAVYSNIPER_MK2"] = 75,
        ["WEAPON_MOLOTOV"] = 6,
        ["WEAPON_SMOKEGRENADE"] = 6
    },
    WeaponWeights = {
        ["WEAPON_KNIFE"] = 24,
        ["WEAPON_STUNGUN"] = 2,
        ["WEAPON_FLAREGUN"] = 2,
        ["WEAPON_SNSPISTOL"] = 2,
        ["WEAPON_SNSPISTOL_MK2"] = 2,
        ["WEAPON_PISTOL"] = 2,
        ["WEAPON_PISTOL_MK2"] = 2,
        ["WEAPON_COMBATPISTOL"] = 2,
        ["WEAPON_HEAVYPISTOL"] = 2,
        ["WEAPON_VINTAGEPISTOL"] = 2,
        ["WEAPON_MARKSMANPISTOL"] = 2,
        ["WEAPON_DOUBLEACTION"] = 2,
        ["WEAPON_MICROSMG"] = 2,
        ["WEAPON_MACHINEPISTOL"] = 2,
        ["WEAPON_MINISMG"] = 2,
        ["WEAPON_APPISTOL"] = 2,
        ["WEAPON_PISTOL50"] = 2,
        ["WEAPON_REVOLVER"] = 2,
        ["WEAPON_REVOLVER_MK2"] = 2,
        ["WEAPON_COMBATPDW"] = 2,
        ["WEAPON_SMG"] = 2,
        ["WEAPON_SMG_MK2"] = 2,
        ["WEAPON_ASSAULTSMG"] = 2,
        ["WEAPON_CARBINERIFLE"] = 2,
        ["WEAPON_GUSENBERG"] = 2,
        ["WEAPON_SPECIALCARBINE"] = 2,
        ["WEAPON_BULLPUPRIFLE"] = 2,
        ["WEAPON_COMPACTRIFLE"] = 2,
        ["WEAPON_DBSHOTGUN"] = 2,
        ["WEAPON_MUSKET"] = 2,
        ["WEAPON_MG"] = 2,
        ["WEAPON_COMBATMG"] = 2,
        ["WEAPON_ASSAULTRIFLE"] = 2,
        ["WEAPON_ASSAULTRIFLE_MK2"] = 2,
        ["WEAPON_CARBINERIFLE_MK2"] = 2,
        ["WEAPON_ADVANCEDRIFLE"] = 2,
        ["WEAPON_SPECIALCARBINE_MK2"] = 2,
        ["WEAPON_BULLPUPRIFLE_MK2"] = 2,
        ["WEAPON_PUMPSHOTGUN"] = 2,
        ["WEAPON_SAWNOFFSHOTGUN"] = 2,
        ["WEAPON_COMBATMG_MK2"] = 2,
        ["WEAPON_PUMPSHOTGUN_MK2"] = 2,
        ["WEAPON_BULLPUPSHOTGUN"] = 2,
        ["WEAPON_AUTOSHOTGUN"] = 2,
        ["WEAPON_GRENADELAUNCHER"] = 2,
        ["WEAPON_COMPACTLAUNCHER"] = 2,
        ["WEAPON_ASSAULTSHOTGUN"] = 2,
        ["WEAPON_HEAVYSHOTGUN"] = 2,
        ["WEAPON_MARKSMANRIFLE"] = 2,
        ["WEAPON_MARKSMANRIFLE_MK2"] = 2,
        ["WEAPON_SNIPERRIFLE"] = 2,
        ["WEAPON_MINIGUN"] = 2,
        ["WEAPON_HEAVYSNIPER"] = 2,
        ["WEAPON_HEAVYSNIPER_MK2"] = 2,
        ["WEAPON_FIREWORK"] = 2,
        ["WEAPON_RPG"] = 2,
        ["WEAPON_HOMINGLAUNCHER"] = 2,
        ["WEAPON_RAILGUN"] = 2
    },
    VehicleLimits = {
        -- FOR VEHICLE CLASSES WITHOUT TRUNKS, GLOVEBOX IS WEIGHTED AS AN INTERIOR(BOATS/HELICOPTERS/CYCLES/TRAINS)
        Classes = {
            [0] = {["gbox"] = 30, ["trunk"] = 200}, -- COMPACTS
            [1] = {["gbox"] = 30, ["trunk"] = 200}, -- SEDANS
            [2] = {["gbox"] = 60, ["trunk"] = 200}, -- SUVS
            [3] = {["gbox"] = 30, ["trunk"] = 250}, -- COUPES
            [4] = {["gbox"] = 30, ["trunk"] = 400}, -- MUSCLES
            [5] = {["gbox"] = 20, ["trunk"] = 200}, -- SPORTS CLASSICS
            [6] = {["gbox"] = 20, ["trunk"] = 200}, -- SPORTS
            [7] = {["gbox"] = 20, ["trunk"] = 250}, -- SUPERS
            [8] = {["gbox"] = 20, ["trunk"] = 30}, -- MOTORCYCLES
            [9] = {["gbox"] = 30, ["trunk"] = 400}, -- OFF-ROAD
            [10] = {["gbox"] = 30, ["trunk"] = 800}, -- INDUSTRIAL
            [11] = {["gbox"] = 30, ["trunk"] = 6000}, -- UTILITY
            [12] = {["gbox"] = 30, ["trunk"] = 1600}, -- VANS
            [13] = {["gbox"] = 5, ["trunk"] = 0}, -- BICYCLES
            [14] = {["gbox"] = 10000, ["trunk"] = 10000}, -- BOATS
            [15] = {["gbox"] = 100, ["trunk"] = 0}, -- HELICOPTERS
            [16] = {["gbox"] = 100, ["trunk"] = 0}, -- PLANES
            [17] = {["gbox"] = 30, ["trunk"] = 200}, -- SERVICE
            [18] = {["gbox"] = 30, ["trunk"] = 200}, -- EMERGENCY
            [19] = {["gbox"] = 30, ["trunk"] = 200}, -- MILITARY
            [20] = {["gbox"] = 60, ["trunk"] = 400}, -- COMMERCIAL
            [21] = {["gbox"] = 3000, ["trunk"] = 0} -- TRAINS
        },
        CustomWeight = {
            ["zentorno"] = {["gbox"] = 15, ["trunk"] = 50}
        }
    },
    Houses = {
        Shells = {
            playerhouse_tier1 = 5000,
            shell_frankaunt = 5000,
            shell_medium2 = 5000,
            shell_medium3 = 5000,
            breze_shell_01 = 5000,
            breze_shell_02 = 5000,
            breze_shell_03 = 5000,
            shell_office1 = 50000,
            Office1 = 50000,
            shell_office2 = 50000,
            Office2 = 50000,
            shell_officebig = 50000,
            OfficeBig = 50000,
            shell_coke1 = 25000,
            CokeShell1 = 25000,
            shell_coke2 = 25000,
            CokeShell2 = 25000,
            shell_meth = 25000,
            MethShell = 25000,
            shell_weed = 25000,
            WeedShell1 = 25000,
            shell_weed2 = 25000,
            WeedShell2 = 25000,
            shell_garages = 15000,
            GarageShell1 = 15000,
            shell_garagem = 15000,
            GarageShell2 = 15000,
            shell_garagel = 15000,
            GarageShell3 = 15000,
            shell_apartment1 = 15000,
            NewApt1 = 15000,
            shell_apartment2 = 15000,
            NewApt2 = 15000,
            shell_apartment3 = 15000,
            NewApt3 = 15000,
            shell_warehouse1 = 500000,
            Warehouse1 = 500000,
            shell_warehouse2 = 500000,
            Warehouse2 = 500000,
            shell_warehouse3 = 500000,
            Warehouse3 = 500000,
            shell_v16low = 5000,
            HotelV2 = 5000,
            shell_trailer = 5000,
            Trailer = 5000,
            shell_trevor = 5000,
            Trevor = 5000,
            shell_v16mid = 10000,
            ApartmentV2 = 10000,
            shell_lester = 5000,
            Lester = 5000,
            shell_ranch = 15000,
            Ranch = 15000,
            shell_highend = 15000,
            HighEndV1 = 15000,
            shell_highendv2 = 15000,
            HighEndV2 = 15000,
            shell_michael = 10000,
            Michaels = 10000
        }
    }
}

for k, v in pairs(Config.Weight.VehicleLimits.CustomWeight) do
    Config.Weight.VehicleLimits.CustomWeight[GetHashKey(k)] = v
    Config.Weight.VehicleLimits.CustomWeight[k] = nil
end

Config.Shops = {
    -- SET ALL SHOP INFORMATION HERE: TABLE NAME IS STORE NAME, TYPE(TYPE OF SHOP, 'purchase', 'sell', 'mix' AVAILABLE, CHOOSE WHAT THE PLAYER CAN DO AT THAT SHOP),
    -- ACCOUNT(PLAYER ACCOUNT TO GIVE/TAKE MONEY FROM), LOCATIONS(SHOP LOCATIONS), SOCIETY(SET SOCIETY NAME TO PAY TO/FROM, SET false IF NO SOCIETY IS USED),
    -- BUYBACK(SET VALUE FROM 0.0-1.0, AMOUNT OF ITEM PRICE GIVEN WHEN SELLING TO SHOP), ITEMS(ITEMS SHOP CAN SELL/BUY),
    -- MARKERS(USE MARKERS?, WHAT SHAPE?, HOW FAR?, SHOW NAME?, WHAT COLOR?), BLIPS(USE BLIPS?, WHAT PICTURE?, WHAT COLOR?, HOW BIG?, WHERE TO DISPLAY?)
    ["24/7 Convenience"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(373.875, 325.896, 102.566),
                vector3(2557.458, 382.282, 107.622),
                vector3(-3038.939, 585.954, 6.908),
                vector3(-3241.927, 1001.462, 11.830),
                vector3(547.431, 2671.710, 41.156),
                vector3(1961.464, 3740.672, 31.343),
                vector3(2678.916, 3280.671, 54.241),
                vector3(1729.216, 6414.131, 34.037),
                vector3(-48.519, -1757.514, 28.421),
                vector3(1163.373, -323.801, 68.205),
                vector3(-707.501, -914.260, 18.215),
                vector3(-1820.523, 792.518, 137.118),
                vector3(1698.388, 4924.404, 41.063),
                vector3(25.723, -1346.966, 28.497)
            },
            Boss = {
                vector3(372.875, 322.896, 102.566)
            }
        },
        Weapons = {
            {name = "WEAPON_BAT", label = "Baton ni mayor", price = 20},
            {name = "WEAPON_KNIFE", label = "Knife", price = 120}
        },
        Items = {
            {name = "bread", price = 5},
            {name = "water", price = 10},
            {name = "lighter", price = 15},
            {name = "chips", price = 25},
       --     {name = "fishbait", price =  },
        --    {name = "turtlebait", price = },
            {name = "pepsibp", price = 45 },
            {name = "rccola", price = 35},
            {name = "yakult", price = 20},
            {name = "cupcake", price = 25 },
            {name = "burger", price = 35 },
            {name = "hersheys", price = 60 },
            {name = "hotdog", price = 55 },
            {name = "taco", price = 65 }
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["ID Center"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(441.27276611328,-981.88763427734,29.689502716064),
			--	vector3(3807.9057617188,4478.6000976562,5.3653311729431),
            },
            Boss = {
            --    vector3(372.875, 322.896, 102.566)
            }
        },
        Items = {
            {name = "retro_drivecard", price = 750},
            {name = "retro_guncard", price = 750},
            {name = "retro_idcard", price = 750},
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
	["Dark PawnShop"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(412.43139648438,314.63217163086,103.02115631104),
				vector3(-167.22891235352,6387.5268554688,31.869262695312),
            },
            Boss = {
            --    vector3(372.875, 322.896, 102.566)
            }
        },
        Items = {
            {name = "shovel", price = 650},
			{name = "lockpick", price = 10},
			{name = "cashregbypass", price = 450},
			{name = "VaultDoorBypass", price = 500},
            {name = "VaultDoorBypass1", price = 500},
            {name = "VaultDoorBypass2", price = 500},
            {name = "VaultDoorCrowBar", price = 500},
			{name = "illegalcashbank", price = 2500},
            {name = "armor", price = 5000}
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },

	["Isdaan ni Ryster"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(-3420.255859375,954.62121582031,7.3466892242432),
				vector3(3807.9057617188,4478.6000976562,5.3653311729431),
                vector3(-273.85180664062,6625.3037109375,7.5344929695129),
                
            },
            Boss = {
            --    vector3(372.875, 322.896, 102.566)
            }
        },
        Items = {
            {name = "fishbait", price = 50},
            {name = "turtlebait", price = 55},
            {name = "fishingrod", price = 150},
			{name = "bread", price = 35},
			{name = "water", price = 45},
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["Black Market"] = {
        Type = "purchase",
        Account = "black_money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(-281.13446044922, 6405.59375, 29.389196395874)
            },
            Boss = {
              --  vector3(372.875, 322.896, 102.566)
            }
        },
        Weapons = {
            {name = "WEAPON_BAT", label = "Baton ni mayor", price = 20},
            {name = "WEAPON_KNIFE", label = "Knife", price = 120},
			{name = "WEAPON_COMPACTRIFLE", label = "Compact Rifle", price = 50000},
			{name = "WEAPON_MINISMG", label = "Mini SMG", price = 12500},
			{name = "WEAPON_ASSAULTRIFLE", label = "Assault Rifle", price = 50000},
			{name = "WEAPON_PUMPSHOTGUN", label = "Pump Shotgun", price = 7500},
			{name = "WEAPON_SAWNOFFSHOTGUN", label = "Sawnoff Shotgun", price = 7500},
			{name = "WEAPON_MOLOTOV", label = "Molotov", price = 2500},
			{name = "WEAPON_ASSAULTSMG", label = "Assault SMG", price = 15000},
			{name = "WEAPON_FLASHLIGHT", label = "Flashlight", price = 500},
        },
        Items = {
			{name = "disc_ammo_pistol_large", price = 2500},
            {name = "disc_ammo_rifle_large", price = 5500},
            {name = "disc_ammo_shotgun_large", price = 4500},
            {name = "disc_ammo_smg_large", price = 3500},
			{name = "shovel", price = 650},
			{name = "lockpick", price = 10},
			{name = "cashregbypass", price = 450},
			{name = "VaultDoorBypass", price = 500},
            {name = "VaultDoorBypass1", price = 500},
            {name = "VaultDoorBypass2", price = 500},
            {name = "VaultDoorCrowBar", price = 500},
			{name = "illegalcashbank", price = 2500},
            {name = "armor", price = 5000}
		},
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = false,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["Electronic Shop"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(-656.91772460938, -857.21081542969, 23.490005493164)
            },
            Boss = {
                vector3(1134.808, -983.281, 45.415)
                -- vector3(-1222.915, -906.983,  11.326),
                -- vector3(-1487.553, -379.107,  39.163),
                -- vector3(-2968.243, 390.910,   14.043),
                -- vector3(1166.024,  2708.930,  37.157),
                -- vector3(1392.562,  3604.684,  33.980),
                -- vector3(-1393.409, -606.624,  29.319)
            }
        },
        Items = {
			{name = "hifi", price = 1500},
            {name = "radio", price = 750},
            {name = "phone", price = 2500},
			{name = "vape", price = 1000},
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 459,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["Robs Liquour"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(1135.808, -982.281, 45.415),
                vector3(-1222.915, -906.983, 11.326),
                vector3(-1487.553, -379.107, 39.163),
                vector3(-2968.243, 390.910, 14.043),
                vector3(1166.024, 2708.930, 37.157),
                vector3(1392.562, 3604.684, 33.980),
                vector3(-1393.409, -606.624, 29.319)
            },
            Boss = {
                vector3(1134.808, -983.281, 45.415)
                -- vector3(-1222.915, -906.983,  11.326),
                -- vector3(-1487.553, -379.107,  39.163),
                -- vector3(-2968.243, 390.910,   14.043),
                -- vector3(1166.024,  2708.930,  37.157),
                -- vector3(1392.562,  3604.684,  33.980),
                -- vector3(-1393.409, -606.624,  29.319)
            }
        },
        Items = {
            {name = "beer", price = 75},
            {name = "wine", price = 250},
            {name = "vodka", price = 500},
            {name = "tequila", price = 750},
            {name = "whisky", price = 75},
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 93,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["You Tool"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
              --  vector3(2748.0, 3473.0, 55.68)
            },
            Boss = {
            --    vector3(2747.0, 3474.0, 55.68)
            }
        },
        Items = {
            {name = "drill"},
            {name = "binocular"},
            {name = "fixkit"},
            {name = "gps"},
            {name = "lockpick"},
            {name = "scubagear"},
            {name = "blowtorch"},
            {name = "1gbag"},
            {name = "5gbag"},
            {name = "50gbag"},
            {name = "100gbag"},
            {name = "lowgradefert"},
            {name = "highgradefert"},
            {name = "plantpot"},
            {name = "drugscales"}
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 15,
            UseText = true,
            RGB = vector3(0, 255, 0)
        },
        Blips = {
            Use = true,
            Sprite = 402,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["Bolinkbroke Penitentiary"] = {
        Type = "purchase",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(1728.41, 2584.31, 45.84)
            },
            Boss = {
                vector3(1727.41, 2583.31, 45.84)
            }
        },
        Items = {
            {name = "bread"},
            {name = "water"},
            {name = "cigarette"},
            {name = "lighter"},
            {name = "sandwich"},
            {name = "chips"}
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 15,
            UseText = true,
            RGB = vector3(0, 255, 0)
        },
        Blips = {
            Use = true,
            Sprite = 52,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    },
    ["Ammunation"] = {
        Type = "purchase",
        NeedsLicense = "weapon",
        Account = "money",
        Society = {
            Name = false,
            OnlySociety = false,
            Options = {
                withdraw = true,
                deposit = true,
                wash = false,
                employess = true,
                grades = true
            }
        },
        BuyBack = 0.5,
        Locations = {
            Store = {
                vector3(-662.180, -934.961, 20.829),
                vector3(810.25, -2157.60, 28.62),
                vector3(1693.44, 3760.16, 33.71),
                vector3(-330.24, 6083.88, 30.45),
                vector3(252.63, -50.00, 68.94),
                vector3(22.09, -1107.28, 28.80),
                vector3(2567.69, 294.38, 107.73),
                vector3(-1117.58, 2698.61, 17.55),
                vector3(842.44, -1033.42, 27.19)
            },
            Boss = {
                vector3(-663.180, -933.961, 20.829)
                -- vector3(810.25, -2157.60, 28.62),
                -- vector3(1693.44, 3760.16, 33.71),
                -- vector3(-330.24, 6083.88, 30.45),
                -- vector3(252.63, -50.00, 68.94),
                -- vector3(22.09, -1107.28, 28.80),
                -- vector3(2567.69, 294.38, 107.73),
                -- vector3(-1117.58, 2698.61, 17.55),
                -- vector3(842.44, -1033.42, 27.19),
            }
        },
        Weapons = {
            {name = "WEAPON_FLASHLIGHT", label = "Flashlight", price = 20},
       --     {name = "WEAPON_STUNGUN", label = "Tazer", price = 120},
            {name = "WEAPON_KNIFE", label = "Knife", price = 60},
            {name = "WEAPON_BAT", label = "Baseball Bat", price = 20},
            {name = "WEAPON_PISTOL", label = "9mm Pistol", price = 200},
        --    {name = "WEAPON_PUMPSHOTGUN", label = "Pump-Shotgun", price = 600}
        },
        Items = {
            {name = "disc_ammo_pistol", price = 1000},
       --     {name = "disc_ammo_rifle", price = 3000},
        --    {name = "disc_ammo_shotgun", price = 2500},
       --     {name = "disc_ammo_smg", price = 1500},
            {name = "armor", price = 10000}
        },
        Markers = {
            Use = true,
            Type = 1,
            Draw = 3,
            UseText = true,
            RGB = vector3(255, 255, 255)
        },
        Blips = {
            Use = true,
            Sprite = 110,
            Color = 2,
            Scale = 0.5,
            Display = 4
        }
    }
}

Config.Bullets = {
    AmmoGain = 20,
    Items = {
        lowcalrounds = {
            "WEAPON_PISTOL",
            "WEAPON_PISTOL_MK2",
            "WEAPON_PISTOL50",
            "WEAPON_COMBATPISTOL",
            "WEAPON_APPISTOL",
            "WEAPON_SNSPISTOL",
            "WEAPON_SNSPISTOL_MK2",
            "WEAPON_HEAVYPISTOL",
            "WEAPON_VINTAGEPISTOL",
            "WEAPON_MARKSMANPISTOL",
            "WEAPON_REVOLVER",
            "WEAPON_REVOLVER_MK2",
            "WEAPON_DOUBLEACTION"
        },
        midcalrounds = {
            "WEAPON_MICROSMG",
            "WEAPON_SMG",
            "WEAPON_SMG_MK2",
            "WEAPON_ASSAULTSMG",
            "WEAPON_COMBATPDW",
            "WEAPON_MACHINEPISTOL",
            "WEAPON_MINISMG"
        },
        highcalrounds = {
            "WEAPON_ASSAULTRIFLE",
            "WEAPON_ASSAULTRIFLE_MK2",
            "WEAPON_CARBINERIFLE",
            "WEAPON_CARBINERIFLE_MK2",
            "WEAPON_ADVANCEDRIFLE",
            "WEAPON_SPECIALCARBINE",
            "WEAPON_SPECIALCARBINE_MK2",
            "WEAPON_BULLPUPRIFLE",
            "WEAPON_BULLPUPRIFLE_MK2",
            "WEAPON_COMPACTRIFLE",
            "WEAPON_MG",
            "WEAPON_COMBATMG",
            "WEAPON_COMBATMG_MK2",
            "WEAPON_GUSENBERG"
        },
        shotcalrounds = {
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_PUMPSHOTGUN_MK2",
            "WEAPON_SAWNOFFSHOTGUN",
            "WEAPON_ASSAULTSHOTGUN",
            "WEAPON_BULLPUPSHOTGUN",
            "WEAPON_MUSKET",
            "WEAPON_HEAVYSHOTGUN",
            "WEAPON_DBSHOTGUN",
            "WEAPON_AUTOSHOTGUN"
        },
        speccalrounds = {
            "WEAPON_SNIPERRIFLE",
            "WEAPON_HEAVYSNIPER",
            "WEAPON_HEAVYSNIPER_MK2",
            "WEAPON_MARKSMANRIFLE",
            "WEAPON_MARKSMANRIFLE_MK2",
            "WEAPON_RPG",
            "WEAPON_GRENADELAUNCHER",
            "WEAPON_MINIGUN",
            "WEAPON_FIREWORK",
            "WEAPON_RAILGUN",
            "WEAPON_HOMINGLAUNCHER",
            "WEAPON_COMPACTLAUNCHER",
            "WEAPON_FLAREGUN"
        }
    }
}

Config.StashP = {
    ["mine"] = {
        coords = vector3(-57.659950256348, 844.92468261719, 231.32991027832),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        steam = "steam:1100001115e4c94",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "Cedrick Stash"
    },
   
    ["MAGTIBAY"] = {
        coords = vector3(-60.030277252197, 834.25323486328, 231.32997131348),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        steam = "steam:110000144c4b7f4",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "Magtibay Stash"
    },
    ["NOSTRA"] = {
        coords = vector3(-79.81965637207,836.65539550781,231.32997131348),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:110000117850ef8",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "NOSTRA Stash"
    },
    ["RATRBU"] = {
        coords = vector3(-49.967166900635, 832.34808349609, 231.32977294922),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:11000014485736e",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "Ratbu Stash"
    },
    ["ACE"] = {
        coords = vector3(-82.061424255371, 826.90747070312, 231.32978820801),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:1100001093ea77c",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "ACE Stash"
    },
    ["krabs"] = {
        coords = vector3(-56.02307510376, 837.56726074219, 235.71800231934),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:1100001443f348a",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "krabs Stash"
    },
    ["uno"] = {
        coords = vector3(-52.970798492432, 828.96685791016, 235.71800231934),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:110000142eac874",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "Uno Stash"
    },
    ["tam"] = {
        coords = vector3(-82.999481201172, 832.4794921875, 235.71797180176),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:110000145364d22",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "tam Stash"
    },
    ["jay"] = {
        coords = vector3(-85.343048095703, 825.46569824219, 235.71798706055),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        steam = "steam:11000011a07e707",
        mingrade = 0,
        markerType = 2,
        draw = 3,
        markerColour = vector3(255, 255, 255),
        msg = "Jay Stash"
    }
}

Config.StashJ2 = {
    ["Magtibay Gang"] = {
        coords = vector3(-101.18379211426, 823.43688964844, 227.88110351562),
        useText = true,
        size = vector3(0.5, 0.5, 0.5),
        job = "magtibay",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Magtibay Stash"
    }
}

Config.StashJ1 = {
    ["LSPD"] = {
        coords = vector3(484.28854370117, -995.68505859375, 30.689645767212),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "police",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City Police Stash"
    },
    ["LSPD2"] = {
        coords = vector3(474.32595825195, -990.72045898438, 26.273281097412),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "police",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City Police Confiscated items Stash"
    },
    ["LSPD3"] = {
        coords = vector3(486.06884765625,-995.54522705078,30.689645767212),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "police",
        mingrade = 13,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City Police Stash [Generals]"
    },
    ["LSPD4"] = {
    --    coords = vector3(441.89743041992,-984.34106445312,30.689506530762),'
    coords = vector3(1854.8446044922,3688.5615234375,34.267032623291),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "police",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City Police Confiscated items Stash"
    },

    
    ["Groove"] = {
     --   coords = vector3(-100.11833953857, -1792.5531005859, 32.195148468018),

     coords = vector3(107.74674987793,6629.8803710938,31.787227630615),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "groove",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City Groove Stash"
    },
    ["RCEMS"] = { --  
      --  coords = vector3(-452.08367919922, -324.60824584961, 34.91077041626),

      coords = vector3(-259.32659912109,6311.919921875,32.431541442871),
        useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = "ambulance",
        mingrade = 0,
        markerType = 2,
        draw = 2,
        markerColour = vector3(255, 255, 255),
        msg = "Retro City EMS Stash"
    }
}

for k, v in pairs(Config.Bullets.Items) do
    for i = 1, #v do
        v[i] = GetHashKey(v[i])
    end
end
