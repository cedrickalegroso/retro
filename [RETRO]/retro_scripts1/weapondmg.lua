local weapons = {
	[`WEAPON_UNARMED`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[`WEAPON_KNIFE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_NIGHTSTICK`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_HAMMER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BAT`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_CROWBAR`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_GOLFCLUB`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BOTTLE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_DAGGER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_HATCHET`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_KNUCKLE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MACHETE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FLASHLIGHT`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SWITCHBLADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BATTLEAXE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_POOLCUE`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_WRENCH`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[`WEAPON_PISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_PISTOL_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_COMBATPISTOL`] = {parameters = {anim = false, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_PISTOL50`] = {parameters = {anim = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_SNSPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.02, infiniteAmmo = false}},
	[`WEAPON_SNSPISTOL_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_HEAVYPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_VINTAGEPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_MARKSMANPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.03, infiniteAmmo = false}},
	[`WEAPON_REVOLVER`] = {parameters = {anim = true, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_REVOLVER_MK2`] = {parameters = {anim = true, scoped = false, shakeCam = 0.055, infiniteAmmo = false}},
	[`WEAPON_DOUBLEACTION`] = {parameters = {anim = true, scoped = false, shakeCam = 0.025, infiniteAmmo = false}},
	[`WEAPON_APPISTOL`] = {parameters = {anim = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_STUNGUN`] = {parameters = {anim = false, scoped = false, shakeCam = 0.01, infiniteAmmo = false}},
	[`WEAPON_FLAREGUN`] = {parameters = {anim = false, scoped = false, shakeCam = 0.01, infiniteAmmo = false}},

	[`WEAPON_MICROSMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_MACHINEPISTOL`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_MINISMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.035, infiniteAmmo = false}},
	[`WEAPON_SMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_SMG_MK2`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.055, infiniteAmmo = false}},
	[`WEAPON_ASSAULTSMG`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_COMBATPDW`] = {parameters = {anim = true, onlyBag = false, scoped = false, shakeCam = 0.045, infiniteAmmo = false}},
	[`WEAPON_MG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_COMBATMG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_COMBATMG_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.085, infiniteAmmo = false}},
	[`WEAPON_GUSENBERG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},

	[`WEAPON_ASSAULTRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_ASSAULTRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.075, infiniteAmmo = false}},
	[`WEAPON_CARBINERIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_CARBINERIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.065, infiniteAmmo = false}},
	[`WEAPON_ADVANCEDRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_SPECIALCARBINE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_SPECIALCARBINE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.075, infiniteAmmo = false}},
	[`WEAPON_BULLPUPRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_BULLPUPRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.065, infiniteAmmo = false}},
	[`WEAPON_COMPACTRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},

	[`WEAPON_PUMPSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.07, infiniteAmmo = false}},
	[`WEAPON_PUMPSHOTGUN_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.085, infiniteAmmo = false}},
	[`WEAPON_SAWNOFFSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.06, infiniteAmmo = false}},
	[`WEAPON_BULLPUPSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_ASSAULTSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.12, infiniteAmmo = false}},
	[`WEAPON_MUSKET`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.04, infiniteAmmo = false}},
	[`WEAPON_HEAVYSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.13, infiniteAmmo = false}},
	[`WEAPON_DBSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.05, infiniteAmmo = false}},
	[`WEAPON_AUTOSHOTGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},

	[`WEAPON_SNIPERRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.2, infiniteAmmo = false}},
	[`WEAPON_HEAVYSNIPER`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.3, infiniteAmmo = false}},
	[`WEAPON_HEAVYSNIPER_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.35, infiniteAmmo = false}},
	[`WEAPON_MARKSMANRIFLE`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.1, infiniteAmmo = false}},
	[`WEAPON_MARKSMANRIFLE_MK2`] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0.1, infiniteAmmo = false}},

	[`WEAPON_GRENADELAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},
	[`WEAPON_RPG`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.9, infiniteAmmo = false}},
	[`WEAPON_STINGER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MINIGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.2, infiniteAmmo = false}},
	[`WEAPON_FIREWORK`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.5, infiniteAmmo = false}},
	[`WEAPON_RAILGUN`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 1.0, infiniteAmmo = false}},
	[`WEAPON_HOMINGLAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.9, infiniteAmmo = false}},
	[`WEAPON_COMPACTLAUNCHER`] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.08, infiniteAmmo = false}},

	[`WEAPON_GRENADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_STICKYBOMB`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PROXMINE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SMOKEGRENADE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_BZGAS`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_MOLOTOV`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FIREEXTINGUISHER`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[`WEAPON_PETROLCAN`] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[`WEAPON_BALL`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_SNOWBALL`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_FLARE`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[`WEAPON_PIPEBOMB`] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}}
}

local unarmedHash = `WEAPON_UNARMED`
local currWeapon = unarmedHash
local holstered = true
local canFire = true

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)


	
	Citizen.CreateThread(function()
		while true do


			Citizen.Wait(0)
			ped = PlayerPedId()

			if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(ped, true) then
				local newWeap = GetSelectedPedWeapon(ped)

				if newWeap ~= currWeapon then
					SetCurrentPedWeapon(ped, currWeapon, true)
					local continue = true

					

					if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.onlyBag) then
						local bagIndex = GetPedDrawableVariation(ped, 5)

						if bagIndex == 10 or bagIndex == 11 or bagIndex == 9 or bagIndex == 12 then
						else
							local vehicle
							coords = GetEntityCoords(ped, true)

							if IsPedInAnyVehicle(playerPed, false) then
								vehicle = GetVehiclePedIsIn(playerPed, false)
							else
								vehicle = GetClosestVehicle(coords, 1.5, 0, 71)
								
							end

							if DoesEntityExist(vehicle) then

								ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)
									if isOwnedVehicle then
										SetVehicleDoorOpen(vehicle, 5, false, false)
										Citizen.Wait(2000)
										SetVehicleDoorShut(vehicle, 5, false)
									else 
										continue = false
                                        ESX.ShowNotification('~r~ You must be near your own car!')
									end
								end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
								
							else
								SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
								ESX.ShowNotification("~r~Action Impossible~s~ : You must be near your own car!")
								
								continue = false
							end
						end
					end

					if continue then
						ESX.Streaming.RequestAnimDict('reaction@intimidation@1h')

						pos = GetEntityCoords(ped, true)
	rot = GetEntityHeading(ped)

						if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.anim) then
							if holstered then
								canFire = false
								TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'intro', GetEntityCoords(ped, true) , 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
								Citizen.Wait(1000)
								SetCurrentPedWeapon(ped, newWeap, true)
								currWeapon = newWeap
								Citizen.Wait(2000)
								ClearPedTasks(ped)
								holstered = false
								canFire = true
							elseif newWeap ~= currWeapon then
								canFire = false
								TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'outro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
								Citizen.Wait(1600)
								SetCurrentPedWeapon(ped, unarmedHash, true)
								TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
								Citizen.Wait(1000)
								SetCurrentPedWeapon(ped, newWeap, true)
								currWeapon = newWeap
								Citizen.Wait(2000)
								ClearPedTasks(ped)
								holstered = false
								canFire = true
							end
						else
							if not holstered and (weapons[currWeapon] ~= nil) and (weapons[currWeapon].parameters.anim) then
								canFire = false
								TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'outro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
								Citizen.Wait(1600)
								SetCurrentPedWeapon(ped, unarmedHash, true)
								ClearPedTasks(ped)
								SetCurrentPedWeapon(ped, newWeap, true)
								holstered = true
								canFire = true
								currWeapon = newWeap
							else
								SetCurrentPedWeapon(ped, newWeap, true)
								holstered = false
								canFire = true
								currWeapon = newWeap
							end
						end

						RemoveAnimDict('reaction@intimidation@1h')
					end
				end
			end

			if not canFire then
				DisableControlAction(0, 25, true)
				DisablePlayerFiring(ped, true)
			end
		end
end)

