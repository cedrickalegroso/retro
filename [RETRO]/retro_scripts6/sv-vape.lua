Config = {
	-- Key used to take a hit of the vape (51)"E" by default.
DragControl = 51,

	-- Key used to reset to the resting vape position (58)"G" by default.
RestingAnim = 58,

	-- The amount of time in (ms) you will need to hold the button in order to commit to the action. (250) by default.
ButtonHoldTime = 250,

	-- Size of the vape clouds. (0.5) by default.
SmokeSize = 0.5,

	-- the Odds of your Mod exploding in your face. (10594) by default. lower the number to increase the chance you have to explode.
FailureOdds = 10594, -- 10594 = 0.0001% chance

	-- The amount of time in (ms) the player has to wait before the can hit the vape again. (4000) by default.
VapeCoolDownTime = 4000,

	-- The amount of time in (ms) the smoke from the vape will linger. (2800) by default.
VapeHangTime = 2800,

	-- Whether or not you want ace permissions to be enabled, False = Everyone Can vape, 
VapePermission = false,

	-- Ace permissions group to allow access. **REQUIRED IF YOU HAVE PERMISSIONS ENABLED**
PermissionsGroup = "ADD_ACE_GROUP_HERE",

	-- If permissions are enabled you can set the denied access message here. **REQUIRED IF YOU HAVE PERMISSIONS ENABLED**
InsufficientMessage = "^3You do not have permission to do this.",

	-- This will Enable and disable the debug commands. 
Debug = false,

	-- The Transparency of the help text when it starts. (0) by default. Just leave this alone...
HelpTextStartingAlpha = 0,

	-- Hold long in (ms) will the help message appear for. (8000) by default.
HelpTextLength = 8000,
}


RegisterNetEvent("Vape:Failure")
RegisterServerEvent("eff_smokes")

if Config.VapePermission == true then
	RegisterCommand("vape1", function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, Config.PermissionsGroup) then
			if (tostring(args[1]) == "start") then
				local _source = source
				local xPlayer = ESX.GetPlayerFromId(_source)

				print('vape count '..xPlayer.getInventoryItem('vape').count)

				if xPlayer.getInventoryItem('vape').count > 0 then 
					TriggerClientEvent("Vape:StartVaping", source, 0)
				else 
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You dont have Vape.'})
				end

				
			elseif (tostring(args[1]) == "stop") then
				TriggerClientEvent("Vape:StopVaping", source, 0)
			elseif (tostring(args[1])) ~= nil then
				TriggerClientEvent("chatMessage", source, "^1 Vaping: Error, Wrong Command must use /vape <start/stop>")
			end
			if Config.Debug then
				if (tostring(args[1]) == "fix") then
					TriggerClientEvent("Vape:VapeAnimFix", source, 0)
				elseif (tostring(args[1]) == "drag") then
					TriggerClientEvent("Vape:Drag", source, 0)
				end
			end
		else
			TriggerClientEvent("chatMessage", source, Config.InsufficientMessage)
		end
	end)
else
	RegisterCommand("vape", function(source, args, rawCommand)
		if (tostring(args[1]) == "start") then
			local _source = source
				local xPlayer = ESX.GetPlayerFromId(_source)

				--print('vape count '..xPlayer.getInventoryItem('vape').count)

				if xPlayer.getInventoryItem('vape').count > 0 then 
					TriggerClientEvent("Vape:StartVaping", source, 0)
				else 
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You dont have Vape.'})
				end
		elseif (tostring(args[1]) == "stop") then
			TriggerClientEvent("Vape:StopVaping", source, 0)
		elseif (tostring(args[1])) ~= nil then
			TriggerClientEvent("chatMessage", source, "^1 Vaping: Error, Wrong Command must use /vape <start/stop>")
		end
		if Config.Debug then
			if (tostring(args[1]) == "fix") then
				TriggerClientEvent("Vape:VapeAnimFix", source, 0)
			elseif (tostring(args[1]) == "drag") then
				TriggerClientEvent("Vape:Drag", source, 0)
			end
		end
	end)
end

AddEventHandler("Vape:Failure", function()
	_s = source
	Player = GetPlayerName(_s)
	TriggerClientEvent("chatMessage", -1, " ^3>>> ^2Well, it seems that ^4@"..Player.."^2's vape has exploded in their face, The odds of that are ^31 ^2in ^310,594")
end)
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)
