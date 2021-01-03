-----LEDUN#8815-------


ESX = nil
local camp = false
local camping = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)

local prevtent = 0
local prevfire = 0
RegisterNetEvent('eon:campfire')
AddEventHandler('eon:campfire', function()
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("prop_beach_fire"), x+3.2, y+0.4, z, true, false, true)
    if prevfire ~= 0 then
        SetEntityAsMissionEntity(prevfire)
        DeleteObject(prevfire)
        prevfire = 0
    end
    TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', -1, false)
        prevfire = prop
        ClearPedTasksImmediately(PlayerPedId())
	
end)

RegisterCommand('camp', function(source, args, rawCommand)
    ESX.TriggerServerCallback('camp:item', function(qtty,deletecamp)
        if qtty > 0 and deletecamp ~= 0  then
            if prevtent ~= 0 then
                SetEntityAsMissionEntity(prevtent)
                DeleteObject(prevtent)
                prevtent = 0
            end
            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.95))
            local tents = {
                'prop_skid_tent_01',
                'prop_skid_tent_01b',
                'prop_skid_tent_03',
            }
            local randomint = math.random(1,3)
            local tent = GetHashKey(tents[randomint])
            local prop = CreateObject(tent, x, y, z, true, false, true)
            OpenCamp() -- Functions
            prevtent = prop
            ClearPedTasksImmediately(PlayerPedId())
            TriggerEvent('eon:campfire')
            camping = true


        else 
            exports['mythic_notify']:DoHudText('error', 'You need camping equipment to camp!')
        end
    end)
end, false)                   
      
--kampkaldır

RegisterCommand('campdel', function(source, args, rawCommand)
    if prevtent ~= 0 then
        CloseCamp()
        SetEntityAsMissionEntity(prevtent)
        DeleteObject(prevtent)
        prevtent = 0
        TriggerEvent('eon:campfiredel')
        ClearPedTasksImmediately(PlayerPedId())
	    
    end
end, false)



RegisterNetEvent('eon:campfiredel')
AddEventHandler('eon:campfiredel', function()
    if prevfire == 0 then
      --  TriggerEvent('chatMessage', '', {255,255,255}, '^8Error: ^0no previous campfire spawned, or your previous campfire has already been deleted.')
    else
        SetEntityAsMissionEntity(prevfire)
        DeleteObject(prevfire)
        prevfire = 0
    end
end)

---------------------------------
function OpenCamp()

    TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true)
    exports['progressBars']:startUI(31000, "Setting up Camp")
    Citizen.Wait(30000)
    exports['mythic_notify']:DoHudText('success', 'Setting up camp success.')

    --[[
 TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true)
    exports['progressBars']:startUI(31000, "Kamp kuruyorsun..")
    Citizen.Wait(30000)
    exports['mythic_notify']:DoHudText('success', 'Kamp kuruldu.')


      TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 31000,
        label = "Setting up Camp",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@world_human_gardener_plant@male@base",
            anim = "base",
        },
        prop = {
            model = "",
        }
    }, function(status)
        if not status then
            exports['mythic_notify']:DoHudText('success', 'Setting up camp success.')
        end
    end)
    ]]--
   
    --ClearPedTasks(PlayerPedId())

  
end
function CloseCamp()
    TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true)
    exports['progressBars']:startUI(31000, "Removing Camp")
    Citizen.Wait(30000)
    exports['mythic_notify']:DoHudText('success', 'Camo removed successfuly.')
    --ClearPedTasks(PlayerPedId())
end
----------------------------------
