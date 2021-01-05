local cJ = false
local eJE = false
local isInInventory = false
local isFrozen;

RegisterNetEvent('freeze:freezePlayer')
AddEventHandler('freeze:freezePlayer', function()
    isFrozen = not isFrozen
end)
--ESX base


local time = 10000

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("retro_scripts:emsbed1")
AddEventHandler("retro_scripts:emsbed1", function(tPID, source)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -448.35134887695,-283.72018432617,35.833194732666, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 21)

	

	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "Hospitalized",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@gangops@morgue@table@",
            anim = "body_search",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            emsbed1done(pP)
        end
    end)

--	TaskPlayAnim(pP, "anim@gangops@morgue@table@", "body_search", 8.0, -8, -1, 49, 0, 0, 0, 0)

--[[
	Citizen.Wait(500)
	ExecuteCommand('e sit')
	TriggerEvent('freeze:freezePlayer')
	

    ExecuteCommand('e passout3')

	exports["taskbar"]:taskBar(100000, "You are under hospital arrest.")
	Citizen.Wait(10000)
	

	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')
]]--


end)

function emsbed1done(pP)
    SetEntityCoords(PlayerPedId(pP), -448.35134887695,-283.72018432617,35.833194732666, true, true, true, false)
    SetEntityHeading(PlayerPedId(pP), 21)
end







RegisterNetEvent("retro_scripts:emsbed2")
AddEventHandler("retro_scripts:emsbed2", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -451.35906982422,-285.08215332031,35.833198547363, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 21)

	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "Hospitalized",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@gangops@morgue@table@",
            anim = "body_search",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            SetEntityCoords(PlayerPedId(pP), -451.35906982422,-285.08215332031,35.833198547363, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 21)
        
        end
    end)

	--[[
	Citizen.Wait(500)
	ExecuteCommand('e sit')
	TriggerEvent('freeze:freezePlayer')
	

    ExecuteCommand('e passout3')

	exports["taskbar"]:taskBar(100000, "You are under hospital arrest.")
	Citizen.Wait(10000)
	

	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')
	]]--

end)



RegisterNetEvent("retro_scripts:emsbed3")
AddEventHandler("retro_scripts:emsbed3", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -454.97229003906,-286.40310668945,35.833225250244, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 21)

	
	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "Hospitalized",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@gangops@morgue@table@",
            anim = "body_search",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            SetEntityCoords(PlayerPedId(pP), -454.97229003906,-286.40310668945,35.833225250244, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 21)
        end
    end)


	--[[
Citizen.Wait(500)
	ExecuteCommand('e sit')
	TriggerEvent('freeze:freezePlayer')
	

    ExecuteCommand('e passout3')

	exports["taskbar"]:taskBar(100000, "You are under hospital arrest.")
	Citizen.Wait(10000)
	

	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')
	]]--

	

end)


RegisterNetEvent("retro_scripts:emsbed4")
AddEventHandler("retro_scripts:emsbed4", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -459.11019897461,-279.70425415039,35.835056304932, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 205.1)

	
	
	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "Hospitalized",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@gangops@morgue@table@",
            anim = "body_search",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            SetEntityCoords(PlayerPedId(pP), -459.11019897461,-279.70425415039,35.835056304932, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 205.1)
        
        end
    end)

	--[[
Citizen.Wait(500)
	ExecuteCommand('e sit')
	TriggerEvent('freeze:freezePlayer')
	

    ExecuteCommand('e passout3')

	exports["taskbar"]:taskBar(100000, "You are under hospital arrest.")
	Citizen.Wait(10000)
	

	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')
	]]--
	
	

end)


RegisterNetEvent("retro_scripts:emsbed5")
AddEventHandler("retro_scripts:emsbed5", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -455.12258911133,-278.18957519531,35.835098266602, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 205.1)

	
	TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "Hospitalized",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@gangops@morgue@table@",
            anim = "body_search",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            SetEntityCoords(PlayerPedId(pP), -455.12258911133,-278.18957519531,35.835098266602, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 205.1)
        end
	end)
	
	--[[
Citizen.Wait(500)
	ExecuteCommand('e sit')
	TriggerEvent('freeze:freezePlayer')
	

    ExecuteCommand('e passout3')

	exports["taskbar"]:taskBar(100000, "You are under hospital arrest.")
	Citizen.Wait(10000)
	

	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')
	]]--

	

end)


RegisterNetEvent("retro_scripts:morgue")
AddEventHandler("retro_scripts:morgue", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -455.12258911133,-278.18957519531,35.835098266602, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 205.1)

	
	ExecuteCommand('e passout3')
	
	

	Citizen.Wait(5000)

	TriggerEvent('freeze:freezePlayer')
	exports['progressBars']:startUI(time, "You are under hospital arrest. ")
	Citizen.Wait(time)
	TriggerEvent('freeze:freezePlayer')
	  
	ExecuteCommand('e c')

end)