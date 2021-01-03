--[[ COMMANDS ]]--
ESX = nil


TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    local name = getIdentity(src)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeMoney(10000)

    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'To lessen the use of "OOC" in chat we are deducting 10,000. Please use twitter for RP. '})


    if player ~= false then
        local user = GetPlayerName(src)
            TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message advert"><b>OOC {0} : </b> {1}</div>',
            args = { user, msg }
        })
    end
    
end, false)




RegisterCommand('rcpd', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

            
      
    
            if  job.job == 'police' then 
                print('player is a POPO')
                fal = name.firstname .. " " .. name.lastname

          

                
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 👮 RCPD : {0} : </b>{1}</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)



RegisterCommand('warncarchase', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)
    
          


            if  job.job == 'police' then 
                print('player is a POPO')
                fal = name.firstname .. " " .. name.lastname

       


                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 👮 RCPD : {0} : </b> Retro citizens please be advised there is an ongoing carchase at {1} If you are inside a 10 mile radius please dont try to interfere.</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)


RegisterCommand('warnshootout', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

          
    
            if  job.job == 'police' then 
                print('player is a POPO')
                fal = name.firstname .. " " .. name.lastname



                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 👮 RCPD : {0} : </b> Retro citizens please be advised there is an ongoing shootout at {1} everyone inside 1 mile radius will be shot dead!.</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)




RegisterCommand('rcems', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(6)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

           
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

           
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b>{1}</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)


RegisterCommand('rcemsotw', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(9)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

          
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

             

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> 10-1 Taking distress. OTW to postal #{1} </div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)


RegisterCommand('rcemsstandby', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

          
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

          

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> ALL EMS ON STAND BY </div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)



RegisterCommand('rcemsotw2', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

          
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

           

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> EMS proceeding to the area. </div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)


RegisterCommand('rcemsotw3', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

          
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

           

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> EMS EN ROUTE TO GET THE HOSTAGE/S </div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)





RegisterCommand('rcemsrip', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(9)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

     
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

                local date = os.date("%H:%M:%S %p")

           

           

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> RIP {1}. Time of Death '..date..' Condolences to family and friends. </div>',
                args = { fal, msg }
            }) 
            else 

            end
		      
        end
    end
end, false)



RegisterCommand('rcemsdelay', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

     
    
            if  job.job == 'ambulance' then 
                print('player is a Ambulance')
                fal = name.firstname .. " " .. name.lastname

         

    

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> 🏥 RCEMS : {0} : </b> Priority in progress. There may be a delay on other distress calls. Your patience is much appreciated. </div>',
                args = { fal, msg }
            }) 
            else 

            end
		      
        end
    end
end, false)











RegisterCommand('rcmech', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(7)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)




    
            if  job.job == 'groove' then 
                print('player is a Mechanic')
                fal = name.firstname .. " " .. name.lastname

              

                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message system"><b> &#128295; RCMECH : {0} : </b>{1}</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)





RegisterCommand('vermillion', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(11)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

            
      
    
            if  job.job == 'vermillion' then 
                print('player is a Vermillion')
                fal = name.firstname .. " " .. name.lastname

          

                
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message vermillion"><b> &#128299; Vermillion : {0} : </b>{1}</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)




RegisterCommand('thelost', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(8)
    if player ~= false then
        if ESX then
            local name = getIdentity(src)
            local job = getIdentity(src)

            
      
    
            if  job.job == 'thelost' then 
                print('player is a The Lost')
                fal = name.firstname .. " " .. name.lastname

          

                
                TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message thelost"><b> &#128757; The Lost MC : {0} : </b>{1}</div>',
                args = { fal, msg }
            })
            else 

            end
		      
        end
    end
end, false)






function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
            height = identity['height'],
            job = identity['job'],
            money = identity['money']
			
		}
	else
		return nil
	end
end


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