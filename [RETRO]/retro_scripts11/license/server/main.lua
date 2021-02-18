ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_licenseshop:loadLicenses', source, licenses)
	end)
end)

function LoadLicenses(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_licenseshop:loadLicenses', source, licenses)
	end)
end

RegisterServerEvent('esx_licenseshop:ServerLoadLicenses')
AddEventHandler('esx_licenseshop:ServerLoadLicenses', function()
	local _source = source
	LoadLicenses(_source)
end)

-- Buy Aircraft License
RegisterServerEvent('esx_licenseshop:buyLicenseAircraft')
AddEventHandler('esx_licenseshop:buyLicenseAircraft', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseAircraft then
		xPlayer.removeMoney(ConfigLi.LicenseAircraft)

		TriggerEvent('esx_license:addLicense', _source, 'aircraft', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Boating License
RegisterServerEvent('esx_licenseshop:buyLicenseBoating')
AddEventHandler('esx_licenseshop:buyLicenseBoating', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseBoating then
		xPlayer.removeMoney(ConfigLi.LicenseBoating)

		TriggerEvent('esx_license:addLicense', _source, 'boating', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Melee License
RegisterServerEvent('esx_licenseshop:buyLicenseMelee')
AddEventHandler('esx_licenseshop:buyLicenseMelee', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseMelee then
		xPlayer.removeMoney(ConfigLi.LicenseMelee)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_melee', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Handgun License
RegisterServerEvent('esx_licenseshop:buyLicenseHandgun')
AddEventHandler('esx_licenseshop:buyLicenseHandgun', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseHandgun then
		xPlayer.removeMoney(ConfigLi.LicenseHandgun)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_handgun', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy SMG License
RegisterServerEvent('esx_licenseshop:buyLicenseSMG')
AddEventHandler('esx_licenseshop:buyLicenseSMG', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseSMG then
		xPlayer.removeMoney(ConfigLi.LicenseSMG)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_smg', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Shotgun License
RegisterServerEvent('esx_licenseshop:buyLicenseShotgun')
AddEventHandler('esx_licenseshop:buyLicenseShotgun', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseShotgun then
		xPlayer.removeMoney(ConfigLi.LicenseShotgun)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_shotgun', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Assault License
RegisterServerEvent('esx_licenseshop:buyLicenseAssault')
AddEventHandler('esx_licenseshop:buyLicenseAssault', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseAssault then
		xPlayer.removeMoney(ConfigLi.LicenseAssault)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_assault', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy LMG License
RegisterServerEvent('esx_licenseshop:buyLicenseLMG')
AddEventHandler('esx_licenseshop:buyLicenseLMG', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseLMG then
		xPlayer.removeMoney(ConfigLi.LicenseLMG)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_lmg', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Sniper License
RegisterServerEvent('esx_licenseshop:buyLicenseSniper')
AddEventHandler('esx_licenseshop:buyLicenseSniper', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseSniper then
		xPlayer.removeMoney(ConfigLi.LicenseSniper)

		TriggerEvent('esx_license:addLicense', _source, 'weapon_sniper', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Commercial License
RegisterServerEvent('esx_licenseshop:buyLicenseCommercial')
AddEventHandler('esx_licenseshop:buyLicenseCommercial', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseCommercial then
		xPlayer.removeMoney(ConfigLi.LicenseCommercial)

		TriggerEvent('esx_license:addLicense', _source, 'drive_truck', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Drivers License
RegisterServerEvent('esx_licenseshop:buyLicenseDrivers')
AddEventHandler('esx_licenseshop:buyLicenseDrivers', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseDrivers then
		xPlayer.removeMoney(ConfigLi.LicenseDrivers)

		TriggerEvent('esx_license:addLicense', _source, 'drive', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Drivers Permit
RegisterServerEvent('esx_licenseshop:buyLicenseDriversP')
AddEventHandler('esx_licenseshop:buyLicenseDriversP', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseDriversP then
		xPlayer.removeMoney(ConfigLi.LicenseDriversP)

		TriggerEvent('esx_license:addLicense', _source, 'dmv', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Motorcyle License
RegisterServerEvent('esx_licenseshop:buyLicenseMotorcyle')
AddEventHandler('esx_licenseshop:buyLicenseMotorcyle', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseMotocycle then
		xPlayer.removeMoney(ConfigLi.LicenseMotocycle)

		TriggerEvent('esx_license:addLicense', _source, 'drive_bike', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Weed License
RegisterServerEvent('esx_licenseshop:buyLicenseWeed')
AddEventHandler('esx_licenseshop:buyLicenseWeed', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseWeed then
		xPlayer.removeMoney(ConfigLi.LicenseWeed)

		TriggerEvent('esx_license:addLicense', _source, 'weed_processing', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)

-- Buy Weapon License
RegisterServerEvent('esx_licenseshop:buyLicenseWeapon')
AddEventHandler('esx_licenseshop:buyLicenseWeapon', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= ConfigLi.LicenseWeapon then
		xPlayer.removeMoney(ConfigLi.LicenseWeapon)

		TriggerEvent('esx_license:addLicense', _source, 'weapon', function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	end
end)
