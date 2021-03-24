ESX = nil
local consuming = false
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(50)
        ESX = exports["es_extended"]:getSharedObject()
    end
end)

-- POLYZONES

local insideGamzFoods = false

local circleA =
    CircleZone:Create(
    vector3(357.55639648438,-585.03576660156,28.796859741211),
    1.5,
    {
        name = 'a',
        data = {place = 'Vending Machine'}
    }
)

local circleB =
    CircleZone:Create(
    vector3(460.8740234375,-982.32342529297,30.689685821533),
    1.5,
    {
        name = 'b',
        data = {place = 'Vending Machine'}
    }
)

local circleC =
    CircleZone:Create(
    vector3(309.79620361328,-585.67340087891,43.28405380249),
    0.5,
    {
        name = 'c',
        data = {place = 'Vending Machine'}
    }
)

local circleD =
    CircleZone:Create(
    vector3(324.46673583984,-598.68237304688,43.284061431885),
    0.5,
    {
        name = 'c',
        data = {place = 'Vending Machine'}
    }
)

local circleE =
    CircleZone:Create(
    vector3(-214.72108459473,-1332.8233642578,18.462020874023),
    0.5,
    {
        name = 'c',
        data = {place = 'Vending Machine'}
    }
)








local combo = ComboZone:Create({circleA, circleB, circleC, circleD, circleE}, {name = 'combo', debugPoly = false})
combo:onPlayerInOut(
    function(isPointInside, point, zone)
        if zone   then
            FoodStand(zone.data.place)
        end
    end
)


--[[
Citizen.CreateThread(function()

    for place, value in pairs(ConfigGamz.Zones) do
		local blip = AddBlipForCoord(value["coords"].x, value["coords"].y)
		SetBlipSprite (blip, 238)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 69)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(place)
		EndTextCommandSetBlipName(blip)
    end
    
    while true do
        local sleepTime = 500
        local coords = GetEntityCoords(PlayerPedId())

        for place, value in pairs(ConfigGamz.Zones) do
            local dst = GetDistanceBetweenCoords(coords, value["coords"], true)
            local text = place

            if dst <= 7.5 then 
                sleepTime = 5
                
                if dst <= 1.25 then
                    text = "[~r~E~w~] " .. place
                    if IsControlJustReleased(0, 38) then
                        FoodStand(place)
                    end
                end

                Marker(text, value["coords"].x, value["coords"].y, value["coords"].z - 0.98) 
            end
        end

        Citizen.Wait(sleepTime)
    end
end)
]]--



FoodStand = function(place)

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'food_stand',
    {
        title    = place,
        align    = 'center',
        elements = {
            { ["label"] = "Food", ["type"] = "eatable" },
            { ["label"] = "Drinks", ["type"] = "drink" }
        }
    }, function(data, menu)

        local type = data.current.type

        FoodMenu(place, type)

    end, function(data, menu)
        menu.close() 
    end)
end

FoodMenu = function(place, type)

    local elements = {}

    if ConfigGamz.Zones[place][type] == nil then
        ConfigGamz.Zones[place][type] = ConfigGamz[type]
    end

    for food, value in pairs(ConfigGamz.Zones[place][type]) do

        table.insert(elements, {
            ["label"] = food .. " $" .. value.price,
            ["price"] = value.price,
            ["prop"] = value.prop
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'food_menu',
    {
        title    = place,
        align    = 'center',
        elements = elements
    }, function(data, menu)
        
        ESX.UI.Menu.CloseAll()

        if MoneyCheck(data.current.price) then
            TriggerServerEvent("gamz-food:removeMoney", data.current.price)

            ESX.ShowNotification("You bought a " .. data.current.label)

            Consume(data.current.prop, type)
        else
            ESX.ShowNotification("You do not have enough cash")
        end

    end, function(data, menu)
        menu.close() 
    end)
end

Consume = function(prop, type)

    if consuming then
        return
    end

    consuming = true

    local dict = ConfigGamz.Anims[type]["dict"]
    local anim = ConfigGamz.Anims[type]["animation"]

    local coords = GetEntityCoords(PlayerPedId())

    local prop = CreateObject(GetHashKey(prop), coords + vector3(0.0, 0.0, 0.2),  true,  true, true)

    if type == "drink" then
        AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.15, 0.025, 0.010, 270.0, 175.0, 0.0, true, true, false, true, 1, true)
    else
        AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
    end

    LoadAnimDict(dict)

    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8, -1, 49, 0, 0, 0, 0)

    if type == "drink" then
        type = "thirst"
    elseif type == "eatable" then
        type = "hunger"
    end

    for i=1, 50 do
        Wait(300)
        TriggerEvent('esx_status:add', type, 10000)
      --  exports["gamz-status"]:SetStatus("Hunger", 0.7)
    end
    
    ClearPedSecondaryTask(PlayerPedId())
    DeleteObject(prop)

    consuming = false

end