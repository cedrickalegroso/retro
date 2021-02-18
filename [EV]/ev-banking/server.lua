--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source
	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
	else


		local tax = amount * 0.2
        local amount = amount + tax

		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))

		TriggerEvent('esx_society:depositTax',xPlayer.source, 'government', tax)

		local name = GetPlayerName(source)
        local message = name..' deposit '..amount
        local color = 56108
        local webhook = 'https://discord.com/api/webhooks/811776174471774249/qZZ_wkVq5rzmkfzt-JhZmjnhUBNKYr7pfZGblGCS_manuigVGC6ZYlLXyiDAWzdhMUWt'
        
        sendToDiscord (name,message,color, webhook)  


		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have successfully deposited $" .. amount .. ""})
		TriggerEvent('ls:AddInLog', 'bank', 'deposit', xPlayer.name, _source, xPlayer.identifier, amount, xPlayer.getAccount('bank').money)
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
	else

		local tax = amount * 0.2
        local amount = amount + tax

		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)

		TriggerEvent('esx_society:depositTax',xPlayer.source, 'government', tax)
	

		local name = GetPlayerName(source)
        local message = name..' withdrawn '..amount
        local color = 56108
        local webhook = 'https://discord.com/api/webhooks/811776174471774249/qZZ_wkVq5rzmkfzt-JhZmjnhUBNKYr7pfZGblGCS_manuigVGC6ZYlLXyiDAWzdhMUWt'
        
        sendToDiscord (name,message,color, webhook)  


		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have successfully withdrawn $".. amount .. ""})
		TriggerEvent('ls:AddInLog', 'bank', 'withdraw', xPlayer.name, _source, xPlayer.identifier, amount, base - amount)
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('banking:updateBalance', _source, balance, true)
	--TriggerClientEvent('banking:viewBalance', _source)
end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(to)
	if xPlayer == nil then return end
	if zPlayer ~= nil then
	local balance = 0
	balance = xPlayer.getAccount('bank').money

	
	if tonumber(_source) == tonumber(to) then

		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "You cannot transfer funds to yourself." })
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then

			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid amount." })
		else
			xPlayer.removeAccountMoney('bank', tonumber(amountt))
			zPlayer.addAccountMoney('bank', tonumber(amountt))

			local name = GetPlayerName(source)
			local message = name..' transfered '..amount..' to '..zPlayer.identifier
			local color = 56108
			local webhook = 'https://discord.com/api/webhooks/811776174471774249/qZZ_wkVq5rzmkfzt-JhZmjnhUBNKYr7pfZGblGCS_manuigVGC6ZYlLXyiDAWzdhMUWt'
			
			sendToDiscord (name,message,color, webhook)  
	
	
 
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = "You have transfered $".. amountt .. " to " .. to .. "."})
			TriggerClientEvent('mythic_notify:client:SendAlert', to, { type = 'inform', text = "You have received $" .. amountt .. " from " .. _source .. "." })
			local message = xPlayer.name..'['.._source..']['..xPlayer.identifier..'] \n Transfered \n'..amountt..'to '..zPlayer.name..'['..to..']['..zPlayer.identifier..'] \n'..xPlayer.name..' new balance: '..xPlayer.getAccount('bank').money..'\n'..zPlayer.name..' new balance: '..zPlayer.getAccount('bank').money
			local tShamsiDate = exports["time"]:ShamsiDateCalculator()
			local title = "[ "..(tShamsiDate[2]).."/"..(tShamsiDate[1]).."/"..(tShamsiDate[0]).."   "..(tShamsiDate[6]).."  "..(tShamsiDate[0]).." "..(tShamsiDate[4]).."   "..os.date('%H:%M:%S').." ]"
			TriggerEvent('ls:AddInLog2', 'bank', title, message)
		end
		
	end
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = "Invalid Account." }) end
end)
--[[
RegisterCommand('cash', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    cash = xPlayer.getMoney()
    TriggerClientEvent('st-banking:updateCash', source, cash)
end)

RegisterCommand('bank', function(source, args, rawCommand)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    bank = xPlayer.getAccount('bank').money
    TriggerClientEvent('st-banking:updateBank', source, bank)
end)
--]]


function sendToDiscord (name,message,color, webhook)  
	local DiscordWebHook = webhook
	local DISCORD_IMAGE	= "https://i.imgur.com/DZUmmWL.png"
  
  local embeds = {
	  {
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "Discord Bot by Cedrick  Alegroso",
			  ["icon_url"] = DISCORD_IMAGE,
		 },
	  }
  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end



