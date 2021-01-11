Citizen.CreateThread(function()
    TriggerEvent('retro-inventory:RegisterInventory', {
        name = 'glovebox',
        label = _U('glove'),
        slots = 5
    })
end)
