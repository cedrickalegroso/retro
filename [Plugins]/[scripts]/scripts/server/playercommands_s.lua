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

	TriggerClientEvent('chat:addMessage', _source, {
		template = '<div class="chat-message blue"><b>{0}</b> {1}</div>',
		args = { "INFO", 'You are working as: ' .. job .. ' - ' .. jobgrade }
    })
    
end, {help = "Check what you are working at"})

TriggerEvent('es:addCommand', 'dirty', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money   = getBlackMoneyFromUser(_source)
    TriggerClientEvent('chatMessage', source, "INFO", false, 'You currently have $' .. black_money .. ' dirty money in your wallet')
end, {help = "Check how much dirty money you have"})


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

        TriggerClientEvent('chatMessage', source, "INFO", false, 'You currently have $' .. money .. ' in the society account')
                                                                    
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", 'error', 'Access not granted!')
                                                                            
    end
end, {help = "Check how much money is stored in your society account"})

function GetSociety(name)
    
    TriggerEvent('esx_society:getSocieties', function(societies) 
        RegisteredSocieties = societies
    end)

  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end

  return nil
end