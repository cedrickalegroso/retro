--[[

        RRP_BODYBAG
        By: BTNGaming

        Github: https://github.com/btngaming

        FEEL FREE TO EDIT THE CODE FOR PERSONAL USE
        DO NOT SHARE AS OWN WORK
        DO NOT SELL THIS WORK

        -= PERSONAL USE ONLY =-

]]--

-- COMMAND NAME --

local command_name = "bodybag"


-- CODE --


ESX = nil

local PlayerData = {}

local bodyBag = nil

local attached = false

Citizen.CreateThread(function()
    if ConfigBODYBAG.use_esx then
        while ESX == nil do
            TriggerEvent('esx:getShRETROaredObjRETROect', function(obj)ESX = obj end)
            Citizen.Wait(0)
        end
        
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        
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

RegisterCommand(command_name, function(source, args, rawCommand)
    if ConfigBODYBAG.use_command then

        if ConfigBODYBAG.use_esx then

            -- ESX CODE --

            PlayerData = ESX.GetPlayerData()

            if ConfigBODYBAG.restrict_job then

                if PlayerData.job ~= nil and (PlayerData.job.name == ConfigBODYBAG.job_1 or PlayerData.job.name == ConfigBODYBAG.job_2) then

                    if args[1] and GetPlayerName(args[1])  ~= nil then
                        local targetPed = GetPlayerPed(args[1])

                        TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(targetPed))
                    else
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        local targetPed = GetPlayerPed(closestPlayer)

                        if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                            TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                        end
                    end
                end

            else

                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                local targetPed = GetPlayerPed(closestPlayer)

                if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                    TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                end
            end

        else

            -- STANDALONE CODE --

            if args[1] and GetPlayerName(args[1])  ~= nil then

                local targetPed = GetPlayerPed(args[1])

                TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(targetPed))

            else 

                local closestPlayer, closestPlayerDist = GetClosestPlayer()
                local targetPed = GetPlayerPed(closestPlayer)

                if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                    TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                end
            end
        end

    else
        print("Command Module Disabled")
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if ConfigBODYBAG.use_keybind then

            if IsControlJustReleased(0, ConfigBODYBAG.keybind) then

                if ConfigBODYBAG.use_esx then

                    -- ESX CODE --

                    PlayerData = ESX.GetPlayerData()

                    if ConfigBODYBAG.restrict_job then
                
                        if PlayerData.job ~= nil and (PlayerData.job.name == ConfigBODYBAG.job_1 or PlayerData.job.name == ConfigBODYBAG.job_2) then

                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local targetPed = GetPlayerPed(closestPlayer)

                            if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                                TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                            end
                        end

                    else

                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        local targetPed = GetPlayerPed(closestPlayer)

                        if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                            TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                        end
                    end

                else

                    -- STANDALONE CODE --

                    local closestPlayer, closestPlayerDist = GetClosestPlayer()
                    local targetPed = GetPlayerPed(closestPlayer)

                    if closestPlayer ~= -1 and closestDistance <= 3.0 and IsEntityDead(targetPed) then

                        TriggerServerEvent('RRP_BODYBAG:Trigger', GetPlayerServerId(closestPlayer))
                    end
                end
            end

        elseif not ConfigBODYBAG.use_command and not ConfigBODYBAG.use_keybind then
            
            PutInBodybag()

            Citizen.Wait(ConfigBODYBAG.freq_bag_on)
    
        else
            break
        end
    end
end)

function PutInBodybag()

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    deadCheck = IsEntityDead(playerPed)

    if deadCheck and not attached then
        SetEntityVisible(playerPed, false, false)
        
        RequestModel(ConfigBODYBAG.bag_model)

        while not HasModelLoaded(ConfigBODYBAG.bag_model) do
            Citizen.Wait(1)
        end

        bodyBag = CreateObject(ConfigBODYBAG.bag_hash, playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)

        AttachEntityToEntity(bodyBag, playerPed, 0, -0.2, 0.75, -0.2, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
        attached = true

    end
end

RegisterNetEvent('RRP_BODYBAG:PutInBag')
AddEventHandler('RRP_BODYBAG:PutInBag', PutInBodybag)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        
        deadCheck = IsEntityDead(playerPed)

        if not deadCheck and attached then

            DetachEntity(playerPed, true, false)
            SetEntityVisible(playerPed, true, true)

            SetEntityAsMissionEntity(bodyBag, false, false)
            SetEntityVisible(bodybag, false)
            SetModelAsNoLongerNeeded(bodyBag)
            
            DeleteObject(bodyBag)
            DeleteEntity(bodyBag)

            bodyBag = nil
            attached = false

        end

        Citizen.Wait(ConfigBODYBAG.freq_bag_off)

    end
end)