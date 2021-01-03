ESX = nil
-- polo © License | Discord : https://discord.gg/czW6Jqj
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)
-- polo © License | Discord : https://discord.gg/czW6Jqj
RegisterServerEvent('polo_drugssell:sellweedpooch')
AddEventHandler('polo_drugssell:sellweedpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local weedpooch = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "weed_pooch" then
			weedpooch = item.count
		end
	end
    
    if weedpooch > 0 then
        xPlayer.removeInventoryItem('weed_pooch', 10)
        xPlayer.addMoney(1000)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have a Weed Pouch! Move Ya Zebi..')
    end
end)

RegisterServerEvent('polo_drugssell:sellmorphinepooch')
AddEventHandler('polo_drugssell:sellmorphinepooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local morphinepooch = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "morphine_pooch" then
			morphinepooch = item.count
		end
	end
    
    if morphinepooch > 0 then
        xPlayer.removeInventoryItem('morphine_pooch', 10)
        xPlayer.addMoney(650)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have a Morphine! Aze Move fast before I get on my nerves.')
    end
end)

RegisterServerEvent('polo_drugssell:sellopiumpooch')
AddEventHandler('polo_drugssell:sellopiumpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local opiumpooch = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "opium_pooch" then
			opiumpooch = item.count
		end
	end
    
    if opiumpooch > 0 then
        xPlayer.removeInventoryItem('opium_pooch', 10)
        xPlayer.addMoney(985)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have an Opium Pouch! Move Ya Zebi.')
    end
end)

RegisterServerEvent('polo_drugssell:sellecstasypooch')
AddEventHandler('polo_drugssell:sellecstasypooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local ecstasypooch = 0

	for i=1, #xPlayer.inventory, 50 do
		local item = xPlayer.inventory[i]

		if item.name == "ecstasy_pooch" then
			ecstasypooch = item.count
		end
	end
    
    if ecstasypooch > 0 then
        xPlayer.removeInventoryItem('ecstasy_pooch', 10)
        xPlayer.addMoney(2500)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have Ecstasy! Aze Move fast before I get on my nerves.')
    end
end)

RegisterServerEvent('polo_drugssell:sellamphetaminespooch')
AddEventHandler('polo_drugssell:sellamphetaminespooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local amphetaminespooch = 0

	for i=1, #xPlayer.inventory, 5 do
		local item = xPlayer.inventory[i]

		if item.name == "amphetamines_pooch" then
			amphetaminespooch = item.count
		end
	end
    
    if amphetaminespooch > 0 then
        xPlayer.removeInventoryItem('amphetamines_pooch', 10)
        xPlayer.addMoney(235)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You come to my place without drugs! Crazy the camp before I kill you !')
    end
end)

RegisterServerEvent('polo_drugssell:sellmethpooch')
AddEventHandler('polo_drugssell:sellmethpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local methpooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "meth_pooch" then
			methpooch = item.count
		end
	end
    
    if methpooch > 0 then
        xPlayer.removeInventoryItem('meth_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have a Meth Pouch! Move Ya Zebi.')
    end
end)

RegisterServerEvent('polo_drugssell:sellcokepooch')
AddEventHandler('polo_drugssell:sellcokepooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local cokepooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "coke_pooch" then
			cokepooch = item.count
		end
	end
    
    if cokepooch > 0 then
        xPlayer.removeInventoryItem('coke_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You come to my place without drugs! Crazy the camp before I kill you!')
    end
end)

RegisterServerEvent('polo_drugssell:selllsdpooch')
AddEventHandler('polo_drugssell:selllsdpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local lsdpooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "lsd_pooch" then
			lsdpooch = item.count
		end
	end
    
    if lsdpooch > 0 then
        xPlayer.removeInventoryItem('lsd_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have an LSD Pouch! Move Ya Zebi.')
    end
end)

RegisterServerEvent('polo_drugssell:sellketaminepooch')
AddEventHandler('polo_drugssell:sellketaminepooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local ketaminepooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "ketamine_pooch" then
			ketaminepooch = item.count
		end
	end
    
    if ketaminepooch > 0 then
        xPlayer.removeInventoryItem('ketamine_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have Ketamine! Aze Move fast before I get on my nerves.')
    end
end)

RegisterServerEvent('polo_drugssell:sellleanpooch')
AddEventHandler('polo_drugssell:sellleanpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local leanpooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "lean_pooch" then
			leanpooch = item.count
		end
	end
    
    if leanpooch > 0 then
        xPlayer.removeInventoryItem('lean_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have a Meth Pouch! Move Ya Zebi.')
    end
end)

RegisterServerEvent('polo_drugssell:sellheroinepooch')
AddEventHandler('polo_drugssell:sellheroinepooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local heroinepooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "heroine_pooch" then
			heroinepooch = item.count
		end
	end
    
    if heroinepooch > 0 then
        xPlayer.removeInventoryItem('heroine_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You come to my place without drugs! Crazy the camp before I kill you !')
    end
end)

RegisterServerEvent('polo_drugssell:sellcrackpooch')
AddEventHandler('polo_drugssell:sellcrackpooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local crackpooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "crack_pooch" then
			crackpooch = item.count
		end
	end
    
    if crackpooch > 0 then
        xPlayer.removeInventoryItem('crack_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don\'t have a Crack Pouch! Move Ya Zebi.')
    end
end)

RegisterServerEvent('polo_drugssell:sellmarijuanapooch')
AddEventHandler('polo_drugssell:sellmarijuanapooch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local marijuanapooch = 0

	for i=1, #xPlayer.inventory, 3 do
		local item = xPlayer.inventory[i]

		if item.name == "marijuana_pooch" then
			marijuanapooch = item.count
		end
	end
    
    if marijuanapooch > 0 then
        xPlayer.removeInventoryItem('marijuana_pooch', 10)
        xPlayer.addMoney(950)
    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'You have no Marijuana! Aze Move fast before I get on my nerves.')
    end
end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end