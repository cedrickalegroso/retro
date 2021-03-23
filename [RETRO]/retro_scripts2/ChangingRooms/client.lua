local hasAlreadyEnteredMarker, currentActionData = false, {}
local lastZone, currentAction, currentActionMsg
local pedArmor 


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_Cshop:hasEnteredMarker', function(zone)
	currentAction     = 'menu'
	currentActionMsg  = 'Press ~INPUT_PICKUP~ to open dressing'
	currentActionData = {}
end)

AddEventHandler('esx_Cshop:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil
end)

-- POLYZONES

local isinsideChaning = false

local circleA = CircleZone:Create(vector3(429.77243041992,-811.68133544922,29.491144180298), 0.5, {
	name="a",
	data={foo=1}
  })
  
  local circleB = CircleZone:Create(vector3(429.661,-811.554,28.591), 0.5, {
	name="b",
	data={foo=2}
  })
  
  local circleC = CircleZone:Create(vector3(-119.53133392334,-1780.7321777344,28.938479995728), 0.5, {
	name="c",
	data={foo=3}
  })

  local circleD = CircleZone:Create(vector3(-819.987,-1067.44,11.328), 0.5, {
	name="d",
	data={foo=4}
  })


  local circleE = CircleZone:Create(vector3(-1447.1,-240.396,49.819), 0.5, {
	name="d",
	data={foo=4}
  })


  local circleF = CircleZone:Create(vector3(3.917,6506.042,31.878), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleG = CircleZone:Create(vector3(118.674,-224.98,54.558), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleH = CircleZone:Create(vector3(1698.673,4818.352,42.063), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleI = CircleZone:Create(vector3(620.432,2766.495,42.088), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleJ = CircleZone:Create(vector3(-3177.755,1043.381,20.863), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleK = CircleZone:Create(vector3(-1889.5599365234,2060.9504394531,139.99999999027), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleL = CircleZone:Create(vector3(-2734.2880859375,-94.493133544922,16.196044540405), 0.5, {
	name="d",
	data={foo=4}
  })


  local circleM = CircleZone:Create(vector3(993.59,-135.82,73.10), 0.5, {
	name="d",
	data={foo=4}
  })


  local circleN = CircleZone:Create(vector3(-1407.8740234375,632.34246826172,196.52646484375), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleO = CircleZone:Create(vector3(-1435.3162841797,660.93664550781,196.59989929199), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleP = CircleZone:Create(vector3(-68.592948913574,829.22790527344,231.32997131348), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleQ = CircleZone:Create(vector3(1201.7416992188,2714.5510253906,37.222560882568), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleR = CircleZone:Create(vector3(463.3381652832,-999.15411376953,29.989514160156), 0.5, {
	name="d",
	data={foo=4}
  })


  local circleS = CircleZone:Create(vector3(301.66177368164,-598.90185546875,42.484091949463), 0.5, {
	name="d",
	data={foo=4}
  })

  local circleT = CircleZone:Create(vector3(956.54693603516,-145.66270446777,74.330993652344), 0.5, {
	name="T",
	data={foo=4}
  })

  local combo = ComboZone:Create({circleA, circleB, circleC, circleD, circleE, circleF, circleG, circleH, circleI, circleJ, circleK, circleL, circleM, circleN, circleO, circleP, circleQ, circleR, circleS, circleT }, {name="combo", debugPoly=false})
  combo:onPlayerInOut(function(isPointInside, point, zone)
	--print("combo: isPointInside is", isPointInside, " for point", point)
	if zone then
		pedArmor = GetPedArmour(GetPlayerPed(-1))
		print(pedArmor)
		OpenDressingMenu()
	end
  end)


Citizen.CreateThread(function()

   
  

end)


--[[

 local plyPed = PlayerPedId()
    local coord = GetEntityCoords(plyPed)
    isinsideChaning = changing:isPointInside(coord)
    Citizen.Wait(500)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.Room) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end

	

		for k,v in pairs(Config.MecanoRoom) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent('esx_Cshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_Cshop:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if currentAction then
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) then
				if currentAction == 'menu' then

                    pedArmor = GetPedArmour(GetPlayerPed(-1))
                    print(pedArmor)
					OpenDressingMenu()
				end

				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)
]]--


function OpenDressingMenu()
	local entering = nil
	local elements = {}

	table.insert(elements, {label = ('player clothes'), value = 'player_dressing'})
	table.insert(elements, {label = ('remove clothes'), value = 'remove_cloth'})
	
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
		title    = "Dressing Room",
		align    = 'right',
		elements = elements
	}, function(data, menu)
		
		if data.current.value == 'player_dressing' then

			ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = "Saved Outfits",
					align    = 'right',
					elements = elements
				}, function(data2, menu2)

                    ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
                        TriggerEvent('retro_scripts:loadclothesSaved', clothes)

                        TriggerEvent('esx:restoreLoadout')

                        SetPedArmour(GetPlayerPed(-1), pedArmor)
                    end, data2.current.value)
					

                    --[[
	TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
                    ]]--
				



				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = "Remove Outfits",
					align    = 'right',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('esx_property:removeOutfit', data2.current.value)
					ESX.ShowNotification(('removed outfit'))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		end
	end, function(data, menu)
		menu.close()
		
		CurrentAction     = 'menu'
		CurrentActionMsg  = 'Press ~INPUT_PICKUP~ to open dressing'
		CurrentActionData = {}
	end)
end

Citizen.CreateThread(function()
	for k,v in ipairs(Config.Room) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 73)
		SetBlipColour (blip, 42)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Changing Room')
		EndTextCommandSetBlipName(blip)
	end
end)