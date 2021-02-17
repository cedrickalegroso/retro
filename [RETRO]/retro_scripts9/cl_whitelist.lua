local blipsEms               = {}
local blipsGroove            = {}
local blipsCops           = {}
local isClaimed = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
    
    print('debug '.. ESX.PlayerData.job.name)

  if ESX.PlayerData.job.name == 'ambulance' then 
--	print('calling ems blips')
--	TriggerServerEvent('retro_scripts:updateEmsBlips1')
	Citizen.Wait(5000)
	TriggerEvent('retro_scripts:initems')
  elseif ESX.PlayerData.job.name == 'groove' then 
--	print('calling groove blips')
--	TriggerServerEvent('retro_scripts:updateGrooveBlips1')
	Citizen.Wait(5000)
	TriggerEvent('retro_scripts:initgroove')
  elseif ESX.PlayerData.job.name == 'police' then 
--	print('calling police blips')
--	TriggerServerEvent('retro_scripts:updatePoliceBlips1')
	Citizen.Wait(5000)
	TriggerEvent('retro_scripts:initpolice')
  end

	

end)



RegisterNetEvent('retro_scripts:notifyemsdeads')
AddEventHandler('retro_scripts:notifyemsdeads', function()
	ESX.ShowNotification('~r~Someone is in need of medical attention. Check your Phone to get the GPS')
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    

	
	Citizen.Wait(5000)
	
end)




-- Create blip for colleagues
function createBlipAmbulance(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsEms, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('retro_scripts:updateEmsBlips')
AddEventHandler('retro_scripts:updateEmsBlips', function()
	
	-- Refresh all blips
	for k, existingBlip in pairs(blipsEms) do
		RemoveBlip(existingBlip)
	end
	
	-- Clean the blip table
	blipsEms = {}


	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'ambulance' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlipAmbulance(id)
					end
				end
			end
		end)
	end

end)



-- Create blip for colleagues
function createBlipGroove(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsGroove, blip) -- add blip to array so we can remove it later
	end
end


RegisterNetEvent('retro_scripts:updateGrooveBlips')
AddEventHandler('retro_scripts:updateGrooveBlips', function()
	
	-- Refresh all blips
	for k, existingBlip in pairs(blipsGroove) do
		RemoveBlip(existingBlip)
	end
	
	-- Clean the blip table
	blipsGroove = {}


	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job ~= nil and PlayerData.job.name == 'groove' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'groove' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlipGroove(id)
					end
				end
			end
		end)
	end

end)


-- Create blip for colleagues
function createBlipCops(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end


RegisterNetEvent('retro_scripts:blipsCops')
AddEventHandler('retro_scripts:blipsCops', function()
	
	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end
	
	-- Clean the blip table
	blipsCops = {}


	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'police' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlipCops(id)
					end
				end
			end
		end)
	end

end)





RegisterNetEvent("retro_scripts:initgroove")
AddEventHandler('retro_scripts:initgroove', function(source)
  --  print('[RETRO_SCRIPTS] initializing groove stuffs') 

    --radio
	exports["rp-radio"]:GivePlayerAccessToFrequencies(3,4) 

	ESX.ShowNotification('Whitelist Frequency for Mechanic activated ~g~FREQ #3 and #4(All Whitelisted) ')
      --blips
    --  TriggerEvent('retro_mechanic:updateBlip')


      --notif
     -- exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for Groove activated')
end)




RegisterNetEvent("retro_scripts:initpolice")
AddEventHandler('retro_scripts:initpolice', function(source)
  --  print('[RETRO_SCRIPTS] initializing police stuffs') 

    --radio
	exports["rp-radio"]:GivePlayerAccessToFrequencies(2,4) 

	ESX.ShowNotification('Whitelist Frequency for Police activated ~g~FREQ #2 and #4(All Whitelisted) ')
     --blips
  --   TriggerEvent('esx_policejob:updateBlip')

    --notif
    --exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for Police activated')
end)

RegisterNetEvent("retro_scripts:initems")
AddEventHandler('retro_scripts:initems', function(source)
   -- print('[RETRO_SCRIPTS] initializing ems stuffs') 

    --radio
	exports["rp-radio"]:GivePlayerAccessToFrequencies(1,4) 
	
	ESX.ShowNotification('Whitelist Frequency for EMS activated ~g~FREQ #1 and #4(All Whitelisted) ')

    --blips
  --  TriggerEvent('esx_ambulancejob:updateBlip')

    --notif
   -- exports['mythic_notify']:DoHudText('inform', 'Whitelist Access for EMS activated')
end)



RegisterNetEvent("retro_scripts:disabledutyradioPD")
AddEventHandler('retro_scripts:disabledutyradioPD', function(source, job)
	exports["rp-radio"]:RemovePlayerAccessToFrequencies(2,4)
    ESX.ShowNotification('Whitelist Frequencies for Police ~r~deactivated')
end)

RegisterNetEvent("retro_scripts:disabledutyradioEMS")
AddEventHandler('retro_scripts:disabledutyradioEMS', function(source, job)
	exports["rp-radio"]:RemovePlayerAccessToFrequencies(1,4)
    ESX.ShowNotification('Whitelist Frequencies for EMS ~r~deactivated')
end)

RegisterNetEvent("retro_scripts:disabledutyradioMECH")
AddEventHandler('retro_scripts:disabledutyradioMECH', function(source, job)
	exports["rp-radio"]:RemovePlayerAccessToFrequencies(3,4)
    ESX.ShowNotification('Whitelist Frequencies for MECHANIC ~r~deactivated')
end)

RegisterNetEvent("retro_scripts:enabledutyradioPD")
AddEventHandler('retro_scripts:enabledutyradioPD', function(source)
	exports["rp-radio"]:GivePlayerAccessToFrequencies(2, 4)
    ESX.ShowNotification('Whitelist Frequency for Police activated ~g~FREQ #2 and #4(All Whitelisted)')
end)


RegisterNetEvent("retro_scripts:enabledutyradioEMS")
AddEventHandler('retro_scripts:enabledutyradioEMS', function(source)
	exports["rp-radio"]:GivePlayerAccessToFrequencies(1, 4)
    ESX.ShowNotification('Whitelist Frequency for EMS activated ~g~FREQ #1 and #4(All Whitelisted)')
end)


RegisterNetEvent("retro_scripts:enabledutyradioMECH")
AddEventHandler('retro_scripts:enabledutyradioMECH', function(source)
	exports["rp-radio"]:GivePlayerAccessToFrequencies(3, 4)
    ESX.ShowNotification('Whitelist Frequency for Mechanic activated ~g~FREQ #3 and #4(All Whitelisted)')
end)


RegisterNetEvent("retro_scripts:fly")
AddEventHandler('retro_scripts:fly', function(source)
    local pP = GetPlayerPed(-1)
    local coords    = GetEntityCoords(pP)

    SetEntityCoords(PlayerPedId(pP), coords.x, coords.y, coords.z + 20, true, true, true, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

RegisterNetEvent("retro_scripts:combatlogpasir")
AddEventHandler('retro_scripts:combatlogpasir', function(source)
    local pP = GetPlayerPed(-1)
    local coords    = GetEntityCoords(pP)
    DoScreenFadeOut(2000)
    SetEntityCoords(PlayerPedId(pP), -497.53268432617, -342.3623046875, 34.501720428467 , true, true, true, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    DoScreenFadeIn(2000)
end)






Citizen.CreateThread(function()
	--Wait(2*60000) -- Delay first spawn.
	while true do
		ClearAllBrokenGlass()
		ClearAllHelpMessages()
		LeaderboardsReadClearAll()
		ClearBrief()
		ClearGpsFlags()
		ClearPrints()
		ClearSmallPrints()
		ClearReplayStats()
		LeaderboardsClearCacheData()
		ClearFocus()
		ClearHdArea()
		print("RETRO CITY FPS BOOT RUNNING ~Cedrick Alegroso Malakaz~")
		Wait(1*60000)
	end
end)


--blindfire

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then 
            DisableControlAction(2, 24, true) 
            DisableControlAction(2, 142, true)
            DisableControlAction(2, 257, true)
        end
    end
end)

RegisterNetEvent('retro_scripts:notif')
AddEventHandler('retro_scripts:notif', function(source)
	print('WEW')

end)

RegisterNetEvent('retro_scripts:rewardsmenu')
AddEventHandler('retro_scripts:rewardsmenu', function()
    openMenu()
end)


RegisterNetEvent('retro_scripts:Notify')
AddEventHandler('retro_scripts:Notify', function(ped, message)
	print('triggered Notify')
	ESX.ShowNotification('Eyy '..message)
end)

function openMenu()
	local ped = PlayerPedId()
    print('Player '..ped..' Opened rewards menu')
	--exports['mythic_notify']:DoHudText('inform', 'Hype! Custom Styling!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })


	local elements = {
		{label = 'Get Todays Reward',      value = 'gettodays'},
		{label = 'Donators Reward',      value = 'getdonate'},
	}



	
	ESX.UI.Menu.CloseAll()


	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Retro Daily Rewards',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'gettodays' then
			ExecuteCommand('openMyRewardsRetro')
				
			elseif data.current.value == 'getdonate' then
				ExecuteCommand('openMyRewardsRetro1')
			end

		end, function(data, menu)
			menu.close()

		
		end)
end

RegisterNetEvent('retro_scripts:illegalcashbankmenu')
AddEventHandler('retro_scripts:illegalcashbankmenu', function(source)
	print('triggered')

	local elements = {
		{label = 'Check Balance',      value = 'bal'},
		{label = 'Deposit Money',      value = 'depmoney'},
		{label = 'Withdraw Money',     value = 'withmoney'},
		
	}

	
	ESX.UI.Menu.CloseAll()


	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = 'Illegal Cash',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'depmoney' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit_illegal_cash', {
					title = 'How much do you want to deposit?'
				}, function(data, menu)
	
					local amount = tonumber(data.value)
	
					if amount == nil then
						ESX.ShowNotification('Invalid AMount')
					else
						print('deposit!!!')
						menu.close()

						TriggerEvent("mythic_progbar:client:progress", {
							name = "unique_action_name",
							duration = 4000,
							label = "Transacting with encrypted network",
							useWhileDead = false,
							canCancel = false,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							},
							animation = {
								animDict = "amb@world_human_stand_mobile@female@standing@call@enter",
								anim = "enter",
							},
							prop = {
								model = "prop_police_phone",
							}
						}, function(status)
							if not status then
								ExecuteCommand('RetroBankIllegalDep '..amount)
							--	TriggerServerEvent('retro_scripts:depositillegalcash', amount)
							end
						end)
						
					end
	
				end, function(data, menu)
					menu.close()
				end)
			elseif data.current.value == 'withmoney' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit_illegal_cash', {
					title = 'How much do you want to Withdraw?'
				}, function(data, menu)
	
					local amount = tonumber(data.value)
	
					if amount == nil then
						ESX.ShowNotification('Invalid AMount')
					else
						print('witdraw!!!')
						menu.close()

						TriggerEvent("mythic_progbar:client:progress", {
							name = "unique_action_name",
							duration = 4000,
							label = "Transacting with encrypted network",
							useWhileDead = false,
							canCancel = false,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							},
							animation = {
								animDict = "amb@world_human_stand_mobile@female@standing@call@enter",
								anim = "enter",
							},
							prop = {
								model = "prop_police_phone",
							}
						}, function(status)
							if not status then
								ExecuteCommand('RetroBankIllegalWith '..amount)
							--	TriggerServerEvent('retro_scripts:withillegalcash', amount)
							end
						end)
						
					end
	
				end, function(data, menu)
					menu.close()
				end)
			elseif data.current.value == 'bal' then
				ESX.TriggerServerCallback('retro_scripts:getbalancedirty', function(money)
				    ESX.ShowNotification('Balance: ~r~'.. money)
				end, source)
			
			elseif data.current.value == 'delacc' then
			end

		end, function(data, menu)
			menu.close()

		
		end)
end)