ESX                           = nil

local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)
        if IsControlJustReleased(0, 38) then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if IsPlayerDead(closestPlayer) then 
                if closestPlayer ~= -1 and closestDistance <= 3.0 then
                    local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
                    exports['mythic_progbar']:Progress({
                        name = "unique_action_name",
                        duration = 1600,
                        label = 'Searching Player',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = dict,
                            anim = anim,
                            flags = 49,
                        },
                    }, function(cancelled)
                        if not cancelled then
                            OpenBodySearchMenu(closestPlayer)
                        end
                    end)
                end
            end
        end
    end
end)


function OpenBodySearchMenu(closestPlayer)
    TriggerEvent("inventory:search")
end