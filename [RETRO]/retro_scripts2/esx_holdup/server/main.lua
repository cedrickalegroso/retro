local rob = false
local robbers = {}
ESX = nil





				


TriggerEvent('esx:getShRETROaredObjRETROect', function(obj) ESX = obj end)

RegisterServerEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function(currentStore)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at', StoresHOLDUP[currentStore].nameOfStore))
			TriggerClientEvent('esx_holdup:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('esx_holdup:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('robbery_cancelled_at', StoresHOLDUP[currentStore].nameOfStore))
	end
end)

RegisterServerEvent('esx_holdup:robberyStarted')
AddEventHandler('esx_holdup:robberyStarted', function(currentStore)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()




	if StoresHOLDUP[currentStore] then
		local store = StoresHOLDUP[currentStore]

		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRobHOLDUP and store.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRobHOLDUP - (os.time() - store.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end

		if not rob then
			if cops >= Config.PoliceNumberRequiredHOLDUP then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' then
					
						TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', store.nameOfStore))
						TriggerClientEvent('esx_holdup:setBlip', xPlayers[i], StoresHOLDUP[currentStore].position)
					end
				end

				TriggerEvent('InteractSound_SV:PlayOnAll','demo',0.5)

				local name = GetPlayerName(source)
local message = name..' started a shop robbery at '..store.nameOfStore
local color = 56108
local webhook = 'https://discordapp.com/api/webhooks/765802118945833000/t5i9lIbO39BFTBe-HsdRW58mKI_s33op0zDgCrtOT-mqjd3SCuXH0MFzddLbz2vspNy6'

sendToDiscord (name,message,color, webhook)  

				TriggerEvent('isPriority')

				Citizen.Wait(5000)


				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..store.nameOfStore.. ' postal code '..store.blockOfStore..  ' ^3EMS AND MECHANIC STANDBY!  </div>',
					args = { fal, msg }
				})

				Citizen.Wait(2500)

				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..store.nameOfStore.. ' postal code '..store.blockOfStore..  ' ^3EMS AND MECHANIC STANDBY!  </div>',
					args = { fal, msg }
				})

				Citizen.Wait(2500)

				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..store.nameOfStore..  ' postal code '..store.blockOfStore..  ' ^3EMS AND MECHANIC STANDBY!  </div>',
					args = { fal, msg }
				})

				Citizen.Wait(2500)


				TriggerClientEvent('chat:addMessage', -1, {
					template = '<div class="chat-message system"><b> 👮 RCPD : </b> ^1Robbery in progress at '..store.nameOfStore..  ' postal code '..store.blockOfStore..  ' ^3EMS AND MECHANIC STANDBY!  </div>',
					args = { fal, msg }
				})

				

				TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', store.nameOfStore))
				TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))
				
				TriggerClientEvent('esx_holdup:currentlyRobbing', _source, currentStore)
				TriggerClientEvent('esx_holdup:startTimer', _source)
				
				StoresHOLDUP[currentStore].lastRobbed = os.time()
				robbers[_source] = currentStore

				SetTimeout(store.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							TriggerClientEvent('esx_holdup:robberyComplete', _source, store.reward)


						
		

							if Config.GiveBlackMoneyHOLDUP then
								xPlayer.addAccountMoney('black_money', store.reward)
							else
								xPlayer.addMoney(store.reward)
							end
							
							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])

								if xPlayer.job.name == 'police' then
									TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at', store.nameOfStore))

						

									TriggerClientEvent('esx_holdup:killBlip', xPlayers[i])
								end
							end
						end
					end

				 
				end)

			
			else
				TriggerClientEvent('esx:showNotification', _source, _U('min_police', Config.PoliceNumberRequiredHOLDUP))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('robbery_already'))
		end
	end
end)


function sendToDiscord (name,message,color, webhook)  
	local DiscordWebHook = webhook
	local DISCORD_IMAGE	= "https://i.imgur.com/DZUmmWL.png"
  
  local embeds = {
	  {
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "Discord Bot by Cedrick  Alegroso",
			  ["icon_url"] = DISCORD_IMAGE,
		 },
	  }
  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end