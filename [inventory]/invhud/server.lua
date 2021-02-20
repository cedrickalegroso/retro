ESX = nil
ScriptName = GetCurrentResourceName()
ServerItems = {}
itemShopList = {}
OpenedInventories = {}
StartingWeights = {}

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            local xPlayers = ESX.GetPlayers()
            for i = 1, #xPlayers do
                if GetPlayerPing(xPlayers[i]) == -1 then
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    print("player : " .. xPlayer.identifier .. " has -1 ping, lost interent or is cheating")
                    DropPlayer(xPlayer.source, "No internet")
                end
            end
        end
    end
)

if Config.Use.Societies then
    for k, v in pairs(Config.Shops) do
        if v.Society.Name then
            local socString = string.format("society_%s", v.Society.Name)
            TriggerEvent(
                "esx_society:registerSociety",
                v.Society.Name,
                v.Society.Name,
                socString,
                socString,
                socString,
                {type = "public"}
            )
        end
    end
end

Notify = function(src, text, timer)
    if timer == nil then
        timer = 5000
    end
    -- TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = text, length = timer, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
    -- TriggerClientEvent('pNotify:SendNotification', src, {text = text, type = 'error', queue = GetCurrentResourceName(), timeout = timer, layout = 'bottomCenter'})
    TriggerClientEvent("esx:showNotification", src, text)
end

doRound = function(value, numDecimalPlaces)
    --print('do round '..value)
    if numDecimalPlaces then
        local power = 10 ^ numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

doTrim = function(value)
    return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
end

plyHasWep = function(wepName, player)
    for k, v in ipairs(player.loadout) do
        if v.name == wepName then
            return true
        end
    end
    return false
end

logText = function(who, what)
    if Config.TextLog.Use then
        local pname = who.identifier
        local cname = who.name
        local _source = who.source
        local logitem = ("[" .. ScriptName .. "] :  " .. cname .. what)
        PerformHttpRequest(
            Config.TextLog.Webhook,
            function(err, text, headers)
            end,
            "POST",
            json.encode({username = (cname .. " [" .. _source .. "]" .. " [" .. pname .. "]"), content = logitem}),
            {["Content-Type"] = "application/json"}
        )
    else
        local pname = who.identifier
        local cname = who.name
        local _source = who.source
        local logitem = "[" .. ScriptName .. "] :  " .. cname .. " [" .. _source .. "]" .. " [" .. pname .. "] " .. what
        print(logitem)
    end
end

IsInInv = function(inv, item)
    for k, v in pairs(inv.items) do
        if item == k then
            return true
        end
    end
    for k, v in pairs(inv.weapons) do
        if item == k then
            return true
        end
    end
    return false
end


InvCanCarry = function(xPlayer, inv, name, count, totWeight)
    if totWeight == -1 then
        print("ngee")
        return true
    end
    print("triggered")
    local total = 0
    local xItem = xPlayer.getInventoryItem(name)
    local itemWeight
    if xItem ~= nil then
        --	itemWeight = xPlayer.getInventoryItem(name).weight
        itemWeight = Config.Weight.ItemWeights[name]
        ---print('Weight '..itemWeight)
        if itemWeight == nil then
            itemWeight = 100 / (xPlayer.getInventoryItem(name).limit * 0.1)
        end
        itemWeight = itemWeight * count
    elseif Config.Weight.WeaponWeights[name] then
        itemWeight = Config.Weight.WeaponWeights[name]
        itemWeight = itemWeight * (count * 0.01)
    else
        itemWeight = 0.01
    end
    totWeight = totWeight * 1.00
    for k, v in pairs(inv.items) do
        local xItem = xPlayer.getInventoryItem(k)
        print("was here")
        if xItem ~= nil then
            print("item not nill " .. name)
            if xItem.weight ~= nil then
                --	print('total 1'.. total)
                total = total + Config.Weight.ItemWeights[name] * v[1].count
            else
                --	print('total 2'.. total)
                itemWeight = Config.Weight.ItemWeights[name]
            end
        else
            print("item  nill")
            total = Config.Weight.ItemWeights[name] + 0.01

            print(total)
        end
    end
    for k, v in pairs(inv.weapons) do
        for i = 1, #v do
            if Config.Weight.WeaponWeights[k] then
                total = total + (Config.Weight.WeaponWeights[k] + (v[i].count * 0.01))
            else
                total = total + 5
                print("Weapon weight not set, defaulted to 5")
            end
        end
    end

    if doRound(total, 2) + doRound(itemWeight, 2) > doRound(totWeight, 2) then
        print("total " .. total)
        print("itemWeight " .. itemWeight)
        print("totWeight " .. totWeight)
        return false
    else
        print("total " .. total)
        print("itemWeight " .. itemWeight)
        print("totWeight " .. totWeight)
        return true
    end
end

ESX.RegisterServerCallback(
    "invhud:getPlayerLicenses",
    function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.fetchAll(
            "SELECT type FROM user_licenses WHERE owner = @owner",
            {
                ["@owner"] = xPlayer.identifier
            },
            function(result)
                local licenses = {}

                for i = 1, #result do
                    table.insert(licenses, result[i].type)
                end

                cb(licenses)
            end
        )
    end
)

ESX.RegisterServerCallback(
    "invhud:doesSomeoneOwn",
    function(source, cb, plate)
        MySQL.Async.fetchAll(
            "SELECT * FROM owned_vehicles WHERE plate = @plate",
            {
                ["@plate"] = plate
            },
            function(result)
                if result and result[1] then
                    cb(true)
                else
                    cb(false)
                end
            end
        )
    end
)

ESX.RegisterServerCallback(
    "invhud:getPlayerInventory",
    function(source, cb, target, notOpen)
        local xPlayer = ESX.GetPlayerFromId(source)
        local tPlayer = ESX.GetPlayerFromId(target)
        local total = 0
        local inventory = tPlayer.inventory
        local weapons = tPlayer.loadout
      
        if xPlayer ~= nil and type(xPlayer) == "table" then
            if tPlayer ~= nil and type(tPlayer) == "table" then
                if
                    (xPlayer.identifier ~= tPlayer.identifier and not OpenedInventories[tPlayer.identifier]) or
                        xPlayer.identifier == tPlayer.identifier
                 then
                    if not notOpen then
                        OpenedInventories[tPlayer.identifier] = xPlayer.identifier
                    end
                    for key, value in pairs(inventory) do
                        if inventory[key].count <= 0 then
                            inventory[key] = nil
                        else
                            local xItem = tPlayer.getInventoryItem(value.name)
                            if xItem ~= nil then
                                --	print('not nill')
                                if xItem.weight ~= nil then
                                    total = total + Config.Weight.ItemWeights[xItem.name] * value.count
                                else
                                   -- print('item'.. xItem.name)
                                    local itemLimit = xItem.limit
                                    if itemLimit == -1 then
                                        print("not nill 2")
                                        itemLimit = 100000
                                    end
                                    total = total + Config.Weight.ItemWeights[xItem.name] * value.count
                                end
                            else
                                total = total + 0.01
                            end
                        end
                    end
                    cb(
                        {
                            owner = tPlayer.identifier,
                            inventory = tPlayer.inventory,
                            money = tPlayer.getMoney(),
                            accounts = tPlayer.accounts,
                            weapons = tPlayer.loadout,
                            maxWeight = tPlayer.maxWeight,
                            totalWeight = total
                        }
                    )
                else
                    Notify(source, "This inventory is already opened")
                    cb(nil)
                end
            else
                print("no target player for", target)
                Notify(xPlayer.source, "No target player for " .. target)
                cb(nil)
            end
        else
            print("no source player, idk they do not exist server side apparently")
            Notify(xPlayer.source, "No source player, idk you do not exist server side apparently")
            cb(nil)
        end
    end
)

ESX.RegisterServerCallback(
    "invhud:doMath",
    function(source, cb, inv)
        local xPlayer = ESX.GetPlayerFromId(source)
        local total = 0
        for k, v in pairs(inv.items) do
            local xItem = xPlayer.getInventoryItem(k)
            if xItem ~= nil then
                --	total = Config.Weight.ItemWeights[name]

                if xItem.weight ~= nil then
                    print("debug 1")
                    total = total + Config.Weight.ItemWeights[xItem.name] * v[1].count
                else
                    print("debug 2")
                    local itemLimit = xItem.limit
                    if itemLimit == -1 then
                        print("debug 3 " .. xItem.name)
                        itemLimit = Config.Weight.ItemWeights[xItem.name]
                    end
                    total = Config.Weight.ItemWeights[xItem.name] * v[1].count
                end
            else
                total = total + 0.01
            end
        end
        for k, v in pairs(inv.weapons) do
            for i = 1, #v do
                if Config.Weight.WeaponWeights[k] then
                    total = total + (Config.Weight.WeaponWeights[k] + (v[i].count * 0.01))
                else
                    total = total + (5 + (v[i].count * 0.01))
                    print("Weapon weight not set, defaulted to 5")
                end
            end
        end
        print("Rounded Total " .. doRound(total))
        cb(doRound(total))
    end
)

ESX.RegisterServerCallback(
    "invhud:getInv",
    function(source, cb, invType, id, class)
        local xPlayer = ESX.GetPlayerFromId(source)
        local weightLimit = Config.Weight.DefaultWeight
        print(class)
        if class ~= nil then
            if class == "mailbox" then
                weightLimit = Config.Weight.MailboxWeight
            elseif Config.Weight.VehicleLimits.Classes[class] then
                weightLimit = Config.Weight.VehicleLimits.Classes[class][invType]
            elseif Config.Weight.VehicleLimits.CustomWeight[class] then
                weightLimit = Config.Weight.VehicleLimits.CustomWeight[class][invType]
            elseif Config.Weight.Houses.Shells[class] then
                weightLimit = Config.Weight.Houses.Shells[class]
            end
        end
        if invType == "stash" then
            weightLimit = Config.Weight.StashWeight
        end
        if invType == "property" then
            
        else 
            if (not OpenedInventories[id]) or OpenedInventories[id] == xPlayer.source then
                OpenedInventories[id] = xPlayer.source
                MySQL.Async.fetchAll(
                    "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                    {["@owner"] = id, ["@type"] = invType},
                    function(result)
                        if result[1] then
                            cb(result[1])
                        else
                            MySQL.Async.execute(
                                "INSERT INTO `inventories` (owner, type, data, `limit`) VALUES (@id, @type, @data, @limit)",
                                {
                                    ["@id"] = id,
                                    ["@type"] = invType,
                                    ["@data"] = json.encode({items = {}, weapons = {}, blackMoney = 0, cash = 0}),
                                    ["@limit"] = weightLimit
                                },
                                function(rowsChanged)
                                    if rowsChanged then
                                        logText(xPlayer, " created inventory for " .. id .. " with type " .. invType)
                                    end
                                end
                            )
                            cb(
                                {
                                    ["owner"] = id,
                                    ["type"] = invType,
                                    ["data"] = json.encode({items = {}, weapons = {}, blackMoney = 0, cash = 0}),
                                    ["limit"] = weightLimit
                                }
                            )
                        end
                    end
                )
            else
                Notify(xPlayer.source, "This inventory is already opened")
                cb(nil)
            end
        end

     
    end
)

RegisterServerEvent("invhud:closedInventory")
AddEventHandler(
    "invhud:closedInventory",
    function(id)
        OpenedInventories[id] = nil
    end
)

RegisterServerEvent("invhud:removeWeight")
AddEventHandler(
    "invhud:removeWeight",
    function(source, gun, ammo)
        local xPlayer = ESX.GetPlayerFromId(source)
        if Config.Weight.AddWeaponsToPlayerWeight then
            local weight
            if Config.Weight.WeaponWeights[gun] then
                weight = Config.Weight.WeaponWeights[gun] + (ammo * 0.01)
            else
                weight = 5 + (ammo * 0.01)
                print(string.format("Weapon weight not set for %s, defaulted to 5", gun))
            end
            if xPlayer.weight + weight > xPlayer.maxWeight then
                if xPlayer.hasWeapon(gun) then
                    local _, weapon = xPlayer.getWeapon(gun)
                    local _, weaponObject = ESX.GetWeapon(gun)
                    local pickupLabel

                    xPlayer.removeWeapon(gun)

                    if weaponObject.ammo and weapon.ammo > 0 then
                        local ammoLabel = weaponObject.ammo.label
                        pickupLabel = ("~y~%s~s~ [~g~%s~s~ %s]"):format(weapon.label, weapon.ammo, ammoLabel)
                    else
                        pickupLabel = ("~y~%s~s~"):format(weapon.label)
                    end
                    Notify(xPlayer.source, "You can not hold that weapon")
                    ESX.CreatePickup(
                        "item_weapon",
                        gun,
                        weapon.ammo,
                        pickupLabel,
                        source,
                        weapon.components,
                        weapon.tintIndex
                    )
                end
            else
                local newWeight = xPlayer.maxWeight - weight
                xPlayer.setMaxWeight(doRound(newWeight, 2))
            end
        end
    end
)

RegisterServerEvent("esx:removeInventoryItem")
AddEventHandler(
    "esx:removeInventoryItem",
    function(itemType, itemName, count)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if Config.Weight.AddWeaponsToPlayerWeight then
            if itemType == "item_weapon" then
                itemName = string.upper(itemName)
                local weight
                if Config.Weight.WeaponWeights[itemName] then
                    weight = Config.Weight.WeaponWeights[itemName] + (count * 0.01)
                else
                    weight = 5 + (count * 0.01)
                    print(string.format("Weapon weight not set for %s, defaulted to 5", itemName))
                end
                local newWeight = xPlayer.maxWeight + weight
                xPlayer.setMaxWeight(doRound(newWeight, 2))
            end
        end
    end
)

RegisterServerEvent("invhud:setPlayerWeaponWeight")
AddEventHandler(
    "invhud:setPlayerWeaponWeight",
    function(weapons)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        local weightWaits = 0
        while not xPlayer.maxWeight do
            Citizen.Wait(10)
            xPlayer = ESX.GetPlayerFromId(src)
            weightWaits = weightWaits + 1
            if weightWaits >= 50 then
                print(
                    "Failed to receive maxWeight, are you running esx with limits? Turn off the config to add weapon weight to players"
                )
                return
            end
        end
        if xPlayer.maxWeight then
            StartingWeights[xPlayer.identifier] = xPlayer.maxWeight
            local total = 0
            for key, value in pairs(weapons) do
                if Config.Weight.WeaponWeights[value.name] then
                    total = total + (Config.Weight.WeaponWeights[value.name] + (value.count * 0.01))
                else
                    total = total + (5 + (value.count * 0.01))
                    print(string.format("Weapon weight not set for %s, defaulted to 5", value.name))
                end
            end
            local newWeight = xPlayer.maxWeight - total
            xPlayer.setMaxWeight(doRound(newWeight, 2))
        else
            print("If you are running esx with weight, please have the player log out")
        end
    end
)

RegisterServerEvent("invhud:tradePlayerItem")
AddEventHandler(
    "invhud:tradePlayerItem",
    function(from, target, invType, itemName, itemCount)
        local src = from

        local xPlayer = ESX.GetPlayerFromId(src)
        local tPlayer = ESX.GetPlayerFromId(target)

        if invType == "item_standard" then
            local xItem = xPlayer.getInventoryItem(itemName)
            local tItem = tPlayer.getInventoryItem(itemName)

            if xPlayer.canCarryItem ~= nil then
                if xPlayer.maxWeight ~= nil then
                    if itemCount > 0 and xItem.count >= itemCount then
                        if tPlayer.canCarryItem(itemName, itemCount) then
                            xPlayer.removeInventoryItem(itemName, itemCount)
                            tPlayer.addInventoryItem(itemName, itemCount)
                            logText(
                                xPlayer,
                                " added " .. itemCount .. " " .. itemName .. " to inventory " .. tPlayer.identifier
                            )
                        else
                            Notify(xPlayer.source, "This player can not carry that much")
                            Notify(tPlayer.source, "You can not carry that much")
                        end
                    else
                        Notify(xPlayer.source, "You do not have enough of that item to give")
                    end
                else
                    Notify(src, "Max weight error, relog")
                end
            else
                if itemCount > 0 and xItem.count >= itemCount then
                    if tItem.limit == -1 or (tItem.count + itemCount) <= tItem.limit then
                        xPlayer.removeInventoryItem(itemName, itemCount)
                        tPlayer.addInventoryItem(itemName, itemCount)
                        logText(
                            xPlayer,
                            " added " .. itemCount .. " " .. itemName .. " to inventory " .. tPlayer.identifier
                        )
                    else
                        Notify(xPlayer.source, "This player can not carry that much")
                        Notify(tPlayer.source, "You can not carry that much")
                    end
                else
                    Notify(xPlayer.source, "You do not have enough of that item to give")
                end
            end
        elseif invType == "item_account" then
            if itemCount > 0 and xPlayer.getAccount(itemName).money >= itemCount then
                xPlayer.removeAccountMoney(itemName, itemCount)
                tPlayer.addAccountMoney(itemName, itemCount)
                logText(xPlayer, " added " .. itemCount .. " " .. itemName .. " to inventory " .. tPlayer.identifier)
            else
                Notify(xPlayer.source, "You do not have enough in that account to give")
            end
        elseif invType == "item_money" then
            if xPlayer.getMoney() >= itemCount then
                xPlayer.removeMoney(itemCount)
                tPlayer.addMoney(itemCount)
                logText(xPlayer, " added " .. itemCount .. " " .. itemName .. " to inventory " .. tPlayer.identifier)
            else
                Notify(xPlayer.source, "You do not have enough money")
            end
        elseif invType == "item_weapon" then
            if not plyHasWep(itemName, tPlayer) then
                local weight
                if Config.Weight.WeaponWeights[itemName] then
                    weight = Config.Weight.WeaponWeights[itemName] + (itemCount * 0.01)
                else
                    weight = 5 + (itemCount * 0.01)
                    print(string.format("Weapon weight not set for %s, defaulted to 5", itemName))
                end
                if Config.Weight.AddWeaponsToPlayerWeight then
                    local newWeight = tPlayer.maxWeight - weight
                    if newWeight <= doRound(0, 2) then
                        Notify(source, "Can not hold weapon")
                        return
                    end
                end
                xPlayer.removeWeapon(itemName)
                tPlayer.addWeapon(itemName, itemCount)
                logText(xPlayer, " added " .. itemCount .. " " .. itemName .. " to inventory " .. tPlayer.identifier)
                if Config.Weight.AddWeaponsToPlayerWeight then
                    local newWeight = xPlayer.maxWeight + weight
                    xPlayer.setMaxWeight(doRound(newWeight, 2))
                    newWeight = tPlayer.maxWeight - weight
                    tPlayer.setMaxWeight(doRound(newWeight, 2))
                end
            else
                Notify(xPlayer.source, "This person already has this weapon, just give them ammo")
            end
        end
    end
)

RegisterServerEvent("invhud:putItem")
AddEventHandler(
    "invhud:putItem",
    function(invType, owner, data, count)
        print(invType)
        for k, v in pairs(Config.Use.CashIn) do
            if (not v and invType == k) and (data.item.type == "item_money") then
                Notify(source, "That is not able to be stored here")
                return
            end
        end
        for k, v in pairs(Config.Use.AccountsIn) do
            if (not v and invType == k) and (data.item.type == "item_account") then
                Notify(source, "That is not able to be stored here")
                return
            end
        end
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer ~= nil and type(xPlayer) == "table" then
            if data.item.type == "item_money" then
                data.item.type = "item_account"
                data.item.name = "money"
            end
            if data.item.type == "item_standard" then
                local xItem = xPlayer.getInventoryItem(data.item.name)
                if count == nil or count == 0 then
                    count = xItem.count
                end
                if xItem.count >= count then
                    local inventory = {}
                    MySQL.Async.fetchAll(
                        "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                        {["@owner"] = owner, ["@type"] = invType},
                        function(result)
                            if result[1] then
                                inventory = json.decode(result[1].data)
                                if IsInInv(inventory, data.item.name) then
                                    if InvCanCarry(xPlayer, inventory, data.item.name, count, result[1].limit) then
                                        print("can carry 1")
                                        print(inventory)
                                        print(data.item.name)
                                        print(count)
                                        print(result[1].limit)
                                        xPlayer.removeInventoryItem(data.item.name, count)
                                        inventory.items[data.item.name][1].count =
                                            inventory.items[data.item.name][1].count + count
                                        MySQL.Async.execute(
                                            "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                            {
                                                ["@owner"] = owner,
                                                ["@type"] = invType,
                                                ["@data"] = json.encode(inventory)
                                            },
                                            function(rowsChanged)
                                                if rowsChanged then
                                                    logText(
                                                        xPlayer,
                                                        " added " ..
                                                            count ..
                                                                " " ..
                                                                    data.item.name ..
                                                                        " to inventory " ..
                                                                            owner .. " with type " .. invType
                                                    )
                                                end
                                            end
                                        )
                                    else
                                        Notify(src, "This inventory can not hold enough of that item")
                                    end
                                else
                                    if InvCanCarry(xPlayer, inventory, data.item.name, count, result[1].limit) then
                                        print("can carry 2")
                                        xPlayer.removeInventoryItem(data.item.name, count)
                                        inventory.items[data.item.name] = {}
                                        table.insert(
                                            inventory.items[data.item.name],
                                            {count = count, label = data.item.label}
                                        )
                                        MySQL.Async.execute(
                                            "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                            {
                                                ["@owner"] = owner,
                                                ["@type"] = invType,
                                                ["@data"] = json.encode(inventory)
                                            },
                                            function(rowsChanged)
                                                if rowsChanged then
                                                    logText(
                                                        xPlayer,
                                                        " added " ..
                                                            count ..
                                                                " " ..
                                                                    data.item.name ..
                                                                        " to inventory " ..
                                                                            owner .. " with type " .. invType
                                                    )
                                                end
                                            end
                                        )
                                    else
                                        Notify(src, "This inventory can not hold enough of that item")
                                    end
                                end
                            end
                        end
                    )
                else
                    Notify(src, "You do not have that much of " .. data.item.name)
                end
            elseif data.item.type == "item_weapon" then
                if plyHasWep(data.item.name, xPlayer) then
                    local inventory = {}
                    local weight
                    if Config.Weight.WeaponWeights[data.item.name] then
                        weight = Config.Weight.WeaponWeights[data.item.name] + (data.item.count * 0.01)
                    else
                        weight = 5 + (data.item.count * 0.01)
                        print(string.format("Weapon weight not set for %s, defaulted to 5", data.item.name))
                    end
                    MySQL.Async.fetchAll(
                        "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                        {["@owner"] = owner, ["@type"] = invType},
                        function(result)
                            if result[1] then
                                inventory = json.decode(result[1].data)
                                if IsInInv(inventory, data.item.name) then
                                    if InvCanCarry(xPlayer, inventory, data.item.name, count, result[1].limit) then
                                        xPlayer.removeWeapon(data.item.name)
                                        if xPlayer.removeWeaponComponent ~= nil then
                                            for i = 1, #data.item.components do
                                                xPlayer.removeWeaponComponent(data.item.name, data.item.components[i])
                                            end
                                        end
                                        if Config.Weight.AddWeaponsToPlayerWeight then
                                            local newWeight = xPlayer.maxWeight + weight
                                            xPlayer.setMaxWeight(doRound(newWeight, 2))
                                        end
                                        table.insert(
                                            inventory.weapons[data.item.name],
                                            {count = count, label = data.item.label, components = data.item.components}
                                        )
                                        MySQL.Async.execute(
                                            "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                            {
                                                ["@owner"] = owner,
                                                ["@type"] = invType,
                                                ["@data"] = json.encode(inventory)
                                            },
                                            function(rowsChanged)
                                                if rowsChanged then
                                                    logText(
                                                        xPlayer,
                                                        " added " ..
                                                            data.item.name ..
                                                                " to inventory " ..
                                                                    owner ..
                                                                        " with type " ..
                                                                            invType .. " holding " .. count .. " ammo"
                                                    )
                                                end
                                            end
                                        )
                                    else
                                        Notify(src, "Inventory cannot hold that weapon")
                                    end
                                else
                                    if InvCanCarry(xPlayer, inventory, data.item.name, count, result[1].limit) then
                                        xPlayer.removeWeapon(data.item.name)
                                        if xPlayer.removeWeaponComponent ~= nil then
                                            for i = 1, #data.item.components do
                                                xPlayer.removeWeaponComponent(data.item.name, data.item.components[i])
                                            end
                                        end
                                        if Config.Weight.AddWeaponsToPlayerWeight then
                                            local newWeight = xPlayer.maxWeight + weight
                                            xPlayer.setMaxWeight(doRound(newWeight, 2))
                                        end
                                        inventory.weapons[data.item.name] = {}
                                        table.insert(
                                            inventory.weapons[data.item.name],
                                            {count = count, label = data.item.label, components = data.item.components}
                                        )
                                        MySQL.Async.execute(
                                            "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                            {
                                                ["@owner"] = owner,
                                                ["@type"] = invType,
                                                ["@data"] = json.encode(inventory)
                                            },
                                            function(rowsChanged)
                                                if rowsChanged then
                                                    logText(
                                                        xPlayer,
                                                        " added " ..
                                                            data.item.name ..
                                                                " to inventory " ..
                                                                    owner ..
                                                                        " with type " ..
                                                                            invType .. " holding " .. count .. " ammo"
                                                    )
                                                end
                                            end
                                        )
                                    else
                                        Notify(src, "Inventory cannot hold that weapon")
                                    end
                                end
                            end
                        end
                    )
                else
                    Notify(src, "You do not have that weapon")
                end
            elseif data.item.type == "item_account" then
                local accountName, money
                if data.item.name == "money" then
                    accountName = "cash"
                    money = xPlayer.getMoney()
                elseif data.item.name == "black_money" then
                    accountName = "blackMoney"
                    money = xPlayer.getAccount(data.item.name).money
                end
                if count == nil or count == 0 then
                    count = money
                end
                if money >= count then
                    local inventory = {}
                    MySQL.Async.fetchAll(
                        "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                        {["@owner"] = owner, ["@type"] = invType},
                        function(result)
                            if result[1] then
                                inventory = json.decode(result[1].data)
                                if data.item.name == "money" then
                                    xPlayer.removeMoney(count)
                                else
                                    xPlayer.removeAccountMoney(data.item.name, count)
                                end
                                inventory[accountName] = inventory[accountName] + count
                                MySQL.Async.execute(
                                    "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                    {
                                        ["@owner"] = owner,
                                        ["@type"] = invType,
                                        ["@data"] = json.encode(inventory)
                                    },
                                    function(rowsChanged)
                                        if rowsChanged then
                                            logText(
                                                xPlayer,
                                                " added " ..
                                                    count ..
                                                        " " ..
                                                            data.item.name ..
                                                                " to inventory " .. owner .. " with type " .. invType
                                            )
                                        end
                                    end
                                )
                            end
                        end
                    )
                else
                    Notify(src, "You do not have enough cash to do that")
                end
            end
        else
            local infoTab = {identifier = "Not Valid", name = "Not Valid", source = "Not Valid"}
            logText(infoTab, "Player source not valid, possible cheat")
        end
    end
)

RegisterServerEvent("invhud:getItem")
AddEventHandler(
    "invhud:getItem",
    function(invType, owner, data, count)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if count == nil or count == 0 then
            count = data.item.count
        end
        if xPlayer ~= nil and type(xPlayer) == "table" then
            if data.item.type == "item_money" then
                data.item.type = "item_account"
                data.item.name = "money"
            end
            if data.item.type == "item_standard" then
                local xItem = xPlayer.getInventoryItem(data.item.name)
                if xPlayer.canCarryItem ~= nil then
                    if xPlayer.maxWeight ~= nil then
                        if xPlayer.canCarryItem(data.item.name, count) then
                            local inventory = {}
                            MySQL.Async.fetchAll(
                                "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                                {["@owner"] = owner, ["@type"] = invType},
                                function(result)
                                    if result[1] then
                                        inventory = json.decode(result[1].data)
                                        if IsInInv(inventory, data.item.name) then
                                            if inventory.items[data.item.name][1].count >= count then
                                                xPlayer.addInventoryItem(data.item.name, count)
                                                inventory.items[data.item.name][1].count =
                                                    inventory.items[data.item.name][1].count - count
                                                if inventory.items[data.item.name][1].count <= 0 then
                                                    inventory.items[data.item.name] = nil
                                                end
                                                MySQL.Async.execute(
                                                    "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                                    {
                                                        ["@owner"] = owner,
                                                        ["@type"] = invType,
                                                        ["@data"] = json.encode(inventory)
                                                    },
                                                    function(rowsChanged)
                                                        if rowsChanged then
                                                            logText(
                                                                xPlayer,
                                                                " took " ..
                                                                    count ..
                                                                        " " ..
                                                                            data.item.name ..
                                                                                " from inventory " ..
                                                                                    owner .. " with type " .. invType
                                                            )
                                                        end
                                                    end
                                                )
                                            else
                                                Notify(src, "There is not enough of that in the inventory")
                                            end
                                        else
                                            Notify(src, "There is not enough of that in the inventory")
                                        end
                                    end
                                end
                            )
                        else
                            Notify(src, "You can not carry any more " .. data.item.name)
                        end
                    else
                        Notify(src, "Max weight error, relog")
                    end
                else
                    if xItem.limit == -1 or (xItem.count + count <= xItem.limit) then
                        local inventory = {}
                        MySQL.Async.fetchAll(
                            "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                            {["@owner"] = owner, ["@type"] = invType},
                            function(result)
                                if result[1] then
                                    inventory = json.decode(result[1].data)
                                    if IsInInv(inventory, data.item.name) then
                                        if inventory.items[data.item.name][1].count >= count then
                                            xPlayer.addInventoryItem(data.item.name, count)
                                            inventory.items[data.item.name][1].count =
                                                inventory.items[data.item.name][1].count - count
                                            if inventory.items[data.item.name][1].count <= 0 then
                                                inventory.items[data.item.name] = nil
                                            end
                                            MySQL.Async.execute(
                                                "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                                {
                                                    ["@owner"] = owner,
                                                    ["@type"] = invType,
                                                    ["@data"] = json.encode(inventory)
                                                },
                                                function(rowsChanged)
                                                    if rowsChanged then
                                                        logText(
                                                            xPlayer,
                                                            " took " ..
                                                                count ..
                                                                    " " ..
                                                                        data.item.name ..
                                                                            " from inventory " ..
                                                                                owner .. " with type " .. invType
                                                        )
                                                    end
                                                end
                                            )
                                        else
                                            Notify(src, "There is not enough of that in the inventory")
                                        end
                                    else
                                        Notify(src, "There is not enough of that in the inventory")
                                    end
                                end
                            end
                        )
                    else
                        Notify(src, "You can not carry any more " .. data.item.name)
                    end
                end
            elseif data.item.type == "item_weapon" then
                if not plyHasWep(data.item.name, xPlayer) then
                    local inventory = {}
                    local weight
                    if Config.Weight.WeaponWeights[data.item.name] then
                        weight = Config.Weight.WeaponWeights[data.item.name] + (data.item.count * 0.01)
                    else
                        weight = 5 + (data.item.count * 0.01)
                        print(string.format("Weapon weight not set for %s, defaulted to 5", data.item.name))
                    end
                    if Config.Weight.AddWeaponsToPlayerWeight then
                        local newWeight = xPlayer.maxWeight - weight
                        if (newWeight < xPlayer.weight) or (newWeight <= doRound(0, 2)) then
                            Notify(src, "Can not hold weapon")
                            return
                        end
                    end
                    MySQL.Async.fetchAll(
                        "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                        {["@owner"] = owner, ["@type"] = invType},
                        function(result)
                            if result[1] then
                                inventory = json.decode(result[1].data)
                                if IsInInv(inventory, data.item.name) then
                                    for i = 1, #inventory.weapons[data.item.name] do
                                        if inventory.weapons[data.item.name][i].count == data.item.count then
                                            xPlayer.addWeapon(
                                                data.item.name,
                                                inventory.weapons[data.item.name][i].count
                                            )
                                            if xPlayer.addWeaponComponent ~= nil then
                                                for j = 1, #inventory.weapons[data.item.name][i].components do
                                                    xPlayer.addWeaponComponent(
                                                        data.item.name,
                                                        inventory.weapons[data.item.name][i].components[j]
                                                    )
                                                end
                                            end
                                            if Config.Weight.AddWeaponsToPlayerWeight then
                                                local newWeight = xPlayer.maxWeight - weight
                                                xPlayer.setMaxWeight(doRound(newWeight, 2))
                                            end
                                            table.remove(inventory.weapons[data.item.name], i)
                                            MySQL.Async.execute(
                                                "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                                {
                                                    ["@owner"] = owner,
                                                    ["@type"] = invType,
                                                    ["@data"] = json.encode(inventory)
                                                },
                                                function(rowsChanged)
                                                    if rowsChanged then
                                                        logText(
                                                            xPlayer,
                                                            " took " ..
                                                                data.item.name ..
                                                                    " from inventory " ..
                                                                        owner ..
                                                                            " with type " ..
                                                                                invType ..
                                                                                    " and " ..
                                                                                        data.item.count .. " ammo"
                                                        )
                                                    end
                                                end
                                            )
                                            break
                                        end
                                    end
                                else
                                    Notify(src, "There is not enough of that in the inventory")
                                end
                            end
                        end
                    )
                else
                    Notify(src, "You already have this weapon")
                end
            elseif data.item.type == "item_account" then
                local accountName
                if data.item.name == "money" then
                    accountName = "cash"
                elseif data.item.name == "black_money" then
                    accountName = "blackMoney"
                end
                local inventory = {}
                MySQL.Async.fetchAll(
                    "SELECT * FROM inventories WHERE owner = @owner AND type = @type",
                    {["@owner"] = owner, ["@type"] = invType},
                    function(result)
                        if result[1] then
                            inventory = json.decode(result[1].data)
                            if inventory[accountName] >= count then
                                if data.item.name == "money" then
                                    xPlayer.addMoney(count)
                                else
                                    xPlayer.addAccountMoney(data.item.name, count)
                                end
                                inventory[accountName] = inventory[accountName] - count
                                MySQL.Async.execute(
                                    "UPDATE inventories SET data = @data WHERE owner = @owner AND type = @type",
                                    {
                                        ["@owner"] = owner,
                                        ["@type"] = invType,
                                        ["@data"] = json.encode(inventory)
                                    },
                                    function(rowsChanged)
                                        if rowsChanged then
                                            logText(
                                                xPlayer,
                                                " took " ..
                                                    count ..
                                                        " " ..
                                                            data.item.name ..
                                                                " from inventory " .. owner .. " with type " .. invType
                                            )
                                        end
                                    end
                                )
                            else
                                Notify(src, "There is not enough of that in the inventory")
                            end
                        end
                    end
                )
            end
        else
            local infoTab = {identifier = "Not Valid", name = "Not Valid", source = "Not Valid"}
            logText(infoTab, "Player source not valid, possible cheat")
        end
    end
)

ESX.RegisterServerCallback(
    "invhud:getShopItems",
    function(source, cb, shoptype)
        itemShopList = {items = {}, weapons = {}}
        local itemResult = MySQL.Sync.fetchAll("SELECT * FROM items")
        local itemInformation = {}

        for i = 1, #itemResult, 1 do
            if itemInformation[itemResult[i].name] == nil then
                itemInformation[itemResult[i].name] = {}
            end

            itemInformation[itemResult[i].name].name = itemResult[i].name
            itemInformation[itemResult[i].name].label = itemResult[i].label
            itemInformation[itemResult[i].name].limit = itemResult[i].limit
            itemInformation[itemResult[i].name].rare = itemResult[i].rare
            itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
            itemInformation[itemResult[i].name].price = itemResult[i].price
            if Config.Shops[shoptype].Account == "black_money" then
                itemInformation[itemResult[i].name].price = itemInformation[itemResult[i].name].price * 2
            end

            for _, v in pairs(Config.Shops[shoptype].Items) do
                if v.name == itemResult[i].name then
                    table.insert(
                        itemShopList.items,
                        {
                            type = "item_standard",
                            name = itemInformation[itemResult[i].name].name,
                            label = itemInformation[itemResult[i].name].label,
                            limit = itemInformation[itemResult[i].name].limit,
                            rare = itemInformation[itemResult[i].name].rare,
                            can_remove = itemInformation[itemResult[i].name].can_remove,
                            price = v.price,
                            count = 1
                        }
                    )
                end
            end
        end
        if Config.Shops[shoptype].Weapons ~= nil then
            for _, v in pairs(Config.Shops[shoptype].Weapons) do
                if Config.Shops[shoptype].Account == "black_money" then
                    v.price = v.price * 2
                end
                table.insert(
                    itemShopList.weapons,
                    {
                        type = "item_weapon",
                        name = v.name,
                        label = v.label,
                        limit = 1,
                        ammo = 1,
                        rare = false,
                        can_remove = false,
                        price = v.price,
                        count = 1
                    }
                )
            end
        end
        itemShopList = itemShopList
        cb(itemShopList)
    end
)

RegisterServerEvent("invhud:SellItemToPlayer")
AddEventHandler(
    "invhud:SellItemToPlayer",
    function(invType, item, count, shop)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if invType == "item_standard" then
            local tItem = xPlayer.getInventoryItem(item)
            if xPlayer.canCarryItem ~= nil then
                if xPlayer.maxWeight ~= nil then
                    if xPlayer.canCarryItem(item, count) then
                        local list = itemShopList.items
                        for k, v in pairs(list) do
                            if v.name == item then
                                local totalPrice = count * v.price
                                if shop.Account ~= "money" and shop.Account ~= "cash" then
                                    if xPlayer.getAccount(shop.Account).money >= totalPrice then
                                        xPlayer.removeAccountMoney(shop.Account, totalPrice)
                                        xPlayer.addInventoryItem(item, count)
                                        Notify(
                                            source,
                                            "You purchased " ..
                                                count ..
                                                    " " ..
                                                        v.label ..
                                                            " for" .. Config.CurrencyIcon .. totalPrice .. " Pesos"
                                        )
                                        if shop.Society.Name then
                                            TriggerEvent(
                                                "esx_addonaccount:getSharedAccount",
                                                string.format("society_%s", shop.Society.Name),
                                                function(account)
                                                    if account ~= nil then
                                                        account.addMoney(totalPrice)
                                                    else
                                                        print("No account found for society: " .. shop.Society.Name)
                                                    end
                                                end
                                            )
                                        end
                                    else
                                        Notify(source, "You do not have enough money!")
                                    end
                                else
                                    if xPlayer.getMoney() >= totalPrice then
                                        xPlayer.removeMoney(totalPrice)
                                        xPlayer.addInventoryItem(item, count)
                                        Notify(
                                            source,
                                            "You purchased " ..
                                                count ..
                                                    " " ..
                                                        v.label ..
                                                            " for" .. Config.CurrencyIcon .. totalPrice .. " Pesos"
                                        )
                                        if shop.Society.Name then
                                            TriggerEvent(
                                                "esx_addonaccount:getSharedAccount",
                                                string.format("society_%s", shop.Society.Name),
                                                function(account)
                                                    if account ~= nil then
                                                        account.addMoney(totalPrice)
                                                    else
                                                        print("No account found for society: " .. shop.Society.Name)
                                                    end
                                                end
                                            )
                                        end
                                    else
                                        Notify(source, "You do not have enough money!")
                                    end
                                end
                            end
                        end
                    else
                        Notify(source, "You do not have enough space in your inventory!")
                    end
                else
                    Notify(src, "Max weight error, relog")
                end
            else
                if tItem.limit == -1 or (tItem.count + count <= tItem.limit) then
                    local list = itemShopList.items
                    for k, v in pairs(list) do
                        if v.name == item then
                            local totalPrice = count * v.price
                            if shop.Account ~= "money" and shop.Account ~= "cash" then
                                if xPlayer.getAccount(shop.Account).money >= totalPrice then
                                    xPlayer.removeAccountMoney(shop.Account, totalPrice)
                                    xPlayer.addInventoryItem(item, count)
                                    Notify(
                                        source,
                                        "You purchased " ..
                                            count ..
                                                " " ..
                                                    v.label .. " for" .. Config.CurrencyIcon .. totalPrice .. " Pesos "
                                    )
                                    if shop.Society.Name then
                                        TriggerEvent(
                                            "esx_addonaccount:getSharedAccount",
                                            string.format("society_%s", shop.Society.Name),
                                            function(account)
                                                if account ~= nil then
                                                    account.addMoney(totalPrice)
                                                else
                                                    print("No account found for society: " .. shop.Society.Name)
                                                end
                                            end
                                        )
                                    end
                                else
                                    Notify(source, "You do not have enough money!")
                                end
                            else
                                if xPlayer.getMoney() >= totalPrice then
									local tax = totalPrice * 0.12
                                    xPlayer.removeMoney(totalPrice)
                                    xPlayer.addInventoryItem(item, count)
									TriggerEvent('esx_society:depositTax',xPlayer.source, 'government', tax)
                                    Notify(
                                        source,
                                        "You purchased " ..
                                            count ..
                                                " " ..
                                                    v.label .. " for " .. '~g~' .. totalPrice .. " Pesos "
                                    )
                                    if shop.Society.Name then
                                        TriggerEvent(
                                            "esx_addonaccount:getSharedAccount",
                                            string.format("society_%s", shop.Society.Name),
                                            function(account)
                                                if account ~= nil then
                                                    account.addMoney(totalPrice)
                                                else
                                                    print("No account found for society: " .. shop.Society.Name)
                                                end
                                            end
                                        )
                                    end
                                else
                                    Notify(source, "You do not have enough money!")
                                end
                            end
                        end
                    end
                else
                    Notify(source, "You do not have enough space in your inventory!")
                end
            end
        end
        if invType == "item_weapon" then
            local targetWeapon = plyHasWep(tostring(item), xPlayer)
            if not targetWeapon then
                local list = itemShopList.weapons
                for k, v in pairs(list) do
                    if v.name == item then
                        local totalPrice = 1 * v.price
                        if shop.Account ~= "money" and shop.Account ~= "cash" then
                            if xPlayer.getAccount(shop.Account).money >= totalPrice then
                                xPlayer.removeAccountMoney(shop.Account, totalPrice)
                                xPlayer.addWeapon(v.name, v.ammo)
                                Notify(
                                    source,
                                    "You purchased a " ..
                                        v.label .. " for " .. Config.CurrencyIcon .. totalPrice .. " Pesos"
                                )
                                if shop.Society.Name then
                                    TriggerEvent(
                                        "esx_addonaccount:getSharedAccount",
                                        string.format("society_%s", shop.Society.Name),
                                        function(account)
                                            if account ~= nil then
                                                account.addMoney(totalPrice)
                                            else
                                                print("No account found for society: " .. shop.Society.Name)
                                            end
                                        end
                                    )
                                end
                            else
                                Notify(source, "You do not have enough money!")
                            end
                        else
                            if xPlayer.getMoney() >= totalPrice then
                                xPlayer.removeMoney(totalPrice)
                                xPlayer.addWeapon(v.name, v.ammo)
                                Notify(
                                    source,
                                    "You purchased a " ..
                                        v.label .. " for " .. Config.CurrencyIcon .. totalPrice .. " Pesos"
                                )
                                if shop.Society.Name then
                                    TriggerEvent(
                                        "esx_addonaccount:getSharedAccount",
                                        string.format("society_%s", shop.Society.Name),
                                        function(account)
                                            if account ~= nil then
                                                account.addMoney(totalPrice)
                                            else
                                                print("No account found for society: " .. shop.Society.Name)
                                            end
                                        end
                                    )
                                end
                            else
                                Notify(source, "You do not have enough money!")
                            end
                        end
                    end
                end
            else
                Notify(source, "You already own this weapon!")
            end
        end
    end
)

RegisterServerEvent("invhud:SellItemToShop")
AddEventHandler(
    "invhud:SellItemToShop",
    function(invType, item, count, shop)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if invType == "item_standard" then
            local tItem = xPlayer.getInventoryItem(item)
            if tItem.count >= count then
                local list = itemShopList.items
                for k, v in pairs(list) do
                    if v.name == item then
                        local totalPrice = count * v.price * shop.BuyBack
                        if totalPrice < 1 then
                            totalPrice = 0
                        end
                        if shop.Society.Name then
                            TriggerEvent(
                                "esx_addonaccount:getSharedAccount",
                                string.format("society_%s", shop.Society.Name),
                                function(account)
                                    if account == nil then
                                        print("No account found for society: " .. shop.Society.Name)
                                        return
                                    end
                                    if account.money >= totalPrice then
                                        if shop.Account ~= "money" and shop.Account ~= "cash" then
                                            xPlayer.addAccountMoney(shop.Account, totalPrice)
                                            xPlayer.removeInventoryItem(item, count)
                                            Notify(
                                                source,
                                                "You sold " ..
                                                    count ..
                                                        " " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                            )
                                            account.removeMoney(totalPrice)
                                        else
                                            xPlayer.addMoney(totalPrice)
                                            xPlayer.removeInventoryItem(item, count)
                                            Notify(
                                                source,
                                                "You sold " ..
                                                    count ..
                                                        " " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                            )
                                            account.removeMoney(totalPrice)
                                        end
                                    else
                                        Notify(source, "The shop does not have enough money")
                                    end
                                end
                            )
                        else
                            if shop.Account ~= "money" and shop.Account ~= "cash" then
                                xPlayer.addAccountMoney(shop.Account, totalPrice)
                                xPlayer.removeInventoryItem(item, count)
                                Notify(
                                    source,
                                    "You sold " ..
                                        count .. " " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                )
                            else
                                xPlayer.addMoney(totalPrice)
                                xPlayer.removeInventoryItem(item, count)
                                Notify(
                                    source,
                                    "You sold " ..
                                        count .. " " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                )
                            end
                        end
                    end
                end
            else
                Notify(source, "You do not have " .. count .. " " .. item .. " in your inventory!")
            end
        end

        if invType == "item_weapon" then
            local targetWeapon = plyHasWep(tostring(item), xPlayer)
            if targetWeapon then
                local list = itemShopList.weapons
                for k, v in pairs(list) do
                    if v.name == item then
                        local totalPrice = 1 * v.price * shop.BuyBack
                        if totalPrice < 1 then
                            totalPrice = 0
                        end
                        if shop.Society.Name then
                            TriggerEvent(
                                "esx_addonaccount:getSharedAccount",
                                string.format("society_%s", shop.Society.Name),
                                function(account)
                                    if account == nil then
                                        print("No account found for society: " .. shop.Society.Name)
                                        return
                                    end
                                    if account.money >= totalPrice then
                                        if shop.Account ~= "money" and shop.Account ~= "cash" then
                                            xPlayer.addAccountMoney(shop.Account, totalPrice)
                                            xPlayer.removeWeapon(v.name)
                                            Notify(
                                                source,
                                                "You sold a " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                            )
                                            account.removeMoney(totalPrice)
                                        else
                                            xPlayer.addMoney(totalPrice)
                                            xPlayer.removeWeapon(v.name)
                                            Notify(
                                                source,
                                                "You sold a " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice
                                            )
                                            account.removeMoney(totalPrice)
                                        end
                                    else
                                        Notify(source, "The shop does not have enough money")
                                    end
                                end
                            )
                        else
                            if shop.Account ~= "money" and shop.Account ~= "cash" then
                                xPlayer.addAccountMoney(shop.Account, totalPrice)
                                xPlayer.removeWeapon(v.name)
                                Notify(source, "You sold a " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice)
                            else
                                xPlayer.addMoney(totalPrice)
                                xPlayer.removeWeapon(v.name)
                                Notify(source, "You sold a " .. v.label .. " for " .. Config.CurrencyIcon .. totalPrice)
                            end
                        end
                    end
                end
            else
                Notify(source, "You do not own this weapon!")
            end
        end
    end
)

for k, v in pairs(Config.Bullets.Items) do
    ESX.RegisterUsableItem(
        k,
        function(source)
            TriggerClientEvent("invhud:usedAmmo", source, k)
        end
    )
end

RegisterServerEvent("invhud:usedAmmo")
AddEventHandler(
    "invhud:usedAmmo",
    function(weapon, item)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        for i = 1, #xPlayer.loadout do
            if GetHashKey(xPlayer.loadout[i].name) == weapon then
                local weapName = xPlayer.loadout[i].name
                local start = xPlayer.loadout[i].ammo
                if xPlayer.addWeaponAmmo == nil then
                    local weapComps = xPlayer.loadout[i].components
                    xPlayer.removeWeapon(weapName)
                    xPlayer.addWeapon(weapName, start + Config.Bullets.AmmoGain)
                    if xPlayer.addWeaponComponent ~= nil then
                        for i = 1, #weapComps do
                            xPlayer.addWeaponComponent(weapName, weapComps[i])
                        end
                    end
                else
                    xPlayer.addWeaponAmmo(weapName, Config.Bullets.AmmoGain)
                end
                xPlayer.removeInventoryItem(item, 1)
            end
        end
    end
)

if Config.Use.AdminSearch then
    RegisterCommand(
        "adminSearch",
        function(source, args, raw)
            if args[1] then
                if args[2] then
                    if args[1] == "player" then
                        local tPlayer = ESX.GetPlayerFromId(tonumber(args[2]))
                        if tPlayer ~= nil and type(tPlayer) == "table" then
                            TriggerClientEvent("invhud:openPlayerInventory", source, tPlayer.source, tPlayer.name)
                        else
                            print("No player found with Server ID: " .. args[2])
                        end
                    else
                        TriggerClientEvent("invhud:adminSearch", source, args[1], args[2])
                    end
                else
                    print("No ID given for admin search")
                end
            else
                print("No iventory type given for admin search")
            end
        end,
        true
    )
    TriggerEvent(
        "chat:addSuggestion",
        "/adminSearch",
        "Use to search an inventory:ADMINS ONLY",
        {
            {name = "Type", help = 'Input inventory type:"player","gbox","trunk","property","stash","safe"'},
            {
                name = "Identifier",
                help = "Input inventory id:Server ID, Property Name(ID), Vehicle Plate(gbox, trunk), Stash Name(ID), Safe ID MUST MATCH EXACTLY"
            }
        }
    )
end

-- RegisterCommand('countInv', function(source, args, raw)
-- local total = 0
-- MySQL.Async.fetchAll('SELECT * FROM inventories', {}, function(result)
-- for i = 1,#result do
-- local items = json.decode(result[i].data)
-- if items.items[args[1]] then
-- total = total + items.items[args[1]][1].count
-- end
-- end
-- cb(total)
-- end)
-- end, true)

AddEventHandler(
    "onResourceStop",
    function(mod)
        if mod == GetCurrentResourceName() then
            for k, v in pairs(StartingWeights) do
                local xPlayer = ESX.GetPlayerFromIdentifier(k)
                xPlayer.setMaxWeight(doRound(v, 2))
            end
        end
    end
)

AddEventHandler(
    "playerDropped",
    function(reason)
        local playerId = source
        local xPlayer = ESX.GetPlayerFromId(playerId)

        if xPlayer ~= nil and type(xPlayer) == "table" then
            for k, v in pairs(OpenedInventories) do
                if v == xPlayer.identifier then
                    OpenedInventories[k] = nil
                end
            end
        end
    end
)
