RegisterNetEvent("mythic_hospital:items:gauze")
AddEventHandler("mythic_hospital:items:gauze", function(item)
    Progressbar("spawn_object", "Place object..", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "cone")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerEvent('notification', "Canceled..", 2)
    end)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1500,
        label = "Packing Wounds",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:RemoveBleed')
        end
    end)

end)

RegisterNetEvent("mythic_hospital:items:bandage")
AddEventHandler("mythic_hospital:items:bandage", function(item)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1000,
        label = "Using Bandage",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_stat_pack_01",
        }
    }, function(status)
        if not status then
            local maxHealth = GetEntityMaxHealth(PlayerPedId())
			local health = GetEntityHealth(PlayerPedId())
			local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 16))
			SetEntityHealth(PlayerPedId(), newHealth)
            TriggerEvent('mythic_hospital:client:RemoveBleed')
        end
    end)

    
end)

RegisterNetEvent("mythic_hospital:items:firstaid")
AddEventHandler("mythic_hospital:items:firstaid", function(item)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1000,
        label = "Using First Aid",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_stat_pack_01",
        }
    }, function(status)
        if not status then
            local maxHealth = GetEntityMaxHealth(PlayerPedId())
			local health = GetEntityHealth(PlayerPedId())
			local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
			SetEntityHealth(PlayerPedId(), newHealth)
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
    end)


end)

RegisterNetEvent("mythic_hospital:items:medkit")
AddEventHandler("mythic_hospital:items:medkit", function(item)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1000,
        label = "Using Medkit",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_stat_pack_01",
        }
    }, function(status)
        if not status then
            local maxHealth = GetEntityMaxHealth(PlayerPedId())
            local health = GetEntityHealth(PlayerPedId())
            SetEntityHealth(PlayerPedId(), 200)
            TriggerEvent('mythic_hospital:client:RemoveBleed')
            TriggerEvent('mythic_hospital:client:ResetLimbs')
        end
    end)


end)

RegisterNetEvent("mythic_hospital:items:vicodin")
AddEventHandler("mythic_hospital:items:vicodin", function(item)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1000,
        label = "Taking Vicodin",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
        },
        prop = {
            model = "prop_cs_pills",
        }
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 1)
        end
    end)


    
end)

RegisterNetEvent("mythic_hospital:items:hydrocodone")
AddEventHandler("mythic_hospital:items:hydrocodone", function(item)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 1000,
        label = "Taking Hydrocodone",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
        },
        prop = {
            model = "prop_cs_pills",
        }
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 2)
        end
    end)
  
end)

RegisterNetEvent("mythic_hospital:items:morphine")
AddEventHandler("mythic_hospital:items:morphine", function(item)

    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = 2000,
        label = "Taking Oxy",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
        },
        prop = {
            model = "prop_cs_pills",
        }
    }, function(status)
        if not status then
              --     TriggerEvent('mythic_hospital:client:UsePainKiller', 3)
           TriggerEvent('mythic_hospital:client:RemoveBleed')
           TriggerEvent('mythic_hospital:client:ResetLimbs')
           TriggerEvent('retro_scripts:notBleed')
            --RegisterNetEvent('retro_scripts:notBleed')
        end
    end)


end)
