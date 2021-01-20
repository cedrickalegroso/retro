

  ESX = nil

  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  
  TriggerEvent('es:addCommand', 'a', function(source, args, user)
	
	local src = source
	if ESX.GetPlayerFromId(source).getGroup() == 'user' then return end

	GetDiscord(src,function(discord)
		for k,v in pairs(ESX.GetPlayers()) do
			local xPlayer = ESX.GetPlayerFromId(v)
			if xPlayer.getGroup() ~= 'user' then
				TriggerClientEvent('chat:addMessage', v, {
					template = '<div class="chat-message nonemergency"><b>Staff | {0}:</b> {1}</div>',
					args = { discord,table.concat(args, " ") }
				})
			end
	  	end
	end)
	
  end, {help = 'Chat Admins.'})
  

function GetDiscord(source,cb)
	local source = source
	local num = 0
	local num2 = GetNumPlayerIdentifiers(source)
	local discord = nil
	while num < num2 and not discord do
	local a = GetPlayerIdentifier(source, num)
	if string.find(a, "discord") then discord = string.sub(a, 9) end
		num = num+1
	end


	if not discord then
		cb(GetPlayerName(source))
	else
    	PerformHttpRequest("https://discordapp.com/api/users/"..discord, function(err, text, headers)
			if err == 200 then
				cb(json.decode(text).username .. '#' .. json.decode(text).discriminator)
			else
				cb(GetPlayerName(source))
			end

		end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot NzEyNjIzMjQ5MDQwNjA1Mjg1.XxoK-w.yXUPYOiMg1fBda1Adh8qO65cVz4"})
	end
end



RegisterCommand('say', function(source, args)
	if source == 0 then
		TriggerClientEvent('chatMessage', -1, "Console", "error", table.concat(args, " "))
	end
end)

TriggerEvent('es:addGroupCommand', 'setwaypoint', "superadmin", function(source, args, user)
	TriggerClientEvent('waypoint',source, tonumber(args[1]), tonumber(args[2]))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)