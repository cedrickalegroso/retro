TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




--[[ AMBULANCE COMMANDS ]]--

RegisterCommand('rcems', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(6)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> {1} </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('rcemsotw', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(9)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> 10-1 Taking distress. OTW to postal #{1} </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('rcemsotw2', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> EMS proceeding to the area. </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('rcemsotw3', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  

 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> RIP {1}. EMS EN ROUTE TO GET THE HOSTAGE/S  </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('rcemsrip', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(9)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
   local date = os.date("%H:%M:%S %p")

 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> RIP RIP {1}. Time of Death '..date..' Condolences to family and friends  </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('rcemsstandby', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> ALL EMS ON STAND BY </div>',
        args = { user, msg }
    })

   end

 
end, false)


RegisterCommand('rcemsstandby', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..': </b> ALL EMS ON STAND BY </div>',
        args = { user, msg }
    })

   end

 
end, false)


RegisterCommand('rcemsdelay', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(10)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'ambulance' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 🏥 RCEMS '..playerName..':  Priority in progress. There may be a delay on other distress calls. Your patience is much appreciated. </div>',
        args = { user, msg }
    })

   end

 
end, false)


--[[ END OF AMBULANCE COMMANDS ]]--



--[[ POLICE COMMANDS ]]--


RegisterCommand('rcpd', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'police' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD '..playerName..': {1}. </div>',
        args = { user, msg }
    })

   end

 
end, false)

RegisterCommand('warncarchase', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'police' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD '..playerName..': Retro citizens please be advised there is an ongoing carchase. If you are inside a 10 mile radius please dont try to interfere. </div>',
        args = { user, msg }
    })

   end

 
end, false)


RegisterCommand('warnshootout', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(12)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'police' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message system"><b> 👮 RCPD '..playerName..': Retro citizens please be advised there is an ongoing shootout everyone inside 1 mile radius will be shot dead! </div>',
        args = { user, msg }
    })

   end

 
end, false)

--[[ END OF POLICE COMMANDS ]]--

--[[ POLICE GANGS ]]--

RegisterCommand('vermillion', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(11)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'vermillion' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message vermillion"><b> &#128299;  Vermillion '..playerName..': {1}. </div>',
        args = { user, msg }
    })

   end

 
end, false)


RegisterCommand('thelost', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(8)
   -- local name = getIdentity(src)
   local xPlayer = ESX.GetPlayerFromId(source)
   local playerName =  xPlayer.name
  
 
   if  xPlayer.getJob().name == 'thelost' then 

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message thelost"><b> &#128757;  The Lost MC  '..playerName..': {1}. </div>',
        args = { user, msg }
    })

   end

 
end, false)



--[[ END OF POLICE COMMANDS ]]--



