-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

RegisterNetEvent('MF_PacificStandard:RefreshBank')
RegisterNetEvent('MF_PacificStandard:OpenDoor')
RegisterNetEvent('SafeCracker:EndMinigame')
RegisterNetEvent('MF_LockPicking:MinigameComplete')
RegisterNetEvent('MF_PacificStandard:SetCops')

local MFP = MF_PacificStandard

MFP.PoliceOnline = 0
function MFP:Start(...)
    self.PlayerData = ESX.GetPlayerData()
    self.SoundID    = GetSoundId() 
    self.DoorCount  = 0
    if not RequestAmbientAudioBank(self.AudioBank, false) then RequestAmbientAudioBank(self.AudioBankName, false); end
    ESX.TriggerServerCallback('MF_PacificStandard:GetStartData', function(cS,bankData,cops) 
        self.BankData = bankData
        self.PoliceOnline = cops
        for k,v in pairs(self.BankData.DoorLocs) do 
            if v then 
                self.DoorCount = math.min(self.DoorCount + 1,7)
            end
        end
        if cS then self.cS = cS; self.dS = cS; self:Update(); end
    end)
end

function MFP:SpawnSafe()
  self.SafeObject = true
  local newPos = vector3(264.19,207.45,109.59)
  TriggerEvent('SafeCracker:SpawnSafe', false, newPos, 247.0, function(safeObj) self.SafeObject = safeObj; end)
end

function MFP:SpawnCash()
    local pos = vector3(264.24,213.72,101.52)
    local hk = GetHashKey('bkr_prop_bkr_cashpile_04')
    while not HasModelLoaded(hk) do RequestModel(hk); Citizen.Wait(0) end
    self.CashObject = CreateObject(hk, pos.x, pos.y, pos.z, false, false, false)
    SetEntityHeading(self.CashObject, 290.0)
    FreezeEntityPosition(self.CashObject,true)
    SetModelAsNoLongerNeeded(hk)
end

function MFP:Update()
    local tick = 0
    local timer = GetGameTimer()
    local lastKey = GetGameTimer()
    while true do
        Citizen.Wait(0)     
        tick = tick + 1
        local plyPed = GetPlayerPed(-1)
        local plyPos = GetEntityCoords(plyPed)
        local dist = Utils:GetVecDist(plyPos, self.BankLocation)

        if dist < self.LoadDist then
            if not self.BankData or (not self.BankData.DoorLocs or self.DoorCount <= 0) then
                ESX.TriggerServerCallback('MF_PacificStandard:GetBankData', function(bankData) self.BankData = bankData; end)
            end

            if self.BankData and self.BankData.DoorLocs then
                if not self.ZoneLoaded then
                    if not self.CashObject then self:SpawnCash(); end
                    if not self.SafeObject then self:SpawnSafe(); end
                    local allObjs = ESX.Game.GetObjects()
                    local didLock = 0
                    for k,v in pairs(allObjs) do
                        local objPos = GetEntityCoords(v)
                        local closest,closestDist
                        for key,val in pairs(self.BankData.DoorLocs) do
                            local dist = Utils:GetVecDist(objPos,key)
                            if not closestDist or dist < closestDist then
                                closest = k
                                closestDist = dist
                            end
                        end

                        if closestDist < 5.0 then
                            local hKey = GetEntityModel(v)
                            local rKey = hKey % 0x100000000
                            local found = false
                            for key,val in pairs(self.BankData.DoorModels) do
                                if hKey == val or rKey == val then
                                    found = true
                                    locked = self.BankData.DoorLocs[key]
                                end
                            end

                            if found and locked then
                                FreezeEntityPosition(v,true)
                                didLock = didLock + 1
                            else
                            end                          
                        end
                    end  

                    if self.DoorCount >= 0 and didLock >= self.DoorCount then 
                        print("MF_PacificStandard : Locked All Doors")
                        self.ZoneLoaded = true
                    else
                        Citizen.Wait(0)
                    end
                end
            end

            local closestKey,closestVal,closestDis,closestText
            for k,v in pairs(self.Actions) do
                local dist = Utils:GetVecDist(v,plyPos)
                if not closestDis or dist < closestDis then
                    closestKey = k
                    closestVal = v
                    closestDis = dist
                    closestText = self.ActionText[k]
                end
            end

            if self.BankData and closestDis and closestDis < self.InteractDist and not self.DoingAction and self.PoliceOnline and self.PoliceOnline >= self.MinPoliceCount then
                if self.BankData.DoorLocs[closestVal] or self.BankData.LootLocs[closestVal] then
                    Utils:DrawText3D(closestVal.x,closestVal.y,closestVal.z, closestText)

                    if Utils:GetKeyPressed("E") and (GetGameTimer() - lastKey) > 150 then
                        lastKey = GetGameTimer()
                        if not self.DoingAction then
                            self.DoingAction = closestVal
                            self:DoAction(closestKey)
                        end
                    end                  
                end
            end
        else
            if self.ZoneLoaded then 
                self.ZoneLoaded = false 
                if self.SafeObject then
                    for k,v in pairs(self.SafeObject) do DeleteObject(v); end
                    self.SafeObject = false
                end
            end
        end
    end
end

function MFP:DoAction(act)
    local doWait = false
    if act == "Hack" then
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start",7,35,self.HackingCb)
        FreezeEntityPosition(GetPlayerPed(-1),true)
    elseif act == "LockpickA" or act == "LockpickB" or act == "LockpickC" then
        doWait = true
        ESX.TriggerServerCallback('MF_PacificStandard:GetLockpickCount', function(count)
            if count and count > 0 then
                MFP:NotifyPolice()
                TriggerEvent('MF_LockPicking:StartMinigame')
            else
                TriggerEvent('notification',"You don't have any lockpicks." , 2)
                self.DoingAction = false
            end
            doWait = false
        end)
    elseif act == "Identify" then
        self:HandleVaultDoor(self.DoingAction)
    elseif act == "LootA" or act == "LootB" or act == "LootC" or act == "LootD" or act == "LootE" or act == "LootF" or act == "LootG" or act == "LootH" then
        doWait = true
        ESX.TriggerServerCallback('MF_PacificStandard:GetOxyCount', function(count)
            if count and count > 0 then
                self:HandleLooting(act)
            else
                TriggerEvent('notification',"You need a plasma torch to cut this open.", 2)
                self.DoingAction = false
            end
            doWait = false
        end)
    elseif act == "LootCash" then
        self:HandleLootCash()
    end

    if doWait then while doWait do Citizen.Wait(0); end; end

end

function MFP:HandleLootCash()
    ESX.TriggerServerCallback('MF_PacificStandard:TryLootCash',function(canLoot)
        if canLoot then  
            local plyPed = GetPlayerPed(-1)
            TaskTurnPedToFaceCoord(plyPed, self.DoingAction.x, self.DoingAction.y, self.DoingAction.z, -1)

            ESX.Streaming.RequestAnimDict('mp_take_money_mg', function(...)
                TaskPlayAnim( plyPed, "mp_take_money_mg", "stand_cash_in_bag_loop", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )     
            end)
            exports["taskbar"]:taskBar(self.InteractTimer * 1000, "Looting Cash")
            ClearPedTasksImmediately(plyPed)
            Wait(1000)
        else
            TriggerEvent('notification',"Somebody else is already looting this." , 2)
        end
        self.DoingAction = false
    end)
end

function MFP:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self:Start()
end

function MFP:HandleLooting(act)
    ESX.TriggerServerCallback('MF_PacificStandard:GetCutterCount', function(count)
        if count then
            ESX.TriggerServerCallback('MF_PacificStandard:TryLoot',function(canLoot) 
                if canLoot then
                    local plyPed = GetPlayerPed(-1)

                    TaskTurnPedToFaceCoord(plyPed, self.DoingAction.x, self.DoingAction.y, self.DoingAction.z, -1)
                    FreezeEntityPosition(plyPed,true)
                    TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
                    exports["taskbar"]:taskBar(self.InteractTimer * 1000, "Cutting")

                    ClearPedTasksImmediately(plyPed)
                    FreezeEntityPosition(plyPed,false)
                    TriggerServerEvent('MF_PacificStandard:RewardPlayer', act)
                else
                    TriggerEvent('notification',"Somebody else is already looting this.", 2)
                end
                self.DoingAction = false
            end,self.DoingAction)
        else
            self.DoingAction = false
            TriggerEvent('notification',"You don't have any plasma cutters.", 2)
        end
    end)
end

function MFP:HandleVaultDoor(closest)
  ESX.TriggerServerCallback('MF_PacificStandard:GetIDCount', function(count)
    if count and count > 0 then
      local plyPed = GetPlayerPed(-1)
      TaskTurnPedToFaceCoord(plyPed, closest.x, closest.y, closest.z, -1)

      FreezeEntityPosition(plyPed,true)
      TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_ATM", 0, true)
      exports["taskbar"]:taskBar(self.InteractTimer * 1000, "Requesting Access")

      TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_ATM", 0, false)
      Wait(1500)

      ClearPedTasksImmediately(plyPed)
      FreezeEntityPosition(plyPed,false)
      Wait(100)
      TriggerServerEvent('MF_PacificStandard:OpenDoor', self.DoingAction)
    else
      TriggerEvent('notification',"You havn't got a bank ID card.", 2)
    end
    self.DoingAction = false
  end)
end

function MFP.HackingCb(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
    if success then
        TriggerServerEvent('MF_PacificStandard:OpenDoor', MFP.DoingAction)
    end
    MFP.DoingAction = false;
end

function MFP:OpenDoor(doorloc,doorhash)
    if self.ZoneLoaded then
        Citizen.CreateThread(function(...) 
            local allObjs = ESX.Game.GetObjects()

            local closestObj,closestDist
            for k,v in pairs(allObjs) do
                local hKey = GetEntityModel(v)
                local rKey = hKey % 0x100000000
                if hKey == doorhash or rKey == doorhash then
                    local dist = Utils:GetVecDist(doorloc, GetEntityCoords(v))
                    if not closestDist or dist < closestDist then
                        closestObj = v
                        closestDist = dist
                    end
                end
            end

            if closestDist and closestDist < self.LoadDist then
                local tick = 0
                local modifier = 0.3
                if doorhash == 961976194 then modifier = -0.3; end
                while tick < 350 do
                    Citizen.Wait(5)
                    tick = tick + 1
                    local entHeading = GetEntityHeading(closestObj)
                    SetEntityHeading(closestObj, entHeading + modifier)
                end
            end
        end)
    end        
end

function MFP:FinishLockpick(result)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    if result then
        TriggerServerEvent('MF_PacificStandard:OpenDoor', self.DoingAction)
    end
    self.DoingAction = false;
end

function MFP:NotifyPolice()
    local streetLabel = GetStreetNameFromHashKey(GetStreetNameAtCoord(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z))
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('policealerts:server:AddPoliceAlert', {
      timeOut = 10000,
      alertTitle = "Bank Robbery In Progress.",
      coords = {
          x = coords.x,
          y = coords.y,
          z = coords.z,
      },
      details = {
        [1] = {
          icon = '<i class="fas fa-university"></i>',
          detail = 'Pacific Bank',
        },
        [2] = {
              icon = '<i class="fas fa-globe-europe"></i>',
              detail = streetLabel,
        },
      },
      callSign = "10-31",
  })
  end


function MFP.SetJob(source,job)
  local self = MFP
  local lastData = self.PlayerData
  if lastData.job.name == self.PoliceJobName then
    TriggerServerEvent('MF_PacificStandard:CopLeft')
  elseif lastData.job.name ~= self.PoliceJobName and job.name == self.PoliceJobName then
    TriggerServerEvent('MF_PacificStandard:CopEnter')
  end
  self.PlayerData = ESX.GetPlayerData()
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) MFP.SetJob(source,job); end)

AddEventHandler('MF_PacificStandard:RefreshBank', function(bankData) MFP.BankData = bankData; end)
AddEventHandler('MF_PacificStandard:OpenDoor', function(doorloc,doorhash) MFP:OpenDoor(doorloc,doorhash); end)
AddEventHandler('MF_PacificStandard:SetCops', function(val) MFP.PoliceOnline = val; end)
AddEventHandler('SafeCracker:EndMinigame', function(won) MFP:FinishLockpick(won); end)
AddEventHandler('MF_LockPicking:MinigameComplete', function(result) MFP:FinishLockpick(result); end)
AddEventHandler('MF_LockPicking:MinigameComplete', function(result) MFP:FinishLockpick(result); end)

Citizen.CreateThread(function(...) MFP:Awake(...); end)