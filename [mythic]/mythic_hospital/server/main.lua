local beds = {
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },    { x = 307.93, y = -581.65, z = 43.11, h = -20.0, taken = false, model = -1091386327 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },    { x = 313.72, y = -579.09, z = 43.01, h = 80.0, taken = false, model = -1091386327 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },    { x = 326.97, y = -576.229, z = 43.11, h = -20.0, taken = false, model = -1091386327 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },    { x = 350.80, y = -591.72, z = 43.11, h = 160.0, taken = false, model = 2117668672 },
    { x = -455.13882446289, y = -277.99584960938, z = 35.835075378418, h = -20.0, taken = false, model = 1631638868 },
}

local bedsTaken = {}
local injuryBasePrice = 500
ESX             = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})

AddEventHandler('playerDropped', function()
    if bedsTaken[source] ~= nil then
        beds[bedsTaken[source]].taken = false
    end
end)

AddEventHandler('playerDropped', function()
    if bedsTaken[source] ~= nil then
        beds[bedsTaken[source]].taken = false
    end
end)

RegisterServerEvent('mythic_hospital:server:RequestBed')
AddEventHandler('mythic_hospital:server:RequestBed', function()
    for k, v in pairs(beds) do
        if not v.taken then
            v.taken = true
            bedsTaken[source] = k
            TriggerClientEvent('mythic_hospital:client:SendToBed', source, k, v)
            return
        end
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No Beds Available' })
end)

ESX.RegisterServerCallback('mythic_hospital:server:shahar', function(money)
    local xPlayer = ESX.GetPlayerFromId(_source)
 ---   local inventory = xPlayer.getInventory().name
  --  local loadout = xPlayer.getLoadout().name
--    local inventory2 = xPlayer.getInventory().count
local money = xPlayer.getMoney()
    
end)

RegisterServerEvent('mythic_hospital:server:RPRequestBed')
AddEventHandler('mythic_hospital:server:RPRequestBed', function(plyCoords)
    local foundbed = false
    for k, v in pairs(beds) do
        local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
        if distance < 3.0 then
            if not v.taken then
                v.taken = true
                foundbed = true
                TriggerClientEvent('mythic_hospital:client:RPSendToBed', source, k, v)
                return
            else
                TriggerClientEvent('esx:showNotification', source, '~r~That Bed Is Taken')
            end
        end
    end

    if not foundbed then
        TriggerClientEvent('esx:showNotification', source, '~r~Not Near A Hospital Bed')
    end
end)

RegisterServerEvent('savePlayer')
AddEventHandler('savePlayer', function()
ESX.SavePlayers()
end)

RegisterServerEvent('mythic_hospital:server:EnteredBed')
AddEventHandler('mythic_hospital:server:EnteredBed', function()
    local src = source

    -- YOU NEED TO IMPLEMENT YOUR FRAMEWORKS BILLING HERE
    local xPlayer = ESX.GetPlayerFromId(src)
    
    TriggerClientEvent('mythic_hospital:client:FinishServices', src)
end)

RegisterServerEvent('mythic_hospital:server:LeaveBed')
AddEventHandler('mythic_hospital:server:LeaveBed', function(id)
    beds[id].taken = false
end)

RegisterServerEvent('mythic_hospital:pay')
AddEventHandler('mythic_hospital:pay', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeBank(money)
end)

