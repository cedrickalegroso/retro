local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyRobbing')
AddEventHandler('esx_holdup:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 0.7)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_holdup:robberyComplete')
AddEventHandler('esx_holdup:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_holdup:startTimer')
AddEventHandler('esx_holdup:startTimer', function()
	local timer = StoresHOLDUP[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(1)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()

		  -- Load the textures
		  RequestStreamedTextureDict("world_blips", 1)
		  while not HasStreamedTextureDictLoaded("world_blips") do
			  Wait(0)
		  end


	for k,v in pairs(StoresHOLDUP) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)

				-- Add all the cool info to the blip
				exports['blip_info']:SetBlipInfoTitle(blip, _U('shop_robbery'), false)
				exports['blip_info']:SetBlipInfoImage(blip, "world_blips", "illegal")
				--exports['blip_info']:AddBlipInfoText(blip, "Area", "La Mesa")
				exports['blip_info']:AddBlipInfoHeader(blip, "") -- Empty header adds the header line
				exports['blip_info']:AddBlipInfoText(blip, "Type", "Illegal")
			
				exports['blip_info']:AddBlipInfoText(blip, "Police Units", "[STRICT] POLICE +1")
				exports['blip_info']:AddBlipInfoText(blip, "Required Police", "2 Officers")
				exports['blip_info']:AddBlipInfoText(blip, "Minimum EMS", "1")
				exports['blip_info']:AddBlipInfoText(blip, "Minimum Robbers", "2")
				--exports['blip_info']:AddBlipInfoText(blip, "Sell your jewelries here!")


	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(StoresHOLDUP) do
			local storePos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)

			if distance < Config.MarkerHOLDUP.DrawDistance then
				if not holdingUp then
					DrawMarker(Config.MarkerHOLDUP.Type, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerHOLDUP.x, Config.MarkerHOLDUP.y, Config.MarkerHOLDUP.z, Config.MarkerHOLDUP.r, Config.MarkerHOLDUP.g, Config.MarkerHOLDUP.b, Config.MarkerHOLDUP.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, 38) then
							if IsPedArmed(PlayerPedId(), 4) then
								TriggerServerEvent('esx_holdup:robberyStarted', k)
							else
								ESX.ShowNotification(_U('no_threat'))
							end
						end
					end
				end
			end
		end

		if holdingUp then
			local storePos = StoresHOLDUP[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistanceHOLDUP then
				TriggerServerEvent('esx_holdup:tooFar', store)
			end
		end
	end
end)
