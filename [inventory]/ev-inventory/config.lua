Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 246
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000
Config.CheckLicense = true
Config.OpenAnim = true


Config.ExtraVisionShops = {

    ['Retro Shops'] = {
        coords = {
        --    vector3(2557.458, 382.282, 106.622),
            vector3(3038.939, 585.954, 106.622),
        --    vector3(-3038.939, 1001.462, 7.908),
            vector3(547.431, 2671.710, 42.156),
            vector3(1961.464, 3740.672, 32.343),
            vector3(2678.916, 3280.671, 55.241),
       --     vector3(1729.563, 6414.126, 36.037),
            vector3(26.18, -1347.37, 29.5),
            vector3(-48.519, -1757.514, 29.421),
            vector3(-707.501, -914.260, 19.215),
            vector3(-1820.523, 792.518, 138.118),
            vector3(1698.388, 4924.404, 42.063),
            vector3(-1222.98, -907.04, 12.33),
            vector3(373.74, 325.96, 103.57),
            vector3(1166.024, 2708.930, 37.177),
            vector3(1392.562, 3604.684, 34.0)
        },
        items = {
            { name = "hifi", price = 500, count = 1 },
            { name = "phone", price = 1500, count = 1 },
            { name = "radio", price = 750, count = 1 },
            { name = "water", price = 10, count = 1 },
            { name = "whisky", price = 250, count = 1 },
            { name = "cigarett", price = 50, count = 1 },
            { name = "beer", price = 75, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "chips", price = 15, count = 1 },
         --   { name = "stress", price = 750, count = 1 },
            { name = "vape", price = 20000, count = 1 },
            { name = "rccola", price = 35, count = 1 },
            { name = "pepsibp", price = 55, count = 1 },
            { name = "yakult", price = 20, count = 1 },
            { name = "cupcake", price = 45, count = 1 },
            { name = "burger", price = 60, count = 1 },
            { name = "hersheys", price = 55, count = 1 },
            { name = "hotdog", price = 45, count = 1 },
            { name = "taco", price = 90, count = 1 },
          --  { name = "orange", price = 30, count = 1 },
            { name = "WEAPON_BAT", price = 500, count = 1},
            { name = "WEAPON_KNIFE", price = 450, count = 1},
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ to open the Super Market',
        show3D = true,
        enableBlip = true,
        job = 'all'
    },
    
    ['RETRO CITY GORDO SHOP'] = {
        coords = {
            vector3(2542.6069335938,6139.423828125,164.27229309082),
        },
        items = {
            { name = "bread", price = 15, count = 1 },
         --   { name = "phone", price = 2500, count = 1 },
         --   { name = "radio", price = 1500, count = 1 },
            { name = "water", price = 10, count = 1 },
         --   { name = "whisky", price = 250, count = 1 },
          --  { name = "cigarett", price = 50, count = 1 },
         --   { name = "beer", price = 75, count = 1 },
         --   { name = "lighter", price = 10, count = 1 },
            { name = "chips", price = 15, count = 1 },
           -- { name = "stress", price = 750, count = 1 },
         --   { name = "vape", price = 2500, count = 1 },
            { name = "rccola", price = 35, count = 1 },
            { name = "pepsibp", price = 55, count = 1 },
          --  { name = "yakult", price = 20, count = 1 },
          --  { name = "cupcake", price = 45, count = 1 },
          --  { name = "burger", price = 60, count = 1 },
          --  { name = "hersheys", price = 55, count = 1 },
            { name = "hotdog", price = 45, count = 1 },
            { name = "taco", price = 90, count = 1 },
            { name = "camp", price = 5, count = 1 },
            { name = "WEAPON_MACHETE", price = 5, count = 1 },
         --   { name = "WEAPON_HATCHET", price = 5, count = 1 },
          --  { name = "orange", price = 30, count = 1 },
           -- { name = "WEAPON_BAT", price = 500, count = 1},
           -- { name = "WEAPON_KNIFE", price = 450, count = 1},
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ to open the Super Market',
        show3D = true,
        enableBlip = false,
        job = 'all'
    },


    ['Retro Weapon Shop'] = {
        coords = {
            vector3(-662.1, -935.3, 20.8),
			vector3(810.19, -2157.3, 29.62),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.7, 6083.97, 31.45),
			vector3(252.08, -50.26, 69.94),
			vector3(22.39, -1106.79, 29.8),
			vector3(2567.7, 294.75, 108.73),
			vector3(-1117.49, 2698.6, 18.55),
			vector3(842.41, -1033.4, 28.19)
        },
        items = {
            { name = "disc_ammo_pistol", price = 1000, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 1500, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 3000, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 3500, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 2500, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 1500, count = 1, grade = 0 },
           -- { name = "disc_ammo_snp", price = 10000, count = 1, grade = 0 },
            { name = "WEAPON_KNIFE", price = 150, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 150, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 150, count = 1, grade = 0 },
            { name = "WEAPON_PISTOL", price = 5000, count = 1, grade = 0 },
            { name = "WEAPON_MINISMG", price = 15000, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 100, count = 1, grade = 0 },
            { name = "silencieux", price = 300, count = 1, grade = 0 },
			{ name = "flashlight", price = 300, count = 1, grade = 0 },
            { name = "grip", price = 300, count = 1, grade = 0 },
            { name = "armor", price = 10000 , count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Weapon Shop',
        show3D = true,
        weaponBlip = true,
        job = 'all'
    },

    ['Retro Pawn Shop'] = {
        coords = {
            vector3(412.1565246582, 314.85778808594, 103.13260650635),
            vector3(-1459.3861083984, -413.91775512695, 35.735530853271)
        },
        items = {
            { name = "shovel", price = 650, count = 1 },
            { name = "lockpick", price = 10, count = 1 },
            { name = "cashregbypass", price = 450, count = 1 },
            { name = "VaultDoorBypass", price = 2500, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open The Pawn shop',
        show3D = true,
        PawnShopBlip = true,
        job = 'all'
    },


    ['Retro Starbucks'] = {
        coords = {
            vector3(263.26809692383, -821.15277099609, 29.437793731689)
        },
        items = {
            { name = "chocolate", price = 0, count = 1 },
            { name = "water", price = 0, count = 1 },
            { name = "coffee", price = 0, count = 1 },
            { name = "milk", price = 0, count = 1 },
            { name = "cupcake", price = 0, count = 1 },
            { name = "icecoffee", price = 0, count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~g~[E]~s~ To Take Food',
        show3D = true,
        PawnShopBlip = true,
        job = 'starbucks'
    },


    --[[
  ['Retro Court'] = {
        coords = {
            vector3(67.397933959961, -952.5205078125, 29.817785263062)
        },
        items = {
            { name = "idcard", price = 400, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~g~[E]~s~ To Create ID Card',
        show3D = true,
        courtBlip = true,
        job = 'all'
    },

       ['Ambulance Shop'] = {
        coords = {
            vector3(311.27, -597.21, 43.28)
        },
        items = {
            { name = "medkit", price = 0, count = 1 },
            { name = "bandage", price = 0, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Press ~r~[E]~h~ To Ambulance shop',
        show3D = true,
        enableBlip = false,
        job = 'ambulance'
    },
    ]]--
  

    ['Black Market'] = {
        coords = {
            vector3(1258.9312744141, -2557.8510742188, 42.716121673584)
        },
        items = {
            { name = "WEAPON_COMPACTRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_MINISMG", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_SPECIALCARBINE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ASSAULTRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ADVANCEDRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_HEAVYSNIPER", price = 0, count = 1, grade = 3 },
            { name = "WEAPON_GUSENBERG", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_BULLPUPRIFLE", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_ASSAULTSMG", price = 0, count = 1, grade = 2 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_COMBATPISTOL", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLARE", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 0, count = 1},
            { name = "WEAPON_KNIFE", price = 0, count = 1},
            { name = "silencieux", price = 0, count = 1, grade = 0 },
			{ name = "flashlight", price = 0, count = 1, grade = 0 },
			{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Black Market',
        show3D = true,
        enableBlip = false,
        job = 'blackmarket'
    },

    ['Biton Armor'] = {
        coords = {
            vector3(-1788.3032226563, 425.32775878906, 122.74110412598)
        },
        items = {
            { name = "disc_ammo_pistol", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLARE", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 0, count = 1},
            { name = "WEAPON_KNIFE", price = 0, count = 1},
            { name = "silencieux", price = 0, count = 1, grade = 0 },
			{ name = "flashlight", price = 0, count = 1, grade = 0 },
			{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~y~[E]~h~ To Open biton Armor',
        show3D = true,
        enableBlip = false,
        job = 'biton'
    },

    ['PB'] = {
        coords = {
            vector3(-1541.2268066406, 91.744720458984, 57.953433990479)
        },
        items = {
            { name = "disc_ammo_pistol", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLARE", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_BAT", price = 0, count = 1},
            { name = "WEAPON_KNIFE", price = 0, count = 1},
            { name = "silencieux", price = 0, count = 1, grade = 0 },
			{ name = "flashlight", price = 0, count = 1, grade = 0 },
			{ name = "grip", price = 0, count = 1, grade = 0 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Press ~r~[E]~h~ To Open Peaky Armory',
        show3D = true,
        enableBlip = false,
        job = 'peaky'
    },

    ['Peaky Market'] = {
        coords = {
            vector3(-1434.2691650391, 207.45541381836, 57.821437835693)
        },
        items = {
            { name = "whisky", price = 100, count = 1 },
            { name = "wine", price = 70, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ to open the Peaky Market',
        show3D = true,
        enableBlip = true,
        job = 'peaky'
    },


 

    ['GOVERNMENT STOCK'] = {
        coords = {
            vector3(-527.52410888672,-189.33833312988,42.783916473389)
        },
        items = {
            { name = "medikit", price = 0, count = 1 },
            { name = "bandage", price = 0, count = 1 },
            { name = "disc_ammo_pistol", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_pistol_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_rifle_large", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "disc_ammo_smg", price = 0, count = 1, grade = 0 },
            { name = "disc_ammo_snp", price = 0, count = 1, grade = 0 },
            { name = "WEAPON_FLASHLIGHT", price = 0, count = 1 },
            { name = "WEAPON_BAT", price = 0, count = 1 },
            { name = "WEAPON_PISTOL", price = 0, count = 1 },
            { name = "WEAPON_PUMPSHOTGUN", price = 0, count = 1 },
            { name = "WEAPON_CARBINERIFLE", price = 0, count = 1 },
            { name = "WEAPON_SPECIALCARBINE", price = 0, count = 1 },
            { name = "WEAPON_MINISMG", price = 0, count = 1 },
            { name = "WEAPON_SMG", price = 0, count = 1 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1 },
            { name = "WEAPON_ADVANCEDRIFLE", price = 0, count = 1 },
            { name = "WEAPON_BZGAS", price = 0, count = 1 },
            { name = "stress", price = 0, count = 1 },
            { name = "legbrace", price = 0, count = 1 },
            { name = "neckbrace", price = 0, count = 1 },
            { name = "bodybandage", price = 0, count = 1 },
            { name = "armbrace", price = 0, count = 1 },
             { name = "stress", price = 0, count = 1 },
            { name = "oxy", price = 0, count = 1 },
            { name = "armor", price = 0, count = 1 },
            { name = "armor2", price = 0, count = 1 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ to open the Government Stocks',
        show3D = true,
        enableBlip = false,
        job = 'government'
    },
}

Config.PVault = {
    ['RIRI'] = {
        coords = vector3(-1411.0913085938,622.12268066406,197.12648010254),
        size = vector3(1.0, 1.0, 1.0),
        steam = 'steam:1100001115e4c94',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Riri Vault',
        show3D = true
    },

    ['HERBS'] = {
        coords = vector3(2535.5007324219,6148.2216796875,168.12161254883),
        size = vector3(1.0, 1.0, 1.0),
        steam = 'steam:11000013d1780b3',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Herbs Vault',
        show3D = true
    },


    
}


Config.Stash = {

     ['police evidence'] = {
        coords = vector3(472.22927856445,-981.61224365234,24.914720535278),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Confiscated Stock',
        show3D = true
    },

    ['Ambulance Stock'] = {
        coords = vector3(-452.15240478516,-324.43298339844,34.910778045654),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Ambulance Stock',
        show3D = true
    },
    
    ['Mech Stock'] = {
        coords = vector3(-100.43384552002,-1792.6810302734,32.19514465332),
        size = vector3(1.0, 1.0, 1.0),
        job = 'groove',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Mech Stock',
        show3D = true
    },

    
    

    ['Fruit Store Stash'] = {
        coords = vector3(2560.4157714844,6184.0209960938,162.74548339844),
        size = vector3(1.0, 1.0, 1.0),
        job = 'gordo',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Fruit Store Stash',
        show3D = true
    },

    ['Fruit Store Stash 2'] = {
        coords = vector3(390.6403503418,-982.95776367188,29.422651290894),
        size = vector3(1.0, 1.0, 1.0),
        job = 'gordo',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Fruit Store Stash',
        show3D = true
    },

    ['Fruit Store Stash 3'] = {
        coords = vector3(-453.02810668945,-397.47616577148,33.510330200195),
        size = vector3(1.0, 1.0, 1.0),
        job = 'gordo',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Fruit Store Stash',
        show3D = true
    },
    ['Police Stash'] = {
        coords = vector3(451.58212280273,-980.04754638672,30.689331054688),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open Police Stash',
        show3D = true
    },
    ['blackmarket Stash'] = {
        coords = vector3(1252.9504394531, -2577.5148925781, 42.948802947998),
        size = vector3(1.0, 1.0, 1.0),
        job = 'blackmarket',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = 'Press ~r~[E]~h~ To Open blackmarket Stash',
        show3D = true
    },
    ['Peaky Stash'] = {
        coords = vector3(-1541.1590576172, 91.930786132813, 53.897163391113),
        size = vector3(1.0, 1.0, 1.0),
        job = 'peaky',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Press ~r~[E]~h~ To Open peaky Stash',
        show3D = true
    },

    ['biton Stash'] = {
        coords = vector3(-1757.2496337891, 427.77893066406, 127.68492889404),
        size = vector3(1.0, 1.0, 1.0),
        job = 'biton',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Press ~r~[E]~h~ To Open biton Stash',
        show3D = true
    },

    ['avitan StashV'] = {
        coords = vector3(8.6424293518066, 530.68853759766, 170.61729431152),
        size = vector3(1.0, 1.0, 1.0),
        job = 'biton',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Press ~r~[E]~h~ To Open Avitan Stash',
        show3D = true
    },
    ['avitan Stash'] = {
        coords = vector3(10.274570465088, 527.41088867188, 170.61727905273),
        size = vector3(1.0, 1.0, 1.0),
        job = 'biton',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~h~Press ~r~[E]~h~ To Open Avitan Stash',
        show3D = true
    },

    ['Mechanic'] = {
        coords = vector3(0, 0, 0),
        size = vector3(1.0, 1.0, 1.0),
        job = 'mechanic',
        markerType = 2,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~r~Press ~r~[E]~p~ To Open Mechanic Stash',
        show3D = true
    },

}

Config.Steal = {
    black_money = true,
    cash = true
}

Config.Seize = {
    black_money = true,
    cash = true
}

Config.VehicleLimit = {
    ['Zentorno'] = 10,
    ['Panto'] = 1,
    ['Zion'] = 5
}


Config.ItemsWeight = {
bread = 1.00,
water = 1.00,
medkit = 2.00,
bankidcard = 2.00,
beer = 1.00,   
cigarett = 1.00,   
diamond = 3.00,
firstaid = 1.00,
zlom = 1.00,
weapon_license = 1.00,
vicodin = 1.00,
vest = 6.00,
tuning_laptop = 3.00,
phone = 1.40,
rolex = 2.00,
pacificidcard = 1.00,
oxycutter = 2.00,
oxy = 2.00,
morphine = 1.00,
milk = 1.00,
meth = 3.00,
lockpick = 2.00,
joint = 1.00,
idcard = 1.00,
hydrocodone = 2.00,
gold = 4.00,
gauze = 1.00,
fixkit = 3.00,
bandage = 1.00,
ammo_snp = 4.00,  
disc_ammo_smg = 2.00,
disc_ammo_shotgun = 3.00,
disc_ammo_rifle = 3.00,
disc_ammo_pistol = 2.00,
adrenaline = 1.00,
rope = 1.00,
handcuffs = 1.00,
WEAPON_WRENCH = 4.00,
WEAPON_VINTAGEPISTOL = 6.00,
WEAPON_SWITCHBLADE = 3.00,
WEAPON_STUNGUN = 2.00,
WEAPON_SPECIALCARBINE = 25.00,
WEAPON_STICKYBOMB = 8.00,
WEAPON_SNSPISTOL = 7.00,
WEAPON_SNIPERRIFLE = 30.00,
WEAPON_SMG = 8.00,
WEAPON_SAWNOFFSHOTGUN = 13.00,
WEAPON_RPG = 40.00,
WEAPON_REVOLVER = 12.00,
WEAPON_PUMPSHOTGUN = 25.00,
WEAPON_POOLCUE = 4.00,
WEAPON_PISTOL50 = 6.00,
WEAPON_PISTOL = 7.00,
WEAPON_PETROLCAN = 5.00,
WEAPON_NIGHTSTICK = 3.00,
WEAPON_MUSKET = 13.00,
WEAPON_MINISMG = 9.00,
WEAPON_MICROSMG = 10.00,
WEAPON_MARKSMANRIFLE = 20.00,
WEAPON_MACHETE = 3.00,
WEAPON_KNUCKLE = 2.00,
WEAPON_KNIFE = 2.00,
WEAPON_HEAVYSNIPER = 30.00,
WEAPON_HATCHET = 5.00,
WEAPON_HAMMER = 8.00,
WEAPON_GRENADE = 4.00,
WEAPON_GOLFCLUB = 3.00,
GARBAGEBAG = 3.00,
WEAPON_FLASHLIGHT = 2.00,
WEAPON_FLAREGUN = 5.00,
WEAPON_DOUBLEACTION = 7.00,
WEAPON_DAGGER = 2.00,
WEAPON_CROWBAR = 3.00,
WEAPON_COMPACTRIFLE = 22.00,
WEAPON_COMBATPISTOL = 9.00,
WEAPON_COMBATPDW = 8.00,
WEAPON_CARBINERIFLE = 24.00,
WEAPON_BZGAS = 6.00,
WEAPON_BULLPUPRIFLE = 28.00,
WEAPON_BOTTLE = 2.00,
WEAPON_BATTLEAXE = 5.00,
WEAPON_BAT = 4.00,
WEAPON_ASSAULTSMG = 9.00,
WEAPON_ASSAULTRIFLE = 27.00,
WEAPON_APPISTOL = 11.00,
WEAPON_ADVANCEDRIFLE = 26.00,
}







--Courtesy DoctorTwitch
Config.VehicleSlot = {
    [0] = 20, --Compact
    [1] = 30, --Sedan
    [2] = 20, --SUV
    [3] = 30, --Coupes
    [4] = 20, --Muscle
    [5] = 20, --Sports Classics
    [6] = 20, --Sports
    [7] = 20, --Super
    [8] = 0, --Motorcycles
    [9] = 15, --Off-road
    [10] = 40, --Industrial
    [11] = 40, --Utility
    [12] = 60, --Vans
    [13] = 20, --Cycles
    [14] = 20, --Boats
    [15] = 20, --Helicopters
    [16] = 20, --Planes
    [17] = 40, --Service
    [18] = 40, --Emergency
    [19] = 90, --Military
    [20] = 0, --Commercial
    [21] = 0 --Trains
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_FLARE = 1233104067,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847
