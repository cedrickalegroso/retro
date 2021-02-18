-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Banks = ConfigBankrob.Banks
Safes = ConfigBankrob.Safes
		
RegisterServerEvent('t1ger_bankrobbery:SafeDataSV')
AddEventHandler('t1ger_bankrobbery:SafeDataSV', function(type, id, state)
	local xPlayer = ESX.GetPlayerFromId(source)
	if type == "robbed" then
		Safes[id].robbed = state
	elseif type == "failed" then
		Safes[id].failed = state
	end
	Wait(100)
	TriggerClientEvent('t1ger_bankrobbery:SafeDataCL', -1, type, id, state)
end)

ESX.RegisterUsableItem('VaultDoorBypass1', function(source)
--	print('hacks')
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent('retro_scripts:triggerfirstHack', source)
end)

ESX.RegisterUsableItem('VaultDoorBypass2', function(source)
	--print('hacks')
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent('retro_scripts:triggerSecondHack', source)
end)

ESX.RegisterUsableItem('VaultDoorCrowBar', function(source)
	--print('hacks')
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent('retro_scripts:OpenVaultDoor', source)
end)

ESX.RegisterUsableItem('BankDriller', function(source)
	--print('hacks')
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent('retro_scripts:BankDriller', source)
end)



RegisterServerEvent('retro_scripts:callcopsonbankrob')
AddEventHandler('retro_scripts:callcopsonbankrob', function(i, j)

	TriggerEvent('InteractSound_SV:PlayOnAll','pow',0.5)

	TriggerEvent('isPriority')


	Citizen.Wait(5000)


    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Bank Robbery in progress at '..j..' Postal Code '..i..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
	})

	Citizen.Wait(2500)

	TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Bank Robbery in progress at '..j..' Postal Code '..i..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
	})

	Citizen.Wait(2500)

	TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Bank Robbery in progress at '..j..' Postal Code '..i..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
	})
	
	
	
	
	


	

end)

RegisterServerEvent('t1ger_bankrobbery:ResetCurrentBankSV')
AddEventHandler('t1ger_bankrobbery:ResetCurrentBankSV', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	-- Banks:
    for i = 1, #Banks do
		Banks[i].inUse = false
		Banks[i].keypads[1].hacked = false
		Banks[i].keypads[2].hacked = false
		Banks[i].deskDoor.lockpicked = false
		for k,v in pairs(Banks[i].deskCash) do
			v.robbed = false
		end
		Banks[i].powerBox.disabled = false
		if i == 8 then
			Banks[i].safe.cracked = false
		end
	end
	
	alertTime = nil

	-- Safes:
	for i = 1, #Safes do
		Safes[i].robbed = false
		Safes[i].failed = false
    end
	TriggerClientEvent('t1ger_bankrobbery:ResetCurrentBankCL', -1)

	-- Secure News:
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'journalist' then
			TriggerClientEvent('chatMessage', xPlayers[i], "^2News: | ^7", { 128, 128, 128 }, string.sub('The bank has been secured. All banks are now open again!',0))
		end
	end
end) 

-- Drill:
ESX.RegisterServerCallback('t1ger_bankrobbery:drillItem',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(ConfigBankrob.DrillItem).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(ConfigBankrob.DrillItem, 1)
		cb(true)
	else
		cb(false)
	end
end)

-- Hacker Device:
ESX.RegisterServerCallback('t1ger_bankrobbery:hackerDevice',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(ConfigBankrob.HackItem ).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(ConfigBankrob.HackItem ,1)
		cb(true)
	else
		cb(false)
	end
end)

-- Lockpick:
ESX.RegisterServerCallback('t1ger_bankrobbery:lockpickItem',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(ConfigBankrob.LockPick).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(ConfigBankrob.LockPick ,1)
		cb(true)
	else
		cb(false)
	end
end)

-- Hammer & WireCutter:
ESX.RegisterServerCallback('t1ger_bankrobbery:hammerWireCutterItem',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(ConfigBankrob.HammerWireCutter).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(ConfigBankrob.HammerWireCutter,1)
		cb(true)
	else
		cb(false)
	end
end)

-- Access Card:
ESX.RegisterServerCallback('t1ger_bankrobbery:accessCard',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(ConfigBankrob.AccessCard).count >= 1
	if gotItem then
		cb(true)
	else
		cb(false)
	end
end)

-- Callback to remove item:
ESX.RegisterServerCallback('t1ger_bankrobbery:removeItem',function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(item).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(item,1)
	end
end)

-- Safe Reward:
RegisterServerEvent('t1ger_bankrobbery:safeReward')
AddEventHandler('t1ger_bankrobbery:safeReward', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	-- Chance to keep drill:
	math.randomseed(GetGameTimer())
	if math.random(0,100) <= ConfigBankrob.ChanceToKeepDrill then 
		xPlayer.addInventoryItem(ConfigBankrob.DrillItem,1)
	end

	-- Money:
	for k,v in pairs(ConfigBankrob.SafeMoneyReward) do
		local amount = (math.random(v.minAmount, v.maxAmount) * 1000)
		if v.dirtyCash then
			xPlayer.addAccountMoney('black_money', amount)
		else
			xPlayer.addMoney(amount)
		end
	end

	-- Item Reward:
	for k,v in pairs(ConfigBankrob.SafeItemRewards) do
		if math.random(0,100) <= v.chance then
			local itemAmount = math.random(v.min,v.max)
			local itemName = ''
			if ConfigBankrob.HasItemLabel then
				itemName = ESX.GetItemLabel(v.item)
			else
				itemName = tostring(v.item)
			end
			xPlayer.addInventoryItem(v.item,itemAmount)
			TriggerClientEvent('t1ger_bankrobbery:ShowNotifyESX', xPlayer.source, (Lang['drill_item_not_usable']:format(itemName,itemAmount)))
		end
	end
end)

RegisterServerEvent('t1ger_bankrobbery:giveItem')
AddEventHandler('t1ger_bankrobbery:giveItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item,1)
end)

-- Event for police alerts
RegisterServerEvent('t1ger_bankrobbery:PoliceNotifySV')
AddEventHandler('t1ger_bankrobbery:PoliceNotifySV', function(targetCoords, streetName, name)
	TriggerClientEvent('t1ger_bankrobbery:PoliceNotifyCL', -1, (Lang['police_notify']):format(name,streetName))
	TriggerClientEvent('t1ger_bankrobbery:PoliceNotifyBlip', -1, targetCoords)
end)

-- Event for police silent alarm
RegisterServerEvent('t1ger_bankrobbery:SilentAlarmSV')
AddEventHandler('t1ger_bankrobbery:SilentAlarmSV', function(name)
	TriggerClientEvent('t1ger_bankrobbery:PoliceNotifyCL', -1, (Lang['silent_alarm']):format(name))
end)

-- get police online:
function getPoliceCount()
	local xPlayers = ESX.GetPlayers()
	PoliceOnline = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			PoliceOnline = PoliceOnline + 1
		end
	end
	TriggerClientEvent('t1ger_bankrobbery:getPoliceCount', -1, PoliceOnline)
	SetTimeout(30 * 1000, getPoliceCount)
end

-- Cash Grab:
RegisterServerEvent('t1ger_bankrobbery:deskCashSV')
AddEventHandler('t1ger_bankrobbery:deskCashSV', function(id, num, state)
    local xPlayer = ESX.GetPlayerFromId(source)
	Banks[id].deskCash[num].robbed = state
	TriggerClientEvent('t1ger_bankrobbery:deskCashCL', -1, id, num, state)
	-- money reward:
	local amount = math.random(Banks[id].deskCash[num].reward.min,Banks[id].deskCash[num].reward.max)
	if Banks[id].deskCash[num].reward.dirty then
		xPlayer.addMoney(amount)
	else
		xPlayer.addAccountMoney('black_money', amount)
	end 
	--TriggerClientEvent('t1ger_bankrobbery:ShowNotifyESX', xPlayer.source, (Lang['drill_item_not_usable']:format(itemName,itemAmount)))
	TriggerClientEvent('t1ger_bankrobbery:ShowNotifyESX', xPlayer.source, "~g~"..amount.."$~s~ in cash taken from the desk")
end)

-- ## POWER BOX ## --

alertTime = nil
RegisterServerEvent('t1ger_bankrobbery:powerBoxSV')
AddEventHandler('t1ger_bankrobbery:powerBoxSV', function(id, state, timer)
    local xPlayer = ESX.GetPlayerFromId(source)
	Banks[id].powerBox.disabled = state
	alertTime = timer
	TriggerClientEvent('t1ger_bankrobbery:powerBoxCL', -1, id, state, alertTime)
end)

RegisterServerEvent('t1ger_bankrobbery:addRobTimeSV')
AddEventHandler('t1ger_bankrobbery:addRobTimeSV', function(timer)
    local xPlayer = ESX.GetPlayerFromId(source)
	alertTime = timer
	TriggerClientEvent('t1ger_bankrobbery:addRobTimeCL', -1, alertTime)
end)

