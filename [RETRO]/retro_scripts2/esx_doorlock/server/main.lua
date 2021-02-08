ESX = nil
local doorState = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(doorIndex, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.DoorListLOCK[doorIndex] and isAuthorized(xPlayer.job.name, xPlayer.job2.name, Config.DoorListLOCK[doorIndex]) then
		doorState[doorIndex] = state
		TriggerClientEvent('esx_doorlock:setDoorState', -1, doorIndex, state)
	end
end)

ESX.RegisterServerCallback('esx_doorlock:getDoorState', function(source, cb)
	cb(doorState)
end)

function isAuthorized(jobName, job2Name, doorObject)
	for k,job in pairs(doorObject.authorizedJobs) do
		if job == jobName or job == job2Name then
			return true
		end
	end

	return false
end
