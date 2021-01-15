-- StarBlazt Chat

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

--[[ COMMANDS ]]--

RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

RegisterCommand('/advert', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    local name = getIdentity(src)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.identifier == 'steam:1100001115e4c94' or xPlayer.identifier == 'steam:11000011693aece' then 
   --     TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'To lessen the use of "OOC" in chat we are deducting 10,000. Please use twitter for RP. '})
        --TriggerEvent('notification','You do not have a phone.', 2)
    
        if player ~= false then
            local user = GetPlayerName(src)
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message advert"><b> RETRO CITY: </b> Discord Link: discord.retrocity.xyz | How to admin report? use /admin </div>',
                args = { user, msg }
            })
        end
    end

   

   
    
end, false)


