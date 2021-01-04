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

RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    local name = getIdentity(src)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeMoney(10000)

    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'To lessen the use of "OOC" in chat we are deducting 10,000. Please use twitter for RP. '})
    --TriggerEvent('notification','You do not have a phone.', 2)

    if player ~= false then
        local user = GetPlayerName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message advert"><b>OOC {0} : </b> {1}</div>',
            args = { user, msg }
        })
    end
    
end, false)


