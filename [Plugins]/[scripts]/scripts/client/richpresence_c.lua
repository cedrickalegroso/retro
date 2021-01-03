Citizen.CreateThread(function()
	while true do
		
		SetDiscordAppId(730312400116514866)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('extravision')

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('ExtraVision | RolePlay')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('extravision')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetText('ExtraVision | RolePlay')
        
        
        -- Amount of online players (Don't touch)
        local playerCount = #GetActivePlayers()
        
        -- Your own playername (Don't touch)
        local playerName = GetPlayerName(PlayerId())

        -- Set here the amount of slots you have (Edit if needed)
        local maxPlayerSlots = "32"

        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(string.format("%s - %s/%s", playerName, playerCount, maxPlayerSlots))
        
        -- It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
