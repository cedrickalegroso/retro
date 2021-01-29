


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetPedDensityMultiplierThisFrame(0.1) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.1) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.3)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.1) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

		-- fix OneSync NPC by Albert0
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.3)
            else
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.3)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.2)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
	end
end)




--[[

CreateThread(function()
    --LAZY LOADING
    local GetRoomKeyFromEntity = GetRoomKeyFromEntity
    local PlayerPedId = PlayerPedId
    local SetPlayerCanUseCover = SetPlayerCanUseCover
    local PlayerId = PlayerId

    while true do
        if GetRoomKeyFromEntity(PlayerPedId()) ~= 0 then
            SetPlayerCanUseCover(PlayerId(), false) -- Disable cover when ped are inside an interior
        else
            SetPlayerCanUseCover(PlayerId(), true) -- Enable cover when ped are outside an interior.
        end
        Wait(2000) -- 2 seconds is a fine delay for preserve user/pc performance.
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.1) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(0.3) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.3) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.3) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.1) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)

]]--
