SX = nil
local log = false -- set this to false if you don't want logging

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("stress:add")
AddEventHandler("stress:add", function (value)
 --  print('[RETRO CITY DEBUG]:Stress ADD')
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playername = xPlayer.name

	if xPlayer.job.name == "police" then -- Polis ise daha yarı yarıya stress ekleniyor, bu şekilde farklı meslekler ekleyebilirsiniz // if player is a police officer, he/she gaing half the stress, you can add different jobs using same method
		TriggerClientEvent("esx_status:add", _source, "stress", value / 10)
		if log then
			SaveLog("Stress added : "..value/10, playername)
		end
	else
		TriggerClientEvent("esx_status:add", _source, "stress", value)
		if log then
			SaveLog("Stress added : "..value, playername)
		end
	end
end)



RegisterServerEvent("stress:remove") -- stres azalttır // remove stress
AddEventHandler("stress:remove", function (value, source)
   -- print('[RETRO CITY DEBUG]:Stress Remove')
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playername = xPlayer.name

	TriggerClientEvent("esx_status:remove", _source, "stress", value)
	if log then
		SaveLog("Stress removed : "..value, playername)
	end
end)

