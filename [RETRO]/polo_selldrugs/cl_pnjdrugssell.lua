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
ESX = nil
local PlayerData              = {}
-- polo © License | Discord : https://discord.gg/czW6Jqj
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_undercover")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "csb_undercover", 1408.02, -2221.28, 60.81, 285.53, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)
  
local gym = {
    {x = 1408.68, y = -2220.83, z = 61.81}
}

local marker = {
    {x = 1408.68, y = -2220.83, z = 61.81}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(marker) do
            DrawMarker(0, marker[k].x, marker[k].y, marker[k].z, 0, 0, 0, 0, 0, 0, 0.201, 0.201, 0.2001, 0, 153, 255, 255, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(gym) do
		
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

            if dist <= 0.5 then
				hintToDisplay('~g~Press ~INPUT_CONTEXT~ to sell ~r~drugs.')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenSellMenu()
				end			
            end
        end
    end
end)


function OpenSellMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_sell_menu',
        {
            title    = 'Souhaitez-vous vendre de la drogue ?',
            elements = {
                {label = 'Weed Pooch ', value = 'weed'},
                {label = 'Morphine Pooch ', value = 'morphine'},
                {label = 'Opium Pooch ', value = 'opium'},
                {label = 'Ecstasy Pooch ', value = 'ecstasy'},
                {label = 'Amphetamines Pooch ', value = 'amphetamines'},
                {label = 'Meth Pooch ', value = 'meth'},
            }
        },
        function(data, menu)
            if data.current.value == 'weed' then
				TriggerServerEvent('polo_drugssell:sellweedpooch')
            elseif data.current.value == 'morphine' then
				TriggerServerEvent('polo_drugssell:sellmorphinepooch')
            elseif data.current.value == 'opium' then
				TriggerServerEvent('polo_drugssell:sellopiumpooch')
            elseif data.current.value == 'ecstasy' then
				TriggerServerEvent('polo_drugssell:sellecstasypooch')
            elseif data.current.value == 'amphetamines' then
				TriggerServerEvent('polo_drugssell:sellamphetaminespooch')
            elseif data.current.value == 'meth' then
                TriggerServerEvent('polo_drugssell:sellmethpooch')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

-----------------------

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_undercover")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "csb_undercover", -452.62, 78.64, 70.34, 267.61, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)
  
local drugs = {
    {x = -451.83, y = 78.74, z = 71.34}
}

local marker = {
    {x = -451.83, y = 78.74, z = 71.34}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(marker) do
            DrawMarker(0, marker[k].x, marker[k].y, marker[k].z, 0, 0, 0, 0, 0, 0, 0.201, 0.201, 0.2001, 0, 153, 255, 255, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(drugs) do
        
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, drugs[k].x, drugs[k].y, drugs[k].z)

            if dist <= 0.5 then
                hintToDisplay('~g~Press ~INPUT_CONTEXT~ to sell ~r~drugs.')
                
                if IsControlJustPressed(0, Keys['E']) then
                    OpenSellMenu2()
                end         
            end
        end
    end
end)


function OpenSellMenu2()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_sell_menu',
        {
            title    = 'Souhaitez-vous vendre de la drogue ?',
            elements = {
                {label = 'Coke Pooch ', value = 'coke'},
                {label = 'LSD Pooch ', value = 'lsd'},
                {label = 'Ketamine Pooch ', value = 'ketamine'},
                {label = 'Lean Pooch ', value = 'lean'},
                {label = 'Heroine Pooch ', value = 'heroine'},
                {label = 'Crack Pooch ', value = 'crack'},
                {label = 'Marijuana Pooch ', value = 'marijuana'},
            }
        },
        function(data, menu)
            if data.current.value == 'coke' then
                TriggerServerEvent('polo_drugssell:sellcokepooch')
            elseif data.current.value == 'lsd' then
                TriggerServerEvent('polo_drugssell:selllsdpooch')
            elseif data.current.value == 'ketamine' then
                TriggerServerEvent('polo_drugssell:sellketaminepooch')
            elseif data.current.value == 'lean' then
                TriggerServerEvent('polo_drugssell:sellleanpooch')
            elseif data.current.value == 'heroine' then
                TriggerServerEvent('polo_drugssell:sellheroinepooch')
            elseif data.current.value == 'crack' then
                TriggerServerEvent('polo_drugssell:sellcrackpooch')
            elseif data.current.value == 'marijuana' then
                TriggerServerEvent('polo_drugssell:sellmarijuanapooch')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end