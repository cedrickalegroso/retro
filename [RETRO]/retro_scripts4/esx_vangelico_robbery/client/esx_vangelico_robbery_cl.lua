local holdingup = false
local store = ""
local blipRobbery = nil

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_vangelico_robbery:currentlyrobbing')
AddEventHandler('esx_vangelico_robbery:currentlyrobbing', function(robb)
	holdingup = true
	store = robb
end)

RegisterNetEvent('esx_vangelico_robbery:killblip')
AddEventHandler('esx_vangelico_robbery:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_vangelico_robbery:setblip')
AddEventHandler('esx_vangelico_robbery:setblip', function(position)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 0.7)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_vangelico_robbery:toofarlocal')
AddEventHandler('esx_vangelico_robbery:toofarlocal', function(robb)
	holdingup = false
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	incircle = false
end)


RegisterNetEvent('esx_vangelico_robbery:robberycomplete')
AddEventHandler('esx_vangelico_robbery:robberycomplete', function(robb)
	holdingup = false

 
	TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else

		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
	    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	    end
	    end)
  

	
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
end)

Citizen.CreateThread(function()

		  -- Load the textures
		  RequestStreamedTextureDict("world_blips", 1)
		  while not HasStreamedTextureDictLoaded("world_blips") do
			  Wait(0)
		  end

		  

	for k,v in pairs(StoresJEWEL)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 439)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)


		-- Add all the cool info to the blip
	exports['blip_info']:SetBlipInfoTitle(blip, 'Jewelry Robbery', false)
	exports['blip_info']:SetBlipInfoImage(blip, "world_blips", "illegal")
	--exports['blip_info']:AddBlipInfoText(blip, "Area", "La Mesa")
	exports['blip_info']:AddBlipInfoHeader(blip, "") -- Empty header adds the header line
	exports['blip_info']:AddBlipInfoText(blip, "Type", "Illegal")

	exports['blip_info']:AddBlipInfoText(blip, "Police Units", "[STRICT] POLICE +2")
	exports['blip_info']:AddBlipInfoText(blip, "Required Police", "4 Officers")
	exports['blip_info']:AddBlipInfoText(blip, "Minimum EMS", "1")
	exports['blip_info']:AddBlipInfoText(blip, "Minimum Robbers", "4")
	--exports['blip_info']:AddBlipInfoText(blip, "Sell your jewelries here!")
		


	end
end)


incircle = false

hasrobbed = false
hasrobbed2 = false
hasrobbed3 = false
hasrobbed4 = false
hasrobbed5 = false
hasrobbed6 = false
hasrobbed7 = false
hasrobbed8 = false
hasrobbed9 = false
hasrobbed10 = false
hasrobbed11 = false
hasrobbed12 = false
hasrobbed13 = false
hasrobbed14 = false
hasrobbed15 = false
hasrobbed16 = false
hasrobbed17 = false
hasrobbed18 = false
hasrobbed19 = false
hasrobbed20 = false

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(StoresJEWEL)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not holdingup then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText('Press [E] to start the robberry')
						end
						incircle = true
						if IsControlJustReleased(0, 38) then

							ESX.TriggerServerCallback('retro_scripts:getHackerDevice', function(hackerDevice)
							

								if hackerDevice == 1 then 


									TriggerEvent("mythic_progbar:client:progress", {
										name = "unique_action_name",
										duration = 15000,
										label = "Finding Network insecurities",
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
											gioielli1 = AddBlipForCoord(-21.699983596802,6487.1201171875,31.514856338501)
											SetBlipSprite(gioielli1,1)
											SetBlipColour(gioielli1,16742399)
											SetBlipScale(gioielli1,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli1)
				
											gioielli2 = AddBlipForCoord(-20.171915054321,6487.8793945312,31.514869689941)
											SetBlipSprite(gioielli2,1)
											SetBlipColour(gioielli2,16742399)
											SetBlipScale(gioielli2,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli2)
				
											gioielli3 = AddBlipForCoord(-18.816240310669,6487.4448242188,31.514904022217)
											SetBlipSprite(gioielli3,1)
											SetBlipColour(gioielli3,16742399)
											SetBlipScale(gioielli3,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli3)
				
											gioielli4 = AddBlipForCoord(-17.928033828735,6485.69140625,31.509088516235)
											SetBlipSprite(gioielli4,1)
											SetBlipColour(gioielli4,16742399)
											SetBlipScale(gioielli4,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli4)
				
				
											gioielli5 = AddBlipForCoord(-18.292133331299,6484.4794921875,31.499258041382)
											SetBlipSprite(gioielli5,1)
											SetBlipColour(gioielli5,16742399)
											SetBlipScale(gioielli5,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli5)
				
											gioielli6 = AddBlipForCoord(-17.561706542969,6487.6884765625,31.514965057373)
											SetBlipSprite(gioielli6,1)
											SetBlipColour(gioielli6,16742399)
											SetBlipScale(gioielli6,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli6)
				
											gioielli7 = AddBlipForCoord(-18.229818344116,6489.1909179688,31.514934539795)
											SetBlipSprite(gioielli7,1)
											SetBlipColour(gioielli7,16742399)
											SetBlipScale(gioielli7,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli7)
				
											gioielli8 = AddBlipForCoord(-17.724700927734,6490.5473632812,31.514928817749)
											SetBlipSprite(gioielli8,1)
											SetBlipColour(gioielli8,16742399)
											SetBlipScale(gioielli8,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli8)
				
											gioielli9 = AddBlipForCoord(-15.999079704285,6491.4272460938,31.514972686768)
											SetBlipSprite(gioielli9,1)
											SetBlipColour(gioielli9,16742399)
											SetBlipScale(gioielli9,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli9)
				
											gioielli10 = AddBlipForCoord(-14.381952285767,6490.6884765625,31.515020370483)
											SetBlipSprite(gioielli10,1)
											SetBlipColour(gioielli10,16742399)
											SetBlipScale(gioielli10,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli10)
				
											gioielli11 = AddBlipForCoord(-16.235395431519,6489.2719726562,31.515003204346)
											SetBlipSprite(gioielli11,1)
											SetBlipColour(gioielli11,16742399)
											SetBlipScale(gioielli11,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli11)
				
											gioielli12 = AddBlipForCoord(-14.062242507935,6485.9965820312,31.512163162231)
											SetBlipSprite(gioielli12,1)
											SetBlipColour(gioielli12,16742399)
											SetBlipScale(gioielli12,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli12)
				
											gioielli13 = AddBlipForCoord(-13.067048072815,6485.1313476562,31.505477905273)
											SetBlipSprite(gioielli13,1)
											SetBlipColour(gioielli13,16742399)
											SetBlipScale(gioielli13,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli13)
				
											gioielli14 = AddBlipForCoord(-10.970438957214,6486.7802734375,31.515144348145)
											SetBlipSprite(gioielli14,1)
											SetBlipColour(gioielli14,16742399)
											SetBlipScale(gioielli14,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli14)
				
											gioielli15 = AddBlipForCoord(-11.918348312378,6487.7563476562,31.515130996704)
											SetBlipSprite(gioielli15,1)
											SetBlipColour(gioielli15,16742399)
											SetBlipScale(gioielli15,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli15)
				
											gioielli16 = AddBlipForCoord(-13.277973175049,6487.2563476562,31.51508140564)
											SetBlipSprite(gioielli16,1)
											SetBlipColour(gioielli16,16742399)
											SetBlipScale(gioielli16,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli16)
				
											gioielli17 = AddBlipForCoord(-11.914082527161,6485.8461914062,31.511383056641)
											SetBlipSprite(gioielli17,1)
											SetBlipColour(gioielli17,16742399)
											SetBlipScale(gioielli17,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli17)
				
											gioielli18 = AddBlipForCoord(-16.1535987854,6480.4604492188,31.467273712158)
											SetBlipSprite(gioielli18,1)
											SetBlipColour(gioielli18,16742399)
											SetBlipScale(gioielli18,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli18)
				
											gioielli19 = AddBlipForCoord(-13.39221572876,6482.5834960938,31.484991073608)
											SetBlipSprite(gioielli19,1)
											SetBlipColour(gioielli19,16742399)
											SetBlipScale(gioielli19,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli19)
				
											gioielli20 = AddBlipForCoord(-20.044359207153,6485.8798828125,31.510192871094)
											SetBlipSprite(gioielli20,1)
											SetBlipColour(gioielli20,16742399)
											SetBlipScale(gioielli20,0.5)
											BeginTextCommandSetBlipName("STRING")
											AddTextComponentString(_U('jewelsblipmap'))
											EndTextCommandSetBlipName(gioielli20)	
											
											TriggerServerEvent('esx_vangelico_robbery:rob', k)
										end
									end)

									

								else
									ESX.ShowNotification('~r~You dont have any Hacking Device to start the robberry!') 

								end
							end, source)
						end

						
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end

		if holdingup then
							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -21.699983596802,6487.1201171875,31.514856338501, true) < 0.5 ) then
								if (hasrobbed == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -21.699983596802,6487.1201171875,31.514856338501, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli1)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-20.171915054321,6487.8793945312,31.514869689941, true) < 0.5 ) then
								if (hasrobbed2 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -20.171915054321,6487.8793945312,31.514869689941, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli2)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed2 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -18.816240310669,6487.4448242188,31.514904022217, true) < 0.5 ) then
								if (hasrobbed3 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -18.816240310669,6487.4448242188,31.514904022217, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli3)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed3 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -17.928033828735,6485.69140625,31.509088516235, true) < 0.5 ) then
								if (hasrobbed4 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -17.928033828735,6485.69140625,31.509088516235, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli4)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
								hasrobbed4 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -18.292133331299,6484.4794921875,31.499258041382, true) < 0.5 ) then
								if (hasrobbed5 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -18.292133331299,6484.4794921875,31.499258041382, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli5)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed5 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -17.561706542969,6487.6884765625,31.514965057373, true) < 0.5 ) then
								if (hasrobbed6 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -17.561706542969,6487.6884765625,31.514965057373, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli6)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed6 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -18.229818344116,6489.1909179688,31.514934539795, true) < 0.5 ) then
								if (hasrobbed7 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -18.229818344116,6489.1909179688,31.514934539795, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli7)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed7 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -17.724700927734,6490.5473632812,31.514928817749, true) < 0.5 ) then
								if (hasrobbed8 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -17.724700927734,6490.5473632812,31.514928817749, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli8)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed8 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -15.999079704285,6491.4272460938,31.514972686768, true) < 0.5 ) then
							if (hasrobbed9 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash",-15.999079704285,6491.4272460938,31.514972686768, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli9)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed9 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-14.381952285767,6490.6884765625,31.515020370483, true) < 0.5 ) then
							if (hasrobbed10 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -14.381952285767,6490.6884765625,31.515020370483, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli10)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed10 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -16.235395431519,6489.2719726562,31.515003204346, true) < 0.5 ) then
							if (hasrobbed11 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -16.235395431519,6489.2719726562,31.515003204346, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli11)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed11 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -14.062242507935,6485.9965820312,31.512163162231, true) < 0.5 ) then
							if (hasrobbed12 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -14.062242507935,6485.9965820312,31.512163162231, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli12)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed12 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -13.067048072815,6485.1313476562,31.505477905273, true) < 0.5 ) then
							if (hasrobbed13 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash",-13.067048072815,6485.1313476562,31.505477905273, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli13)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed13 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -10.970438957214,6486.7802734375,31.515144348145, true) < 0.5 ) then
							if (hasrobbed14 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -10.970438957214,6486.7802734375,31.515144348145, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli14)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed14 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -11.918348312378,6487.7563476562,31.515130996704, true) < 0.5 ) then
							if (hasrobbed15 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -11.918348312378,6487.7563476562,31.515130996704, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli15)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed15 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -13.277973175049,6487.2563476562,31.51508140564, true) < 0.5 ) then
							if (hasrobbed16 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -13.277973175049,6487.2563476562,31.51508140564, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli16)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed16 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -11.914082527161,6485.8461914062,31.511383056641, true) < 0.5 ) then
							if (hasrobbed17 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash",-11.914082527161,6485.8461914062,31.511383056641, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli17)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed17 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -16.1535987854,6480.4604492188,31.467273712158, true) < 0.5 ) then
							if (hasrobbed18 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -16.1535987854,6480.4604492188,31.467273712158, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli18)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed18 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),-13.39221572876,6482.5834960938,31.484991073608, true) < 0.5 ) then
							if (hasrobbed19 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -13.39221572876,6482.5834960938,31.484991073608, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli19)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed19 = true
							end
							end
							end

							if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -20.044359207153,6485.8798828125,31.510192871094, true) < 0.5 ) then
							if (hasrobbed20 == false) then
							DisplayHelpText(_U('field'))
							if IsControlJustReleased(1, 51) then
								local player = GetPlayerPed( -1 )
								if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
	                            RequestNamedPtfxAsset("scr_jewelheist")
                                end
                                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
	                            Citizen.Wait(0)
                                end
                                SetPtfxAssetNextCall("scr_jewelheist")
								StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", -20.044359207153,6485.8798828125,31.510192871094, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
								loadAnimDict( "missheist_jewel" ) 
								TaskPlayAnim( player, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
								DisplayHelpText(_U('collectinprogress'))
								DrawSubtitleTimed(5000, 1)
								Citizen.Wait(5000)
								ClearPedTasksImmediately(GetPlayerPed(-1))
								RemoveBlip(gioielli20)
								TriggerServerEvent('esx_vangelico_robbery:gioielli1')
								PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                                hasrobbed20 = true
							end
							end
							end

							if (hasrobbed == true) and (hasrobbed2 == true) and (hasrobbed3 == true) and (hasrobbed4 == true) and (hasrobbed5 == true) and (hasrobbed6 == true) and (hasrobbed7 == true) and (hasrobbed8 == true) and (hasrobbed9 == true) and (hasrobbed10 == true) and (hasrobbed11 == true) and (hasrobbed12 == true) and (hasrobbed13 == true) and (hasrobbed14 == true) and (hasrobbed15 == true) and (hasrobbed16 == true) and (hasrobbed17 == true) and (hasrobbed18 == true) and (hasrobbed19 == true) and (hasrobbed20 == true) then
							holdingup = false
							
							hasrobbed = false
                            hasrobbed2 = false
                            hasrobbed3 = false
                            hasrobbed4 = false
                            hasrobbed5 = false
                            hasrobbed6 = false
                            hasrobbed7 = false
                            hasrobbed8 = false
                            hasrobbed9 = false
                            hasrobbed10 = false
                            hasrobbed11 = false
                            hasrobbed12 = false
                            hasrobbed13 = false
                            hasrobbed14 = false
                            hasrobbed15 = false
                            hasrobbed16 = false
                            hasrobbed17 = false
                            hasrobbed18 = false
                            hasrobbed19 = false
                            hasrobbed20 = false
							TriggerServerEvent('esx_vangelico_robbery:endrob', store)
							ESX.ShowNotification(_U('lester'))

							
	TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 41, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                        end)
							
						
							end	

			local pos2 = StoresJEWEL[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -16.266967773438,6487.2094726562,31.515008926392, true) > 11.5 ) then
				TriggerServerEvent('esx_vangelico_robbery:toofar', store)
				holdingup = false
				RemoveBlip(gioielli1)
				RemoveBlip(gioielli2)
				RemoveBlip(gioielli3)
				RemoveBlip(gioielli4)
				RemoveBlip(gioielli5)
				RemoveBlip(gioielli6)
				RemoveBlip(gioielli7)
				RemoveBlip(gioielli8)
				RemoveBlip(gioielli9)
				RemoveBlip(gioielli10)
				RemoveBlip(gioielli11)
				RemoveBlip(gioielli12)
				RemoveBlip(gioielli13)
				RemoveBlip(gioielli14)
				RemoveBlip(gioielli15)
				RemoveBlip(gioielli16)
				RemoveBlip(gioielli17)
				RemoveBlip(gioielli18)
				RemoveBlip(gioielli19)
				RemoveBlip(gioielli20)
				
				hasrobbed = false
                hasrobbed2 = false
                hasrobbed3 = false
                hasrobbed4 = false
                hasrobbed5 = false
                hasrobbed6 = false
                hasrobbed7 = false
                hasrobbed8 = false
                hasrobbed9 = false
                hasrobbed10 = false
                hasrobbed11 = false
                hasrobbed12 = false
                hasrobbed13 = false
                hasrobbed14 = false
                hasrobbed15 = false
                hasrobbed16 = false
                hasrobbed17 = false
                hasrobbed18 = false
                hasrobbed19 = false
                hasrobbed20 = false
			end
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_vangelico_robbery:togliblip')
AddEventHandler('esx_vangelico_robbery:togliblip', function(robb)
	RemoveBlip(gioielli1)
	RemoveBlip(gioielli2)
	RemoveBlip(gioielli3)
	RemoveBlip(gioielli4)
	RemoveBlip(gioielli5)
	RemoveBlip(gioielli6)
	RemoveBlip(gioielli7)
	RemoveBlip(gioielli8)
	RemoveBlip(gioielli9)
	RemoveBlip(gioielli10)
	RemoveBlip(gioielli11)
	RemoveBlip(gioielli12)
	RemoveBlip(gioielli13)
	RemoveBlip(gioielli14)
	RemoveBlip(gioielli15)
	RemoveBlip(gioielli16)
	RemoveBlip(gioielli17)
	RemoveBlip(gioielli18)
	RemoveBlip(gioielli19)
	RemoveBlip(gioielli20)
end)

RegisterNetEvent("lester:createBlip")
AddEventHandler("lester:createBlip", function(type, x, y, z)

	  -- Load the textures
	  RequestStreamedTextureDict("world_blips", 1)
	  while not HasStreamedTextureDictLoaded("world_blips") do
		  Wait(0)
	  end


	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	if(type == 77)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Lester")
		EndTextCommandSetBlipName(blip)
	end

	-- Add all the cool info to the blip
	exports['blip_info']:SetBlipInfoTitle(blip, 'Lester', false)
	exports['blip_info']:SetBlipInfoImage(blip, "world_blips", "illegal")
	--exports['blip_info']:AddBlipInfoText(blip, "Area", "La Mesa")
	exports['blip_info']:AddBlipInfoHeader(blip, "") -- Empty header adds the header line
	exports['blip_info']:AddBlipInfoText(blip, "Type", "Illegal")

	exports['blip_info']:AddBlipInfoText(blip, "Police Units", "[STRICT] POLICE +2")
	exports['blip_info']:AddBlipInfoText(blip, "Required Police", "4 Officers")
	exports['blip_info']:AddBlipInfoText(blip, "Minimum EMS", "1")
	exports['blip_info']:AddBlipInfoText(blip, "Minimum Robbers", "4")
	--exports['blip_info']:AddBlipInfoText(blip, "Sell your jewelries here!")
		

end)

Citizen.CreateThread(function()

	-- -1124.5552978516,4892.5874023438,218.47245788574
	--	TriggerEvent('lester:createBlip', 77, 706.669, -966.898, 30.413)

	TriggerEvent('lester:createBlip', 77, -1124.5552978516,4892.5874023438,218.47245788574)

    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		
		if pos then
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1124.5552978516,4892.5874023438,218.47245788574, true) <= 5 then
					TriggerServerEvent('lester:vendita')
					Citizen.Wait(4000)
					
					
                  --[[

				    TriggerEvent('skinchanger:getSkin', function(skin)
	
		                       if skin.sex == 0 then

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
		                          TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		                        else

		                              local clothesSkin = {
		                              ['bags_1'] = 0, ['bags_2'] = 0
		                              }
	                              TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

	                           end
	                end)
					
				  ]]--
                  
				end	
		end
    end
end)

