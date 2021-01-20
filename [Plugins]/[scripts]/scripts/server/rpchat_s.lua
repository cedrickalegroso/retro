

ESX = nil
Config.Locale = 'en'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	
	if command_args[1] then
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message server"><b>[System]</b> no such command</div>',
			args = {}
		})
	end
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()
	end
end)

RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	
	GetDiscord(source,function(discord)
		TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message"><b>OOC | {0}:</b> {1}</div>',
            args = { discord, msg }
        })
	end)

end, false)


--Commands
TriggerEvent('es:addGroupCommand', 'staff', "superadmin", function(source, args, user)

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message nonemergency"><b>צוות השרת:</b> {0}</div>',
		args = { table.concat(args, " ") }
	})

end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Announce a message to the entire server", params = {{name = "announcement", help = "The message to announce"}}})

TriggerEvent('es:addGroupCommand', 'noam', "superadmin", function(source, args, user)

	TriggerClientEvent('chat:addMessage', -1, {
		template = "<div style='font-size: calc(2.1vw / 1.77777);display:display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(255, 175, 3, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn.discordapp.com/attachments/686512382369202177/754931493905891358/1200px-IsraelElectric.png' style='width:19px;height:15px;'></img></la></div>",
		args = { table.concat(args, " ") }
	})

end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Hevrat Hasmal", params = {{name = "noam", help = "The message to Noam"}}})


RegisterCommand('ad', function(source, args, rawCommand)
	if source == 0 then
		print('you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetCharacterName(source)
	
	if not name:find( "[^%d%.]" ) then
		TriggerClientEvent('chat:addMessage', -1, {
			template = "<div style='font-size: calc(2.1vw / 1.77777);display:display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(255, 175, 3, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn.discordapp.com/attachments/644631964774694942/686212556158664708/unknown.png' style='width:19px;height:15px;'></img></la></div>",
			args = { ( args.. ' ^*: ' .. name .. ' | יד2 ') }
		})
	else
		TriggerClientEvent('chat:addMessage', -1, {
			template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(255, 175, 3, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn.discordapp.com/attachments/644631964774694942/686212556158664708/unknown.png' style='width:26px;height:15px;'></img></la></div>",
			args = { ( '^*' .. 'מודעה | ' .. name .. '^r : '  .. args ) }
		})
	end

end, false)


RegisterCommand('news', function(source, args, rawCommand)
	if source == 0 then
		print('you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.name
	local group = xPlayer.getGroup()
	if job == "police" or group == "superadmin" then
		TriggerClientEvent('chat:addMessage', -1, {
			template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(255, 27, 10, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn.discordapp.com/attachments/695303500631900211/711725118598021211/shit.png' style='width:25px;height:23px;'></img></la></div>",
			args = { (  ' ^*' .. 'חדשות 12 : ^r' .. args) }
		})
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1System ', 'אין לך גישות לבצע פקודה זאת'} } )
	end
end, false)

RegisterCommand('police', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.name
	local group = xPlayer.getGroup()
	if job == "police" or group == "admin" or group == "superadmin" then

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message blue"><b>משטרת ישראל:</b> {0} ✯</div>',
			args = { table.concat(args, " ") }
		})

	else
		TriggerClientEvent('notification', source, "You\'re not an police.", 2)
	end
end)

RegisterCommand("ems",function(source,args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.job.name
	local group = xPlayer.getGroup()
	if job == "ambulance" or group == "admin" or group == "superadmin" then

		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message nonemergency"><b>מדא:</b> {0} ✡</div>',
			args = { table.concat(args, " ") }
		})

	else
		TriggerClientEvent('notification', source, "You\'re not an EMS.", 2)
	end
end)

TriggerEvent('es:addGroupCommand', 'dev', "superadmin", function(source, args, user)
	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message yellow"><b>צוות התכנות:</b> {0}</div>',
		args = { table.concat(args, " ") }
	})
end, false)


RegisterCommand('id', function(source)
	GetDiscord(source,function(discord)
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message red"><b>{0}</b> {1}</div>',
			args = { discord .. "- ID", source }
		})
	end)
end)

RegisterCommand('100', function(source,args)
	local args = table.concat(args, " ")
	TriggerClientEvent('100', -1,source,args, GetCharacterName(source))
end)


RegisterCommand('101', function(source,args)
	local args = table.concat(args, " ")
	TriggerClientEvent('101', -1,source,args, GetCharacterName(source))
end)


RegisterCommand('ic', function(source)
	GetDiscord(source,function(discord)
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message yellow"><b>{0}</b> {1}</div>',
			args = { discord .. "- Character", GetCharacterName(source) }
		})
	end)
end)


--DO NOT TOUCH THIS
function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	return ('%s %s'):format(result[1].firstname, result[1].lastname) or GetPlayerName(source)
end

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
