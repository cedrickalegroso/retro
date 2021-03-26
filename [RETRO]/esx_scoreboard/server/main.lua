--- CrazyFox Discord Channel: https://discord.gg/4E8sth5
ESX = nil
local connectedPlayers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name

	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		UpdatePing()
	end
end)


RegisterCommand('onhold', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)


    local job = xPlayer.getJob().name


    if job == 'police' then
		TriggerClientEvent('retro_scripts:holdplease', -1)
    end
end)

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1A priority call is in progress. Please do not interfere, otherwise you will be ^1kicked. ^7All calls are on ^3hold ^7until this one concludes.  </div>',
		args = { fal, msg }
	})

	TriggerClientEvent('retro_scripts:progplease', source)

	--TriggerClientEvent('chatMessage', -1, "WARNING", {255, 0, 0}, "^1A priority call is in progress. Please do not interfere, otherwise you will be ^1kicked. ^7All calls are on ^3hold ^7until this one concludes.")
end)

RegisterCommand('priority', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)


    local job = xPlayer.getJob().name


    if job == 'police' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1^1A priority call was just conducted. ^3All civilians must wait 15 minutes before conducting another one. ^7Failure to abide by this rule will lead to you being ^1kicked.  </div>',
            args = { fal, msg }
        })
		TriggerClientEvent('retro_scripts:prioplease', -1)
    end

  
     
end)


RegisterCommand('inprogress', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)


    local job = xPlayer.getJob().name


    if job == 'police' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1^1A priority call was just conducted. ^3All civilians must wait 15 minutes before conducting another one. ^7Failure to abide by this rule will lead to you being ^1kicked.  </div>',
            args = { fal, msg }
        })
		TriggerClientEvent('retro_scripts:progplease', -1)
    end

  
     
end)



AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].ping = GetPlayerPing(playerId)
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].name = GetPlayerName(playerId)
	connectedPlayers[playerId].job = xPlayer.job.name

	if update then
		TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
	end

	if xPlayer.permission_level == 0 then
		Citizen.CreateThread(function()
			Citizen.Wait(3000)
			TriggerClientEvent('esx_scoreboard:toggleID', playerId, false)
		end)
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, false)
	end

	TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end

function UpdatePing()
	for k,v in pairs(connectedPlayers) do
		v.ping = GetPlayerPing(k)
		TriggerClientEvent('status:updatePing', k, v.ping)
	end
	TriggerClientEvent('esx_scoreboard:updatePing', -1, connectedPlayers)
end

RegisterCommand('screfresh', function(source, args, user)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then

			AddPlayersToScoreboard()

		else

			TriggerClientEvent('chatMessage', source, "[CONSOLE]", {255, 0, 0}, " ^0Shoma ^1Admin ^0nistid!")

		end

end, false)

RegisterCommand('sctoggle', function(source, args, user)

	local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then

			TriggerClientEvent('esx_scoreboard:toggleID', source)
			
		else

			TriggerClientEvent('chatMessage', source, "[CONSOLE]", {255, 0, 0}, " ^0Shoma ^1Admin ^0nistid!")

		end

end, false)

