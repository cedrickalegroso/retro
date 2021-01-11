local isPlayerSafe = false
local isMotel = false

RegisterNetEvent("esx_inventoryhud:openPropertyInventory")
AddEventHandler("esx_inventoryhud:openPropertyInventory", function(data, playerSafe, playerMotel)
    if playerSafe then isPlayerSafe = playerSafe; else isPlayerSafe = false; end
    if playerMotel then isMotel = playerMotel; else isMotel = false; end
    setPropertyInventoryData(data)
    openPropertyInventory()
end)

function refreshPropertyInventory()
    if isPlayerSafe then
        ESX.TriggerServerCallback('playersafes:GetSafeInventory', function(inventory) 
            setPropertyInventoryData(inventory); 
        end,isPlayerSafe.safeid)
    elseif isMotel then
        ESX.TriggerServerCallback('motels:getInventory', function(inventory) 
            setPropertyInventoryData(inventory); 
        end,isMotel.zone,isMotel.door)
    else
        ESX.TriggerServerCallback("esx_property:getPropertyInventory",function(inventory)
            setPropertyInventoryData(inventory)
        end,ESX.GetPlayerData().identifier)
    end
end

function setPropertyInventoryData(data)
    items = {}

    local blackMoney = data.blackMoney
    local propertyItems = data.items
    local propertyWeapons = data.weapons

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #propertyItems, 1 do
        local item = propertyItems[i]
        if item.count > 0 then            
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]
        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openPropertyInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "property"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoProperty",
    function(data, cb) 
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)
            local isWeapon = false
            if data.item.type == "item_weapon" then
                isWeapon = true
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            if isPlayerSafe then        
                TriggerServerEvent("playersafes:PutItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, isPlayerSafe.safeid, isWeapon)
            elseif isMotel then
                TriggerServerEvent("motels:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, isMotel.zone, isMotel.door, isWeapon)
            else
                TriggerServerEvent("esx_property:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count)
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromProperty",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            if isPlayerSafe then
                TriggerServerEvent("playersafes:GetItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), isPlayerSafe.safeid)
            elseif isMotel then
                TriggerServerEvent("motels:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), isMotel.zone, isMotel.door)                
            else
                TriggerServerEvent("esx_property:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number))
            end
        end

        Wait(150)
        refreshPropertyInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)


function loadPlayerInventory()
    ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventory", function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if  money ~= nil and money > 0 then
                for key, value in pairs(accounts) do
                    moneyData = {
                        label = _U("cash"),
                        name = "cash",
                        type = "item_money",
                        count = money,
                        usable = false,
                        rare = false,
                        limit = -1,
                        canRemove = true
                    }

                    table.insert(items, moneyData)
                end
            end

            if  accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end
			
            if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        inventory[key].type = "item_standard"
                        table.insert(items, inventory[key])
						--widgetTotal = getInventoryWeight(items)
                    end
                end
            end

            if  weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
							local found = false
							for slot, weapon in pairs(fastWeapons) do
								if weapon == weapons[key].name then
									local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
									table.insert(
										fastItems,
										{
											label = weapons[key].label,
											count = ammo,
											limit = -1,
											type = "item_weapon",
											name = weapons[key].name,
											usable = false,
											rare = false,
											canRemove = true,
											slot = slot
										}
									)
									found = true
									break
								end
							end
							if found == false then
								local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
								table.insert(
									items,
									{
										label = weapons[key].label,
										count = ammo,
										limit = -1,
										type = "item_weapon",
										name = weapons[key].name,
										usable = false,
										rare = false,
										canRemove = true
									}
								)
							end
                    end
                end
            end
			
			local arrayWeight = Config.localWeight
			local weight = 0
			local itemWeight = 0
			local itemsW = 0
			if items ~= nil then
			for i = 1, #items, 1 do
				if items[i] ~= nil then
				  itemWeight = Config.DefaultWeight
				  itemWeight = itemWeight / items[1].count * 0.0
				if arrayWeight[items[i].name] ~= nil then
				  itemWeight = arrayWeight[items[i].name]
				  items[i].limit = itemWeight / 1000
				end
				  weight = weight + (itemWeight * (items[i].count or 1))
				end
		      end
			end
			
			local texts =  _U("player_info", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
			
           -- if weight > Config.Limit then
               -- exports['mythic_notify']:SendAlert('error', 'Inventário Cheio! Não Consegues Andar')
				--[[TriggerEvent("pNotify:SendNotification",  {
					text =  'Inventário Cheio! Não Consegues Andar',
					type = "error",
					timeout = 2000,
					layout = "centerLeft"
                })--]] --Uncomment this to Use pNotify
			  -- setHurt()
			   
			--   texts = _U("player_info_full", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
		--	elseif weight <= Config.Limit then
			--   setNotHurt()
--texts =  _U("player_info", GetPlayerName(PlayerId()), (weight / 1000), (Config.Limit / 1000))
		--	end
			
            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
                    fastItems = fastItems,
					text = texts
                })	
        end, GetPlayerServerId(PlayerId())
    )
end
