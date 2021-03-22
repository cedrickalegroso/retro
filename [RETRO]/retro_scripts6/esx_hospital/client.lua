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


	--SetEntityCoords(PlayerPedId(pP), -448.35134887695,-283.72018432617,35.833194732666, true, true, true, false)
    SetEntityCoords(PlayerPedId(pP), 309.23175048828,-577.31573486328,44.203968048096, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 158.60)

    --
	

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
    SetEntityCoords(PlayerPedId(pP), 310.32293701172,-577.82897949219,43.28405380249, true, true, true, false)
    SetEntityHeading(PlayerPedId(pP), 131.60)
end







RegisterNetEvent("retro_scripts:emsbed2")
AddEventHandler("retro_scripts:emsbed2", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), 313.98254394531,-579.00396728516,44.20397567749, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 156.60)

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
            SetEntityCoords(PlayerPedId(pP), 314.76141357422,-579.62506103516,43.28405380249, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 131.60)
        
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


	SetEntityCoords(PlayerPedId(pP), 307.70944213867,-581.77581787109,44.20397567749, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 336.2)

	
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
            SetEntityCoords(PlayerPedId(pP), 308.80499267578,-581.98712158203,43.284049987793, true, true, true, false)
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


	SetEntityCoords(PlayerPedId(pP), 311.09112548828,-582.99462890625,44.20397567749, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 344.1)

	
	
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
            SetEntityCoords(PlayerPedId(pP), 312.12442016602,-583.232421875,43.283168792725, true, true, true, false)
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


	SetEntityCoords(PlayerPedId(pP), 354.58609008789,-600.11712646484,44.215702056885, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 66.1)

	
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
            SetEntityCoords(PlayerPedId(pP), 354.53186035156,-599.14916992188,43.284038543701, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 205.1)
        end
	end)
	

end)
RegisterNetEvent("retro_scripts:emsbed6")
AddEventHandler("retro_scripts:emsbed6", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), 361.43786621094,-581.26843261719,44.192794799805, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 66.1)

	
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
            SetEntityCoords(PlayerPedId(pP), 361.47384643555,-580.2373046875,43.283908843994, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 84.1)
        end
	end)
	

end)

RegisterNetEvent("retro_scripts:emsbed7")
AddEventHandler("retro_scripts:emsbed7", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -485.45489501953,-339.9602355957,70.448524475098, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), -11.1)

	
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
            SetEntityCoords(PlayerPedId(pP), -484.6247253418,-340.37936401367,69.52294921875, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), -80.1)
        end
	end)
	

end)

RegisterNetEvent("retro_scripts:emsbed8")
AddEventHandler("retro_scripts:emsbed8", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -475.65866088867,-340.48858642578,70.448516845703, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 79.1)

	
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
            SetEntityCoords(PlayerPedId(pP), -475.99203491211,-339.52642822266,69.522933959961, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), -16.1)
        end
	end)
	

end)

RegisterNetEvent("retro_scripts:emsbed9")
AddEventHandler("retro_scripts:emsbed9", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -477.44903564453,-332.02722167969,70.438537597656, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), -86.1)

	
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
            SetEntityCoords(PlayerPedId(pP), -477.51141357422,-332.81677246094,69.522933959961, true, true, true, false)
            SetEntityHeading(PlayerPedId(pP), 6.1)
        end
	end)
	

end)




RegisterNetEvent("retro_scripts:morgue")
AddEventHandler("retro_scripts:morgue", function(tPID)
	local pP = GetPlayerPed(-1)


	SetEntityCoords(PlayerPedId(pP), -455.12258911133,-278.18957519531,35.835098266602, true, true, true, false)
	SetEntityHeading(PlayerPedId(pP), 205.1)

	
	ExecuteCommand('e passout3')
	
	

	Citizen.Wait(5000)

    TriggerEvent('freeze:freezePlayer')
    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 100000,
        label = "You are under hospital arrest.",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "",
            anim = "",
        },
        prop = {
            model = "",
        }
    }, function(status)
        if not status then
            TriggerEvent('freeze:freezePlayer')
	  
            ExecuteCommand('e c')
        end
	end)

	

end)