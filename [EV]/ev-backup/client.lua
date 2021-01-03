local backupUnits = {
 [1] = {vehicle = 'pol3', spawn = {x = 452.361, y = -1015.064, z = 28.464, h = 88.994}, pedid = 1, ped = 's_m_y_cop_01', giveWeapons = true, responceSpeed = 55.0},
 [2] = {vehicle = 'pol9', spawn = {x = 452.361, y = -1015.064, z = 28.464, h = 88.994}, pedid = 3, ped = 's_m_y_cop_01', giveWeapons = true, responceSpeed = 58.0},
 [3] = {vehicle = 'pol3', spawn = {x = 452.361, y = -1015.064, z = 28.464, h = 88.994}, pedid = 5, ped = 's_m_y_cop_01', giveWeapons = true, responceSpeed = 45.0},
 [4] = {vehicle = 'ambulance22', spawn = {x = 328.434, y = -548.366, z = 28.744, h = 270.711}, pedid = 7, ped = 's_m_m_paramedic_01', giveWeapons = false, responceSpeed = 32.0},
 [5] = {vehicle = 'rambulance', spawn = {x = 328.434, y = -548.366, z = 28.744, h = 270.711}, pedid = 9, ped = 's_m_m_paramedic_01', giveWeapons = false, responceSpeed = 32.0},
}


RegisterCommand("backup", function(source, args, rawCommand)
 local ped = PlayerPedId()
 local pos = GetEntityCoords(ped, true)
 local backupUnitVehicle = {} 
 local backupUnitPeds = {}


 for id, v in pairs(backupUnits) do 
  backupUnitVehicle[id] = CreateVehicle(GetHashKey(v.vehicle), v.spawn.x, v.spawn.y, v.spawn.z, v.spawn.h, true, false)
  backupUnitPeds[v.pedid] = CreatePedInsideVehicle(backupUnitVehicle[id], 6, GetHashKey(v.ped), -1, true, false)
  backupUnitPeds[v.pedid+1] = CreatePedInsideVehicle(backupUnitVehicle[id], 4, GetHashKey(v.ped), 0, true, false)
  
  if v.giveWeapons then 
   GiveWeaponToPed(backupUnitPeds[v.pedid], GetHashKey('WEAPON_COMBATPISTOL'), 5000, false, true)
   GiveWeaponToPed(backupUnitPeds[v.pedid+1], GetHashKey('WEAPON_COMBATPISTOL'), 5000, false, true)
  end
  
  SetVehicleEngineOn(backupUnitVehicle[id], true, true)
  SetVehicleLivery(backupUnitVehicle[id], 3)
  SetVehicleSiren(backupUnitVehicle[id], true)

  SetDriveTaskDrivingStyle(backupUnitPeds[v.pedid], 1074528293)
  SetDriverAbility(backupUnitPeds[v.pedid], 1.0)

  local backupUnit = AddBlipForEntity(backupUnitVehicle[id])
  SetBlipSprite(backupUnit, 56)
  SetBlipColour(backupUnit, 7)

  TaskVehicleDriveToCoordLongrange(backupUnitPeds[v.pedid], backupUnitVehicle[id], pos.x, pos.y, pos.z, v.responceSpeed, 262463, 15.0)
  Wait(1000)
 end
end)



RegisterCommand("chase", function(source, args, rawCommand)
 local ped = PlayerPedId()
 local pos = GetEntityCoords(ped, true)
 local backupUnitVehicle = {} 
 local backupUnitPeds = {}

 backupUnitVehicle[1] = CreateVehicle(GetHashKey(backupUnits[1].vehicle), backupUnits[2].spawn.x, backupUnits[2].spawn.y, backupUnits[2].spawn.z, backupUnits[2].spawn.h, true, false)
 backupUnitPeds[backupUnits[2].pedid] = CreatePedInsideVehicle(backupUnitVehicle[1], 6, GetHashKey(backupUnits[2].ped), -1, true, false)
 backupUnitPeds[backupUnits[2].pedid+1] = CreatePedInsideVehicle(backupUnitVehicle[1], 4, GetHashKey(backupUnits[2].ped), 0, true, false)
  
 SetVehicleEngineOn(backupUnitVehicle[1], true, true)
 SetVehicleLivery(backupUnitVehicle[1], 3)
 SetVehicleSiren(backupUnitVehicle[1], true)

 SetDriveTaskDrivingStyle(backupUnitPeds[backupUnits[2].pedid], 1074528293)
 SetDriverAbility(backupUnitPeds[backupUnits[2].pedid], 1.0)
 
 TaskVehicleChase(backupUnitPeds[backupUnits[2].pedid], ped)
end)