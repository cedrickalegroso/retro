ESX = nil
local consuming = false
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(50)
        ESX = exports["es_extended"]:getSharedObject()
    end
end)


RegisterCommand('wheelchair', function()
	LoadModel('prop_wheelchair_01')

	local wheelchair = CreateObject(GetHashKey('prop_wheelchair_01'), GetEntityCoords(PlayerPedId()), true)
end, false)

RegisterCommand('removewheelchair', function()
	local wheelchair = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_wheelchair_01'))

	if DoesEntityExist(wheelchair) then
		DeleteEntity(wheelchair)
	end
end, false)

Citizen.CreateThread(function()
	while true do
		local sleep = 500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		local closestObject = GetClosestObjectOfType(pedCoords, 3.0, GetHashKey("prop_wheelchair_01"), false)

		if DoesEntityExist(closestObject) then
			sleep = 5

			local wheelChairCoords = GetEntityCoords(closestObject)
			local wheelChairForward = GetEntityForwardVector(closestObject)
			
			local sitCoords = (wheelChairCoords + wheelChairForward * - 0.5)
			local pickupCoords = (wheelChairCoords + wheelChairForward * 0.3)

			if GetDistanceBetweenCoords(pedCoords, sitCoords, true) <= 1.0 then
				DrawText3Ds(sitCoords, "[E] Sit", 0.4)

				if IsControlJustPressed(0, 38) then
					Sit(closestObject)
				end
			end

			if GetDistanceBetweenCoords(pedCoords, pickupCoords, true) <= 1.0 then
				DrawText3Ds(pickupCoords, "[E] Pick up", 0.4)

				if IsControlJustPressed(0, 38) then
					PickUp(closestObject)
				end
			end
		end

		Citizen.Wait(sleep)
	end
end)

Sit = function(wheelchairObject)
	local closestPlayer, closestPlayerDist = GetClosestPlayer()

	if closestPlayer ~= nil and closestPlayerDist <= 1.5 then
		if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 3) then
			ShowNotification("Somebody is already using the wheelchair!")
			return
		end
	end

	LoadAnim("missfinale_c2leadinoutfin_c_int")

	AttachEntityToEntity(PlayerPedId(), wheelchairObject, 0, 0, 0.0, 0.4, 0.0, 0.0, 180.0, 0.0, false, false, false, false, 2, true)

	local heading = GetEntityHeading(wheelchairObject)

	while IsEntityAttachedToEntity(PlayerPedId(), wheelchairObject) do
		Citizen.Wait(5)

		if IsPedDeadOrDying(PlayerPedId()) then
			DetachEntity(PlayerPedId(), true, true)
		end

		if not IsEntityPlayingAnim(PlayerPedId(), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 3) then
			TaskPlayAnim(PlayerPedId(), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 8.0, 8.0, -1, 69, 1, false, false, false)
		end

		if IsControlPressed(0, 32) then
			local x, y, z  = table.unpack(GetEntityCoords(wheelchairObject) + GetEntityForwardVector(wheelchairObject) * -0.02)
			SetEntityCoords(wheelchairObject, x,y,z)
			PlaceObjectOnGroundProperly(wheelchairObject)
		end

		if IsControlPressed(1,  34) then
			heading = heading + 0.4

			if heading > 360 then
				heading = 0
			end

			SetEntityHeading(wheelchairObject,  heading)
		end

		if IsControlPressed(1,  9) then
			heading = heading - 0.4

			if heading < 0 then
				heading = 360
			end

			SetEntityHeading(wheelchairObject,  heading)
		end

		if IsControlJustPressed(0, 73) then
			DetachEntity(PlayerPedId(), true, true)

			local x, y, z = table.unpack(GetEntityCoords(wheelchairObject) + GetEntityForwardVector(wheelchairObject) * - 0.7)

			SetEntityCoords(PlayerPedId(), x,y,z)
		end
	end
end

PickUp = function(wheelchairObject)
	local closestPlayer, closestPlayerDist = GetClosestPlayer()

	if closestPlayer ~= nil and closestPlayerDist <= 1.5 then
		if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'anim@heists@box_carry@', 'idle', 3) then
			ShowNotification("Somebody is already driving the wheelchair!")
			return
		end
	end

	NetworkRequestControlOfEntity(wheelchairObject)

	LoadAnim("anim@heists@box_carry@")

	AttachEntityToEntity(wheelchairObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), -0.00, -0.3, -0.73, 195.0, 180.0, 180.0, 0.0, false, false, true, false, 2, true)

	while IsEntityAttachedToEntity(wheelchairObject, PlayerPedId()) do
		Citizen.Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if IsPedDeadOrDying(PlayerPedId()) then
			DetachEntity(wheelchairObject, true, true)
		end

		if IsControlJustPressed(0, 73) then
			DetachEntity(wheelchairObject, true, true)
		end
	end
end

DrawText3Ds = function(coords, text, scale)
	local x,y,z = coords.x, coords.y, coords.z
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 370

	DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.025, 41, 11, 41, 100)
end

GetPlayers = function()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

GetClosestPlayer = function()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

LoadAnim = function(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		
		Citizen.Wait(1)
	end
end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		
		Citizen.Wait(1)
	end
end

ShowNotification = function(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end




RegisterNetEvent('retro_scripts:gpspluson')
AddEventHandler('retro_scripts:gpspluson', function(source)

    exports['progressBars']:startUI(7500, "Turning on GPS")
    Citizen.Wait(7500)
    DisplayRadar(true)
    
end)



Citizen.CreateThread(function()

    for place, value in pairs(ConfigXray.Zones) do
		local blip = AddBlipForCoord(value["coords"].x, value["coords"].y)
	--	SetBlipSprite (blip, 238)
	--	SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 69)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(place)
		EndTextCommandSetBlipName(blip)
    end
    
    while true do
        local sleepTime = 500
        local coords = GetEntityCoords(PlayerPedId())

        for place, value in pairs(ConfigXray.Zones) do
            local dst = GetDistanceBetweenCoords(coords, value["coords"], true)
            local text = place

            if dst <= 7.5 then 
                sleepTime = 5
                
                if dst <= 1.25 then
                    text = "Press [~r~E~w~] to open " .. place
                    if IsControlJustReleased(0, 38) then
                        ESX.UI.Menu.CloseAll()

                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions',
                        {
                            title    = 'Police',
                            align    = 'top-left',
                            elements = {
                                {label = 'Lay down',	value = 'lay'},
                                {label = 'Sit',	value = 'sit'},
                                {label = 'Close',	value = 'close'},
            
                            }
                        }, function(data, menu)


                            if data.current.value == 'lay' then
                                TakeXray(place, value) 
                                menu.close()
                            elseif  data.current.value == 'sit' then
                                sit(place, value) 
                                menu.close()
                            elseif  data.current.value == 'close' then
                                menu.close()
                            end

                        end, function(data, menu)
                            menu.close()
                        end)


                       
                    end
                end

                Marker(text, value["coords"].x, value["coords"].y, value["coords"].z - 0.98) 
            end
        end

        Citizen.Wait(sleepTime)
    end
end)

Citizen.CreateThread(function()

    for place, value in pairs(ConfigAlbularyo.Zones) do
		local blip = AddBlipForCoord(value["coords"].x, value["coords"].y)
		SetBlipSprite (blip, 61)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(place)
		EndTextCommandSetBlipName(blip)
    end
    
    while true do
        local sleepTime = 500
        local coords = GetEntityCoords(PlayerPedId())

        for place, value in pairs(ConfigAlbularyo.Zones) do
            local dst = GetDistanceBetweenCoords(coords, value["coords"], true)
            local text = place

            if dst <= 7.5 then 
                sleepTime = 5
                
                if dst <= 1.25 then
                    text = "Press [~r~E~w~] to consult the " .. place
                    if IsControlJustReleased(0, 38) then
                        ESX.UI.Menu.CloseAll()
						quantity = 1


						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 1.0 then
						--if 1 > 5 then
							ESX.ShowNotification('No Players nearby')
						else
						
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)

								if IsPedDeadOrDying(closestPlayerPed, 1) then
									local playerPed = PlayerPedId()


									ESX.TriggerServerCallback('retro_scripts:checkblack', function(black)
										if black == 1 then 

										 
											ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
											{
												title		= 'Albularyo Menu',
												align		= 'top-left',
												elements	= {
													{label = 'Revive nearest player', value = 'revive'},
												--	{label = _U('ems_menu_small'), value = 'small'},
													{label = 'Heal nearest player', value = 'big'},
												--	{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'}
												}
											}, function(data, menu)
												if IsBusy then return end
								
												local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
								
												if closestPlayer == -1 or closestDistance > 1.0 then
													ESX.ShowNotification(_U('no_players'))
												else
								
													if data.current.value == 'revive' then
								
														ESX.ShowNotification('The Albularyo gave you the magic spell to revive your crewmate!')
														
																local closestPlayerPed = GetPlayerPed(closestPlayer)
								
																if IsPedDeadOrDying(closestPlayerPed, 1) then
																	local playerPed = PlayerPedId()
								
																	TriggerServerEvent('CUSTOM_esx_ambulance:requestCPR', GetPlayerServerId(closestPlayer), GetEntityHeading(playerPed), GetEntityCoords(playerPed), GetEntityForwardVector(playerPed))
								
																	ESX.UI.Menu.CloseAll()
								
																	ESX.ShowNotification(_U('revive_inprogress'))
								
																	local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
								
																	for i=1, 15, 1 do
																		Citizen.Wait(900)
																
																		ESX.Streaming.RequestAnimDict(lib, function()
																			TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
																		end)
																	end
									
																
																		TriggerServerEvent('esx_ambulancejob:reviveAlbularyo', GetPlayerServerId(closestPlayer))
									
																
																			ESX.ShowNotification('Revived by Albularyo', GetPlayerName(closestPlayer))
																	
																else
																	ESX.ShowNotification(_U('player_not_unconscious'))
																end
													
								
															
								
												
								
													elseif data.current.value == 'small' then
								
														ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
															if quantity > 0 then
																local closestPlayerPed = GetPlayerPed(closestPlayer)
																local health = GetEntityHealth(closestPlayerPed)
								
																if health > 0 then
																	local playerPed = PlayerPedId()
								
																	IsBusy = true
																	ESX.ShowNotification(_U('heal_inprogress'))
																	TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
																	Citizen.Wait(10000)
																	ClearPedTasks(playerPed)
								
																	TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
																	TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
																	ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
																	IsBusy = false
																else
																	ESX.ShowNotification(_U('player_not_conscious'))
																end
															else
																ESX.ShowNotification(_U('not_enough_bandage'))
															end
														end, 'bandage')
								
													elseif data.current.value == 'big' then
								
														ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
															if quantity > 0 then
																local closestPlayerPed = GetPlayerPed(closestPlayer)
																local health = GetEntityHealth(closestPlayerPed)
								
																if health > 0 then
																	local playerPed = PlayerPedId()
								
																	IsBusy = true
																	ESX.ShowNotification(_U('heal_inprogress'))
																	TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
																	Citizen.Wait(10000)
																	ClearPedTasks(playerPed)
								
																	TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
																	TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
																	ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
																	IsBusy = false
																else
																	ESX.ShowNotification(_U('player_not_conscious'))
																end
															else
																ESX.ShowNotification(_U('not_enough_medikit'))
															end
														end, 'medikit')
								
													elseif data.current.value == 'put_in_vehicle' then
														TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
													end
												end
											end, function(data, menu)
												menu.close()
											end)

										else
										  ESX.ShowNotification('You dont have enough dirty money') 
										end
									  end, source)

                                   
							--	else
							--		ESX.ShowNotification(_U('player_not_unconscious'))
								--	exports['mythic_notify']:DoCustomHudText('inform', _U('player_not_unconscious'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
							--	end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
								--exports['mythic_notify']:DoCustomHudText('inform', _U('not_enough_medikit'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
							end
						end
					end

						
						
							
						
						

						
                       
                    end
                end

                Marker(text, value["coords"].x, value["coords"].y, value["coords"].z - 0.98) 
            end
        end

        Citizen.Wait(sleepTime)
    end
end)



Citizen.CreateThread(function()

    for place, value in pairs(ConfigGunLicense.Zones) do
		local blip = AddBlipForCoord(value["coords"].x, value["coords"].y)
		SetBlipSprite (blip, 110)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(place)
		EndTextCommandSetBlipName(blip)
    end
    
    while true do
        local sleepTime = 500
        local coords = GetEntityCoords(PlayerPedId())

        for place, value in pairs(ConfigGunLicense.Zones) do
            local dst = GetDistanceBetweenCoords(coords, value["coords"], true)
            local text = place

            if dst <= 7.5 then 
                sleepTime = 5
                
                if dst <= 1.25 then
                    text = "Press [~r~E~w~] to buy Gun License for 50000 "
                    if IsControlJustReleased(0, 38) then
                        ESX.UI.Menu.CloseAll()
		                    print('BUY LICENSE!')
                               TriggerServerEvent('suku:buyLicense')   
                    end
                end

                Marker(text, value["coords"].x, value["coords"].y, value["coords"].z - 0.98) 
            end
        end

        Citizen.Wait(sleepTime)
    end
end)

function TakeXray(place, value) 



    SetEntityCoords(PlayerPedId(), value["bed"].x, value["bed"].y, value["bed"].z, true, true, true, false)
    SetEntityHeading(PlayerPedId(), value["bed"].w)

    Citizen.Wait(500)
     

    if  value["timed"] == 1 then 

        ExecuteCommand('e passout3')
        exports['progressBars']:startUI(ConfigXray.XrayTime, "Taking Xray")
        Citizen.Wait(ConfigXray.XrayTime)
    
        exports['mythic_notify']:DoHudText('inform', 'You paid 250')
        TriggerServerEvent('retro_scripts:xrayPay', ConfigXray.XrayPay)

        ExecuteCommand('e c')

    else 

        ExecuteCommand('e passout3')

        exports['mythic_notify']:DoHudText('inform', 'You are being treated by the RCEMS please stay still.')

    end

  
end


function sit(place, value) 



    SetEntityCoords(PlayerPedId(), value["bed"].x, value["bed"].y, value["bed"].z, true, true, true, false)
    SetEntityHeading(PlayerPedId(), value["bed"].w)

    Citizen.Wait(500)
     



        ExecuteCommand('e sit8')

        exports['mythic_notify']:DoHudText('inform', 'You are being treated by the RCEMS please stay still.')

    

  
end