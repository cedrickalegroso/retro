ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


TriggerEvent('esx_society:registerSociety', 'starbucks', 'starbucks', 'society_starbucks', 'society_starbucks', 'society_starbucks', {type = 'public'})

RegisterNetEvent('esx_starbucksjob:giveitem')
AddEventHandler('esx_starbucksjob:giveitem', function(item, amount)
	local XPlayer = ESX.GetPlayerFromId(source)
	XPlayer.addInventoryItem(item, amount)
end)
