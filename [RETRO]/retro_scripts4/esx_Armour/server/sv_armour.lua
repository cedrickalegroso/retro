ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end



	

RegisterCommand("testdeath", function(source)
	TriggerClientEvent('reload_death:revive', source) 

   
end)

RegisterCommand("adminradioaccess", function(source)

	local grupos = getIdentity(source)

	print(grupos.group)

	if grupos.group == 'admin' or grupos.group == 'superadmin' then
		TriggerClientEvent('retro_scripts:giveadminaccess', source)
	end

   
end)


RegisterCommand("v", function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
   local count

  if xPlayer.getJob().name == 'police' or  xPlayer.getJob().name == 'ambulance' then 
	 count = xPlayer.getInventoryItem('armor2').count
	 
	 if count > 0 then
		TriggerClientEvent('esx_armour:armor2', source)
		xPlayer.removeInventoryItem('armor2', 1)
	 else 
		TriggerClientEvent('retro_scripts:noarmor', source)
	 end

  else 
	count = xPlayer.getInventoryItem('armor').count


	if count > 0 then
		
	print('player have more than 0 armor he can use it now!')
		TriggerClientEvent('esx_armour:armor', source)
		xPlayer.removeInventoryItem('armor', 1)
	else 
		TriggerClientEvent('retro_scripts:noarmor', source)
	end

  end
	
end)




RegisterServerEvent('retro_scripts:checkforradio')
AddEventHandler('retro_scripts:checkforradio', function()
	

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	count = xPlayer.getInventoryItem('radio').count

	print(count)

	if count > 0 then 
		TriggerClientEvent('Radio.Set', source, true)
		TriggerClientEvent('Radio.Toggle', source)
		--TriggerClientEvent('retro_scripts:noradio', source)
	else 
		TriggerClientEvent('Radio.Set', source, false)
		--TriggerClientEvent('Radio.Toggle', source)
		TriggerClientEvent('retro_scripts:noradio', source)
	end
end)




--[[


RegisterServerEvent('esx_armour:armorremove2')
AddEventHandler('esx_armour:armorremove2', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('armor2', 1)
end)


ESX.RegisterUsableItem('armor', function(source)
	TriggerClientEvent('esx_armour:armor', source)
end)


ESX.RegisterUsableItem('armor2', function(source)
	TriggerClientEvent('esx_armour:armor2', source)
end)


RegisterServerEvent('esx_armour:armorremove')
AddEventHandler('esx_armour:armorremove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('armor', 1)
end)


]]--



RegisterServerEvent('esx_armour:handcuffremove')
AddEventHandler('esx_armour:handcuffremove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('handcuff', 1)
end)



RegisterServerEvent('esx_armour:handcuff')
AddEventHandler('esx_armour:handcuff', function(target)
  TriggerClientEvent('esx_armour:handcuff', target)
end)

ESX.RegisterUsableItem('handcuff', function(target)
	TriggerClientEvent('esx_armour:handcuff', target)
end)

AddEventHandler('esx_armour:cutting_pliers', function(target)
  TriggerClientEvent('esx_armour:cutting_pliers', target)
end)

ESX.RegisterUsableItem('cutting_pliers', function(target)
	TriggerClientEvent('esx_armour:cutting_pliers', target)
end)