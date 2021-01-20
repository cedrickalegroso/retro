local CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask = {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService = false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged, isInShopMenu = false, false
ESX = nil

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


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)



-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'starbucks' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.Starbucks) do
				
				for i=1, #v.Stash, 1 do
					local distance = #(playerCoords - v.Stash[i])

					if distance < 1 then
						DrawText3D(v.Stash[i][1], v.Stash[i][2], v.Stash[i][3], '[E] - Menu')
						if IsControlJustPressed(1,38) then
							OpenMenu()
						end
					elseif distance < 3 then
						DrawText3D(v.Stash[i][1], v.Stash[i][2], v.Stash[i][3], 'Menu')
					end
				end

				for i=1, #v.Deposit, 1 do
					local distance = #(playerCoords - v.Deposit[i])

					if distance < 1 then
						DrawText3D(v.Deposit[i][1], v.Deposit[i][2], v.Deposit[i][3], '[E] - Deposit Money')
						if IsControlJustPressed(1,38) then
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit_money_amount_esx_starbucks', {
								title = 'Deposit Amount'
							}, function(data, menu)
								local amount = tonumber(data.value)
		
								if amount == nil then
									TriggerEvent('notification', "Invalid Amount", 2)
								else
									menu.close()
									TriggerServerEvent('esx_society:depositMoney', 'starbucks', amount)
								end
							end, function(data, menu)
								menu.close()
							end)
						end
					elseif distance < 3 then
						DrawText3D(v.Deposit[i][1], v.Deposit[i][2], v.Deposit[i][3], 'Deposit Money')
					end
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)



AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)


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

function OpenMenu()
	local elements = {
		{ label = 'אחסון', v = 'storage' },
	}

	if ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements,{ label = 'תפריט בוס', v = 'boss' })
	end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'starbucks_menu',
		{
		  title    = 'סטארבקס',
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
			if data.current.v == 'boss' then
				TriggerEvent('esx_society:openBossMenu', 'starbucks', function(data, menu)
					menu.close()
				end, {wash = false})
			elseif data.current.v == 'storage' then
				menu.close()
				TriggerEvent('inventory:stash', 'Starbucks')
			end
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
end