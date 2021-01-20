local ResetStress = false

RegisterServerEvent("qb-hud:Server:UpdateStress")
AddEventHandler('qb-hud:Server:UpdateStress', function(StressGain)
	local src = source
    local Player = ESX.GetPlayerFromId(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player["stress"] == nil then
                Player["stress"] = 0
            end
            newStress = Player["stress"] + StressGain
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
		TriggerClientEvent("hud:client:UpdateStress", src, newStress)
	end
end)

RegisterServerEvent('qb-hud:Server:GainStress')
AddEventHandler('qb-hud:Server:GainStress', function(amount)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player["stress"] == nil then
                Player["stress"] = 0
            end
            newStress = Player["stress"] + amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        TriggerClientEvent("hud:client:UpdateStress", src, newStress)
        TriggerClientEvent('notification', src, 'Gained stress', 1)
	end
end)

RegisterServerEvent('qb-hud:Server:RelieveStress')
AddEventHandler('qb-hud:Server:RelieveStress', function(amount)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player["stress"] == nil then
                Player["stress"] = 0
            end
            newStress = Player["stress"] - amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        TriggerClientEvent("hud:client:UpdateStress", src, newStress)
        TriggerClientEvent('notification', src, 'Stress lightened', 1)
	end
end)