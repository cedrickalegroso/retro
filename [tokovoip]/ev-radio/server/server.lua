ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('radio', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('radioGui', source)
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	Wait(100)
	if item.name == 'radio' then
		if xPlayer.getInventoryItem(item.name).count < 1 then
			TriggerEvent("TokoVoip:removePlayerFromAllRadio", source)
		end
	end
end)

RegisterServerEvent('radio:firstSpawn')
AddEventHandler('radio:firstSpawn', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('radio').count > 0 then
		if xPlayer.job.name == 'police' then
			TriggerEvent("TokoVoip:addPlayerToRadio", 1, source)
		elseif xPlayer.job.name == 'ambulance' then
			TriggerEvent("TokoVoip:addPlayerToRadio", 3, source)
		end
	end
end)
