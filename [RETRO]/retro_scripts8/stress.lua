


local weaponstress = {
	[453432689] = 1000, -- PISTOL
	[3219281620] = 1000, -- PISTOL MK2
	[1593441988] = 1000, -- COMBAT PISTOL
	[584646201] = 1000, -- AP PISTOL
	[2578377531] = 1200, -- PISTOL .50
	[3523564046] = 650, -- HEAVY PISTOL
	[-1716589765] = 6500, --pistol50
	[1198879012] = 100, -- FLARE GUN
	[324215364] = 1000, -- MICRO SMG
	[736523883] = 1000, -- SMG
	[2024373456] = 1000, -- SMG MK2
	[4024951519] = 1000, -- ASSAULT SMG
	[3220176749] = 3500, -- ASSAULT RIFLE
	[-2084633992] = 3500, -- CARBINE RIFLE
	[4208062921] = 3500, -- CARBINE RIFLE MK2
	[-1357824103] = 3500, -- ADVANCED RIFLE
	[487013001] = 6833, -- PUMP SHOTGUN
	[2017895192] = 3500, -- SAWNOFF SHOTGUN
	[3800352039] = 6833, -- ASSAULT SHOTGUN
	[911657153] = 100, -- STUN GUN
	[100416529] = 3500, -- SNIPER RIFLE
	[1119849093] = 3500, -- MINIGUN
	[-1063057011] = 1000, -- SPECIAL CARBINE
	[-2066285827] = 3500, -- BULLPUP RIFLE MK2
	[2828843422] = 750, -- MUSKET
	[984333226] = 6833, -- HEAVY SHOTGUN
	[3342088282] = 6833, -- MARKSMAN RIFLE
	[1198879012] = 100, -- FLARE GUN
	[171789620] = 1000, -- COMBAT PDW
	[3675956304] = 750, -- MACHINE PISTOL
	[1649403952] = 1000, -- COMPACT RIFLE
	[3173288789] = 1000, -- MINI SMG	
	[-1813897027] = 1000, -- Grenade	
	[615608432] = 1000, -- Molly	
	[883325847] = 1, -- Pterol	
	[-37975472] = 1000, -- Smoke	
	--[137902532] = 750, -- VINTAGE PISTOL
	--[3696079510] = 750, -- MARKSMAN PISTOL
	--[961495388] = 3500, -- ASSAULT RIFLE MK2
	--[2634544996] = 3500, -- MG
	--[2144741730] = 3500, -- COMBAT MG
	--[3686625920] = 3500, -- COMBAT MG MK
	--[1432025498] = 6833, -- PUMP SHOTGUN MK2
	--[2640438543] = 6833, -- BULLPUP SHOTGUN
	--[205991906] = 3500, -- HEAVY SNIPER
	--[177293209] = 3500, -- HEAVY SNIPER MK2
	--[856002082] = 3500, -- REMOTE SNIPER
	--[2726580491] = 3500, -- GRENADE LAUNCHER
	--[1305664598] = 3500, -- GRENADE LAUNCHER SMOKE
	--[2982836145] = 3500, -- RPG
	--[1752584910] = 3500, -- STINGER
	--[3218215474] = 1000, -- SNS PISTOL
	--[1627465347] = 1000, -- GUSENBERG
	--[-1768145561] = 0.25, -- SPECIAL CARBINE MK2
	--[2132975508] = 3500, -- BULLPUP RIFLE
	--[-1746263880] = 750, -- DOUBLE ACTION REVOLVER
	--[1785463520] = 6833, -- MARKSMAN RIFLE MK2
	--[1672152130] = 6833, -- HOMING LAUNCHER
	--[3696079510] = 750, -- MARKSMAN PISTOL
  	--[1834241177] = 6833, -- RAILGUN
	--[3249783761] = 750, -- REVOLVER
	--[-879347409] = 1200, -- REVOLVER MK2
	--[4019527611] = 01800, -- DOUBLE BARREL SHOTGUN
	--[317205821] = 6833, -- AUTO SHOTGUN
	--[125959754] = 3500, -- COMPACT LAUNCHER
	--[2009644972] = 1000, -- SNS PISTOL MK2
	--[741814745] = 1000, -- StickyBomb		
	--[-494615257] = 1000, -- AssaultShotgun		
}

ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
  --  local xPlayer = ESX.GetPlayerFromId(source)
 --   print('xplayer '..xPlayer)
 --   print('source '..source)
    while true do
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
		local weapon = GetSelectedPedWeapon(ped)

		--print(weaponstress[weapon])

		if weaponstress[weapon] == nill then
		--	print('weapon nill seeting it 3500 to default')

			weaponstress[weapon] = 3500

       --    print(weaponstress[weapon]  )
		end 

		
		
		if IsPedShooting(ped) then
			TriggerServerEvent("stress:add", weaponstress[weapon] )
	--	  print(weaponstress[weapon ]  * 5 )
		  
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local ped = GetPlayerPed(-1)
		if IsPedOnAnyBike(ped) then
	--		TriggerServerEvent("stress:remove", 300)
		 -- TriggerEvent('esx_status:remove', source,'stress',300)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)
		local speed = GetEntitySpeed(GetVehiclePedIsIn(ped,true)) * 2.6
		if IsPedInAnyVehicle(ped,false)	and speed >= 120 then
		  --TriggerEvent('esx_status:add', source ,'stress',300)
		  TriggerServerEvent("stress:add", 300)
		  print(speed)
		  Citizen.Wait(3000)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local ped = GetPlayerPed(-1)
		if IsPedInMeleeCombat(ped) then
		--	TriggerServerEvent("stress:add", 300)
		 -- TriggerEvent('esx_status:add', source,'stress',300)
		  Citizen.Wait(3000)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local ped = GetPlayerPed(-1)
		if IsPedSwimming(ped) then
		--	TriggerServerEvent("stress:remove", 300)
		  --TriggerEvent('esx_status:remove', source,'stress',200)
		end
	end
end)