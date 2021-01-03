ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
	
TriggerEvent('es:addCommand', 'job', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label

    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'עבודתך היא: ' .. job .. ' - ' .. jobgrade})

end, {help = "Check what's your job"})


RegisterCommand('salary', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local jobsalary = xPlayer.job.grade_salary
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = "₪" .. jobsalary .. ' : המשכורת שלך היא'})
end, false)

RegisterCommand('ping', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local ping = GetPlayerPing(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = ping .. ' : הפינג שלך הוא'})
end, false)


TriggerEvent('es:addCommand', 'cash', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local wallet 		= getMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. wallet .. ' ~s~in your wallet~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. wallet .. ' מזומן'})
end, {help = "Check how much is in your wallet"})

TriggerEvent('es:addCommand', 'bank', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bank 			= getBankFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. bank .. ' ~s~in your bank~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. bank .. ' בתוך הבנק'})
end, {help = "Check how much is in your bank"})

TriggerEvent('es:addCommand', 'dirty', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money 	= getBlackMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. black_money .. ' ~s~dirty money in your wallet~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. black_money .. ' כסף שחור'})
end, {help = "Check how much dirty money you have"})

TriggerEvent('es:addCommand', 'info', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local bank 			= getBankFromUser(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'עבודתך היא: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. wallet .. ' מזומן'})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. bank .. ' בתוך הבנק'})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. black_money .. ' כסף שחור'})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך ₪' .. money .. ' בחברה'})
																	
	else

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'עבודתך היא: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. wallet .. ' מזומן'})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. bank .. ' בתוך הבנק'})
                Citizen.Wait(1500)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך כרגע ₪' .. black_money .. ' כסף שחור'})
																	
	end
end, {help = "Check your society's balance"})

TriggerEvent('es:addCommand', 'society', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
                --TriggerClientEvent('esx:showNotification', _source, 'You currently have ~g~$~g~' .. money .. ' ~s~in the society account~g~ ')
	        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'יש לך ₪' .. money .. ' בחברה'})
																	
	else

	        --TriggerClientEvent('esx:showNotification', _source, '~r~Access not granted!')
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'אין לך אישור לבדוק את הכסף במניות!'})
																			
	end
end, {help = "Check your society's balance"})

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end
