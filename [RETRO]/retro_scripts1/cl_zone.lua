--------------------------------------------------------------------------------------------------------------
------------First off, many thanks to @anders for help with the majority of this script. ---------------------
------------Also shout out to @setro for helping understand pNotify better.              ---------------------
--------------------------------------------------------------------------------------------------------------
------------To configure: Add/replace your own coords in the sectiong directly below.    ---------------------
------------        Goto LINE 90 and change "50" to your desired SafeZone Radius.        ---------------------
------------        Goto LINE 130 to edit the Marker( Holographic circle.)               ---------------------
--------------------------------------------------------------------------------------------------------------
-- Place your own coords here!

local zones = { -- 1799.6811523438,3665.3786621094,34.280109405518 1038.3634033203,4838.0444335938,758.95715332031
	--{ ['x'] = -108.7912979126, ['y'] = -1816.0548095703, ['z'] = -1.00 }, 443.66622924805,5899.8974609375,916.09521484375
--	{ ['x'] = -500.29672241211, ['y'] = -323.38958740234, ['z'] = 0 }, 194.61839294434,6487.0522460938,712.57006835938
	--{ ['x'] = -488.82958984375, ['y'] = -333.06072998047, ['z'] = 0 },
	{ ['x'] =194.61839294434, ['y'] = 6487.0522460938, ['z'] = 90.280109405518 },
	--{ ['x'] = -102.20610809326, ['y'] =-1809.0076904297, ['z'] = 26.812646865845 },
	--{ ['x'] = -442.79278564453, ['y'] = -324.29922485352, ['z'] = 0 },
	--{ ['x'] = -92.211532592773, ['y'] = -1806.4682617188, ['z'] = 0 },

	
	
}

local notifIn = false
local notifOut = false
local closestZone = 1

local calledSakit = 0
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-------                              Creating Blips at the locations. 							--------------
-------You can comment out this section if you dont want any blips showing the zones on the map.--------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	for i = 1, #zones, 1 do
		local szBlip = AddBlipForCoord(zones[i].x, zones[i].y, zones[i].z)
		SetBlipAsShortRange(szBlip, true)
		SetBlipColour(szBlip, 2)  --Change the blip color: https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
		SetBlipSprite(szBlip, 398) -- Change the blip itself: https://marekkraus.sk/gtav/blips/list.html
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("SAFE ZONE") -- What it will say when you hover over the blip on your map.
		EndTextCommandSetBlipName(szBlip)
	end
end)


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------   Getting your distance from any one of the locations  --------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
---------   Setting of friendly fire on and off, disabling your weapons, and sending pNoty   -----------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
RegisterNetEvent('retro_scripts:stopCalled')
AddEventHandler('retro_scripts:stopCalled', function(source)
	calledSakit = 0
end)



Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end

	
	
	while true do
		Citizen.Wait(0)



		--print('called '..calledSakit)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)


		
		
	
		if dist <= 4000.0 then  ------------------------------------------------------------------------------ Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because 
			if not notifIn then																			  -- it is a sphere. So 50 will actually result in a diameter of 100. I assume it is meters. No clue to be honest.
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
				--exports['mythic_notify']:DoHudText('success', 'You are in a Safe Zone')

				exports['mythic_notify']:DoHudText('success', 'You are in a Safe Zone')

			
			
				notifIn = true
				notifOut = false
			end

			while calledSakit == 1 do 
					
				RequestAnimDict("oddjobs@taxi@tie")
				while not HasAnimDictLoaded("oddjobs@taxi@tie") do
				Citizen.Wait(100)
				end
		  
				TaskPlayAnim(player, "oddjobs@taxi@tie", "vomit_outside", 8.0, 8.0, -1, 50, 0, false, false, false)
				Citizen.Wait(7000)
		  
				ClearPedSecondaryTask(player)


				Citizen.Wait(7000)
				SetEntityHealth(player, GetEntityHealth(player) - 5)
			end
		else
			if not notifOut then
				NetworkSetFriendlyFireOption(true)
			--	exports['mythic_notify']:DoHudText('error', 'You are in NO LONGER a Safe Zone')
			exports['mythic_notify']:DoHudText('error', 'You are in a Contaminated Area')


			--while GetEntityHealth(player) ~= 0 do 
				SetEntityHealth(player, GetEntityHealth(player) - 60)

			--end
				
			
			while calledSakit == 1 do 
				print('sakit!')
				RequestAnimDict("oddjobs@taxi@tie")
				while not HasAnimDictLoaded("oddjobs@taxi@tie") do
				Citizen.Wait(100)
				end
		  
				TaskPlayAnim(player, "oddjobs@taxi@tie", "vomit_outside", 8.0, 8.0, -1, 50, 0, false, false, false)
				Citizen.Wait(7000)
		  
				ClearPedSecondaryTask(player)


				Citizen.Wait(7000)
				SetEntityHealth(player, GetEntityHealth(player) - 5)
			end
				
		


				if calledSakit == 0 then 
					TriggerServerEvent('esx_disease:malato',player)
					TriggerServerEvent('esx_disease:malatostomaco',player)
					TriggerServerEvent('esx_disease:malatopelle',player)

					
				end

				calledSakit = 1
				notifOut = true
				notifIn = false
			end
		end
	--	if notifIn then
	--	DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
	--	DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
     -- 	DisableControlAction(0, 106, true) -- Disable in-game mouse controls
			--if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
			--	SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
			--	exports['mythic_notify']:DoHudText('error', 'You can not use weapons in a Safe Zone')

		--	end
		--	if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
			--	SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
		--		exports['mythic_notify']:DoHudText('error', 'You can not do that in a Safe Zone')
			
		--	end
	--	end
		-- Comment out lines 142 - 145 if you dont want a marker.
	 	if DoesEntityExist(player) then	      --The -1.0001 will place it on the ground flush		-- SIZING CIRCLE |  x    y    z | R   G    B   alpha| *more alpha more transparent*
	 		DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0, 8000.0, 8000.0, 100.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0) -- heres what all these numbers are. Honestly you dont really need to mess with any other than what isnt 0.
	 		--DrawMarker(type, float posX, float posY, float posZ, float dirX, float dirY, float dirZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ, int red, int green, int blue, int alpha, BOOL bobUpAndDown, BOOL faceCamera, int p19(LEAVE AS 2), BOOL rotate, char* textureDict, char* textureName, BOOL drawOnEnts)
	 	end
	end
end)