ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('ev-sellshop:sellring')
AddEventHandler('ev-sellshop:sellring', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ring = 0
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "ring" then
			ring = item.count
		end
	end

	if ring > 0 then
		xPlayer.removeInventoryItem('ring', 1)
		xPlayer.addMoney(350)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$350 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a ring to sell!")
	end
end)

			

RegisterServerEvent('ev-sellshop:sellrolex')
AddEventHandler('ev-sellshop:sellrolex', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local rolex = 0
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "rolex" then
			rolex = item.count
		end
	end			

	if rolex > 0 then
		xPlayer.removeInventoryItem('rolex', 1)
		xPlayer.addMoney(1150)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$1150 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a rolex to sell!")
	end
end)

RegisterServerEvent('ev-sellshop:sell5ct_gold_chain')
AddEventHandler('ev-sellshop:sell5ct_gold_chain', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local chainfive = 0
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "5ct_gold_chain" then
			chainfive = item.count
		end
	end			

	if chainfive > 0 then
		xPlayer.removeInventoryItem('5ct_gold_chain', 1)
		xPlayer.addMoney(800)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$800 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a 5ct_gold_chain to sell!")
	end
end)

RegisterServerEvent('ev-sellshop:sell2ct_gold_chain')
AddEventHandler('ev-sellshop:sell2ct_gold_chain', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tchain = 0
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "2ct_gold_chain" then
			tchain = item.count
		end
	end			

	if tchain > 0 then
		xPlayer.removeInventoryItem('2ct_gold_chain', 1)
		xPlayer.addMoney(500)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$500 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a 2ct_gold_chain to sell!")
	end
end)

RegisterServerEvent('ev-sellshop:sellpsp')
AddEventHandler('ev-sellshop:sellpsp', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local psp = 0
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "psp" then
			psp = item.count
		end
	end			

	if psp > 0 then
		xPlayer.removeInventoryItem('psp', 1)
		xPlayer.addMoney(350)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$350 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a psp to sell!")
	end
end)

			

RegisterServerEvent('ev-sellshop:sellcamera')
AddEventHandler('ev-sellshop:sellcamera', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local camera = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "camera" then
			camera = item.count
		end
	end		

	if camera > 0 then
		xPlayer.removeInventoryItem('camera', 1)
		xPlayer.addMoney(135)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$135 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a camera to sell!")
	end
end)

			

RegisterServerEvent('ev-sellshop:sellgoldNecklace')
AddEventHandler('ev-sellshop:sellgoldNecklace', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local goldNecklace = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "goldNecklace" then
			goldNecklace = item.count
		end
	end

	if goldNecklace > 0 then
		xPlayer.removeInventoryItem('goldNecklace', 1)
		xPlayer.addMoney(345)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$345 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a goldNecklace to sell!")
	end
end)

RegisterServerEvent('ev-sellshop:selllaptop')
AddEventHandler('ev-sellshop:selllaptop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local laptop = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "laptop" then
			laptop = item.count
		end
	end

	if laptop > 0 then
		xPlayer.removeInventoryItem('laptop', 1)
		xPlayer.addMoney(1750)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$1750 added")
	else 
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a laptop to sell!")
	end
end)
			

RegisterServerEvent('ev-sellshop:sellsamsungS10')
AddEventHandler('ev-sellshop:sellsamsungS10', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local samsungS10 = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		if item.name == "samsungS10" then
			samsungS10 = item.count
		end
	end
				
	if samsungS10 > 0 then
		xPlayer.removeInventoryItem('samsungS10', 1)
		xPlayer.addMoney(925)
		TriggerClientEvent('esx:showNotification', xPlayer.source, "$925 added")
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a samsung to sell!")
	end
end)


RegisterServerEvent('ev-sellshop:gold')
AddEventHandler('ev-sellshop:gold', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gold = 0
    for i=1, #xPlayer.inventory, 1 do
        local item = xPlayer.inventory[i]
        if item.name == "gold" then
            gold = item.count
        end
    end

    if gold > 0 then
        xPlayer.removeInventoryItem('gold', 1)
        xPlayer.addMoney(2500)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "$2500 added")
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a Gold to sell!")
    end
end)


RegisterServerEvent('ev-sellshop:diamond')
AddEventHandler('ev-sellshop:diamond', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local diamond = 0
    for i=1, #xPlayer.inventory, 1 do
        local item = xPlayer.inventory[i]
        if item.name == "diamond" then
            diamond = item.count
        end
    end

    if diamond > 0 then
        xPlayer.removeInventoryItem('diamond', 1)
        xPlayer.addMoney(5000)
        TriggerClientEvent('esx:showNotification', xPlayer.source, "$5000 added")
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, "You don't have a diamond to sell!")
    end
end)