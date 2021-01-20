Citizen.CreateThread(function()
    TriggerEvent('retro-inventory:RegisterInventory', {
        name = 'stash',
        label = _U('stash'),
        slots = 100
    })
end)
