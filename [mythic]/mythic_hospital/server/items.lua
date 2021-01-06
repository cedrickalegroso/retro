ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('gauze', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gauze', 1)
	TriggerClientEvent('mythic_hospital:items:gauze', source)
end)

ESX.RegisterUsableItem('bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bandage', 1)
	TriggerClientEvent('mythic_hospital:items:bandage', source)
	TriggerClientEvent("mythic_hospital:heal", source, "bandage")
end)

ESX.RegisterUsableItem('firstaid', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('firstaid', 1)
	TriggerClientEvent('mythic_hospital:items:firstaid', source)
	TriggerClientEvent("mythic_hospital:heal", source, "medkit")
end)

ESX.RegisterUsableItem('medkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('medkit', 1)
	TriggerClientEvent('mythic_hospital:items:medkit', source)
	TriggerClientEvent("mythic_hospital:heal", source, "medkit")
end)

ESX.RegisterUsableItem('vicodin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vicodin', 1)
	TriggerClientEvent('mythic_hospital:items:vicodin', source)
	TriggerClientEvent("mythic_hospital:heal", source, "medkit")
end)

ESX.RegisterUsableItem('hydrocodone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hydrocodone', 1)
	TriggerClientEvent('mythic_hospital:items:hydrocodone', source)
	TriggerClientEvent("mythic_hospital:heal", source, "medkit")
end)


RegisterCommand("wew", function(source)

	print('Use Morph')
	local xPlayer = ESX.GetPlayerFromId(source)
	print(xPlayer)
	TriggerClientEvent("retro_scripts:notBleed", source)
	TriggerClientEvent("mythic_hospital:client:RemoveBleed", source)
    
end)

ESX.RegisterUsableItem('morphine', function(source)
	print('Use Morph')
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('morphine', 1)
	TriggerClientEvent("retro_scripts:notBlee", source)
--	TriggerClientEvent('mythic_hospital:items:morphine', source)
--	TriggerClientEvent("mythic_hospital:heal", source, "medkit")
end)

