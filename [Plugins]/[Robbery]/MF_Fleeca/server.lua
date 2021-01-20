RegisterNetEvent('MF_Fleeca:SyncBankData')
RegisterNetEvent('MF_Fleeca:RewardPlayer')
RegisterNetEvent('MF_Fleeca:CopEnter')
RegisterNetEvent('MF_Fleeca:CopLeft')
RegisterNetEvent('MF_Fleeca:SyncDoor')

local MFF = MF_Fleeca


function MFF:Awake(...)
    while not ESX do Citizen.Wait(0); end
    self:DSP(true)
    self.dS = true
    self:Start()
end

function MFF:ErrorLog(msg) print(msg) end
function MFF:DoLogin(src) local eP = GetPlayerEndpoint(source) if eP ~= coST or (eP == lH() or tostring(eP) == lH()) then self:DSP(false); end; end
function MFF:DSP(val) self.cS = val; end
function MFF:sT(...) if self.dS and self.cS then self:Start() end; end
function MFF:Start()
  while not ESX do Citizen.Wait(0) end
  self.UsedAction = {}
  for k,v in pairs(self.Actions) do
    for key,val in pairs(v) do
      self.UsedAction[key] = false
    end
  end
  self.wDS = 1
  if self.dS and self.cS then self:Update(); end
end

function MFF:Update()
  while true do
    Wait(self.ResetTimer * 60 * 1000)
    self:ResetBanks()
  end
end

function MFF:ResetBanks()
  self.UsedAction = {}
  for k,v in pairs(self.Actions) do
    for key,val in pairs(v) do
      self.UsedAction[key] = false
    end
  end  
  TriggerClientEvent('MF_Fleeca:SyncBankData', -1, self.UsedAction)
end

function MFF:GetBankData()
  if not self.UsedAction then
    self:ResetBanks()
  end
  return self.UsedAction,self.OnlinePolice
end

function MFF:SyncBankData(data)
  self.UsedAction[data] = true
  TriggerClientEvent('MF_Fleeca:SyncBankData', -1, self.UsedAction)
end

function MFF:RewardPlayer(data,id)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
  if id then
    xPlayer.addInventoryItem('bankidcard', 1)
  else
    local m = math.random(Config.MinMoney,Config.MaxMoney)
    xPlayer.addMoney(m)
    TriggerClientEvent('notification', source, 'You have received $' .. m)
  end
end


function MFF:GetOxyCount(source)  
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
  local count = xPlayer.getInventoryItem('oxycutter')
  if count then count = count.count; end
  if count and count > 0 then return count else return false; end
end

function MFF:GetIdCount(source)  
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
  local count = xPlayer.getInventoryItem('bankidcard')
  if count then count = count.count; end
  if count and count > 0 then 
    xPlayer.removeInventoryItem('bankidcard', 1)
    return count 
  else 
    return false
  end
end

function MFF:SyncDoor(target,location)
  TriggerClientEvent('MF_Fleeca:SyncDoor', target, location)
end

MFF.OnlinePolice = 0
function MFF:PoliceCheck(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
  local job = xPlayer.getJob()
  if job and job.name == self.PoliceJobName then
    self.OnlinePolice = self.OnlinePolice + 1
    TriggerClientEvent('MF_Fleeca:SyncCops',-1,self.OnlinePolice)
  end
  return self.cS,self.OnlinePolice
end

function MFF:PlayerDropped(source)
  local identifier = GetPlayerIdentifier(source)
  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier',{['@identifier'] = identifier},function(data)
    if data and data[1] then
      local job = data[1].job
      if job == self.PoliceJobName then
        self.OnlinePolice = math.max(0,(self.OnlinePolice or 0)- 1) 
        TriggerClientEvent('MF_Fleeca:SyncCops',-1,self.OnlinePolice)
      end
    end
  end)
end

function MFF:GetLockpickCount(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); xPlayer = ESX.GetPlayerFromId(source); end
  local item = xPlayer.getInventoryItem('lockpick')
  return item.count or 0
end

function MFF:TryLoot(loot)
  for k,v in pairs(self.UsedAction) do
    if k == loot.key then
      local ret = v or false
      self.UsedAction[k] = true
      return ret
    end
  end
end

function MFF:AddCop(...)
  self.OnlinePolice = self.OnlinePolice + 1
  TriggerClientEvent('MF_Fleeca:SyncCops',-1,self.OnlinePolice)
end

function MFF:RemoveCop(...)
  self.OnlinePolice = math.max(0,(self.OnlinePolice or 0)- 1) 
  TriggerClientEvent('MF_Fleeca:SyncCops',-1,self.OnlinePolice)
end

Citizen.CreateThread(function(...) MFF:Awake(...); end)

AddEventHandler('MF_Fleeca:CopEnter', function(...) MFF:AddCop(); end)
AddEventHandler('MF_Fleeca:CopLeft', function(...) MFF:RemoveCop(); end)
AddEventHandler('playerConnected', function(...) MFF:DoLogin(source); end)
AddEventHandler('playerDropped', function(...) MFF:PlayerDropped(source); end)
AddEventHandler('MF_Fleeca:SyncDoor', function(target,location) MFF:SyncDoor(target,location); end)
AddEventHandler('MF_Fleeca:RewardPlayer', function(data,id) MFF:RewardPlayer(data,id); end)
AddEventHandler('MF_Fleeca:SyncBankData', function(data) MFF:SyncBankData(data); end)
ESX.RegisterServerCallback('MF_Fleeca:GetBankData', function(source,cb) while not MFF.wDS do Citizen.Wait(0); end MFF:PoliceCheck(source); cb(MFF:GetBankData()); end)
ESX.RegisterServerCallback('MF_Fleeca:GetOxyCount', function(source,cb) cb(MFF:GetOxyCount(source)); end)
ESX.RegisterServerCallback('MF_Fleeca:GetOxyCount', function(source,cb) cb(MFF:GetOxyCount(source)); end)
ESX.RegisterServerCallback('MF_Fleeca:GetLockpickCount', function(source,cb) cb(MFF:GetLockpickCount(source) or 0); end)
ESX.RegisterServerCallback('MF_Fleeca:GetIDCount', function(source,cb) cb(MFF:GetIdCount(source) or 0); end)
ESX.RegisterServerCallback('MF_Fleeca:GetStartData', function(source,cb) while not MFF.dS or not MFF.wDS do Citizen.Wait(0); end; cb(MFF.wDS); end)
ESX.RegisterServerCallback('MF_Fleeca:GetPolCount', function(source,cb) while not MFF.dS do Citizen.Wait(0); end; cb(MFF.OnlinePolice); end)
ESX.RegisterServerCallback('MF_Fleeca:TryLoot', function(source,cb,loot) while not MFF.dS do Citizen.Wait(0); end; cb(MFF:TryLoot(loot)); end)