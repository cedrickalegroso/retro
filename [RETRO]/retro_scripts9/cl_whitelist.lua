local blipsEms               = {}
local blipsGroove            = {}


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    
    print('debug '..PlayerData.job)
	
	Citizen.Wait(5000)
	TriggerServerEvent('retro_scripts:updateEmsBlips')
end)




-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsEms, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('retro_scripts:updateEmsBlips')
AddEventHandler('retro_scripts:updateEmsBlips', function()
	
	-- Refresh all blips
	for k, existingBlip in pairs(blipsEms) do
		RemoveBlip(existingBlip)
	end
	
	-- Clean the blip table
	blipsEms = {}


	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'ambulance' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)






RegisterNetEvent("retro_scripts:initpolice")
AddEventHandler('retro_scripts:initpolice', function(source)
    print('[RETRO_SCRIPTS] initializing police stuffs') 

    --radio
    exports["rp-radio"]:GivePlayerAccessToFrequency(2) 

     --blips
     TriggerEvent('esx_policejob:updateBlip')

    --notif
    exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for Police activated')
end)

RegisterNetEvent("retro_scripts:initems")
AddEventHandler('retro_scripts:initems', function(source)
    print('[RETRO_SCRIPTS] initializing ems stuffs') 

    --radio
    exports["rp-radio"]:GivePlayerAccessToFrequency(1) 

    --blips
    TriggerEvent('esx_ambulancejob:updateBlip')

    --notif
    exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for EMS activated')
end)

RegisterNetEvent("retro_scripts:fly")
AddEventHandler('retro_scripts:fly', function(source)
    local pP = GetPlayerPed(-1)
    local coords    = GetEntityCoords(pP)

    SetEntityCoords(PlayerPedId(pP), coords.x, coords.y, coords.z + 20, true, true, true, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

RegisterNetEvent("retro_scripts:combatlogpasir")
AddEventHandler('retro_scripts:combatlogpasir', function(source)
    local pP = GetPlayerPed(-1)
    local coords    = GetEntityCoords(pP)
    DoScreenFadeOut(2000)
    SetEntityCoords(PlayerPedId(pP), -497.53268432617, -342.3623046875, 34.501720428467 , true, true, true, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    DoScreenFadeIn(2000)
end)





RegisterNetEvent("retro_scripts:initgroove")
AddEventHandler('retro_scripts:initgroove', function(source)
    print('[RETRO_SCRIPTS] initializing groove stuffs') 

    --radio
    exports["rp-radio"]:GivePlayerAccessToFrequency(3) 


      --blips
      TriggerEvent('retro_mechanic:updateBlip')


      --notif
      exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for Groove activated')
end)


Citizen.CreateThread(function()
	--Wait(2*60000) -- Delay first spawn.
	while true do
		ClearAllBrokenGlass()
		ClearAllHelpMessages()
		LeaderboardsReadClearAll()
		ClearBrief()
		ClearGpsFlags()
		ClearPrints()
		ClearSmallPrints()
		ClearReplayStats()
		LeaderboardsClearCacheData()
		ClearFocus()
		ClearHdArea()
		print("RETRO CITY FPS BOOT RUNNING ~Cedrick Alegroso Malakaz~")
		Wait(1*60000)
	end
end)


--blindfire

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then 
            DisableControlAction(2, 24, true) 
            DisableControlAction(2, 142, true)
            DisableControlAction(2, 257, true)
        end
    end
end)
