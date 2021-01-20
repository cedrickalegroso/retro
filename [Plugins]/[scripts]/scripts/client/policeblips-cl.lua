ESX = nil
local blips = {}
local blipname = {}
local enableblip = {}
RegisterNetEvent('esx:playerLoaded')
RegisterNetEvent('esx:setJob')
RegisterNetEvent('JobActivity:updateBlip')
RegisterNetEvent('JobActivity:enableblip')
RegisterNetEvent('JobActivity:changestatus')

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESX.PlayerData = ESX.GetPlayerData()
    TriggerServerEvent('JobActivity:event', 'refresh')
end)

AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer 
    Citizen.Wait(10)
    TriggerServerEvent('JobActivity:event', 'refresh')
end)

AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(10)
	TriggerServerEvent('JobActivity:event', 'refresh')
end)

AddEventHandler('JobActivity:enableblip', function(enable, id)
    if enableblip[id] ~= nil then
    if enable then
        enableblip[id] = true
    else
        enableblip[id] = false
    end
end
end)

AddEventHandler('JobActivity:changestatus', function(id)
    if enableblip[id] ~= nil then
    if enableblip[id] then
        enableblip[id] = false
    else
        enableblip[id] = true
    end
end
end)


AddEventHandler('JobActivity:updateBlip', function()

	for k, existingBlip in pairs(blips) do
		RemoveBlip(existingBlip)
    end
    
    blips = {}

    if ESX.PlayerData.job then
        if ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'police' then
            ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
                for i=1, #players, 1 do
                    if players[i].job.name == 'police' or players[i].job.name == 'ambulance' then
                        local id = GetPlayerFromServerId(players[i].source)
                        if NetworkIsPlayerActive(id) then
                            if enableblip[id] == nil then enableblip[id] = true end
                           if players[i].job.name == 'ambulance' then
                           AmbulanceBlip(id)
                           elseif players[i].job.name == 'police' then
                            PoliceBlip(id)
                           end
                        end
                    end
                end
            end)
        end
    end
end)

function PoliceBlip(id)
	local ped = GetPlayerPed(id)
    local blip = GetBlipFromEntity(ped)
    local name = GetPlayerName(id)
	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) 
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
		--SetBlipNameToPlayerName(blip, id)
		SetBlipScale(blip, 0.85)
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, 77)
            SetBlipShowCone(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Police | ' .. name)
        EndTextCommandSetBlipName(blip)
        blipname[id] = blip
		table.insert(blips, blip) 
	end
end

function AmbulanceBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)
    local name = GetPlayerName(id)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true)
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
		--SetBlipNameToPlayerName(blip, id) 
		SetBlipScale(blip, 0.85)
		SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 1)
        SetBlipShowCone(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('EMS | ' .. name)
        EndTextCommandSetBlipName(blip)
        blipname[id] = blip

		table.insert(blips, blip)
	end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end