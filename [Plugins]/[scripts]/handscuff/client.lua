ESX = nil
local IsHandcuffed = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

RegisterNetEvent("handscuff:checkCuff")
AddEventHandler("handscuff:checkCuff", function(type)
    local player, distance = ESX.Game.GetClosestPlayer()
    if distance~=-1 and distance<=3.0 then
        ESX.TriggerServerCallback("handscuff:isCuffed",function(cuffed)
            if not cuffed and type == 0 then
                local playerheading = GetEntityHeading(GetPlayerPed(-1))
                local playerlocation = GetEntityForwardVector(PlayerPedId())
                local playerCoords = GetEntityCoords(GetPlayerPed(-1))
                local target_id = GetPlayerServerId(player)
                TriggerServerEvent('police:server:CuffPlayer', target_id, playerheading, playerCoords, playerlocation)
                TriggerServerEvent("handscuff:handcuff",GetPlayerServerId(player),true)
                TriggerServerEvent("handscuff:item",'add', 'keys', 1)
                TriggerServerEvent("handscuff:item",'remove', 'cuffs', 1)
            elseif cuffed and type == 1 then
                local playerheading = GetEntityHeading(GetPlayerPed(-1))
                local playerlocation = GetEntityForwardVector(PlayerPedId())
                local playerCoords = GetEntityCoords(GetPlayerPed(-1))
                local target_id = GetPlayerServerId(player)
                TriggerServerEvent('police:server:UnCuffPlayer', target_id, playerheading, playerCoords, playerlocation)
                TriggerServerEvent("handscuff:handcuff",GetPlayerServerId(player),false)
                TriggerServerEvent("handscuff:item",'remove', 'keys', 1)
                TriggerServerEvent("handscuff:item",'add', 'cuffs', 1)
            end
        end,GetPlayerServerId(player))
    else
        ESX.ShowNotification("~r~No players nearby!")
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if IsHandcuffed then
            SetEnableHandcuffs(playerPed, true)
            DisablePlayerFiring(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
            SetPedCanPlayGestureAnims(playerPed, false)
            DisplayRadar(false)
            DisableControlAction(0, 140, true)
        end
        if not IsHandcuffed and not IsControlEnabled(0, 140) then EnableControlAction(0, 140, true) end
    end
end)

Citizen.CreateThread(function()
    local wasgettingup = false
    while true do
        Citizen.Wait(250)
        if IsHandcuffed then
            local ped = GetPlayerPed(-1)
            if not IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) and not IsEntityPlayingAnim(ped, "mp_arrest_paired", "crook_p2_back_right", 3) or (wasgettingup and not IsPedGettingUp(ped)) then ESX.Streaming.RequestAnimDict("mp_arresting", function() TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0) end) end
            wasgettingup = IsPedGettingUp(ped)
        end
    end
end)