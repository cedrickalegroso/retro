ESX = nil
local cuffed = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("cuffs", function(source)
    TriggerClientEvent("handscuff:checkCuff", source, 0)
end)

ESX.RegisterUsableItem("keys", function(source)
    TriggerClientEvent("handscuff:checkCuff", source, 1)
end)



RegisterServerEvent("handscuff:handcuff")
AddEventHandler("handscuff:handcuff",function(player,state)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    cuffed[player]=state
end)

ESX.RegisterServerCallback("handscuff:isCuffed",function(source,cb,target)
    cb(cuffed[target]~=nil and cuffed[target])
end)

RegisterServerEvent("handscuff:item")
AddEventHandler("handscuff:item",function(type,item,count)
    count = count or 1
    local xPlayer = ESX.GetPlayerFromId(source)

    if type == 'add' then
    xPlayer.addInventoryItem(item,count)
    elseif type == 'remove' then
    xPlayer.removeInventoryItem(item,count)
    end
end)