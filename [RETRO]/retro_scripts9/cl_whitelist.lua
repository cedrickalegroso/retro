
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
