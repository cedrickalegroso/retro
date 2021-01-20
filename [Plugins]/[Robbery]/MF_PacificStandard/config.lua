
MF_PacificStandard = {}
local MFP = MF_PacificStandard

MFP.Version = '1.0.0'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFP.CooldownTimer = 30
MFP.BankLocation = vector3(246.78,218.70,106.30)
MFP.LoadDist = 50.0
MFP.InteractDist = 2.0
MFP.AudioBankName = "MF_Pacific"
MFP.InteractTimer = 10 -- seconds
MFP.MinPoliceCount = 6
MFP.PoliceJobName = "police"

MFP.Actions = {
  ["LockpickA"]  = vector3(256.79,220.01,106.50),
  ["Hack"]       = vector3(261.97,223.16,106.50),
  ["Identify"]   = vector3(253.21,228.43,101.80),
  ["LockpickB"]  = vector3(252.47,221.02,101.80),
  ["LockpickC"]  = vector3(261.12,215.22,101.80),

  ["LootA"]      = vector3(259.63,218.06,102.10),
  ["LootB"]      = vector3(258.32,214.19,102.10),

  ["LootC"]      = vector3(262.32,212.65,102.10),
  ["LootD"]      = vector3(264.17,211.98,102.10),

  ["LootE"]      = vector3(265.75,212.79,102.10),
  ["LootF"]      = vector3(266.36,214.27,102.10),

  ["LootG"]      = vector3(265.77,215.83,102.10),
  ["LootH"]      = vector3(263.92,216.48,102.10),

  ["LootCash"]   = vector3(264.24,213.72,102.50),

}

MFP.ActionText = {
  ["LockpickA"] = "[E] - Lockpick",
  ["LockpickB"] = "[E] - Lockpick",
  ["LockpickC"] = "[E] - Lockpick",
  ["Hack"] = "[E] - Hack",
  ["Identify"] = "[E] - Attempt to gain access",
  ["Safe"] = "[E] - attempt to crack the safe",
  ["LootA"] = "[E] - Cut open the lock",
  ["LootB"] = "[E] - Cut open the lock",
  ["LootC"] = "[E] - Cut open the lock",
  ["LootD"] = "[E] - Cut open the lock",
  ["LootE"] = "[E] - Cut open the lock",
  ["LootF"] = "[E] - Cut open the lock",
  ["LootG"] = "[E] - Cut open the lock",
  ["LootH"] = "[E] - Cut open the lock",
  ["LootCash"] = "[E] - Loot",
}
