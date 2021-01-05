ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local SafeCodes = {}

Citizen.CreateThread(function()
    while true do 
        SafeCodes = {
            [1] = 1234,
            [2] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [3] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [4] = math.random(1000, 9999),
            [5] = math.random(1000, 9999),
            [6] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [7] = math.random(1000, 9999),
            [8] = math.random(1000, 9999),
            [9] = math.random(1000, 9999),
            [10] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [11] = math.random(1000, 9999),
            [12] = math.random(1000, 9999),
            [13] = math.random(1000, 9999),
            [14] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [15] = math.random(1000, 9999),
            [16] = math.random(1000, 9999),
            [17] = math.random(1000, 9999),
            [18] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [19] = math.random(1000, 9999),
        }
        Citizen.Wait((1000 * 60) * 40)
    end
end)

RegisterServerEvent('qb-storerobbery:server:takeMoney')
AddEventHandler('qb-storerobbery:server:takeMoney', function(register, isDone)
    local src   = source
    local Player = ESX.GetPlayerFromId(src)
    local cakam = math.random(50, 100)
   -- Player.addMoney(cakam)

   
    Player.addAccountMoney('black_money', cakam)
    TriggerClientEvent('notification', source, cakam.. '$ Dirty Money' , 3)
    if isDone then
        --if math.random(1, 100) <= 17 then
            local code = SafeCodes[Config.Registers[register].safeKey]
            local info = {}
            if Config.Safes[Config.Registers[register].safeKey].type == "keypad" then
                 TriggerClientEvent('notification', source, 'A cism out of the safe:'.. '' ..tostring(code) , 2)
            else
                 TriggerClientEvent('notification', source, 'A cism out of the safe:'.. '' ..tostring(math.floor((code[1] % 360) / 3.60))..'-'..tostring(math.floor((code[2] % 360) / 3.60))..'-'..tostring(math.floor((code[3] % 360) / 3.60))..'-'..tostring(math.floor((code[4] % 360) / 3.60)).."-"..tostring(math.floor((code[5] % 360) / 3.60) , 2))
            end
        --end
    end
end)
ESX.RegisterUsableItem('safebypass', function(register, isDone)
    local src   = source
    local Player = ESX.GetPlayerFromId(src)
    if isDone then
        if math.random(1, 100) <= 17 then
            local code = SafeCodes[Config.Registers[register].safeKey]
            local info = {}
            if Config.Safes[Config.Registers[register].safeKey].type == "keypad" then
       
              TriggerClientEvent('notification', source, 'Code register:'..tostring(code) , 2)
              
            else
                TriggerClientEvent('notification', source, 'Code register:'..tostring(math.floor((code[1] % 360) / 3.60))..'-'..tostring(math.floor((code[2] % 360) / 3.60))..'-'..tostring(math.floor((code[3] % 360) / 3.60))..'-'..tostring(math.floor((code[4] % 360) / 3.60)).."-"..tostring(math.floor((code[5] % 360) / 3.60) , 2))
            end
        end
    end
end)

ESX.RegisterUsableItem('cashregbypass', function(source)
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

RegisterServerEvent('qb-storerobbery:server:setRegisterStatus')
AddEventHandler('qb-storerobbery:server:setRegisterStatus', function(register)
    TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, register, true)

    TriggerEvent('InteractSound_SV:PlayOnAll','demo',0.5)

    TriggerEvent('isPriority')


    Citizen.Wait(5000)


    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..Config.Registers[register].storename..' Postal Code '..Config.Registers[register].postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })


    Config.Registers[register].robbed   = true
    Config.Registers[register].time     = Config.resetTime
end)

RegisterServerEvent('qb-storerobbery:server:setSafeStatus')
AddEventHandler('qb-storerobbery:server:setSafeStatus', function(safe)
    TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, true)
    Config.Safes[safe].robbed = true

    TriggerEvent('InteractSound_SV:PlayOnAll','demo',0.5)

    TriggerEvent('isPriority')


    Citizen.Wait(5000)


    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at Vault openned  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })



    SetTimeout(math.random(40, 80) * (60 * 1000), function()
        TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, false)
        TriggerClientEvent('SafeCracker:EndMinigameanim')
        Config.Safes[safe].robbed = false
    end)
end)

RegisterServerEvent('qb-storerobbery:server:SafeReward')
AddEventHandler('qb-storerobbery:server:SafeReward', function(safe)
    local src   = source
    local Player = ESX.GetPlayerFromId(src)
    local cakam2 = math.random(1000, 3000)
  

    Player.addAccountMoney('black_money', cakam2)
    TriggerClientEvent('SafeCracker:EndMinigameanim', src)
    TriggerClientEvent('notification', source, cakam2.. ' Dirty Money' , 3)
    local luck = math.random(1, 100)
    local odd = math.random(1, 100)
    if luck <= 10 then
        Player.addInventoryItem('rolex', math.random(3, 7))
        if luck == odd then
            Citizen.Wait(500)
            Player.addInventoryItem('gold', math.random(3, 7))
        end
    end
end)



RegisterServerEvent('retro_scripts:callcopsnew')
AddEventHandler('retro_scripts:callcopsnew', function(safe, currentRegister, streetLabel, pos, storename, postal)
  
    print(pos)

    TriggerEvent('InteractSound_SV:PlayOnAll','demo',0.5)

    TriggerEvent('isPriority')


    Citizen.Wait(5000)


    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..storename..' Postal Code '..postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })

    --[[
Citizen.Wait(5000)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..storename..' Postal Code '..postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })

    Citizen.Wait(5000)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..storename..' Postal Code '..postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })

    Citizen.Wait(5000)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..storename..' Postal Code '..postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })

    Citizen.Wait(5000)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..storename..' Postal Code '..postal..'  ^3EMS AND MECHANIC STANDBY!  </div>',
        args = { fal, msg }
    })

    Citizen.Wait(5000)
    ]]---
    
end)


RegisterServerEvent('qb-storerobbery:server:callCops')
AddEventHandler('qb-storerobbery:server:callCops', function(type, safe, streetLabel, coords)
    print('Calling Cops')
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[safe].camId
    else
        cameraId = Config.Registers[safe].camId
    end
    local alertData = {
        title = "Shop robbery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Someone is trying to rob a store at "..streetLabel.." (CAMERA ID: "..cameraId..")"
    }
    TriggerClientEvent("qb-storerobbery:client:robberyCall", -1, type, safe, streetLabel, coords)
end)

RegisterServerEvent('qb-storerobbery:server:cakamsizlere')
AddEventHandler('qb-storerobbery:server:cakamsizlere', function()
    local player = ESX.GetPlayerFromId(source)
    player.removeInventoryItem('safebypass', 1)
    TriggerClientEvent('notification', source, 'Safe Bypass was broken ' , 1)
end)


Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.Registers) do
            if Config.Registers[k].time > 0 and (Config.Registers[k].time - Config.tickInterval) >= 0 then
                Config.Registers[k].time = Config.Registers[k].time - Config.tickInterval
            else
                Config.Registers[k].time = 0
                Config.Registers[k].robbed = false
                TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, k, false)
            end
        end
        Citizen.Wait(Config.tickInterval)
    end
end)

ESX.RegisterServerCallback('qb-storerobbery:server:isCombinationRight', function(source, cb, safe)
    cb(SafeCodes[safe])
end)

ESX.RegisterServerCallback('qb-storerobbery:server:getPadlockCombination', function(source, cb, safe)
    cb(SafeCodes[safe])
end)

ESX.RegisterServerCallback('qb-storerobbery:server:getRegisterStatus', function(source, cb)
    cb(Config.Registers)
end)

ESX.RegisterServerCallback('qb-storerobbery:server:getSafeStatus', function(source, cb)
    cb(Config.Safes)
end)