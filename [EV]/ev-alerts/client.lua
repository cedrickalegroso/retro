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

local AlertActive = false

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Locales['en'] = {
    -- Weapons
    ['weapon_knife'] = 'knife',
    ['weapon_nightstick'] = 'nightstick',
    ['weapon_hammer'] = 'hammer',
    ['weapon_bat'] = 'bat',
    ['weapon_golfclub'] = 'golf club',
    ['weapon_crowbar'] = 'crow bar',
    ['weapon_pistol'] = 'pistol',
    ['weapon_combatpistol'] = 'combat pistol',
    ['weapon_appistol'] = 'AP pistol',
    ['weapon_pistol50'] = 'pistol .50',
    ['weapon_microsmg'] = 'micro SMG',
    ['weapon_smg'] = 'SMG',
    ['weapon_assaultsmg'] = 'assault SMG',
    ['weapon_assaultrifle'] = 'assault rifle',
    ['weapon_carbinerifle'] = 'carbine rifle',
    ['weapon_advancedrifle'] = 'advanced rifle',
    ['weapon_mg'] = 'MG',
    ['weapon_combatmg'] = 'combat MG',
    ['weapon_pumpshotgun'] = 'pump shotgun',
    ['weapon_sawnoffshotgun'] = 'sawed off shotgun',
    ['weapon_assaultshotgun'] = 'assault shotgun',
    ['weapon_bullpupshotgun'] = 'bullpup shotgun',
    ['weapon_stungun'] = 'taser',
    ['weapon_sniperrifle'] = 'sniper rifle',
    ['weapon_heavysniper'] = 'heavy sniper',
    ['weapon_grenadelauncher'] = 'grenade launcher',
    ['weapon_rpg'] = 'rocket launcher',
    ['weapon_minigun'] = 'minigun',
    ['weapon_grenade'] = 'grenade',
    ['weapon_stickybomb'] = 'sticky bomb',
    ['weapon_smokegrenade'] = 'smoke grenade',
    ['weapon_bzgas'] = 'bz gas',
    ['weapon_molotov'] = 'molotov cocktail',
    ['weapon_fireextinguisher'] = 'fire extinguisher',
    ['weapon_petrolcan'] = 'jerrycan',
    ['weapon_ball'] = 'ball',
    ['weapon_snspistol'] = 'sns pistol',
    ['weapon_bottle'] = 'bottle',
    ['weapon_gusenberg'] = 'gusenberg sweeper',
    ['weapon_specialcarbine'] = 'special carbine',
    ['weapon_heavypistol'] = 'heavy pistol',
    ['weapon_bullpuprifle'] = 'bullpup rifle',
    ['weapon_dagger'] = 'dagger',
    ['weapon_vintagepistol'] = 'vintage pistol',
    ['weapon_firework'] = 'firework',
    ['weapon_musket'] = 'musket',
    ['weapon_heavyshotgun'] = 'heavy shotgun',
    ['weapon_marksmanrifle'] = 'marksman rifle',
    ['weapon_hominglauncher'] = 'homing launcher',
    ['weapon_proxmine'] = 'proximity mine',
    ['weapon_snowball'] = 'snow ball',
    ['weapon_flaregun'] = 'flaregun',
    ['weapon_combatpdw'] = 'combat pdw',
    ['weapon_marksmanpistol'] = 'marksman pistol',
    ['weapon_knuckle'] = 'knuckledusters',
    ['weapon_hatchet'] = 'hatchet',
    ['weapon_railgun'] = 'railgun',
    ['weapon_machete'] = 'machete',
    ['weapon_machinepistol'] = 'machine pistol',
    ['weapon_switchblade'] = 'switchblade',
    ['weapon_revolver'] = 'heavy revolver',
    ['weapon_dbshotgun'] = 'double barrel shotgun',
    ['weapon_compactrifle'] = 'compact rifle',
    ['weapon_autoshotgun'] = 'auto shotgun',
    ['weapon_battleaxe'] = 'battle axe',
    ['weapon_compactlauncher'] = 'compact launcher',
    ['weapon_minismg'] = 'mini smg',
    ['weapon_pipebomb'] = 'pipe bomb',
    ['weapon_poolcue'] = 'pool cue',
    ['weapon_wrench'] = 'pipe wrench',
    ['weapon_flashlight'] = 'flashlight',
    ['gadget_parachute'] = 'parachute',
    ['weapon_flare'] = 'flare',
    ['weapon_doubleaction'] = 'double-Action Revolver',
  }


function getWeapon(weapon)
    print(weapon)
    for k,v in pairs(Config.Weapons) do
        if GetHashKey(v.name) == weapon then
            return v.label
        end
    end

    return "Unknown"
end

RegisterNetEvent('policealerts:client:AddPoliceAlert')
AddEventHandler('policealerts:client:AddPoliceAlert', function(data, forBoth)
    if forBoth then
        if (ESX.GetPlayerData().job.name == "police" or ESX.GetPlayerData().job.name == "ambulance") then
            if data.alertTitle == "Assistentie collega" or data.alertTitle == "Assistentie Ambulance" or data.alertTitle == "Assistentie Doctor" then
                TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.7)
            else
                PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
            end
            data.callSign = data.callSign ~= nil and data.callSign or tostring(math.random(11, 99) .. '-' .. math.random(11, 99))
            data.alertId = math.random(11111, 99999)
            SendNUIMessage({
                action = "add",
                data = data,
            })

            local alpha = 250
			local thiefBlip = AddBlipForRadius(data.coords.x, data.coords.y, data.coords.z, 50.0)

			SetBlipHighDetail(thiefBlip, true)
			SetBlipColour(thiefBlip, 1)
			SetBlipAlpha(thiefBlip, alpha)
			SetBlipAsShortRange(thiefBlip, true)

			while alpha ~= 0 do
				Citizen.Wait(40 * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)

				if alpha == 0 then
					RemoveBlip(thiefBlip)
					return
				end
			end
        end
    else
        if (ESX.GetPlayerData().job.name == "police" ) then
            
            if data.alertTitle == "Assistentie collega" or data.alertTitle == "Assistentie Ambulance" or data.alertTitle == "Assistentie Doctor" then
                TriggerServerEvent("InteractSound_SV:PlayOnSource", "emergency", 0.7)
            else
                PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
            end
            data.callSign = data.callSign ~= nil and data.callSign or tostring(math.random(11, 99) .. '-' .. math.random(11, 99))
            data.alertId = math.random(11111, 99999)
            SendNUIMessage({
                action = "add",
                data = data,
            })

            local alpha = 250
			local thiefBlip = AddBlipForRadius(data.coords.x, data.coords.y, data.coords.z, 50.0)

			SetBlipHighDetail(thiefBlip, true)
			SetBlipColour(thiefBlip, 1)
			SetBlipAlpha(thiefBlip, alpha)
			SetBlipAsShortRange(thiefBlip, true)

			while alpha ~= 0 do
				Citizen.Wait(40 * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)

				if alpha == 0 then
					RemoveBlip(thiefBlip)
					return
				end
			end
        end 
    end

    AlertActive = true
    SetTimeout(data.timeOut, function()
        AlertActive = false
    end)
end)

Citizen.CreateThread(function()
    while true do

        if IsControlJustPressed(0, 166) then
            SetNuiFocus(true, true)
            SetNuiFocusKeepInput(true, false)
            SetCursorLocation(0.965, 0.12)
            MouseActive = true
        end

        if MouseActive then
            DisablePlayerFiring(PlayerPedId(), true)
            if IsControlJustReleased(0, 166) then
                SetNuiFocus(false, false)
                SetNuiFocusKeepInput(false, false)
                MouseActive = false
            end
        end

        Citizen.Wait(6)
    end
end)

RegisterNUICallback('SetWaypoint', function(data)
    local coords = data.coords

    SetNewWaypoint(coords.x, coords.y)
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false, false)
    MouseActive = false
end)

function getStreet()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local streetName = GetStreetNameFromHashKey(streetName)
    return streetName
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
        local nul, number = GetCurrentPedWeapon(GetPlayerPed(-1))

    if IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and getWeapon(number) ~= "Unknown" and ESX.PlayerData.job.name ~= 'police' then

			Citizen.Wait(2000)

            local gender = GetGender()
            local icon = '<i class="fas fa-male"></i>'

            if gender == 0 then
                gender = 'Male'
                icon = '<i class="fas fa-male"></i>'
            else
                gender = 'Female'
                icon = '<i class="fas fa-female"></i>'

            end

            TriggerServerEvent('policealerts:server:AddPoliceAlert', {
                timeOut = 4000,
                callSign = "10-32",
                alertTitle = "Gun shots in progress.",
                    coords = {
                        x = playerCoords.x,
                        y = playerCoords.y,
                        z = playerCoords.z,
                    },

                    details = {
                        { icon = '<i class="fas fa-globe"></i>', detail = getStreet() },
                        { icon = '<i class="fas fa-fire-extinguisher"></i>', detail = getWeapon(number) },
                        { icon = icon, detail = gender },
                    },
            })

		end
	end
end)

RegisterCommand('testi', function()
    local playerCoords = GetEntityCoords(playerPed)
    TriggerEvent('policealerts:client:AddPoliceAlert', {
        timeOut = 4000,
        callSign = "10-32",
        alertTitle = "Gun shots in progress.",
            coords = {
                x = playerCoords.x,
                y = playerCoords.y,
                z = playerCoords.z,
            },

            details = {
                { icon = '<i class="fas fa-globe"></i>', detail = getStreet() },
            },
    })
end)