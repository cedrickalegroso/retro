ESX = nil
local IsAlreadyDrug = false
local DrugLevel = -1

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'drug', 0, '#9ec617', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end, function(status)
      status.remove(1500)
    end)

	Citizen.CreateThread(function()
		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drug', function(status)

		if status.val > 0 then
          local start = true

          if IsAlreadyDrug then
            start = false
          end

          local level = 0

          if status.val <= 999999 then
            level = 0
          else
            overdose()
          end

          if level ~= DrugLevel then
          end

          IsAlreadyDrug = true
          DrugLevel = level
		end

		if status.val == 0 then
          
          if IsAlreadyDrug then
            Normal()
          end

          IsAlreadyDrug = false
          DrugLevel     = -1
		end
			end)
		end
	end)
end)

--When effects ends go back to normal
function Normal()

  Citizen.CreateThread(function()
    local playerPed = GetPlayerPed(-1)
			
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    --ResetPedMovementClipset(playerPed, 0) <- it might cause the push of the vehicles
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)
  end)
end

--In case too much drugs dies of overdose set everything back
function overdose()

  Citizen.CreateThread(function()
    local playerPed = GetPlayerPed(-1)
	
    SetEntityHealth(playerPed, 0)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrug(playerPed, false)
    SetPedMotionBlur(playerPed, false)
  end)
end

--Drugs Effects

--Marijuana
RegisterNetEvent('esx_drugeffects:onMarijuana')
AddEventHandler('esx_drugeffects:onMarijuana', function()
 local playerPed = GetPlayerPed(-1)

    RequestAnimSet("move_m@hipster@a") 
    while not HasAnimSetLoaded("move_m@hipster@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
   -- SetPedIsDrug(playerPed, true)

   ESX.ShowNotification('You are drugged and can run a little bit faster.')

    --Efects
    local player = PlayerId()
    
    SetRunSprintMultiplierForPlayer(player, 1.3)

    print('start count')
    Wait(16000)
    print('stop count')

    SetRunSprintMultiplierForPlayer(player, 1.0)

end)

--Opium
RegisterNetEvent('esx_drugeffects:onOpium')
AddEventHandler('esx_drugeffects:onOpium', function()
  local playerPed = GetPlayerPed(-1)
  

    --Efects
    local player = PlayerId()
    SetRunSprintMultiplierForPlayer(player, 1.2)
    SetSwimMultiplierForPlayer(player, 1.3)

    Wait(520000)

    SetRunSprintMultiplierForPlayer(player, 1.0)
    SetSwimMultiplierForPlayer(player, 1.0)


        RequestAnimSet("move_m@drunk@moderatedrunk") 
    while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    SetPedIsDrug(playerPed, true)

  
 end)

--Meth
RegisterNetEvent('esx_drugeffects:onMeth')
AddEventHandler('esx_drugeffects:onMeth', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)

  local player = PlayerId()  
  local health = GetEntityHealth(playerPed)
  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))


  SetEntityHealth(playerPed, newHealth)

        RequestAnimSet("move_injured_generic") 
    while not HasAnimSetLoaded("move_injured_generic") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_injured_generic", true)
    SetPedIsDrug(playerPed, true)

   --Efects

end)

--Coke
RegisterNetEvent('esx_drugeffects:onCoke')
AddEventHandler('esx_drugeffects:onCoke', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  local player = PlayerId()
  local health = GetEntityHealth(playerPed)
  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/6))

  SetEntityHealth(playerPed, newHealth)
  SetPedArmour(playerPed, 30)


        RequestAnimSet("move_m@hurry_butch@a") 
    while not HasAnimSetLoaded("move_m@hurry_butch@a") do
      Citizen.Wait(0)
    end    

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
    SetPedIsDrug(playerPed, true)

    --Efects
   
    --AddArmourToPed(playerPed, 100)
   

end)



RegisterNetEvent('esx_drugeffects:onpackaged_apple')
AddEventHandler('esx_drugeffects:onpackaged_apple', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  local player = PlayerId()
  local health = GetEntityHealth(playerPed)
  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))

  TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = 5000,
		label = "Eating Apple",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
		},
		prop = {
			model = "prop_paper_bag_small",
		}
	}, function(status)
    if not status then
      ESX.ShowNotification('Your regained health and gained Armor')
      SetEntityHealth(playerPed, newHealth)
      SetPedArmour(playerPed, 30)
		end
	end)
 
 
   

end)



RegisterNetEvent('esx_drugeffects:onpackaged_banana')
AddEventHandler('esx_drugeffects:onpackaged_banana', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  local player = PlayerId()
  local health = GetEntityHealth(playerPed)
  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))

  TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = 5000,
		label = "Eating Banana",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
		},
		prop = {
			model = "prop_paper_bag_small",
		}
	}, function(status)
    if not status then
      ESX.ShowNotification('You regained Health.')
      SetEntityHealth(playerPed, newHealth)
		end
	end)
 
 -- SetPedArmour(playerPed, 30)
   

end)

RegisterNetEvent('esx_drugeffects:onpackaged_grapes')
AddEventHandler('esx_drugeffects:onpackaged_grapes', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  local player = PlayerId()
  local health = GetEntityHealth(playerPed)
  local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))


  TriggerEvent("mythic_progbar:client:progress", {
		name = "unique_action_name",
		duration = 5000,
		label = "Eating Grapes",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
		},
		prop = {
			model = "prop_paper_bag_small",
		}
	}, function(status)
    if not status then
      ESX.ShowNotification('You gained Armor.')
      AddArmourToPed(playerPed, 25)
		end
	end)
  
   

end)


RegisterNetEvent('esx_drugeffects:onpackaged_orange')
AddEventHandler('esx_drugeffects:onpackaged_orange', function()
 local playerPed = GetPlayerPed(-1)

 TriggerEvent("mythic_progbar:client:progress", {
  name = "unique_action_name",
  duration = 5000,
  label = "Eating Orange",
  useWhileDead = false,
  canCancel = true,
  controlDisables = {
    disableMovement = false,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
  },
  animation = {
    animDict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
  },
  prop = {
    model = "prop_paper_bag_small",
  }
}, function(status)
  if not status then
    --Efects
    local player = PlayerId()
    ESX.ShowNotification('You can now run a little bit faster')
    
    SetRunSprintMultiplierForPlayer(player, 1.3)

    print('start count')
    Wait(16000)
    print('stop count')

    ESX.ShowNotification('Your run speed goes back to normal again')
    SetRunSprintMultiplierForPlayer(player, 1.0)
  end
end)


  

end)
