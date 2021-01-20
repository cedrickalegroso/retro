--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

ESX                      = nil

local Akt         			 = nil
local CurrentActionMsg   = ''
local CurrentActionData  = {}
local JestWMarkerze 		 = false
local OstStrefa          = nil
local Czaspozostaly			 = 0
local PlayerData         = {}
local onDuty 				  	 = false
local cd 					 			 = false
local majuznoty				 	 = false
local as1								 = false
local as2								 = false
local sprzataj							= false
local hardblock							= false
local an 						= 'anim@amb@business@coc@coc_unpack_cut_left@'
local animacja 					= "coke_cut_v4_coccutter"
local nozhash					= GetHashKey('prop_knife')




Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
  	odswiezblipy()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  	odswiezblipy()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  	odswiezblipy()
end)

function odswiezblipy() 

if PlayerData.job ~= nil and PlayerData.job.name == 'burgerownia' then

 blipypracy = AddBlipForCoord(-1195.61, -893.14, 13)
    SetBlipSprite (blipypracy, 417)
    SetBlipDisplay(blipypracy, 4)
    SetBlipScale  (blipypracy, 1.0)
    SetBlipColour (blipypracy, 5)
    SetBlipAsShortRange(blipypracy, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Praca w burgerowni')
    EndTextCommandSetBlipName(blipypracy)
else
RemoveBlip(blipypracy)
end
end






AddEventHandler('wojtek_burgerownia:wmarkerze', function (zone)
  if zone == 'Lodowka' and onDuty == true and sprzataj == false then
    Akt     = 'lod'
    CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to open ~g~Fridge')
    CurrentActionData = {}
  elseif zone == 'Smaz' and onDuty == true and sprzataj == false then
    Akt	  = 'smazenie'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~Fry~w~ Meat')
	CurrentActionData = {}
  elseif zone == 'Przebieralnia' and PlayerData.job.name == 'burgerownia'  then
    Akt	  = 'przeb'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to be ~b~dress up~w~')
	CurrentActionData = {}
  elseif zone == 'Kroj' and onDuty == true and sprzataj == false then
    Akt	  = 'krojenie'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~Cut ~w~Tomato')
	CurrentActionData = {}
  elseif zone == 'Myj' and onDuty == true and sprzataj == false then
    Akt	  = 'myju'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~umyć~w~ Lettuce')
	CurrentActionData = {}
  elseif zone == 'Przyg' and onDuty == true and sprzataj == false then
	Akt	  = 'przygotuj'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~Prepare~w~ burger')
	CurrentActionData = {}
  elseif zone == 'Sprzatanie' and onDuty == true and sprzataj == true then
	Akt	  = 'sprz'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~Prepare~w~ toaletę')
	CurrentActionData = {}
  elseif zone == 'Sprzedaz' and onDuty == true and sprzataj == false then
	Akt	  = 'sell'
	CurrentActionMsg  = ('Press ~INPUT_CONTEXT~ to ~o~Sell~w~ burger')
	CurrentActionData = {}
  end
end)



AddEventHandler('wojtek_burgerownia:pozamarkerem', function (zone)
  Akt = nil
end)



Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

  if Akt ~= nil then

    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

    if IsControlPressed(0,  Keys['E']) then
		
		if Akt == 'przeb' then
			MenuPrzebieralnia()
		end
		
		if Akt == 'smazenie' and as1 == false then
				TriggerServerEvent('wojtek_burgerownia:czymozesmazyc')
				if as1 == false then
					as1 = true
				end
		end

		if Akt == 'krojenie' and as1 == false then
			TriggerServerEvent('wojtek_burgerownia:czymozekroic')
			if as1 == false then
				as1 = true
			end
		end
		
		if Akt == 'myju' and as1 == false then
			TriggerServerEvent('wojtek_burgerownia:czymozemyc')
			if as1 == false then
				as1 = true
			end
		end	

		if Akt == 'sprz' and sprzataj == true and as1 == false then
			TriggerEvent('wojtek_burgerownia:sprzatanie')
			if as1 == false then
				as1 = true
			end
		end

		if Akt == 'przygotuj' and as1 == false then
			TriggerServerEvent('wojtek_burgerownia:czymozeprzygotowac')
			if as1 == false then
				as1 = true
			end
		end	

		if Akt == 'sell' and as1 == false and hardblock == false then
			TriggerServerEvent('wojtek_burgerownia:hajs')
			if as1 == false then
				as1 = true
			end
		end	
		
        if Akt == 'lod' then
            MenuLodowki()
				else
			
				end
      end
    end
  end
end)

function MenuPrzebieralnia()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = 'Szatnia',
	  align    = 'center',
      elements = {
        {label = 'Work clothes', value = 'job_wear'},
        {label = 'Citizen clothes', value = 'citizen_wear'}
      }
    },
    function(data, menu)
			if data.current.value == 'citizen_wear' then
	  		TriggerEvent("pNotify:SendNotification",{
			text = ('Przebieranie'),
			type = "info",
			timeout = (ConfigBurger.Czasprzebierania * 1000),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES", 0, true)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			Wait(ConfigBurger.Czasprzebierania * 1000 + 250)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			ClearPedTasks(GetPlayerPed(-1))
        onDuty = false
		    TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie cywilne'),
			type = "error",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		 TriggerServerEvent('wojtek_burgerownia:pow2')
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
      end
      if data.current.value == 'job_wear' then
	  	  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przebieranie'),
			type = "info",
			timeout = (ConfigBurger.Czasprzebierania * 1000),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES", 0, true)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			Wait(ConfigBurger.Czasprzebierania * 1000 + 250)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			ClearPedTasks(GetPlayerPed(-1))
        onDuty = true
			TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie robocze '),
			type = "success",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		  TriggerServerEvent('wojtek_burgerownia:pow')
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end
          
        end)
      end
      menu.close()
    end,
    function(data, menu)
      menu.close()
    end
  )
end

function MenuLodowki()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = 'Lodówka',
	  align    = 'center',
      elements = {
        {label = 'Take bun', value = 'bulka'},
				{label = 'Take Tomato', value = 'pomidor'},
				{label = 'Take Lettuce', value = 'salata'},
				{label = 'Take Meat', value = 'mieso'},
				{label = 'Take Ketchup', value = 'ketchup'}
      }
    },
    function(data, menu)
			if data.current.value == 'bulka' then
		 TriggerServerEvent('wojtek_burgerownia:dajitembulka')
			elseif data.current.value == 'pomidor' then
			TriggerServerEvent('wojtek_burgerownia:dajitempomidor')
			elseif data.current.value == 'salata' then
			TriggerServerEvent('wojtek_burgerownia:dajitemsalata')
			elseif data.current.value == 'mieso' then
			TriggerServerEvent('wojtek_burgerownia:dajitemmieso')
			elseif data.current.value == 'ketchup' then
			TriggerServerEvent('wojtek_burgerownia:dajitemketchup') 
      end
		end,
		function(data, menu)
      menu.close()
    end
  )
end


Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(ConfigBurger.StrefyJesliPrzebrany) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100.0) and onDuty == true and sprzataj == false then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
      end
    end
	for k,v in pairs(ConfigBurger.StrefyJesliMaPrace) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'burgerownia' then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
      end
	end
	for k,v in pairs(ConfigBurger.Strefysprzatanko) do
		if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'burgerownia' and sprzataj == true and onDuty == true then
		  DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
	end
  end
end)



Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

			for k,v in pairs(ConfigBurger.StrefyJesliPrzebrany) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
				end
			end
	
			for k,v in pairs(ConfigBurger.StrefyJesliMaPrace) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
				end
			end

			for k,v in pairs(ConfigBurger.Strefysprzatanko) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
				end
			end

    if (isInMarker and not JestWMarkerze) or (isInMarker and OstStrefa ~= currentZone) then
      JestWMarkerze = true
      OstStrefa                = currentZone
      TriggerEvent('wojtek_burgerownia:wmarkerze', currentZone)
    end

    if not isInMarker and JestWMarkerze then
	  TriggerEvent('wojtek_burgerownia:pozamarkerem', OstStrefa)
      JestWMarkerze = false
    end
  end
end)


RegisterNetEvent('wojtek_burgerownia:animacjasmazenia')
AddEventHandler('wojtek_burgerownia:animacjasmazenia', function()
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(GetPlayerPed(-1), -1199.99, -900.29, 13.1)
	SetEntityHeading(GetPlayerPed(-1), 126.9)
    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BBQ", 0, true) 
	smazeniepozostalo = ConfigBurger.czassmazenia
	FreezeEntityPosition(GetPlayerPed(-1), true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Smazysz mieso'),
			type = "info",
			timeout = (ConfigBurger.czassmazenia * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	smazeniepozostalo = smazeniepozostalo - 1
	Citizen.Wait(1000)
	until(smazeniepozostalo == 0) 
		TriggerServerEvent('wojtek_burgerownia:dajitemgmieso')
		FreezeEntityPosition(GetPlayerPed(-1), false)
		Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end

end)

RegisterNetEvent('wojtek_burgerownia:losowanko')
AddEventHandler('wojtek_burgerownia:losowanko', function()

	local zrzygalsie = math.random(1,100)

	if zrzygalsie < ConfigBurger.szansa  then
		TriggerServerEvent('wojtek_burgerownia:pow3')

		if sprzataj == false then
			sprzataj = true
		end

		if hardblock == false then
			hardblock = true
		end
	end
	
end)

RegisterNetEvent('wojtek_burgerownia:sprzatanie')
AddEventHandler('wojtek_burgerownia:sprzatanie', function() 

	if as1 == false then
		as1 = true
	end
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(GetPlayerPed(-1), -1199.39, -889.90, 13.1)
	SetEntityHeading(GetPlayerPed(-1), 27.58)
    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true) 
	sprzatajjeszcze = ConfigBurger.czassprzatania
	FreezeEntityPosition(GetPlayerPed(-1), true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Sprzatasz toalete'),
			type = "info",
			timeout = (ConfigBurger.czassprzatania * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	sprzatajjeszcze = sprzatajjeszcze - 1
	Citizen.Wait(1000)
	until(sprzatajjeszcze == 0) 
	TriggerServerEvent('wojtek_burgerownia:pow4')
		FreezeEntityPosition(GetPlayerPed(-1), false)
		Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))

	if as1 == true then
		as1 = false
	end

	if sprzataj == true then
		sprzataj = false
	end

	if hardblock == true then
		hardblock = false
	end
	
end)

RegisterNetEvent('wojtek_burgerownia:animacjaprzygotowania')
AddEventHandler('wojtek_burgerownia:animacjaprzygotowania', function()
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(GetPlayerPed(-1), -1199.80, -898.28, 13.1)
	SetEntityHeading(GetPlayerPed(-1), 304.4)
    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true) 
	przygotowanieczas = ConfigBurger.czasprzygotowania
	FreezeEntityPosition(GetPlayerPed(-1), true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przygotowujesz burgera'),
			type = "info",
			timeout = (ConfigBurger.czasprzygotowania * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	przygotowanieczas = przygotowanieczas - 1
	Citizen.Wait(1000)
	until(przygotowanieczas == 0) 
		TriggerServerEvent('wojtek_burgerownia:dajitemburger')
		FreezeEntityPosition(GetPlayerPed(-1), false)
		Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end

end)

RegisterNetEvent('wojtek_burgerownia:falarm')
AddEventHandler('wojtek_burgerownia:falarm', function()
	if as1 == true then
		as1 = false
	end

end)

RegisterNetEvent('wojtek_burgerownia:animacjakrojenia')
AddEventHandler('wojtek_burgerownia:animacjakrojenia', function()
	if as2 == false then
		as2 = true

	local pP = GetPlayerPed(-1)
	local cgracza = GetEntityCoords(pP)

	SetEntityCoords(pP, -1198.99, -901.92, 13.1)
	SetEntityHeading(pP, 120.6)
	FreezeEntityPosition(pP, true)

	LoadDict(an)
	TaskPlayAnim(pP, an, animacja, 3.5, -6, -1, 63, 0, 0, 0, 0 )

	nozkuchenny = CreateObject(nozhash,cgracza.x, cgracza.y, cgracza.z, true, true, true)
	AttachEntityToEntity(nozkuchenny, pP, GetPedBoneIndex(pP, 0xDEAD), 0.11, 0.16, 0.10, 39.7, 0.0, 0.0, false, false, false, false, 2, true)


	krojenie = ConfigBurger.czaskrojenia
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Kroisz pomidora'),
			type = "info",
			timeout = (ConfigBurger.czaskrojenia * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})

	repeat
	krojenie = krojenie - 1
	Citizen.Wait(1000)
	until(krojenie == 0) 

	DeleteEntity(nozkuchenny)

	TriggerServerEvent('wojtek_burgerownia:dajitemgpomidor')

	FreezeEntityPosition(pP, false)
	Wait(1000)
	ClearPedTasksImmediately(pP)
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end

end)

function LoadDict(an)
    RequestAnimDict(an)
	while not HasAnimDictLoaded(an) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent('wojtek_burgerownia:animacjamycia')
AddEventHandler('wojtek_burgerownia:animacjamycia', function()
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(GetPlayerPed(-1), -1197.23, -901.53, 13.1)
	SetEntityHeading(GetPlayerPed(-1), 219.07)
    TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true) 
	myciejeszcze = ConfigBurger.czasmycia
	FreezeEntityPosition(GetPlayerPed(-1), true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Myjesz salate..'),
			type = "info",
			timeout = (ConfigBurger.czasmycia * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	myciejeszcze = myciejeszcze - 1
	Citizen.Wait(1000)
	until(myciejeszcze == 0) 
		TriggerServerEvent('wojtek_burgerownia:dajitemgsalata')
		FreezeEntityPosition(GetPlayerPed(-1), false)
		Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end

end)


--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------
