Config = {}

Config.Locale = 'en'

-- Set the time (in minutes) during the player is outlaw
Config.Timer = 1

-- Set if show alert when player use gun
Config.GunshotAlert = true

-- Set if show when player do carjacking
Config.CarJackingAlert = true

-- Set if show when player fight in melee
Config.MeleeAlert = true

-- In seconds
Config.BlipGunTime = 5

-- Blip radius, in float value!
Config.BlipGunRadius = 50.0

-- In seconds
Config.BlipMeleeTime = 7

-- Blip radius, in float value!
Config.BlipMeleeRadius = 50.0

-- In seconds
Config.BlipJackingTime = 10

-- Blip radius, in float value!
Config.BlipJackingRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = true

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
	'police'
}


ConfigWeazel                        = {}
ConfigWeazel.DrawDistance           = 100.0
ConfigWeazel.MaxInService           = -1
ConfigWeazel.EnablePlayerManagement = true
ConfigWeazel.Locale                 = 'en'

ConfigWeazel.Zones = {

	weazelnewsActions = {
		Pos   = {x = -591.51, y = -929.81, z = 22.86},
		Size  = {x = 1.1, y = 1.1, z = 1.0},
		Color = {r = 0, g = 204, b = 0},
		Type  = 1
	},

	VehicleDeleter = {
		Pos   = {x = -551.37, y = -904.49, z = 22.76},
		Size  = {x = 5.0, y = 5.0, z = 1.5},
		Color = {r = 102, g = 0, b = 0 },
		Type  = -1
	},

	VehicleSpawnPoint = {
		Pos   = {x = -551.37, y = -904.49, z = 23.76},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = -1
	},

}
------------------------------------------------
-- discord shop : https://discord.gg/3wwzfmf  --
-- discord leaks : https://discord.gg/39mJqPU --
--                SP#5201                     --               
------------------------------------------------           



JAM_Pillbox = {}
local JPB = JAM_Pillbox
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

JPB.HospitalPosition = vector3(	-445.63125610352,-337.53472900391,34.503124237061)
JPB.LoadZoneDist = 80.0
JPB.DrawTextDist = 15.0
JPB.InteractDist = 5.0
JPB.MaxCapacity = 7
JPB.AutoHealTimer = 30 -- seconds
JPB.HealingTimer = 5 -- seconds
JPB.OnlineEMSTimerMultiplier = 1500 -- if ems > MinEMSCount and player in bed, time for auto heal = AutoHealTimer*OnlineEMSTimerMultiplier

JPB.UseHospitalClothing = true
JPB.UsingSkeletalSystem = true
JPB.UsingProgressBars = true
JPB.UsingBasicNeeds = true

JPB.MinEMSCount = 90000
JPB.EMSJobLabel = "Ambulance"

JPB.PushToTalkKey = "N"

JPB.ActionMarkers = {
  [1] = vector3(-435.80233764648,-325.95443725586,34.910755157471),
}

JPB.ActionText = {
  [1] = "~h~Press [~r~E~s~] to check yourself in.",
  [2] = "~h~Press [~r~E~s~] to lay down on the bed.",
}

JPB.Actions = {
  [1] = "Check In",
  [2] = "Lay Down",
}

JPB.BedLocations = {
  [1] = vector3(-467.03823852539,-291.37716674805,35.835102081299),
  [2] = vector3(-469.92874145508,-284.45986938477,35.835105895996),
  [3] = vector3(-466.49075317383,-283.05969238281,35.835105895996),
  [4] = vector3(-463.74911499023,-290.08059692383,35.833232879639),
  [5] = vector3(-460.2314453125,-288.45895385742,35.833171844482),
  [6] = vector3(-462.63223266602,-281.42108154297,35.835102081299),
  [7] = vector3(-454.92736816406,-286.34255981445,35.833232879639),
}

JPB.BedRotations = {
  [vector3(-467.03823852539,-291.37716674805,35.835102081299)] = vector3(90.0, 160.0, 0.0),
  [vector3(-469.92874145508,-284.45986938477,35.835105895996)] = vector3(90.0,  70.0, 0.0),
  [vector3(-466.49075317383,-283.05969238281,35.835105895996)] = vector3(90.0,  70.0, 0.0),
  [vector3(-463.74911499023,-290.08059692383,35.833232879639)] = vector3(90.0, 160.0, 0.0),
  [vector3(-460.2314453125,-288.45895385742,35.833171844482)] = vector3(90.0, 160.0, 0.0),
  [vector3(-462.63223266602,-281.42108154297,35.835102081299)] = vector3(90.0, 160.0, 0.0),
  [vector3(-454.92736816406,-286.34255981445,35.833232879639)] = vector3(90.0, 160.0, 0.0),
}

JPB.GetUpLocations = {
  [vector3(-467.03823852539,-291.37716674805,35.835102081299)] = vector4(-467.03823852539,-291.37716674805,35.835102081299,154.91),
  [vector3(-469.92874145508,-284.45986938477,35.835105895996)] = vector4(-469.92874145508,-284.45986938477,35.835105895996,154.91),
  [vector3(-466.49075317383,-283.05969238281,35.835105895996)] = vector4(-466.49075317383,-283.05969238281,35.835105895996,146.98),
  [vector3(-463.74911499023,-290.08059692383,35.833232879639)] = vector4(-463.74911499023,-290.08059692383,35.833232879639,084.35),
  [vector3(-460.2314453125,-288.45895385742,35.833171844482)] = vector4(-460.2314453125,-288.45895385742,35.833171844482,216.76),
  [vector3(-462.63223266602,-281.42108154297,35.835102081299)] = vector4(-462.63223266602,-281.42108154297,35.835102081299,111.87),
  [vector3(-454.92736816406,-286.34255981445,35.833232879639)] = vector4(-454.92736816406,-286.34255981445,35.833232879639,217.84),
}

JPB.Outfits = {
  patient_wear = {
    male = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
      ['torso_1']  = 2, ['torso_2']  = 9,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms']     = 0, ['pants_1']  = 49,
      ['pants_2']  = 2,   ['shoes_1']  = 34,
      ['shoes_2']  = 0,  ['chain_1']  = 0,
      ['chain_2']  = 0
    },
    female = {
      ['tshirt_1'] = 15,   ['tshirt_2'] = 0,
      ['torso_1']  = 14,  ['torso_2']  = 5,
      ['decals_1'] = 0,   ['decals_2'] = 0,
      ['arms']     = 14,  ['pants_1'] = 55,
      ['pants_2']  = 3,  ['shoes_1']  = 5,
      ['shoes_2']  = 0,   ['chain_1']  = 0,
      ['chain_2']  = 0
    }
  }
}



ConfigBarber = {}

ConfigBarber.Price = 100

ConfigBarber.DrawDistance = 100.0
ConfigBarber.MarkerSize   = vector3(1.5, 1.5, 1.0)
ConfigBarber.MarkerColor  = {r = 102, g = 102, b = 204}
ConfigBarber.MarkerType   = 1

ConfigBarber.Locale = 'fr'

ConfigBarber.Shops = {
	vector3(-814.3, -183.8, 36.6),
	vector3(136.8, -1708.4, 28.3),
	vector3(-1282.6, -1116.8, 6.0),
	vector3(1931.5, 3729.7, 31.8),
	vector3(1212.8, -472.9, 65.2),
	vector3(-32.9, -152.3, 56.1),
	vector3(-278.1, 6228.5, 30.7)
}



ConfigGamz = {}

ConfigGamz.Zones = {

    ["Weazel Store"] = {

        ["coords"] = vector3(-596.62091064453,-921.50463867188,23.815698623657),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, -- You can add more spots by just copying this one and changing the values


    ["RCPD Store"] = {

        ["coords"] = vector3(436.26565551758,-986.37823486328,30.689340591431),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --


    ["RCEMS Store"] = {

        ["coords"] = vector3(-433.22155761719,-341.61465454102,34.910751342773),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --

    ["RCEMS Store 2"] = {

        ["coords"] = vector3(-455.76086425781,-332.03594970703,42.329776763916),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --

    ["City Hall Store "] = {

        ["coords"] = vector3(-551.20831298828,-192.60929870605,38.28006362915),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --


    ["CUATRO HERMANOS Store "] = {

        ["coords"] = vector3(-1869.0250244141,2066.3325195312,140.97654724121),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --

--[[
 ["VERMILLION STORE "] = {

        ["coords"] = vector3(-2734.7905273438,-86.259078979492,17.050016403198),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --
]]--
    
   
	["VERMILLION STORE "] = {

        ["coords"] = vector3(982.41,-130.2,78.89),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 50,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 35,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 50,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, --


    ["RIRI STORE "] = {

        ["coords"] = vector3(-1409.1231689453,663.83966064453,192.04946899414),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 25,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 15,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 25,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 25,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, 

    ["Fridge "] = {

        ["coords"] = vector3(2537.25390625,6143.8525390625,164.27233886719),

        ["drink"] = {
            ["Coca Cola"] = {
                ["price"] = 25,
                ["prop"] = "prop_ecola_can"
            },

            ["Sparkling Water"] = {
                ["price"] = 15,
                ["prop"] = "prop_ld_flow_bottle"
            } 
        },
        
        ["eatable"] = {
            ["Burger"] = {
                ["price"] = 25,
                ["prop"] = "prop_cs_burger_01"
            },

            ["Hotdog"] = {
                ["price"] = 25,
                ["prop"] = "prop_cs_hotdog_01"
            }

        }
    }, 

    ["Gyro Day"] = {
        ["coords"] = vector3(461.50152587891, -699.02325439453, 27.402139663696)
    }

}

ConfigGamz.Anims = { -- if you want to change the animation
    ["eatable"] = {
        ["animation"] = "mp_player_int_eat_burger_fp",
        ["dict"] = "mp_player_inteat@burger",
    },

    ["drink"] = {
        ["animation"] = "loop_bottle",
        ["dict"] = "mp_player_intdrink",
    },
}

ConfigGamz.eatable = { -- if you have not choosed any food for a certain zone it will automatically get this
    ["Hotdog"] = {
        ["price"] = 79,
        ["prop"] = "prop_cs_hotdog_01"
    }
}

ConfigGamz.drink = { -- if you have not choosed any drinks for a certain zone it will automatically get this
    ["Sparkling Water"] = {
        ["price"] = 15,
        ["prop"] = "prop_ld_flow_bottle"
    }
}



ConfigBike                            = {}
ConfigBike.Locale                     = 'en'

--- #### BASICS
ConfigBike.EnablePrice = true -- false = bikes for free
ConfigBike.EnableEffects = false
ConfigBike.EnableBlips = false


--- #### PRICES	
ConfigBike.PriceTriBike = 1000
ConfigBike.PriceScorcher = 900
ConfigBike.PriceCruiser = 750
ConfigBike.PriceBmx = 550


--- #### MARKER EDITS
ConfigBike.TypeMarker = 38
ConfigBike.MarkerScale = { x = 1.000, y = 1.500, z = 0.500}
ConfigBike.MarkerColor = { r = 0, g = 255, b = 255}
	
ConfigBike.MarkerZones = { 
  
    {x = -521.91528320312,y = -262.80706787109,z = 35.487537384033},
    {x =  -440.16738891602,y = -364.33129882812,z =33.343330383301},
    {x =  410.66989135742,y =-974.61584472656,z =29.421234130859},
    {x =  -60.577705383301,y = -1831.1787109375,z = 26.809270858765}, 
    {x =  -616.18676757812,y = -940.88012695312,z = 22.032342910767},

}


-- Edit blip titles
ConfigBike.BlipZones = { 

   {title="Bikes Rental", colour=2, id=376, x = -248.938, y = -339.955, z = 29.969},
   {title="Bikes Rental", colour=2, id=376, x = -6.892, y = -1081.734, z = 26.829},
   {title="Bikes Rental", colour=2, id=376, x = -1262.36, y = -1438.98, z = 3.45},
}
