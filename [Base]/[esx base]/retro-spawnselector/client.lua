local ESX, selectedspawnposition = nil
local spawn = nil
local LastLocation = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
        end)
        
		Citizen.Wait(0)
	end
end)

--CODE
local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000

RegisterNUICallback("SpawnPlayer", function()
	if selectedspawnposition ~= nil then
		SpawnPlayer(selectedspawnposition)
	else
        TriggerEvent('spawnselector:setNui')
		print("You need to select a spawn point!")
        TriggerEvent('notification', "You need to select a spawn point!", 15000)
	end
end)

RegisterNUICallback("LastLocation", function()
    selectedspawnposition = LastLocation
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnAirport", function()
    selectedspawnposition = { x = -1037.74, y = -2738.04, z = 20.1693, h = 282.91 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTrain", function()
    selectedspawnposition = { x = -206.674, y = -1015.1, z = 30.1381, h = 282.91 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTrain2", function()
    selectedspawnposition = { x = 100.4045791626, y = -1713.0010986328, z = 30.112661361694 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnTrain2", function()
    selectedspawnposition = { x = 100.4045791626, y = -1713.0010986328, z = 30.112661361694 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

RegisterNUICallback("SpawnYarkon", function()
    selectedspawnposition = { x = 197.57879638672, y = -931.56091308594, z = 30.686809539795 }
    local playerPed = PlayerPedId()
    local campos = selectedspawnposition

    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Citizen.Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
end)

function SpawnPlayer(Location)
    local pos = Location
    local ped = PlayerPedId()
    SetNuiFocus(false, false)

    DoScreenFadeOut(500)
    Citizen.Wait(500)
    SetEntityCoords(ped, pos.x, pos.y, pos.z)
    Citizen.Wait(500)
    SetEntityCoords(ped, pos.x, pos.y, pos.z)
    SetEntityHeading(ped, pos.h)
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(GetPlayerPed(-1), true)
    Citizen.Wait(500)
    DoScreenFadeIn(250)
    SetNuiFocus(false, false)

end

RegisterNetEvent("spawnselector:setNui")
AddEventHandler("spawnselector:setNui", function(spawn)
    LastLocation = spawn or { x = 0, y = 0, z = 0 }
    SetNuiFocus(true, true)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", spawn.x, spawn.y, spawn.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)

	SendNUIMessage({ Action = "OPEN_SPAWNMENU" })
end)

RegisterNetEvent("spawnselector:closeNui")
AddEventHandler("spawnselector:closeNui", function()
    SetNuiFocus(false, false)
    SendNUIMessage({ Action = "CLOSE_MENU" })
    
end)
