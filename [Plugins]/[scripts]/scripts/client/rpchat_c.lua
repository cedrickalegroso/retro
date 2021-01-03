ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)


RegisterNetEvent('100')
AddEventHandler('100', function(id,message,name)
	if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or id == GetPlayerServerId(PlayerId()) then
		PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)

		TriggerEvent('chat:addMessage', {
			template = '<div class="chat-message blue"><b>Emergency Call 100 | {0}</b> {1}</div>',
			args = { name, message }
		})

		
		if id ~= GetPlayerServerId(PlayerId()) then
			local blip = AddBlipForEntity(GetPlayerPed(GetPlayerFromServerId(id)))

			SetBlipSprite (blip, 458)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.8)
			SetBlipColour(blip, 84)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(GetPlayerName(GetPlayerFromServerId(id)) .. ' Emengercy Call')
			EndTextCommandSetBlipName(blip)

			Wait(30000)

			RemoveBlip(blip)
		end
	end
end)

RegisterNetEvent('101')
AddEventHandler('101', function(id,message,name)
	if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or id == GetPlayerServerId(PlayerId()) then
		PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)

		TriggerEvent('chat:addMessage', {
			template = '<div class="chat-message nonemergency"><b>Emergency Call 101 | {0}</b> {1}</div>',
			args = { name, message }
		})

		
		if id ~= GetPlayerServerId(PlayerId()) then
			local blip = AddBlipForEntity(GetPlayerPed(GetPlayerFromServerId(id)))

			SetBlipSprite (blip, 458)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.8)
			SetBlipColour(blip, 1)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(GetPlayerName(GetPlayerFromServerId(id)) .. ' Emengercy Call')
			EndTextCommandSetBlipName(blip)

			Wait(30000)

			RemoveBlip(blip)
		end
	end
end)