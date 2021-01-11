local secondarySearchInventory = {
    type = 'player',
    owner = '',
    seize = true
}
local secondaryStealInventory = {
    type = 'player',
    owner = '',
    steal = true
}


RegisterNetEvent('retro-inventory:openPlayerInventory')
AddEventHandler('retro-inventory:openPlayerInventory', function(id)
    ESX.TriggerServerCallback('retro-inventory:getIdentifier', function(identifier)
        secondarySearchInventory.owner = identifier
        openInventory(secondarySearchInventory)
    end, id)
end)

RegisterNetEvent('retro-inventory:openForAdmin')
AddEventHandler('retro-inventory:openForAdmin', function(identifier)
    secondarySearchInventory.owner = identifier
    openInventory(secondarySearchInventory)
end)

RegisterNetEvent('retro-inventory:search')
AddEventHandler('retro-inventory:search', function()
    local player = ESX.GetPlayerData()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local searchPlayerPed = GetPlayerPed(closestPlayer)
        ESX.TriggerServerCallback('retro-inventory:getIdentifier', function(identifier)
            secondarySearchInventory.owner = identifier
            openInventory(secondarySearchInventory)
        end, GetPlayerServerId(closestPlayer))
    end
end)

RegisterNetEvent('retro-inventory:steal')
AddEventHandler('retro-inventory:steal', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local searchPlayerPed = GetPlayerPed(closestPlayer)
        if IsEntityPlayingAnim(searchPlayerPed, 'random@mugging3', 'handsup_standing_base', 3) then
            ESX.TriggerServerCallback('retro-inventory:getIdentifier', function(identifier)
                secondaryStealInventory.owner = identifier
                openInventory(secondaryStealInventory)
            end, GetPlayerServerId(closestPlayer))
        end
    end
end)

RegisterNetEvent('retro-inventory:loot')
AddEventHandler('retro-inventory:loot', function()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local searchPlayerPed = GetPlayerPed(closestPlayer)
        if (IsEntityDead(searchPlayerPed)) or IsEntityPlayingAnim ( searchPlayerPed, "dead", "dead_a", 3) then
            ESX.TriggerServerCallback('retro-inventory:getIdentifier', function(identifier)
                secondaryStealInventory.owner = identifier
                openInventory(secondaryStealInventory)
            end, GetPlayerServerId(closestPlayer))
        end
    end
end)

RegisterNUICallback('StealCash', function(data)
    TriggerServerEvent('retro-inventory:StealCash', data)
end)
RegisterNUICallback('SeizeCash', function(data)
    TriggerServerEvent('retro-inventory:SeizeCash', data)
end)