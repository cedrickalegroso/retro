local speed = 0.0
local seatbeltOn = false
local cruiseOn = false

local bleedingPercentage = 0
local hunger = 100
local thirst = 100

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
	if hour <= 9 then
		hour = "0" .. hour
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do 
        if ESX ~= nil and isLoggedIn and QBHud.Show then
            speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local time = CalculateTimeToDisplay()
            local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
            local fuel = exports['np-fuel']:GetFuel(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local engine = GetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
            
            SendNUIMessage({
                action = "hudtick",
                show = IsPauseMenuActive(),
                health = GetEntityHealth(GetPlayerPed(-1)),
                armor = GetPedArmour(GetPlayerPed(-1)),
                thirst = thirst,
                hunger = hunger,
                drunk = drunk,
                bleeding = bleedingPercentage,
                direction = GetDirectionText(GetEntityHeading(GetPlayerPed(-1))),
                street1 = GetStreetNameFromHashKey(street1),
                street2 = GetStreetNameFromHashKey(street2),
                area_zone = current_zone,
                speed = math.ceil(speed),
                fuel = fuel,
                time = time,
                engine = engine,
            })
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        TriggerEvent('esx_status:getStatus', 'hunger', function(h)
            TriggerEvent('esx_status:getStatus', 'thirst', function(t)
                TriggerEvent('esx_status:getStatus', 'drunk', function(d)
                    hunger = h.getPercent()
                    thirst = t.getPercent()
                    drunk = d.getPercent()
                end)
            end)
        end)
        Citizen.Wait(300)

    end
end)

Citizen.CreateThread(function()
    while true do
        if ESX ~= nil and isLoggedIn and QBHud.Show then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
                if speed >= QBStress.MinimumSpeed then
                    TriggerServerEvent('qb-hud:Server:GainStress', math.random(1, 2))
                end
            end
        end
        Citizen.Wait(20000)
    end
end)


Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1)
        if IsControlJustReleased(0, 29) and IsPedInAnyVehicle(PlayerPedId()) then
            seatbeltOn = not seatbeltOn
             if not seatbeltOn then
                TriggerEvent("seatbelt:client:ToggleSeatbelt",false)
                TriggerEvent("notification",'Seat Belt Disabled',2)
            else
                TriggerEvent("seatbelt:client:ToggleSeatbelt",true)
				TriggerEvent("notification",'Seat Belt Enabled',1)
            end
		end
	end
end)

local radarActive = false
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId()) and isLoggedIn and QBHud.Show then
            DisplayRadar(true)
            SendNUIMessage({
                action = "car",
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)
            SendNUIMessage({
                action = "car",
                show = false,
            })
            seatbeltOn = false
            cruiseOn = false

            SendNUIMessage({
                action = "seatbelt",
                seatbelt = seatbeltOn,
            })

            SendNUIMessage({
                action = "cruise",
                cruise = cruiseOn,
            })
            radarActive = false
        end
    end
end)

RegisterNetEvent("hud:client:UpdateNeeds")
AddEventHandler("hud:client:UpdateNeeds", function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent("seatbelt:client:ToggleSeatbelt")
AddEventHandler("seatbelt:client:ToggleSeatbelt", function(toggle)
    if toggle == nil then
        seatbeltOn = not seatbeltOn
        SendNUIMessage({
            action = "seatbelt",
            seatbelt = seatbeltOn,
        })
    else
        seatbeltOn = toggle
        SendNUIMessage({
            action = "seatbelt",
            seatbelt = toggle,
        })
    end
end)

RegisterNetEvent('qb-hud:client:ToggleHarness')
AddEventHandler('qb-hud:client:ToggleHarness', function(toggle)
    SendNUIMessage({
        action = "harness",
        toggle = toggle
    })
end)

RegisterNetEvent('qb-hud:client:UpdateDrivingMeters')
AddEventHandler('qb-hud:client:UpdateDrivingMeters', function(toggle, amount)
    SendNUIMessage({
        action = "UpdateDrivingMeters",
        amount = amount,
        toggle = toggle,
    })
end)

RegisterNetEvent('qb-hud:client:UpdateVoiceProximity')
AddEventHandler('qb-hud:client:UpdateVoiceProximity', function(Proximity)
    SendNUIMessage({
        action = "proximity",
        prox = Proximity
    })
end)

RegisterNetEvent('qb-hud:client:ProximityActive')
AddEventHandler('qb-hud:client:ProximityActive', function(active)
    SendNUIMessage({
        action = "talking",
        IsTalking = active
    })
end)



local LastHeading = nil
local Rotating = "left"

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local PlayerHeading = GetEntityHeading(ped)
        if LastHeading ~= nil then
            if PlayerHeading < LastHeading then
                Rotating = "right"
            elseif PlayerHeading > LastHeading then
                Rotating = "left"
            end
        end
        LastHeading = PlayerHeading
        SendNUIMessage({
            action = "UpdateCompass",
            heading = PlayerHeading,
            lookside = Rotating,
        })
        Citizen.Wait(6)
    end
end)

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "Noord"
    elseif (heading >= 45 and heading < 135) then
        return "Oost"
    elseif (heading >=135 and heading < 225) then
        return "Zuid"
    elseif (heading >= 225 and heading < 315) then
        return "West"
    end
end