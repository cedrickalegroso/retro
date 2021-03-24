ESX                           = nil

local cachedBins = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)


local circleA =
    CircleZone:Create(
    vector3(29.337753295898, -1770.3348388672, 29.607357025146),
    0.5,
    {
        name = 'a',
        data = {job = 'police'}
    }
)

local circleB =
    CircleZone:Create(
    vector3(388.30194091797, -874.88238525391, 29.295169830322),
    0.5,
    {
        name = 'b',
        data = {job = 'ambulance'}
    }
)

local circleC =
    CircleZone:Create(
    vector3(26.877752304077, -1343.0764160156, 29.497024536133),
    0.5,
    {
        name = 'c',
        data = {job = 'groove'}
    }
)

local combo = ComboZone:Create({circleA, circleB, circleC}, {name = 'combo', debugPoly = false})
combo:onPlayerInOut(
    function(isPointInside, point, zone)
        -- print("combo: isPointInside is", isPointInside, " for point", point)
     --   if zone and PlayerData.job.name == zone.data.job  then
          if zone   then
            ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
                'default',
                GetCurrentResourceName(),
                'police_actions',
                {
                    title = 'Do you want to sell some Bottles?',
                    align = 'top-left',
                    elements = {
                        {label = 'Yes', value = 'yes'},
                        {label = 'No', value = 'close'}
                    }
                },
                function(data, menu)
                    if data.current.value == 'yes' then
                        TriggerServerEvent("esx-ecobottles:sellBottles")
                        menu.close()
                    elseif data.current.value == 'close' then
                        menu.close()
                    end
                end,
                function(data, menu)
                    menu.close()
                end
            )
          
           
        end
    end
)


Citizen.CreateThread(function()
    Citizen.Wait(100)

    for locationIndex = 1, #ConfigBottles.SellBottleLocations do
        local locationPos = ConfigBottles.SellBottleLocations[locationIndex]

        local blip = AddBlipForCoord(locationPos)

        SetBlipSprite (blip, 409)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 48)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Sell Bottles")
        EndTextCommandSetBlipName(blip)
    end

end)

--[[

Citizen.CreateThread(function()
    Citizen.Wait(100)

    for locationIndex = 1, #ConfigBottles.SellBottleLocations do
        local locationPos = ConfigBottles.SellBottleLocations[locationIndex]

        local blip = AddBlipForCoord(locationPos)

        SetBlipSprite (blip, 409)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 48)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Sell Bottles")
        EndTextCommandSetBlipName(blip)
    end

    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex = 1, #ConfigBottles.SellBottleLocations do
            local locationPos = ConfigBottles.SellBottleLocations[locationIndex]

            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos, true)

            if dstCheck <= 5.0 then
                sleepThread = 5

                local text = "Sell Bottles"

                if dstCheck <= 1.5 then
                    text = "[~g~E~s~] " .. text

                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("esx-ecobottles:sellBottles")
                    end
                end
                
                ESX.Game.Utils.DrawText3D(locationPos, text, 0.4)
            end
        end

        Citizen.Wait(sleepThread)
    end
end)



Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000

        local entity, entityDst = ESX.Game.GetClosestObject(ConfigBottles.BinsAvailable)

        if DoesEntityExist(entity) and entityDst <= 1.5 then
            sleepThread = 5

            local binCoords = GetEntityCoords(entity)

            ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Search Trashbin", 1)

            if IsControlJustReleased(0, 38) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                else
                    ESX.ShowNotification("You've already searched this bin!")
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

]]--

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000

        local entity, entityDst = ESX.Game.GetClosestObject(ConfigBottles.BinsAvailable)

        if DoesEntityExist(entity) and entityDst <= 1.5 then
            sleepThread = 5

            local binCoords = GetEntityCoords(entity)

            ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] Search Trashbin", 1)

            if IsControlJustReleased(0, 38) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                else
                    ESX.ShowNotification("You've already searched this bin!")
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)




function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(10000)

    TriggerServerEvent("esx-ecobottles:retrieveBottle")

    ClearPedTasks(PlayerPedId())
end
