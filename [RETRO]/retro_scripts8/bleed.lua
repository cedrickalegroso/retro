
local takenoxy = 0
local alreadyTaken = 0

function setBleedingOn(ped)
    SetEntityHealth(ped,GetEntityHealth(ped)-2)
    if not effect then
  -- StartScreenEffect('Rampage', 0, true)
   effect = true
   end

  
  -- NetworkSetVoiceChannel(0)
   Citizen.CreateThread(function()
     DoScreenFadeOut(1000)
     StartScreenEffect('DeathFailOut', 0, true)
   --  SetTimecycleModifier("hud_def_blur")
     SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)

     Citizen.Wait(2000)
   --  ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
     DoScreenFadeIn(2000)
     Citizen.Wait(2000)

     Citizen.Wait(2000)
     --  ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
       DoScreenFadeIn(2000)
       Citizen.Wait(2000)

       Citizen.Wait(2000)
       --  ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
         DoScreenFadeIn(2000)
         Citizen.Wait(2000)
         Citizen.Wait(2000)
         --  ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
           DoScreenFadeIn(2000)
           Citizen.Wait(2000)



    
   end)

   -- ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
    InfoRanny("~r~You are bleeding!")
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    Wait(7000)
 
 end
 
 RegisterNetEvent('retro_scripts:notBleed')
AddEventHandler('retro_scripts:notBleed', function(source, ped)

    if alreadyTaken == 1 then 
      TriggerEvent('notification', ('Oxy is not stackable spamming wont do you any good'), 2)
     -- exports['mythic_notify']:DoHudText('error', 'Oxy is not stackable spamming wont do you any good')
     --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Oxy is not stackable spamming wont do you any good'})
    else
      TriggerEvent('notification', ('You have taken Oxy this will last for 1 Min'), 2)
      print('Stopping Bleed')
      StopScreenEffect('DeathFailOut')
      setBleedingOff(ped)
      takenoxy = 1
      alreadyTaken = 1
      
     
      --[[
  TriggerEvent('notification', ('You have taken Oxy this will last for 1 Min'), 2)
     -- exports['mythic_notify']:DoHudText('success', 'You have taken Oxy this will last for 1 Min')
    -- TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You have taken Oxy this will last for 1 Min. '})
      print('Stopping Bleed')
      StopScreenEffect('DeathFailOut')
      setBleedingOff(ped)
      takenoxy = 1
      alreadyTaken = 1
      effect = false
      print('taken oxy '..takenoxy)
      print('alreadyTaken '..alreadyTaken)
      Citizen.Wait(60000)
      print('1 Min has gone by Oxy is not affecting you anymore.')
  
      takenoxy = 0
      alreadyTaken = 0
      print('taken oxy '..takenoxy)
      print('alreadyTaken '..alreadyTaken)
      effect = true
      ]]--
    
    end

   
  
    
end)


 function setBleedingOff(ped)
    effect = false
 --   SetEntityHealth(ped, 150)
    StopScreenEffect('Rampage')
    StopScreenEffect('DeathFailOut')
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
 end
 
 local effect = false
 
 Citizen.CreateThread(function()
 while true do
 Wait(0)
 local player = GetPlayerPed(-1)
 local Health = GetEntityHealth(player)
 
 if takenoxy == 1 then
   setBleedingOff(player)
   Citizen.Wait(60000)
 
   if Health > 180 then
    takenoxy = 0
   end

 else 
   if Health <= 139   then
      setBleedingOn(player)
  
   elseif Health > 140 then
     setBleedingOff(player)
     
   end

 end
  
 end
 end)
  
 function InfoRanny(text)
 SetNotificationTextEntry("STRING")
 AddTextComponentString(text)
 DrawNotification(false, false)
 end
