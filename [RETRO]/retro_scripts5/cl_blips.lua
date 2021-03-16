--[[local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Example 1", colour=10, id=446, x = -347.291, y = -133.370, z = 38.009},
     {title="Example 2", colour=10, id=108, x = 260.130, y = 204.308, z = 109.287}
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
	end]]

	ConfigRead                            = {}
	
	

	ConfigRead.Casino = {

		LSPD = {
	
			Blip = {
				Coords  = vector3(922.35522460938,47.30685043335,81.104942321777),
				Sprite  = 9,
				Display = 4,
				Scale   = 0.3,
				alpha = 80,
				Colour  = 75
			},

		},
		
	}
	
	ConfigRead.TheLost = {

		LSPD = {
	
			Blip = {
				Coords  = vector3(966.82,-126.39,74.35),
				Sprite  = 9,
				Display = 4,
				Scale   = 0.3,
				alpha = 80,
				Colour  = 75
			},

		},
		
	}
	
	ConfigRead.MechSandy = {

		LSPD = {
	
			Blip = {
				Coords  = vector3(1438.19,3554.12,43.34),
				Sprite  = 446,
				Display = 4,
				Scale   = 1,
				alpha = 80,
				Colour  = 48
			},

		},
		
	}
	
	ConfigRead.Vermillion = {

	
		
	}
	
	ConfigRead.Cuatro = {

		LSPD = {
	
			Blip = {
				Coords  = vector3(-1889.3,2047.19,148.44),
				Sprite  = 9,
				Display = 4,
				Scale   = 0.3,
				alpha = 80,
				Colour  = 75
			},

		},
		
	}

-- Create blips
Citizen.CreateThread(function()

		  -- Load the textures
		  RequestStreamedTextureDict("world_blips", 1)
		  while not HasStreamedTextureDictLoaded("world_blips") do
			  Wait(0)
		  end



	


	for k,v in pairs(ConfigRead.Casino) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, 58)
		SetBlipScale  (blip, 1.5)
		SetBlipColour (blip, 81)
		SetBlipShrink(blip, true)
		SetBlipAsShortRange(blip, true)
		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Casino de Simpas')
		EndTextCommandSetBlipName(blip)

	end



	--[[

		for k,v in pairs(ConfigRead.TheLost) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, 3)
		SetBlipScale  (blip, 2.5)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipShrink(blip, true)
		SetBlipAsShortRange(blip, true)
		SetBlipAlpha(blip, 90)

		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('RED ZONE')
		EndTextCommandSetBlipName(blip)
		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('The Lost MC')
		EndTextCommandSetBlipName(blip)

	end
for k,v in pairs(ConfigRead.Vermillion) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, 3)
		SetBlipScale  (blip, 2.5)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipShrink(blip, true)
		SetBlipAsShortRange(blip, true)
		SetBlipAlpha(blip, 90)

		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('RED ZONE')
		EndTextCommandSetBlipName(blip)
		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Vermillion Mansion')
		EndTextCommandSetBlipName(blip)

	end
	
	for k,v in pairs(ConfigRead.Cuatro) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, 3)
		SetBlipScale  (blip, 2.5)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipShrink(blip, true)
		SetBlipAsShortRange(blip, true)
		SetBlipAlpha(blip, 90)

		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('RED ZONE')
		EndTextCommandSetBlipName(blip)
		
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Cuatro Hermanos')
		EndTextCommandSetBlipName(blip)

	end
	]]--
	
	
	
end)