
RegisterNetEvent('robPlayer')
AddEventHandler('robPlayer', function()

	local finishedanim = false

	local lPed = PlayerPedId()

	RequestAnimDict("random@shop_robbery")
	while not HasAnimDictLoaded("random@shop_robbery") do
		Citizen.Wait(0)
	end
		
	if IsEntityPlayingAnim(lPed, "random@shop_robbery", "robbery_action_b", 3) then
		ClearPedSecondaryTask(lPed)
		finishedanim = false
	else
		ClearPedTasksImmediately(lPed)
        TaskPlayAnim(lPed, "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0)
        
		local seccount = math.random(3, 4)
		while seccount > 0 do
			Citizen.Wait(1200)
			seccount = seccount - 1
		end
            
        if IsEntityPlayingAnim(lPed, "random@shop_robbery", "robbery_action_b", 3) then
			finishedanim = true
		else
			finishedanim = false
		end
		ClearPedTasksImmediately(lPed)
	end		

	if not finishedanim then return end

	t, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance < 5 then

		print(GetPlayerName(t))
		if (IsEntityPlayingAnim ( GetPlayerPed(t), "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(GetPlayerPed(t), "random@arrests@busted", "idle_a", 3) or ESX.PlayerData.job.name == 'police') then
			TriggerEvent("ev-inventory:search")
		elseif (IsEntityDead(GetPlayerPed(t))) or IsEntityPlayingAnim ( GetPlayerPed(t), "dead", "dead_a", 3) then
			TriggerEvent("ev-inventory:loot")
		else
			TriggerEvent("notification", "You can only rob players that have their hands up.",2)
		end

	else
		TriggerEvent("notification","No target found.",2)
	end

end)