ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local robbableItems = {
    [1] =  {id = 'fixtool', name = 'Repair Kit', quantity = 1}, 
    [2] =  {id = 'phone', name = 'Phone', quantity = 1}, 
    [3] =  {id = 'ring', name = 'Ring', quantity = 1}, 
    [4] = {id = 'psp', name = 'PSP', quantity = 1}, 
    [5] = {id = '2ct_gold_chain', name = '2CT Gold Chain', quantity = 1},
    [6] = {id = '5ct_gold_chain', name = '5CT Gold Chain', quantity = 1},
    [7] = {id = '8ct_gold_chain', name = '8CT Gold Chain', quantity = 1},
    [8] = {id = '10ct_gold_chain', name = '10CT Gold Chain', quantity = 1},
}

ESX.RegisterUsableItem('advancedlockpick', function(source) --Hammer high time to unlock but 100% call cops
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('HouseRobbery:attempt', source, xPlayer.getInventoryItem('advancedlockpick').count)
    PerformHttpRequest('https://discordapp.com/api/webhooks/743140170425041027/Fs6VPtVjizqu7oI0yRVIUKycBVUP6cmddT96hSOgwI7dH92T6Rn4_wfnm9xT7p9mvdTZ', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ used Advanced Lockpick: **" .. source .. "** **on a House** "}), { ['Content-Type'] = 'application/json' })
end)
   
RegisterServerEvent('HouseRobbery:removeLockpick')
AddEventHandler('HouseRobbery:removeLockpick', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('advancedlockpick', 1)
    TriggerClientEvent('notification', source, 'Your lockpick has bent out of shape')
end)
   
RegisterServerEvent('HouseRobbery:giveMoney')
AddEventHandler('HouseRobbery:giveMoney', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(100, 500)
    xPlayer.addMoney(cash)
    TriggerClientEvent('notification', source, 'You have found $'..cash)
    PerformHttpRequest('https://discordapp.com/api/webhooks/743140170425041027/Fs6VPtVjizqu7oI0yRVIUKycBVUP6cmddT96hSOgwI7dH92T6Rn4_wfnm9xT7p9mvdTZ', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Got Money: **" .. cash .. "** **.** "}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('HouseRobbery:searchItem')
AddEventHandler('HouseRobbery:searchItem', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}

    for i=1, math.random(1, 2) do
        item = robbableItems[math.random(1, #robbableItems)]
            if tonumber(item.id) == 0 and not gotID[item.id] then
                gotID[item.id] = true
                item.quantity = math.random(50,400)
                xPlayer.addMoney(item.quantity)
                TriggerClientEvent('notification', source, 'You found $'..item.quantity)
            elseif item.isWeapon and not gotID[item.id] then
                gotID[item.id] = true
                xPlayer.addWeapon(item.id, 50)
                TriggerClientEvent('notification', source, 'You found a '..item.name)
                PerformHttpRequest('https://discordapp.com/api/webhooks/743140170425041027/Fs6VPtVjizqu7oI0yRVIUKycBVUP6cmddT96hSOgwI7dH92T6Rn4_wfnm9xT7p9mvdTZ', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.isWeapon .. "** **.** "}), { ['Content-Type'] = 'application/json' })
            elseif not gotID[item.id] then
                gotID[item.id] = true
                xPlayer.addInventoryItem(item.id, item.quantity)
                TriggerClientEvent('notification', source, 'You have found '..item.quantity..'x '..item.name)
                PerformHttpRequest('https://discordapp.com/api/webhooks/743140170425041027/Fs6VPtVjizqu7oI0yRVIUKycBVUP6cmddT96hSOgwI7dH92T6Rn4_wfnm9xT7p9mvdTZ', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.id .. "** **.** "}), { ['Content-Type'] = 'application/json' })
        end
    end
end)
   

RegisterServerEvent("robbery:SellItem")
AddEventHandler("robbery:SellItem", function(amountToSell,totalSellPrice,itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel(itemName)
	if xPlayer.getInventoryItem(itemName).count >= amountToSell then
		xPlayer.addMoney(totalSellPrice)
		xPlayer.removeInventoryItem(itemName, amountToSell)
		TriggerClientEvent("notification",source,"You sold "..amountToSell.."x "..itemLabel.." for $"..totalSellPrice .. ".")
	else
		TriggerClientEvent("notification",source,"You dont have enough items.", 2)
	end
end)
