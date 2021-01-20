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
-- polo © License | Discord : https://discord.gg/czW6Jqj
local PlayerData              = {}
local isBlip              = false
-- polo © License | Discord : https://discord.gg/czW6Jqj
ESX = nil
-- polo © License | Discord : https://discord.gg/czW6Jqj
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerData.job = job
	Citizen.Wait(5000)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
	isBlip = true
	--blip = AddBlipForCoord(-163.76,-1344.97,30.0) -- Blip on Map Position
	--SetBlipSprite  (blip, 103) -- Blip Model , you can change it from : https://wiki.gtanet.work/index.php?title=Blips
	--SetBlipDisplay (blip, 4)
	--SetBlipScale   (blip, 1.2)
	--SetBlipCategory(blip, 3)
	--SetBlipColour  (blip, 4) -- Blip Color , you can change it from : https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
	--SetBlipAsShortRange(blip, true)
	--BeginTextCommandSetBlipName("STRING")
	--AddTextComponentString("Kitchen Location") -- Name of the Blip on the map
	--EndTextCommandSetBlipName(blip)
  end
end)


local inKitchen = false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -308.43,-1350.78,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -308.43,-1350.78,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -306.29,-1354.66,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -306.29,-1354.66,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -312.46,-1359.31,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -312.46,-1359.31,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -312.70,-1354.90,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -312.70,-1354.90,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -312.72,-1350.85,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -312.72,-1350.85,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -302.76,-1350.80,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -302.76,-1350.80,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -302.51,-1354.91,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -302.51,-1354.91,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -302.48,-1358.85,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -302.48,-1358.85,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -307.89,-1359.11,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -307.89,-1359.11,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -321.13,-1358.97,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -321.13,-1358.97,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -321.19,-1361.05,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -321.19,-1361.05,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -300.23,-1346.88,24.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -300.23,-1346.88,24.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Weed)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openWeed2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1253.77,-1116.81,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1253.77,-1116.81,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1254.37,-1114.30,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1254.37,-1114.30,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1250.02,-1115.67,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1250.02,-1115.67,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1246.86,-1114.51,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1246.86,-1114.51,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1243.71,-1113.43,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1243.71,-1113.43,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1242.40,-1117.15,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1242.40,-1117.15,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1244.81,-1120.82,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1244.81,-1120.82,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1245.66,-1118.21,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1245.66,-1118.21,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1247.98,-1121.87,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1247.98,-1121.87,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1251.47,-1122.99,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1251.47,-1122.99,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1252.29,-1120.44,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1252.29,-1120.44,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1250.90,-1113.07,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1250.90,-1113.07,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1247.73,-1112.13,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1247.73,-1112.13,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1244.41,-1110.96,0.78, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 0,255,0, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1244.41,-1110.96,0.78, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Coke)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCoke2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -541.28,3551.78,237.61, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -541.28,3551.78,237.61, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -542.07,3552.99,237.84, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -542.07,3552.99,237.84, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -543.32,3554.37,238.07, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -543.32,3554.37,238.07, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -540.18,3552.83,237.70, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -540.18,3552.83,237.70, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -540.84,3553.68,237.84, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -540.84,3553.68,237.84, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -542.04,3555.22,238.09, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -542.04,3555.22,238.09, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -543.30,3556.56,238.32, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -543.30,3556.56,238.32, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -544.43,3555.94,238.34, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -544.43,3555.94,238.34, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -542.41,3557.28,238.29, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -542.41,3557.28,238.29, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -539.22,3553.71,237.75, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -539.22,3553.71,237.75, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -539.91,3554.51,237.89, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -539.91,3554.51,237.89, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~w~Press [E] to harvest (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -2087.97,2621.70,1.02, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 227,158,64, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -2087.97,2621.70,1.02, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~w~Press [E] to Process (Opium)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openOpium2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -3205.11,1198.80,9.54, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 141,104,255, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -3205.11,1198.80,9.54, true)
		
		if distance < 1.5 then
			ESX.ShowHelpNotification('~p~Press [E] to Collect (Ketamine)')	
			inKitchen = true
		elseif distance > 1.5 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openKetamine()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1797.97,408.92,113.66, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 141,104,255, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1797.97,408.92,113.66, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~p~Press [E] to Process (Ketamine)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openKetamine2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 2510.50,3786.05,50.83, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 245,195,107, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 2510.50,3786.05,50.83, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~o~Press [E] to Collect (lsd)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openlsd()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 244.67,374.58,105.73, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 245,195,107, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 244.67,374.58,105.73, true)
		
		if distance < 2.0 then
			ESX.ShowHelpNotification('~o~Press [E] to Process (lsd)')	
			inKitchen = true
		elseif distance > 2.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openlsd2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		if PlayerData.job ~= nil then
		DrawMarker(32, 3559.88,3674.75,28.12, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.50, 250,250,228, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3559.88,3674.75,28.12, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~s~Press [E] to Collect (Morphine)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMorphine()
		end
	end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		if PlayerData.job ~= nil then
		DrawMarker(32, 3559.49,3672.07,28.12, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.50, 250,250,228, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3559.49,3672.07,28.12, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~s~Press [E] to Collect (Morphine)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMorphine()
		end
	end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 166.64,2229.20,90.76, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 250,250,228, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 166.64,2229.20,90.76, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~s~Press [E] to Process (Morphine)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMorphine2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1359.01,-757.28,22.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 213,107,245, 100, true, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1359.01,-757.28,22.30, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~o~Press ~b~[E] ~p~to ~q~Collect (Lean)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openLean()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 725.79,-1071.51,28.31, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 213,107,245, 100, true, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 725.79,-1071.51,28.31, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~o~Press ~b~[E] ~p~to ~q~Process (Lean)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openLean2()
		end
	end
end)
-- à revérif
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1336.31,-1164.44,4.54, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 255,0,0, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1336.31,-1164.44,4.54, true)
		
		if distance < 1.5 then
			ESX.ShowHelpNotification('~r~Press [E] to Collect (Heroine)')	
			inKitchen = true
		elseif distance > 1.5 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openHeroine()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 414.62,344.27,102.42, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 255,0,0, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 414.62,344.27,102.42, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~r~Press [E] to Process (Heroine)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openHeroine2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -1202.17,-1793.12,3.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 245,182,70, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -1202.17,-1793.12,3.90, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Collect (Ecstasy)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openEcstasy()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, -157.35,-2206.26,8.71, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 245,182,70, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -157.35,-2206.26,8.71, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Process (Ecstasy)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openEcstasy2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 463.46,-1323.01,29.43, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 234,200,10, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 463.46,-1323.01,29.43, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Collect (Amphetamines)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openAmphetamines()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 1268.44,-1710.14,54.77, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 234,200,10, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 1268.44,-1710.14,54.77, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Process (Amphetamines)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openAmphetamines2()
		end
	end
end)
-- à revérif
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 710.62,-1415.26,26.34, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 225,239,171, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 710.62,-1415.26,26.34, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Collect (Crack)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCrack()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 709.62,-1416.28,26.49, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 225,239,171, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 709.62,-1416.28,26.49, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Collect (Crack)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCrack()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 983.82,3572.65,33.57, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 225,239,171, 100, true, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 983.82,3572.65,33.57, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~y~Press [E] to Process (Crack)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openCrack2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 3679.42,4936.07,17.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 155,250,140, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3679.42,4936.07,17.05, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Collect (Marijuana)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMarijuana()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 3680.25,4937.29,17.31, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 155,250,140, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3680.25,4937.29,17.31, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Collect (Marijuana)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMarijuana()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 3680.26,4935.86,17.17, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 155,250,140, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3680.26,4935.86,17.17, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Collect (Marijuana)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMarijuana()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 3681.15,4937.21,17.46, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 155,250,140, 100, false, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 3681.15,4937.21,17.46, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Collect (Marijuana)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMarijuana()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		DrawMarker(21, -708.94,642.13,155.17, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 155,250,140, 100, true, true, 2, true, false, true, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, -708.94,642.13,155.17, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~g~Press [E] to Process (Marijuana)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMarijuana2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 171.70,-1710.14,22.20, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 10,135,234, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 171.70,-1710.14,22.20, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~b~Press [E] to Collect (Meth)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMeth()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 170.35,-1709.04,22.20, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 10,135,234, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 170.35,-1709.04,22.20, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~b~Press [E] to Collect (Meth)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMeth()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 160.45,-1706.86,23.80, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 10,135,234, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 160.45,-1706.86,23.80, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~b~Press [E] to Process (Meth)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMeth2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 157.38,-1711.92,22.70, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 10,135,234, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 157.38,-1711.92,22.70, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~b~Press [E] to Process (Meth)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMeth2()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		
		DrawMarker(21, 166.40,-1711.13,22.71, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 1.0, 0.25, 10,135,234, 100, false, true, 2, false, false, false, false)
			
		local coords = GetEntityCoords(PlayerPedId())
		local distance = GetDistanceBetweenCoords(coords, 166.40,-1711.13,22.71, true)
		
		if distance < 1.0 then
			ESX.ShowHelpNotification('~b~Press [E] to Process (Meth)')	
			inKitchen = true
		elseif distance > 1.0 then
			inKitchen = false
		end
		
		if IsControlJustReleased(0, Keys['E']) and inKitchen then
			ESX.UI.Menu.CloseAll()
			openMeth2()
		end
	end
end)

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)			
		if GetDistanceBetweenCoords( -708.94, 642.13, 155.17, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -708.94, 642.13, 155.17  -1.400, "~g~Process Marijuana", 4, 0.1, 0.1) -- Marijuana
		end
		if GetDistanceBetweenCoords( 3680.40, 4937.00, 17.31, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 3680.40, 4937.00, 17.31  -1.600, "~g~Harvest Marijuana", 4, 0.1, 0.1) -- Marijuana
		end
		if GetDistanceBetweenCoords( -541.49, 3554.43, 237.96, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -541.49, 3554.43, 237.96  -1.600, "~d~Harvest Opium", 4, 0.1, 0.1) -- Opium
		end
		if GetDistanceBetweenCoords( -2087.97, 2621.70, 1.02, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -2087.97, 2621.70, 1.02  -1.600, "~d~Process Opium", 4, 0.1, 0.1) -- Opium
		end
		if GetDistanceBetweenCoords( -3205.11, 1198.80, 9.54, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -3205.11, 1198.80, 9.54  -1.600, "~p~Harvest Ketamine", 4, 0.1, 0.1) -- Ketamine
		end
		if GetDistanceBetweenCoords( -1797.97, 408.92, 113.66, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1797.97, 408.92, 113.66  -1.600, "~p~Process Ketamine", 4, 0.1, 0.1) -- Ketamine
		end
		if GetDistanceBetweenCoords( 2510.50, 3786.05, 50.83, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 2510.50, 3786.05, 50.83  -1.600, "~y~Harvest LSD", 4, 0.1, 0.1) -- LSD
		end
		if GetDistanceBetweenCoords( 244.67, 374.58, 105.73, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 244.67, 374.58, 105.73  -1.600, "~y~Process LSD", 4, 0.1, 0.1) -- LSD
		end
		if GetDistanceBetweenCoords( 3559.88, 3673.40, 28.12, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 3559.88, 3673.40, 28.12  -1.600, "~j~Harvest ~j~Morphine", 4, 0.1, 0.1) -- Morphine
		end
		if GetDistanceBetweenCoords( 166.64, 2229.20, 90.76, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 166.64, 2229.20, 90.76  -1.600, "~j~Process ~j~Morphine", 4, 0.1, 0.1) -- Morphine
		end
		if GetDistanceBetweenCoords( -1358.80,-757.95,22.30, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1358.80,-757.95,22.30  -1.600, "~m~Harvest ~p~Lean", 4, 0.1, 0.1) -- Lean
		end
		if GetDistanceBetweenCoords( 725.79, -1071.51, 28.31, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 725.79, -1071.51, 28.31  -1.600, "~m~Process ~p~Lean", 4, 0.1, 0.1) -- Lean
		end
		if GetDistanceBetweenCoords( -1337.31, -1164.44, 4.54, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1337.31, -1164.44, 4.54  -1.600, "~r~Harvest Heroïne", 4, 0.1, 0.1) -- Heroïne
		end
		if GetDistanceBetweenCoords( 414.62, 344.27, 102.42, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 414.62, 344.27, 102.42  -1.600, "~r~Process Heroïne", 4, 0.1, 0.1) -- Heroïne
		end
		if GetDistanceBetweenCoords( -1202.17, -1793.12, 3.90, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1202.17, -1793.12, 3.90  -1.600, "~y~Harvest Ecstasy", 4, 0.1, 0.1) -- Ecstasy
		end
		if GetDistanceBetweenCoords( -157.35, -2206.26, 8.71, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -157.35, -2206.26, 8.71  -1.600, "~y~Process Ecstasy", 4, 0.1, 0.1) -- Ecstasy
		end
		if GetDistanceBetweenCoords( 462.50, -1323.20, 28.94, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 462.50, -1323.20, 28.94  -1.600, "~y~Harvest Amphetamines", 4, 0.1, 0.1) -- Amphetamines
		end
		if GetDistanceBetweenCoords( 1268.44, -1710.14, 54.77, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1268.44, -1710.14, 54.77  -1.600, "~y~Process Amphetamines", 4, 0.1, 0.1) -- OpiAmphetaminesum
		end
		if GetDistanceBetweenCoords( 710.34, -1416.28, 26.19, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 710.34, -1416.28, 26.19  -1.600, "~y~Harvest Crack", 4, 0.1, 0.1) -- Crack
		end
		if GetDistanceBetweenCoords( 983.82, 3572.65, 33.57, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 983.82, 3572.65, 33.57  -1.600, "~y~Process Crack", 4, 0.1, 0.1) -- Crack
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)		-- You can change the text color here
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end

RegisterNetEvent('drug1:animation')
AddEventHandler('drug1:animation', function()
	TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true) -- Animaton 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
	ClearPedTasksImmediately(PlayerPedId()) -- Function to stop the animation
end)

RegisterNetEvent('drugs2:animation2')
AddEventHandler('drugs2:animation2', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true) -- Animaton 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
	ClearPedTasksImmediately(PlayerPedId()) -- Function to stop the animation
end)

RegisterNetEvent('opium3:animation3')
AddEventHandler('opium3:animation3', function()
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true) -- Animaton 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
	ClearPedTasksImmediately(PlayerPedId()) -- Function to stop the animation
end)

RegisterNetEvent('meth4:animation4')
AddEventHandler('meth4:animation4', function()
	TaskStartScenarioInPlace(PlayerPedId(), "world_human_stand_fire", 0, true) -- Animaton 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
	ClearPedTasksImmediately(PlayerPedId()) -- Function to stop the animation
end)

RegisterNetEvent('none:none')
AddEventHandler('none:none', function()
	TaskStartScenarioInPlace(PlayerPedId(), "none", 0, true) -- Animaton 
	Citizen.Wait(10000) -- Time progress , in ms, 1 second = 1000 ms , the value is 10000 so , its 10 seconds
	ClearPedTasksImmediately(PlayerPedId()) -- Function to stop the animation
end)


function openWeed()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'weed',
        {
            title    = 'Weed Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Weed', value = 'weed' }, --			
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'weed' then
            menu.close()
            TriggerServerEvent('weed:weed')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openWeed2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'weed',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Weed', value = 'weed2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'weed2' then
            menu.close()
            TriggerServerEvent('weed2:weed2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openCoke()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'coke',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Coke', value = 'coke' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'coke' then
            menu.close()
            TriggerServerEvent('coke:coke')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openCoke2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'coke',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Coke', value = 'coke2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'coke2' then
            menu.close()
            TriggerServerEvent('coke2:coke2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openOpium()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'opium',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Opium', value = 'opium' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'opium' then
            menu.close()
            TriggerServerEvent('opium:opium')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openOpium2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'opium',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Opium', value = 'opium2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'opium2' then
            menu.close()
            TriggerServerEvent('opium2:opium2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openKetamine()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'ketamine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Ketamine', value = 'ketamine' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'ketamine' then
            menu.close()
            TriggerServerEvent('ketamine:ketamine')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openKetamine2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'ketamine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Ketamine', value = 'ketamine2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'ketamine2' then
            menu.close()
            TriggerServerEvent('ketamine2:ketamine2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openlsd()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lsd',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect LSD', value = 'lsd' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'lsd' then
            menu.close()
            TriggerServerEvent('lsd:lsd')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openlsd2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lsd',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process LSD', value = 'lsd2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'lsd2' then
            menu.close()
            TriggerServerEvent('lsd2:lsd2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMorphine()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'morphine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Morphine', value = 'morphine' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'morphine' then
            menu.close()
            TriggerServerEvent('morphine:morphine')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMorphine2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'morphine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Morphine', value = 'morphine2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'morphine2' then
            menu.close()
            TriggerServerEvent('morphine2:morphine2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openLean()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lean',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Lean', value = 'lean' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'lean' then
            menu.close()
            TriggerServerEvent('lean:lean')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openLean2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lean',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Lean', value = 'lean2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'lean2' then
            menu.close()
            TriggerServerEvent('lean2:lean2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openHeroine()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'heroine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Heroine', value = 'heroine' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'heroine' then
            menu.close()
            TriggerServerEvent('heroine:heroine')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openHeroine2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'heroine',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Heroine', value = 'heroine2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'heroine2' then
            menu.close()
            TriggerServerEvent('heroine2:heroine2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openEcstasy()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'ecstasy',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Ecstasy', value = 'ecstasy' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'ecstasy' then
            menu.close()
            TriggerServerEvent('ecstasy:ecstasy')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openEcstasy2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'ecstasy',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Ecstasy', value = 'ecstasy2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'ecstasy2' then
            menu.close()
            TriggerServerEvent('ecstasy2:ecstasy2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openAmphetamines()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'amphetamines',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Amphetamines', value = 'amphetamines' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'amphetamines' then
            menu.close()
            TriggerServerEvent('amphetamines:amphetamines')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openAmphetamines2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'amphetamines',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Amphetamines', value = 'amphetamines2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'amphetamines2' then
            menu.close()
            TriggerServerEvent('amphetamines2:amphetamines2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openCrack()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'crack',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Crack', value = 'crack' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'crack' then
            menu.close()
            TriggerServerEvent('crack:crack')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openCrack2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'crack',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Crack', value = 'crack2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'crack2' then
            menu.close()
            TriggerServerEvent('crack2:crack2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMarijuana()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'marijuana',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Marijuana', value = 'marijuana' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'marijuana' then
            menu.close()
            TriggerServerEvent('marijuana:marijuana')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMarijuana2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'marijuana',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Marijuana', value = 'marijuana2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'marijuana2' then
            menu.close()
            TriggerServerEvent('marijuana2:marijuana2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMeth()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'meth',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Collect Meth', value = 'meth' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'meth' then
            menu.close()
            TriggerServerEvent('meth:meth')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

function openMeth2()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'meth',
        {
            title    = 'Farm Menu',
            align    = 'top-right',
            elements = { 
                { label = 'Press [E] to Process Meth', value = 'meth2' }
   
            }
        },
    function(data, menu)
        local value = data.current.value

        if value == 'meth2' then
            menu.close()
            TriggerServerEvent('meth2:meth2')
			
        end
    end,
    function(data, menu)
        menu.close()
    end)
end

--

local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed				  = false
local menuIsShowedMeth				  = false
local hasAlreadyEnteredMarker     = false
local hasAlreadyEnteredMarkerMeth   = false
local lastZone                    = nil
local isInjaillistingMarker 		  = false
local isInjaillistingMarkerMeth 		  = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenPoloDrugsMenu(data)
	

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'drugs',
			{
				title    = 'Laboratory outfit',
				elements = {
				{label = 'Citizen outfit', value = 'citizen_wear'},
				{label = 'Drugs outfit', value = 'drugs_wear'},			
			},
			},
			function(data, menu)
			local ped = GetPlayerPed(-1)
			menu.close()

			if data.current.value == 'citizen_wear' then
				
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)

			end
			

			if data.current.value == 'drugs_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
					if skin.sex == 0 then				
						SetPedComponentVariation(GetPlayerPed(-1), 3, 96, 0, 0)--Gants
						SetPedComponentVariation(GetPlayerPed(-1), 4, 31, 0, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 27, 0, 0)--Chaussure
						SetPedComponentVariation(GetPlayerPed(-1), 11, 253, 1, 0)--Veste
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--GiletJaune
						SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune			
						SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)--Masques								
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 111, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 32, 0, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 261, 1, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 1, 36, 0, 0)--Masques
					else
						TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
					end
					
				end)
			end


		end,
			function(data, menu)
				menu.close()
			end
		)

	
end

AddEventHandler('polo_drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

function OpenPoloDrugsMenuMeth(data2)
	

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'drugs',
			{
				title    = 'Laboratory outfit',
				elements = {
				{label = 'Citizen outfit', value = 'citizen_wear'},
				{label = 'Meth outfit', value = 'drugsmeth_wear'},			
			},
			},
			function(data2, menu)
			local ped = GetPlayerPed(-1)
			menu.close()

			if data2.current.value == 'citizen_wear' then
				
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)

			end
			

			if data2.current.value == 'drugsmeth_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
					if skin.sex == 0 then				
						SetPedComponentVariation(GetPlayerPed(-1), 3, 88, 0, 0)--Gants
						SetPedComponentVariation(GetPlayerPed(-1), 4, 39, 1, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)--Chaussure
						SetPedComponentVariation(GetPlayerPed(-1), 11, 66, 1, 0)--Veste
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--GiletJaune
						SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune			
						SetPedComponentVariation(GetPlayerPed(-1), 1, 46, 0, 0)--Gants								
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 101, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 39, 1, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 60, 1, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 5, 44, 0, 0)--GiletJaune
                        SetPedComponentVariation(GetPlayerPed(-1), 1, 46, 0, 0)--Gants
					else
						TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
					end
					
				end)
			end


		end,
			function(data2, menu)
				menu.close()
			end
		)

	
end

AddEventHandler('polo_drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0, 0.0, 0.0, 1.0, 1.5, 1.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, false, false, false, false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zone, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zone[i].x, Config.Zone[i].y, Config.Zone[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zone[i].x, Config.Zone[i].y, Config.Zone[i].z, 0, 0.0, 0.0, 1.0, 1.5, 1.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, false, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJaillistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.ZoneSize.x) then
				isInJaillistingMarker  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString('Press ~INPUT_PICKUP~ to take your ~b~outfit~s~.')
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJaillistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJaillistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('polo_drugs:hasExitedMarker')
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJaillistingMarkerMeth  = false
		local currentZone = nil
		for i=1, #Config.Zone, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zone[i].x, Config.Zone[i].y, Config.Zone[i].z, true) < Config.ZoneSize.x) then
				isInJaillistingMarkerMeth  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString('Press ~INPUT_PICKUP~ to take your ~b~outfit~s~.')
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if isInJaillistingMarkerMeth and not hasAlreadyEnteredMarkerMeth then
			hasAlreadyEnteredMarkerMeth = true
		end
		if not isInJaillistingMarkerMeth and hasAlreadyEnteredMarkerMeth then
			hasAlreadyEnteredMarkerMeth = false
			TriggerEvent('polo_drugs:hasExitedMarkerMeth')
		end
	end
end)



-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInJaillistingMarker and not menuIsShowed then
			OpenPoloDrugsMenu()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInJaillistingMarkerMeth and not menuIsShowedMeth then
			OpenPoloDrugsMenuMeth()
		end
	end
end)