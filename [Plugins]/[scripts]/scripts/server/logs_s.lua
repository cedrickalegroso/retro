local chat = 'https://discordapp.com/api/webhooks/742002638458978336/QkcZh2lMJDVpw-Y-sWuvsezvmGqwVJIa74HUNVnVZmIqsc2Flc_3HD5sKaJTXF8EV8DL'
local connect = 'https://discordapp.com/api/webhooks/742002519424892999/CD4duAgc_ugHzzHAl53Yt0n4E0DeC3STOc-aymgoXAmCgBbOORVkz5cR_Pqpm0GtRSFk'
local death = 'https://discordapp.com/api/webhooks/742001931815485480/_PbMDh8I2PGe3FbuRchRz0XnADqityxnqx7v0AElJ0-OVuc2albRPe6J6Q2Da66TVVOu'
AddEventHandler('chatMessage', function(source, name, message)
    PerformHttpRequest(chat, function(err, text, headers) end, 'POST', json.encode({username = name .. " | " .. GetPlayerIdentifiers(source)[1], content = message}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerConnecting', function()
    local identifiers = {discord = "", steam = "", license = "", ip = "", live = "", xbl = ""}
    local num = GetNumPlayerIdentifiers(source)

    for i = 0, num-1 do
        local a = GetPlayerIdentifier(source, i)
        local f = string.find(a, ":")
        if f then
            local b = string.sub(a, 1, f-1)
            identifiers[b] = a
        end
    end

    local name = GetPlayerName(source)
    local ServerName = GetConvar("sv_hostname")
    local guid = GetPlayerGuid(source)
    local ping = GetPlayerPing(source)
    local embed = {
        {
            ["color"] = "255600",
            ["title"] = "Player Connecting.",
            ["description"] = "**[Name]** "..name.."\n**[Ping]**: "..ping.."**\n[Player IP]**: "..identifiers.ip.."\n**[Guid]**: "..guid.."\n **[Discord]**: <@!" .. string.sub(identifiers.discord, 9) .. ">\n **[license]**: "..identifiers.license.."\n**[Steam id]**: "..identifiers.steam.. '\n**[Time]: ' ..os.date("%Y/%m/%d %X"),
        }
    }

    PerformHttpRequest(connect, function(err, text, headers) end, 'POST', json.encode({username = "Connection Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
    local identifiers = {discord = "", steam = "", license = "", ip = "", live = "", xbl = ""}
    local num = GetNumPlayerIdentifiers(source)

    for i = 0, num-1 do
        local a = GetPlayerIdentifier(source, i)
        local f = string.find(a, ":")
        if f then
            local b = string.sub(a, 1, f-1)
            identifiers[b] = a
        end
    end

    local name = GetPlayerName(source)
    local guid = GetPlayerGuid(source)
    local ping = GetPlayerPing(source)
    local embed = {
        {
            ["color"] = "25500",
            ["title"] = "Player Dropped. (" .. reason .. ")",
            ["description"] = "**[Name]** "..name.."\n**[Ping]**: "..ping.."**\n[Player IP]**: "..identifiers.ip.."\n**[Guid]**: "..guid.."\n **[Discord]**: <@!" .. string.sub(identifiers.discord, 9) .. ">\n **[license]**: "..identifiers.license.."\n**[Steam id]**: "..identifiers.steam.. '\n**[Time]: ' ..os.date("%Y/%m/%d %X"),
        }
    }

    PerformHttpRequest(connect, function(err, text, headers) end, 'POST', json.encode({username = "Connection Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('logs:Died')
AddEventHandler('logs:Died', function(Message, Weapon)
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if Weapon then
		Message = Message .. ' [' .. Weapon .. ']'
	end
    PerformHttpRequest(death, function(err, text, headers) end, 'POST', json.encode({username = 'Death Logs', content = Message}), { ['Content-Type'] = 'application/json' })
end)
