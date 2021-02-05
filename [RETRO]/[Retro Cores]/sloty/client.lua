ESX                             = nil
local PlayerData                = {}
local open 						= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(xPlayer)
            ESX = xPlayer
        end)
    end

    while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end

    if ESX.IsPlayerLoaded() then
        PlayerData = ESX.GetPlayerData()
		TriggerServerEvent('route68_kasyno:getJoinChips')
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local Gracz = GetPlayerPed(-1)
		local PozycjaGracza = GetEntityCoords(Gracz)
		local Dystans = GetDistanceBetweenCoords(PozycjaGracza, 959.48, 25.34, 76.99, true)
		local Dystans2 = GetDistanceBetweenCoords(PozycjaGracza, 961.79467773438,50.823329925537,74.991333007812, true)
		local Dystans3 = GetDistanceBetweenCoords(PozycjaGracza, 1108.34, 208.39, -49.45, true)
		if Dystans <= 10.0 then
			local PozycjaTekstu = {
				["x"] = 959.09,
				["y"] = 24.73,
				["z"] = 76.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu, "PRESS [~g~E~s~] TO BUY CHIPS", 0.55, 1.5, "~b~CASHIER", 0.7)
			if IsControlJustReleased(0, 38) and Dystans <= 1.5 then
				OtworzMenuKasyna()
			end
		end
		if Dystans2 <= 6.0 then
			local PozycjaTekstu2 = {
				["x"] = 936.97,
				["y"] = 9.56,
				["z"] = 75.49
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu2, "PRESS [~g~E~s~] TO OPEN BAR", 0.55, 1.5, "~b~BAR", 0.7)
			if IsControlJustReleased(0, 38) and Dystans2 <= 1.5 then
				OtworzMenuKasynaSklepu()
			end
		end
		if Dystans3 <= 6.0 then
			local PozycjaTekstu3 = {
				["x"] = 1108.34,
				["y"] = 208.39,
				["z"] = -49.45
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu3, "PRESS [~g~E~s~] TO OPEN BAR", 0.55, 1.5, "~b~BAR", 0.7)
			if IsControlJustReleased(0, 38) and Dystans3 <= 1.5 then
				OtworzMenuKasynaSklepu()
			end
		end
	end
end)

function OtworzMenuKasyna()
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'zetony',
      {
          title    = 'Diamond Casino - CASHIER',
          align    = 'left',
          elements = {
			{label = "Buy chips", value = "buy"},
			{label = "Sell chips", value = "sell"},
		  }
      },
	  function(data, menu)
		local akcja = data.current.value
		if akcja == 'buy' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
				title = 'Amount - $5/chip'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Invalid amount!'})
				else
					TriggerServerEvent('route68_kasyno:KupZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif akcja == 'sell' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = 'Amount - $5/chip'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Invalid amount!'})
				else
					TriggerServerEvent('route68_kasyno:WymienZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
      end,
      function(data, menu)
		menu.close()
	  end
  )
end

function OtworzMenuKasynaSklepu()
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'alkohole',
      {
          title    = 'Diamond Casino - Bar',
          align    = 'left',
          elements = {
			{label = "Beer", value = "beer"},
			{label = "Wine", value = "wine"},
			{label = "Whisky", value = "whisky"},
			{label = "Tequila", value = "tequila"},
			{label = "Vodka", value = "vodka"},
		  }
      },
	  function(data, menu)
		local item = data.current.value
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'buy_alkohol', {
				title = 'Amount - $10/item'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Invalid amount!'})
				else
					TriggerServerEvent('route68_kasyno:KupAlkohol', quantity, item)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
      end,
      function(data, menu)
		menu.close()
	  end
  )
end

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	TriggerEvent('pNotify:SendNotification', {text = 'You won '..data.win..' chips!'})
end)

RegisterNUICallback('updateBets', function(data)
	TriggerServerEvent('esx_slots:updateCoins', data.bets)
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("esx_slots:UpdateSlots")
AddEventHandler("esx_slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("esx_slots:PayOutRewards", math.floor(data.coinAmount))
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Sloty do
			local dis = GetDistanceBetweenCoords(coords, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to play slots.')
				DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerServerEvent('esx_slots:BetsAndMoney')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Ruletka do
			local dis = GetDistanceBetweenCoords(coords, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to play roulette.')
				DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 1.6, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_ruletka:start')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 1.6, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Blackjack do
			local dis = GetDistanceBetweenCoords(coords, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to play blackjack.')
				DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 1.85, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_blackjack:start')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 1.85, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
	end
end)

local coordonate = {
    {1088.1, 221.11, -49.21, nil, 185.5, nil, 1535236204},
    {1100.61, 195.55, -49.45, nil, 316.5, nil, -1371020112},
	
    {1134.33, 267.23, -51.04, nil, 135.5, nil, -245247470},
	{1128.82, 261.75, -51.04, nil, 321.5, nil, 691061163},

	{1143.83, 246.72, -51.04, nil, 320.5, nil, -886023758},
	{1149.33, 252.24, -51.04, nil, 138.5, nil, -1922568579},
	
	{1149.48, 269.11, -51.85, nil, 49.5, nil, -886023758},
	{1151.25, 267.3, -51.85, nil, 227.5, nil, 469792763},
	
	{1143.89, 263.71, -51.85, nil, 45.5, nil, 999748158},
	{1145.77, 261.883, -51.85, nil, 222.5, nil, -254493138},
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)

local heading = 254.5
local vehicle = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1099.84, 219.86, -49.38, true) < 40 then
			if DoesEntityExist(vehicle) == false then
				RequestModel(GetHashKey('nero2'))
				while not HasModelLoaded(GetHashKey('nero2')) do
					Wait(1)
				end
				vehicle = CreateVehicle(GetHashKey('nero2'), 1099.84, 219.86, -49.38, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, 1099.84, 219.86, -49.38, false, false, false, true)
				local props = ESX.Game.GetVehicleProperties(vehicle)
				props['wheelColor'] = 147
				props['plate'] = "DIAMONDS"
				ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed-1), 1099.84, 219.86, -49.38, true) < 40 then
			SetEntityCoords(vehicle, 1099.84, 219.86, -49.38, false, false, false, true)
		end
	end
end)