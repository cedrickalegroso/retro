--####################################################################################
--#                                   DISCORD:                                       #
--#                                   Mun#0001                                       #
--####################################################################################

ESX = nil
blip = nil

local actualPed
local actualPedCoords
local distanceToRental
local distanceToDelete
local isPedInVehicle
local isInAuthorizedVehicle

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	
end)

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function IsInAuthorizedVehicle()
	local vehModel  = GetEntityModel(GetVehiclePedIsIn(actualPed, false))
	
	if vehModel == GetHashKey('seashark') or vehModel == GetHashKey('seashark2') or vehModel == GetHashKey('seashark3') or vehModel == GetHashKey('dinghy') or vehModel == GetHashKey('predator') then
		return true
	end
	
	return false
end

RegisterNetEvent('AddictionRentBoats:spawnVehicle')
AddEventHandler('AddictionRentBoats:spawnVehicle', function(model, x, y, z, heading)
	if model == 'seashark' or model == 'seashark2' or model == 'seashark3' then
		exports['mythic_notify']:DoHudText('success', 'You rented a jet ski, you paid 3000')
	elseif model == 'predator' then
		exports['mythic_notify']:DoHudText('success', 'You rented a Police Predator, you paid 5000')
	elseif model == 'dinghy4' then
		exports['mythic_notify']:DoHudText('success', 'you rented a Dinghy, you paid 4000')
	end
	SetPedCoordsKeepVehicle(actualPed, x, y , z)
	ESX.Game.SpawnVehicle(model, vector3(x,y,z), heading, function(vehicle)
		TaskWarpPedIntoVehicle(actualPed,  vehicle, -1)
	end)
end)

RegisterNetEvent('AddictionRentBoats:nomoney')
AddEventHandler('AddictionRentBoats:nomoney', function()
	exports['mythic_notify']:DoHudText('error', 'Kulang money mo')
end)


Citizen.CreateThread(function()
	while true do
		actualPed = PlayerPedId()
		actualPedCoords = GetEntityCoords(actualPed, false)
		distanceToRental = GetDistanceBetweenCoords(actualPedCoords, ConfigWaterCraft.SpawnBike.x, ConfigWaterCraft.SpawnBike.y, ConfigWaterCraft.SpawnBike.z, true)
		distanceToDelete = GetDistanceBetweenCoords(actualPedCoords, ConfigWaterCraft.DeleteBike.x, ConfigWaterCraft.DeleteBike.y, ConfigWaterCraft.DeleteBike.z, true)
		Citizen.Wait(500)
		
	end
end)

Citizen.CreateThread(function()
	while true do
		
		isPedInVehicle = IsPedInAnyVehicle(actualPed)
		if isPedInVehicle then
			isInAuthorizedVehicle = IsInAuthorizedVehicle()
		end
		Citizen.Wait(1000)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
          if distanceToRental <= 1.40 and ESX ~= nil then

					DisplayHelpText('Press E to rent a watercraft')
					
					if IsControlJustPressed(0, Keys['E']) and not isPedInVehicle then
						OpenBikesMenu(ConfigWaterCraft.SpawnBike.xs, ConfigWaterCraft.SpawnBike.ys, ConfigWaterCraft.SpawnBike.zs, 162.0)
					end 
			elseif distanceToRental < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            if distanceToDelete <= 5.0 and ESX ~= nil then

                    if  isPedInVehicle and isInAuthorizedVehicle then
						DisplayHelpText('Press E to return the watercraft')
						if IsControlJustPressed(0, Keys['E']) then
							TriggerEvent('esx:deleteVehicle')
							exports['mythic_notify']:DoHudText('success', 'You returned a water vehicle')
						end
                    end 
            elseif distanceToDelete < 5.0 then
               ESX.UI.Menu.CloseAll()
            end
    end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if distanceToDelete <= 25.0 and ESX ~= nil then
			if isPedInVehicle and isInAuthorizedVehicle then
				DrawMarker(27, ConfigWaterCraft.DeleteBike.x, ConfigWaterCraft.DeleteBike.y, ConfigWaterCraft.DeleteBike.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0)
			end
		end
		if distanceToRental <= 25.0 and ESX ~= nil then
            DrawMarker(27, ConfigWaterCraft.SpawnBike.x, ConfigWaterCraft.SpawnBike.y, ConfigWaterCraft.SpawnBike.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 150, 150, 100, 0, 0, 0, 0)	
		end
	end
end)

Citizen.CreateThread(function()
		Wait(5)
	
					blip = AddBlipForCoord(ConfigWaterCraft.SpawnBike.x, ConfigWaterCraft.SpawnBike.y, ConfigWaterCraft.SpawnBike.z)

					SetBlipSprite (blip, 427)
					SetBlipDisplay(blip, 4)
					SetBlipScale  (blip, 0.9)
					SetBlipColour (blip, 43)
					SetBlipAsShortRange(blip, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString("Boat Rental")
					EndTextCommandSetBlipName(blip)

end)	

function OpenBikesMenu(x, y , z, heading)
	PlayerData = ESX.PlayerData
	local elements = {}
	
		local color = math.random(0, 100)
		local bike = 'seashark3'
		if color >= 0 and color <= 33 then
			bike = 'seashark'
		elseif color >= 34 and color <= 66 then
			bike = 'seashark2'
		end
		print(bike)
		table.insert(elements, {label = '<span style="color:white;">Jetski</span> <span style="color:white;">(3,000)</span>', value = bike})
		table.insert(elements, {label = '<span style="color:white;">Police Predator</span> <span style="color:white;">(5,000)</span>', value = 'predator'})
		table.insert(elements, {label = '<span style="color:white;">Dinghy</span> <span style="color:white;">(4,000)</span>', value = 'dinghy'})
	
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'client',
    {
		title    = 'Boat Rental',
		align    = 'bottom-right',
		elements = elements,
    },
	
	
	function(data, menu)

	if data.current.value == bike then
		ESX.UI.Menu.CloseAll()

		TriggerServerEvent("AddictionRentBoats:checkmoney", 3000, data.current.value,x, y, z, heading) 
	elseif data.current.value == 'dinghy' then
		ESX.UI.Menu.CloseAll()

		TriggerServerEvent("AddictionRentBoats:checkmoney", 5000, data.current.value,x, y, z, heading) 
	elseif data.current.value == 'predator' then
		ESX.UI.Menu.CloseAll()
		
		TriggerServerEvent("AddictionRentBoats:checkmoney", 40000, data.current.value,x, y, z, heading) 
	end
	
	ESX.UI.Menu.CloseAll()
	
    end,
	function(data, menu)
		menu.close()
		end
	)
end