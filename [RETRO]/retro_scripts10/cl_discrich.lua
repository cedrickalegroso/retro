ConfigDiscord = {}
ConfigDiscord.ClientID = 763715352680202270 -- Put your discord bot client id here
ConfigDiscord.PlayerCount = 64
ConfigDiscord.PlayerText = "Players" -- Player text. Example Players 10/32
ConfigDiscord.ResourceTimer = 5 -- Time in witch resource updates in seconds
ConfigDiscord.UseESXIdentity = true -- Uses ESX Identity name not steam name

ESX = nil
local jobGrade = ''
local job = ''
local playerName = nil
local playerLoaded = false
-- ESX Stuff----
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	playerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('discord:client:setPresence')
AddEventHandler('discord:client:setPresence', function(_playerName)
	playerName = _playerName
   	SetRichPresence('ID:' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. ' | ' .. playerName .. ' | ' ..' '.. ConfigDiscord.PlayerText ..' ' .. #GetActivePlayers() .. '/' .. tostring(ConfigDiscord.PlayerCount))
end)

Citizen.CreateThread(function()
	while true do			
		
		-- Checking if player is loaded	
		if playerLoaded then
			if ESX.PlayerData.job then
			 		--Setting players image to reflect their job
					SetDiscordRichPresenceAssetSmall(ESX.PlayerData.job.name)
					job = ESX.PlayerData.job.label
					jobGrade = ESX.PlayerData.job.grade_label
					--Setting the job text
					SetDiscordRichPresenceAssetSmallText(job .. " - " .. jobGrade)	
				else			
				Citizen.Wait(500)
			end
		end					
			
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(763715352680202270)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo_retro')
		
		
		
		if ConfigDiscord.UseESXIdentity and playerLoaded then			
			TriggerServerEvent(('discord:server:setName'))
		else
			SetRichPresence('ID:' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. ' | ' .. GetPlayerName(PlayerId()) .. ' | ' ..' '.. ConfigDiscord.PlayerText ..' ' .. #GetActivePlayers() .. '/' .. tostring(ConfigDiscord.PlayerCount))
        end

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('RETRO CITY SEASON 2 Badge')
	
        --It updates every five seconds just in case.
		Citizen.Wait(ConfigDiscord.ResourceTimer*1000)
	end
end)