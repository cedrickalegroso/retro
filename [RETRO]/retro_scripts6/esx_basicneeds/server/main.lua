ESX = nil

TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	
	TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)

	TriggerClientEvent('esx:showNotification', source, _U('used_water'))
end)

ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	--TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Eating Cupcake')
end)

ESX.RegisterUsableItem('hersheys', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hersheys', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
--	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Eating hersheys')
end)

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
--	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Eating burger')
end)

ESX.RegisterUsableItem('sandwhich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwhich', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
--	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Eating sandwhich')
end)


ESX.RegisterUsableItem('rccola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rccola', 1)

	
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Drinking RC COLA')
end)

ESX.RegisterUsableItem('pepsibp', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pepsibp', 1)

	
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Drinking Pepsi')
end)


ESX.RegisterUsableItem('yakult', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('yakult', 1)

	
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Drinking yakult')
end)



ESX.RegisterUsableItem('orange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('orange', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_orange'))
end)

ESX.RegisterUsableItem('grapes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grapes', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grapes'))
end)

ESX.RegisterUsableItem('apple', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('apple', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_apple'))
end)

ESX.RegisterUsableItem('banana', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('banana', 1)

	TriggerClientEvent('esx_basicneeds:onEat', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_banana'))
end)

ESX.RegisterUsableItem('gatorade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gatorade', 1)

	TriggerClientEvent('esx_basicneeds:onDrink', source)
	--Citizen.Wait(10000)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_gatorade'))
end)

TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local target = tonumber(args[1])
		
		-- is the argument a number?
		if target ~= nil then
			
			-- is the number a valid player?
			if GetPlayerName(target) then
				print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing a player!')
				TriggerClientEvent('esx_basicneeds:healPlayer', target)
				TriggerClientEvent('MF_SkeletalSystem:HealBones', target, "all")
				TriggerClientEvent('chatMessage', target, "HEAL", {223, 66, 244}, "You have been healed!")
			else
				TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Player not found!")
			end
		else
			TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Incorrect syntax! You must provide a valid player ID")
		end
	else
		-- heal source
		TriggerClientEvent('MF_SkeletalSystem:HealBones', source, "all")
		print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing!')
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})