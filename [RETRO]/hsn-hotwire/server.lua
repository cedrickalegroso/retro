SearchedVehicles = {}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('hsn-hotwire:addKeys')
AddEventHandler('hsn-hotwire:addKeys',function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    TriggerClientEvent('hsn-hotwire:client:addKeys',src,plate)
end)


RegisterServerEvent('retro_scripts:takelockpick')
AddEventHandler('retro_scripts:takelockpick',function(plate)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem('lockpick', 1)

 --   TriggerClientEvent('hsn-hotwire:client:addKeys',src,plate)
end)

RegisterServerEvent('hsn-hotwire:server:giveKeys')
AddEventHandler('hsn-hotwire:server:giveKeys',function(target,plate)
    local src = source
    local tPlayer = ESX.GetPlayerFromId(target)
    TriggerClientEvent('hsn-hotwire:client:removeKeys',src,plate)
    TriggerClientEvent('hsn-hotwire:client:addKeys',tPlayer.source,plate)
end)

RegisterServerEvent('hsn-hotwire:server:SearchVeh')
AddEventHandler('hsn-hotwire:server:SearchVeh',function(plate)
    local src = source 
    --local Items = ESX.GetItems()
    local xPlayer = ESX.GetPlayerFromId(src)
    if SearchedVehicles[plate] ~= true then
        SearchedVehicles[plate] = true
        local luck = math.random(1, 4)
        local money = math.random(20, 200)
        if luck == 1 then
            xPlayer.addInventoryItem('bread', 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'You found one piece of bread in the car.'} )
        elseif luck == 2 then
            xPlayer.addInventoryItem('water', 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'You found one piece of water in the vehicle.'} )
        elseif luck == 3 then
            xPlayer.addInventoryItem('WEAPON_PISTOL', 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'You found one handgun in the vehicle.'} )
        elseif luck == 4 then
            xPlayer.addMoney(money)
            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = 'You found $'} )
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'inform', text = plate..'Car has already been searched'} )
    end
end)

RegisterServerEvent('hsn-hotwire:maymuncuksil')
AddEventHandler('hsn-hotwire:maymuncuksil', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem('lockpick', 1)
end)

ESX.RegisterServerCallback('hsn-hotwire:maymuncuk', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	itemcount = xPlayer.getInventoryItem(item).count
	if itemcount > 0 then
		cb(true)
	else
        activity = 0
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You dont have a lockpick on you!'} )
	end
end)