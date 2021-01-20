local drops = {}

Citizen.CreateThread(function()
    TriggerEvent('retro-inventory:RegisterInventory', {
        name = 'drop',
        label = _U('drop'),
        slots = 50
    })
end)

MySQL.ready(function()
    if Config.DeleteDropsOnStart then
        MySQL.Async.execute('DELETE FROM disc_inventory WHERE type = \'drop\'')
    end
end)

function updateDrops()
    print('Fetching')
    MySQL.Async.fetchAll('SELECT * FROM disc_inventory WHERE type = \'drop\'', {}, function(results)
        print('Fetched ' .. tostring(#results))
        drops = {}
        for k, v in pairs(results) do
            drops[v.owner] = json.decode(v.data)
        end
        table.print(drops)
        TriggerClientEvent('retro-inventory:updateDrops', -1, drops)
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    updateDrops()
end)

AddEventHandler('esx:playerLoaded', function(data)
    Citizen.Wait(0)
    updateDrops()
end)

RegisterServerEvent('retro-inventory:modifiedInventory')
AddEventHandler('retro-inventory:modifiedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('retro-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('retro-inventory:savedInventory')
AddEventHandler('retro-inventory:savedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('retro-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('retro-inventory:createdInventory')
AddEventHandler('retro-inventory:createdInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('retro-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('retro-inventory:deletedInventory')
AddEventHandler('retro-inventory:deletedInventory', function(identifier, type)
    if type == 'drop' then
        drops[identifier] = nil
        TriggerClientEvent('retro-inventory:updateDrops', -1, drops)
    end
end)
