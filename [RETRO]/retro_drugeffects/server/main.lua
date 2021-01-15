ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('weed', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('weed', 2)

	TriggerClientEvent('esx_status:add', source, 'drug', 166000)
	TriggerClientEvent('esx_drugeffects:onMarijuana', source)
end)

ESX.RegisterUsableItem('opium', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('opium', 2)

	TriggerClientEvent('esx_status:add', source, 'drug', 249000)
	TriggerClientEvent('esx_drugeffects:onOpium', source)
end)

ESX.RegisterUsableItem('meth', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('meth', 2)

	TriggerClientEvent('esx_status:add', source, 'drug', 333000)
	TriggerClientEvent('esx_drugeffects:onMeth', source)
end)

ESX.RegisterUsableItem('coke', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coke', 2)

	TriggerClientEvent('esx_status:add', source, 'drug', 499000)
	TriggerClientEvent('esx_drugeffects:onCoke', source)
end)

ESX.RegisterUsableItem('packaged_apple', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('packaged_apple', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 499000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 499000)
	TriggerClientEvent('esx_drugeffects:onpackaged_apple', source)
end)


ESX.RegisterUsableItem('packaged_banana', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('packaged_banana', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 499000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 499000)
	TriggerClientEvent('esx_drugeffects:onpackaged_banana', source)
end)


ESX.RegisterUsableItem('packaged_grapes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('packaged_grapes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 499000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 499000)
	TriggerClientEvent('esx_drugeffects:onpackaged_grapes', source)
end)


ESX.RegisterUsableItem('packaged_orange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('packaged_orange', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 499000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 499000)
	TriggerClientEvent('esx_drugeffects:onpackaged_orange', source)
end)




ESX.RegisterUsableItem('xanax', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('xanax', 2)

	TriggerClientEvent('esx_status:remove', source, 'drug', 249000)
end)
