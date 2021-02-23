
ESX 				= nil
local defaultsecs   = 300
local maxsecs 		= 9999

-----------------------------

--ESX base
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('retro_scripts:saveoutfit')
AddEventHandler('retro_scripts:saveoutfit', function(source, label)
	local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user = users[1]
		local skin = nil




		if user.skin ~= nil then
            skin = json.decode(user.skin)
            TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
                local dressing = store.get('dressing')
        
                 print('weewew')
                if dressing == nil then
                    dressing = {}
                end
        
                table.insert(dressing, {
                    label = label,
                    skin  = skin
                })
        
                store.set('dressing', dressing)
                store.save()
            end)
		end

	

		TriggerClientEvent('clothing:loadclothes', skin)
	end)


end)

RegisterCommand("whitelistaccess", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local job = xPlayer.getJob().name

    if job == 'ambulance' then
        print('tada')
        TriggerClientEvent("retro_scripts:initems", source)
    elseif job == 'police' then 
        TriggerClientEvent("retro_scripts:initpolice", source)
    elseif job == 'groove' then
        TriggerClientEvent("retro_scripts:initgroove", source)
    else
        print('who are you?') 
    end

   
end)

RegisterCommand("stuck", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerClientEvent("retro_scripts:fly", source)
end)

RegisterServerEvent('retro_scripts:updateEmsBlips1')
AddEventHandler('retro_scripts:updateEmsBlips1', function()
	TriggerClientEvent('retro_scripts:updateEmsBlips', -1)
end)


RegisterServerEvent('retro_scripts:updateGrooveBlips1')
AddEventHandler('retro_scripts:updateGrooveBlips1', function()
	TriggerClientEvent('retro_scripts:updateGrooveBlips', -1)
end)

RegisterServerEvent('retro_scripts:updatePoliceBlips1')
AddEventHandler('retro_scripts:updatePoliceBlips1', function()
	TriggerClientEvent('retro_scripts:updatePoliceBlips', -1)
end)



RegisterCommand("hotwirecar", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

   
    if  xPlayer.getInventoryItem('lockpick').count > 0 then 
        TriggerClientEvent("retro_scripts:starthotwire", source)
    else 
        --TriggerEvent('notification', ('You need to have a lockpick to hotwire a car!'), 2)
        --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You need to have a lockpick to hotwire a car!'})
    end

    
end)

    



RegisterCommand("hideintrunk", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    --print(xPlayer.getJob2().name)

    
    --print('testt hide')

   -- TriggerEvent('esx:restoreLoadout', source)

   TriggerClientEvent("retro_scripts:hidetrunk", source)
end)





RegisterCommand("hpbedarrest", function(source)
    TriggerClientEvent("retro_scripts:hpanim", source)
end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
            identifier = identity['identifier'],
            license = identity['license'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end


RegisterCommand("clearrewards", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local job = xPlayer.getJob().name

    

    if xPlayer.identifier == 'steam:1100001115e4c94' or xPlayer.identifier == 'steam:steam:11000011693aece'  then 

        --print('1')

        MySQL.Async.execute('UPDATE retro_rewards SET `takenDonator` =  @takenDonator, `taken` = @taken, time = @time', {
            ['@takenDonator'] = 0,
            ['@taken'] = 0,
            ['@time'] = 0
        }, function(rowsChanged)
            if rowsChanged == 0 then
              print('RETRO CITY REWARDS HAS BEEN RESTARTED!')
            end
        end)

    end
   
end)

ESX.RegisterServerCallback('retro_scripts:getHackerDevice', function(source,cb, hackerDevice)
    local hackerDevice = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getInventoryItem('hackerDevice').count 

    if count > 0 then 
        hackerDevice = 1
    end

	if hackerDevice == 1 then 
		xPlayer.removeInventoryItem('hackerDevice', 1)
	end

    cb(hackerDevice)

end)

ESX.RegisterServerCallback('retro_scripts:getbalancedirty', function(source,cb, money)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)

    MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
        ['@owner'] = player.license,
    }, function(result) 
        cb(result[1].money)
    end)
end)

RegisterServerEvent('retro_scripts:testcheckpoundcarstat')
AddEventHandler('retro_scripts:testcheckpoundcarstat', function(source, data)
    print('sss')
	print(data)

    for k, v in pairs(data) do
        print(k, json.encode(v))
    end
end)


ESX.RegisterServerCallback('retro_scripts:checkpoundcarstat', function(data, cb, status)

    print('plate '..data)



    --[[

    	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)


    MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
        ['@owner'] = player.license,
    }, function(result) 
        cb(result[1].money)
    end)
    ]]--

end)

ESX.RegisterServerCallback('retro_scripts:getCuffs', function(source,cb, cuff)
    local cuff = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getInventoryItem('cuffs').count 

    if count > 0 then 
        cuff = 1
     --   xPlayer.removeInventoryItem('cuffs', 1)
    end

    cb(cuff)

end)

ESX.RegisterServerCallback('retro_scripts:checkblack', function(source,cb, black)
    local black = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getAccount('black_money').money 

    if count >= 5000 then 
        black = 1
        xPlayer.removeAccountMoney('black_money', 5000)
    end

    cb(black)

end)

ESX.RegisterServerCallback('retro_scripts:getIDCARD', function(source,cb, item)
    local item = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getInventoryItem('retro_idcard').count 

    if count > 0 then 
        item = 1
    end

    cb(item)

end)

ESX.RegisterServerCallback('retro_scripts:getDRIVECARD', function(source,cb, item)
    local item = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getInventoryItem('retro_drivecard').count 

    if count > 0 then 
        item = 1
    end

    cb(item)

end)

ESX.RegisterServerCallback('retro_scripts:getGUNCARD', function(source,cb, item)
    local item = 0
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local count = xPlayer.getInventoryItem('retro_guncard').count 

    if count > 0 then 
        item = 1
    end

    cb(item)

end)




RegisterServerEvent('retro_scripts:withillegalcash')
AddEventHandler('retro_scripts:withillegalcash', function(source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)

    local name = xPlayer.name
    local message = name..'  withdrawn '.. amount
    local color = 56108
     local webhook = 'https://discord.com/api/webhooks/803479851943985162/-DcXa9-9AQZTBOEpVTuaFcbGBeOk-5p8qvZOJ6mOl7unTQpoc9gXPY_6zj_M9_M-n935'
     sendToDiscord(name,message,color, webhook)

    MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
        ['@owner'] = player.license,
    }, function(result) 
        local moneynow = result[1].money 
        local lefintbank = moneynow - amount

        if lefintbank >= 0 then 
            xPlayer.addAccountMoney('black_money', amount)
            TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'success', text = 'Success! you just withdrawn '..amount.. ' black money.' })
            MySQL.Async.execute('UPDATE illegal_acc SET `money` = @money WHERE owner = @owner', {
                ['@owner'] = player.license,
                ['@money'] = lefintbank,
            }, function(rowsChanged)
                if rowsChanged == 0 then
                end
            end)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'error', text = 'Not enough money in Bank' })
        end

      
    end)
   
  
	
end)

RegisterServerEvent('retro_scripts:depositillegalcash')
AddEventHandler('retro_scripts:depositillegalcash', function(source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)



    local name = xPlayer.name
    local message = name..'  deposited '.. amount 
    local color = 56108
     local webhook = 'https://discord.com/api/webhooks/803479851943985162/-DcXa9-9AQZTBOEpVTuaFcbGBeOk-5p8qvZOJ6mOl7unTQpoc9gXPY_6zj_M9_M-n935'
     sendToDiscord(name,message,color, webhook)


    if xPlayer.getAccount('black_money').money >= amount then 
        xPlayer.removeAccountMoney('black_money', amount)
        print('money goods')
        MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
            ['@owner'] = player.license,
        }, function(result) 

            if result[1] then 
                local totalinBank = result[1].money + amount
            
                TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'success', text = 'Success! you just deposited '..amount.. ' black money.' })
                MySQL.Async.execute('UPDATE illegal_acc SET `money` = @money WHERE owner = @owner', {
                    ['@owner'] = player.license,
                    ['@money'] = totalinBank,
                }, function(rowsChanged)
                    if rowsChanged == 0 then

                        TriggerClientEvent('notification', source, 'Deposited '..amount)
                      
                        
                    end
                end)
             else
                print('Server error has occured')
             end
           
        end)
    else 
        TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'error', text = 'Not enough money' })
    end
   
  
	
end)




ESX.RegisterUsableItem('illegalcashbank', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)
   -- print('License '..player.license..' registered for Retro City Daily rewards!')

    MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
        ['@owner'] = player.license,
    }, function(result)
    
     if result[1] then 
        
        TriggerClientEvent('retro_scripts:illegalcashbankmenu', source)
     else
        MySQL.Async.execute('INSERT INTO illegal_acc (owner, money) VALUES (@owner, @money)', {
            ['@owner'] = player.license,
            ['@money'] = 0,
        }, function(rowsChanged)
          
           --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Registred' })

           local name = GetPlayerName(source)
          local message = name..' registered a illegal cash bank '
          local color = 56108
           local webhook = 'https://discord.com/api/webhooks/803479851943985162/-DcXa9-9AQZTBOEpVTuaFcbGBeOk-5p8qvZOJ6mOl7unTQpoc9gXPY_6zj_M9_M-n935'
      
                
           sendToDiscord(name,message,color, webhook)
        end)
     end

    end)
end)


RegisterCommand("useillegalcash", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)
   -- print('License '..player.license..' registered for Retro City Daily rewards!')

    MySQL.Async.fetchAll('SELECT * FROM illegal_acc WHERE owner = @owner ', {
        ['@owner'] = player.license,
    }, function(result)
    
     if result[1] then 
        print('calling menu trigger')
        TriggerClientEvent('retro_scripts:illegalcashbankmenu', source)
     else
        MySQL.Async.execute('INSERT INTO illegal_acc (owner, money) VALUES (@owner, @money)', {
            ['@owner'] = player.license,
            ['@money'] = 0,
        }, function(rowsChanged)
          
           --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Registred' })

           local name = GetPlayerName(source)
           local message = name..' registered a illegal cash bank '
           local color = 56108
           local webhook = 'https://discord.com/api/webhooks/803479851943985162/-DcXa9-9AQZTBOEpVTuaFcbGBeOk-5p8qvZOJ6mOl7unTQpoc9gXPY_6zj_M9_M-n935'
      
                
           sendToDiscord(name,message,color, webhook)

           
           
        end)
     end

    end)

end)


        
ESX.RegisterServerCallback('retro_scripts:checkPopoCount', function(source,cb, okay)
    local cops = 0
    local okay = 0
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end

    print('COPS COUNT '..cops )

    if cops >= 2   then 
        okay = 1
    end

    cb(okay)
end)

ESX.RegisterServerCallback('retro_scripts:isClaimed', function(source,cb, isClaimed)
    print('callback triggered')
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)


    
end)




RegisterServerEvent('retro_scripts:gettodayreward')
AddEventHandler('retro_scripts:gettodayreward', function(source)
  
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)

    print('this player '..source)
    

    

   

    local epochunix = os.time(os.date("!*t"))


    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id AND taken = @taken ', {
        ['@id'] = player.license,
        ['@taken'] = 0
    }, function(result) 
     if result[1] then
        
        if epochunix - result[1].time >= 2500  and result[1].taken == 0 then 
            math.randomseed(os.time())
            local day = math.random(1,31)

            local type = ""
            local weapon = ""
            local amount = 0
            local item  = ""
            
            if  day == nil then
                type = "money" 
                amount = 25000
            elseif day == 01 then 
                type = "black" 
                amount = 20000
            elseif day == 02 then 
                type = "black" 
                amount = 20000
            elseif day == 03 then
                type = "item" 
                item = "bandage"
                amount = 5
            elseif day == 04 then
                type = "item" 
                item = "bread"
                amount = 15
            elseif day == 05 then
                type = "money" 
                amount = 15000
            elseif day == 06 then
                type = "money" 
                amount = 30000
            elseif day == 07 then
                type = "item" 
                item = "jewels"
                amount = 150
            elseif day == 08 then
                type = "item" 
                item = "carokit"
                amount = 3
            elseif day == 09 then
                type = "item" 
                item = "armor"
                amount = 5
            elseif day == 10 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 11 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 12 then
                type = "item" 
                item = "packaged_chicken"
                amount = 50
            elseif day == 13 then
                type = "black" 
                amount = 30000
            elseif day == 14 then
                type = "item" 
                item = "packaged_chicken"
                amount = 50
            elseif day == 15 then
                type = "money" 
                amount = 25000
            elseif day == 16 then
                type = "item" 
                item = "weed_pooch"
                amount = 100
            elseif day == 17 then
                type = "item" 
                item = "opoium_pooch"
                amount = 100
            elseif day == 18 then
                type = "weapon" 
                item = "WEAPON_CARBINERIFLE"
                amount = 1
            elseif day == 19 then
                type = "black" 
                amount = 35000
            elseif day == 20 then
                type = "item" 
                item = "jewels"
                amount = 100
            elseif day == 21 then
                type = "money" 
                amount = 30000
            elseif day == 22 then
                type = "black" 
                amount = 40000
            elseif day == 23 then
                type = "item" 
                item = "packaged_chicken"
                amount = 150
            elseif day == 24 then
                type = "item" 
                item = "armor2"
                amount = 10
            elseif day == 25 then
                type = "weapon" 
                item = "WEAPON_PISTOL"
                amount = 1
            elseif day == 26 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 27 then
                type = "item" 
                item = "weed_pooch"
                amount = 100
            elseif day == 28 then
                type = "item" 
                item = "carokit"
                amount = 5
            elseif day == 29 then
                type = "item" 
              --  item = "retro_car"
                item = "carokit"
                amount = 1
            elseif day == 30 then
                type = "retro" 
                amount = 30000
            elseif day == 31 then
                type = "black" 
                amount = 50000
            end
            print('player recived'.. type)
        
                        local name = xPlayer.name
                        local message = 'got ' .. type .. ' ' .. item .. ' ' .. amount  
                        local color = 56108
                        local webhook = 'https://discord.com/api/webhooks/803504972032901170/M9PWG-v4XNUAhgip6rcxpizBFmGFeqk4QY1sKTmA6o0YNrWtNppeWOldG9Wt_bjOIjVU'
                   
                             
                        sendToDiscord(name,message,color, webhook)
        
            if result[1].isdonator == 1 then 
                amount = (amount * 2) + amount
              
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You have a retro coin so you got a little bit more reward.' })
            end
        
            if type == "money" then 
                xPlayer.addMoney(amount)
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of clean money' })
            elseif type == "item" then 
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of '..item })
            elseif type == "black" then 
                xPlayer.addAccountMoney('black_money', amount)
              TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of dirty money' })
            elseif type == "weapon" then 
               -- xPlayer.addInventoryItem(item, amount)
               xPlayer.addWeapon(item,amount)
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..item..' with '..amount..' of bullets.'})
            end
        
            
            MySQL.Async.execute('UPDATE retro_rewards SET `taken` = @taken WHERE id = @id', {
                ['@id'] = player.license,
                ['@taken'] = 1,
            }, function(rowsChanged)
                if rowsChanged == 0 then
                 print('PLAYER SET TO 1')
                end
            end)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You already claimed todays reward or you havent played for atleast 20 mins yet.' })

        end

     else
      --  print('NOO')
     
     --  TriggerClientEvent('esx:showNotification', source, '~r~You cant carry anymore!')
     TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You already claimed todays reward or you havent played for atleast 20 mins yet.' })
      --  TriggerClientEvent('retro_scripts:notif', source)
     end


    end)

end)

ESX.RegisterUsableItem('retro_rwo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
-- ExecuteCommand('openMyRewardsOVERRIEEDDD')
    TriggerEvent('retro_scripts:gettodayrewardOverride', source)
	 xPlayer.removeInventoryItem('retro_rwo', 1)
end)


RegisterServerEvent('retro_scripts:gettodayrewardOverride')
AddEventHandler('retro_scripts:gettodayrewardOverride', function(source)
  
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)

    print('this player '..source)


    local epochunix = os.time(os.date("!*t"))

        
        if 1 > 0 then 
            math.randomseed(os.time())
            local day = math.random(1,31)

            local type = ""
            local weapon = ""
            local amount = 0
            local item  = ""
            
            if  day == nil then
                type = "money" 
                amount = 25000
            elseif day == 01 then 
                type = "black" 
                amount = 20000
            elseif day == 02 then 
                type = "black" 
                amount = 20000
            elseif day == 03 then
                type = "item" 
                item = "bandage"
                amount = 5
            elseif day == 04 then
                type = "item" 
                item = "bread"
                amount = 15
            elseif day == 05 then
                type = "money" 
                amount = 15000
            elseif day == 06 then
                type = "money" 
                amount = 30000
            elseif day == 07 then
                type = "item" 
                item = "jewels"
                amount = 150
            elseif day == 08 then
                type = "item" 
                item = "carokit"
                amount = 3
            elseif day == 09 then
                type = "item" 
                item = "armor"
                amount = 5
            elseif day == 10 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 11 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 12 then
                type = "item" 
                item = "packaged_chicken"
                amount = 50
            elseif day == 13 then
                type = "black" 
                amount = 30000
            elseif day == 14 then
                type = "item" 
                item = "packaged_chicken"
                amount = 50
            elseif day == 15 then
                type = "money" 
                amount = 25000
            elseif day == 16 then
                type = "item" 
                item = "weed_pooch"
                amount = 100
            elseif day == 17 then
                type = "item" 
                item = "opoium_pooch"
                amount = 100
            elseif day == 18 then
                type = "weapon" 
                item = "WEAPON_CARBINERIFLE"
                amount = 1
            elseif day == 19 then
                type = "black" 
                amount = 35000
            elseif day == 20 then
                type = "item" 
                item = "jewels"
                amount = 100
            elseif day == 21 then
                type = "money" 
                amount = 30000
            elseif day == 22 then
                type = "black" 
                amount = 40000
            elseif day == 23 then
                type = "item" 
                item = "packaged_chicken"
                amount = 150
            elseif day == 24 then
                type = "item" 
                item = "armor2"
                amount = 10
            elseif day == 25 then
                type = "weapon" 
                item = "WEAPON_PISTOL"
                amount = 1
            elseif day == 26 then
                type = "weapon" 
                item = "WEAPON_ASSAULTRIFLE"
                amount = 1
            elseif day == 27 then
                type = "item" 
                item = "weed_pooch"
                amount = 100
            elseif day == 28 then
                type = "item" 
                item = "carokit"
                amount = 5
            elseif day == 29 then
                type = "item" 
              --  item = "retro_car"
                item = "carokit"
                amount = 1
            elseif day == 30 then
                type = "retro" 
                amount = 30000
            elseif day == 31 then
                type = "black" 
                amount = 50000
            end
            print('player recived'.. type)
        
                        local name = xPlayer.name
                        local message = 'got ' .. type .. ' ' .. item .. ' ' .. amount  
                        local color = 56108
                        local webhook = 'https://discord.com/api/webhooks/803504972032901170/M9PWG-v4XNUAhgip6rcxpizBFmGFeqk4QY1sKTmA6o0YNrWtNppeWOldG9Wt_bjOIjVU'
                   
                             
                        sendToDiscord(name,message,color, webhook)
        
           -- if result[1].isdonator == 1 then 
          --      amount = (amount * 2) + amount
              
           --     TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You have a retro coin so you got a little bit more reward.' })
         --   end
        
            if type == "money" then 
                xPlayer.addMoney(amount)
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of clean money' })
            elseif type == "item" then 
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of '..item })
            elseif type == "black" then 
                xPlayer.addAccountMoney('black_money', amount)
              TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of dirty money' })
            elseif type == "weapon" then 
            --    xPlayer.addInventoryItem(item, amount)

            xPlayer.addWeapon(item,amount)
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..item..' with '..amount..' of bullets.'})
            end
        
            
            MySQL.Async.execute('UPDATE retro_rewards SET `taken` = @taken WHERE id = @id', {
                ['@id'] = player.license,
                ['@taken'] = 1,
            }, function(rowsChanged)
                if rowsChanged == 0 then
                 print('PLAYER SET TO 1')
                end
            end)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You already claimed todays reward or you havent played for atleast 20 mins yet.' })
        end

    


  
end)


RegisterServerEvent('retro_scripts:gettodayreward1')
AddEventHandler('retro_scripts:gettodayreward1', function(source)
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local player = getIdentity(source)

    print('this player '..source)

    local retroCoin = xPlayer.getInventoryItem('retro_coin').count

    local epochunix = os.time(os.date("!*t"))

  

        MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id AND takenDonator = @takenDonator ', {
            ['@id'] = player.license,
            ['@takenDonator'] = 0
        }, function(result) 
           
         if result[1] then

        

           

            print('donator '..result[1].isdonator)
            
            if  result[1].isdonator == 1 and epochunix - result[1].time >= 2500  and result[1].takenDonator == 0 then 
                print('donator')
               
                math.randomseed(os.time())
                local day = math.random(1,31)
    
                local type = ""
                local weapon = ""
                local amount = 0
                local item  = ""
                
                if  day == nil then
                    type = "money" 
                    amount = 25000
                elseif day == 01 then 
                    type = "black" 
                    amount = 20000
                elseif day == 02 then 
                    type = "black" 
                    amount = 20000
                elseif day == 03 then
                    type = "item" 
                    item = "bandage"
                    amount = 5
                elseif day == 04 then
                    type = "item" 
                    item = "bread"
                    amount = 15
                elseif day == 05 then
                    type = "money" 
                    amount = 15000
                elseif day == 06 then
                    type = "money" 
                    amount = 30000
                elseif day == 07 then
                    type = "item" 
                    item = "jewels"
                    amount = 150
                elseif day == 08 then
                    type = "item" 
                    item = "carokit"
                    amount = 3
                elseif day == 09 then
                    type = "item" 
                    item = "armor"
                    amount = 5
                elseif day == 10 then
                    type = "weapon" 
                    item = "WEAPON_ASSAULTRIFLE"
                    amount = 1
                elseif day == 11 then
                    type = "weapon" 
                    item = "WEAPON_ASSAULTRIFLE"
                    amount = 1
                elseif day == 12 then
                    type = "item" 
                    item = "packaged_chicken"
                    amount = 50
                elseif day == 13 then
                    type = "black" 
                    amount = 30000
                elseif day == 14 then
                    type = "item" 
                    item = "packaged_chicken"
                    amount = 50
                elseif day == 15 then
                    type = "money" 
                    amount = 25000
                elseif day == 16 then
                    type = "item" 
                    item = "weed_pooch"
                    amount = 100
                elseif day == 17 then
                    type = "item" 
                    item = "opoium_pooch"
                    amount = 100
                elseif day == 18 then
                    type = "weapon" 
                    item = "WEAPON_CARBINERIFLE"
                    amount = 1
                elseif day == 19 then
                    type = "black" 
                    amount = 35000
                elseif day == 20 then
                    type = "item" 
                    item = "jewels"
                    amount = 100
                elseif day == 21 then
                    type = "money" 
                    amount = 30000
                elseif day == 22 then
                    type = "black" 
                    amount = 40000
                elseif day == 23 then
                    type = "item" 
                    item = "packaged_chicken"
                    amount = 150
                elseif day == 24 then
                    type = "item" 
                    item = "armor2"
                    amount = 10
                elseif day == 25 then
                    type = "weapon" 
                    item = "WEAPON_PISTOL"
                    amount = 1
                elseif day == 26 then
                    type = "weapon" 
                    item = "WEAPON_ASSAULTRIFLE"
                    amount = 1
                elseif day == 27 then
                    type = "item" 
                    item = "weed_pooch"
                    amount = 100
                elseif day == 28 then
                    type = "item" 
                    item = "carokit"
                    amount = 5
                elseif day == 29 then
                    type = "item" 
                    
                    item = "carokit"
                    amount = 1
                elseif day == 30 then
                    type = "retro" 
                    amount = 30000
                elseif day == 31 then
                    type = "black" 
                    amount = 50000
                end
                print('player recived'.. type)
            
                            local name = xPlayer.name
                            local message = 'got ' .. type .. ' ' .. item .. ' ' .. amount  
                            local color = 56108
                            local webhook = 'https://discord.com/api/webhooks/803504972032901170/M9PWG-v4XNUAhgip6rcxpizBFmGFeqk4QY1sKTmA6o0YNrWtNppeWOldG9Wt_bjOIjVU'
                       
                                 
                            sendToDiscord(name,message,color, webhook)
            
                if result[1].isdonator ==  1 then 
                    amount = (amount * 2) + amount
                  
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You have a retro coin so you got a little bit more reward.' })
                end
            
                if type == "money" then 
                    xPlayer.addMoney(amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of clean money' })
                elseif type == "item" then 
                    xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of '..item })
                elseif type == "black" then 
                    xPlayer.addAccountMoney('black_money', amount)
                  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of dirty money' })
                elseif type == "weapon" then 
                --    xPlayer.addInventoryItem(item, amount)
                xPlayer.addWeapon(item,amount)
                   TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..item..' with '..amount..' of bullets.'})
                end
            
                
                MySQL.Async.execute('UPDATE retro_rewards SET `takenDonator` = @takenDonator WHERE id = @id', {
                    ['@id'] = player.license,
                    ['@takenDonator'] = 1,
                }, function(rowsChanged)
                    if rowsChanged == 0 then
                     print('PLAYER SET TO 1')
                    end
                end)
    
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You already claimed todays reward or you havent played for atleast 20 mins yet.' })
      
            end

           
    
         else
           -- print('NOO')
           TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You already claimed todays reward or you havent played for atleast 20 mins yet.' })
    
          --  TriggerClientEvent('retro_scripts:notif', source)
         end
    
    
        end)


   


   

end)




RegisterServerEvent('retro_scripts:loginrewardstart')
AddEventHandler('retro_scripts:loginrewardstart', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)

    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

        if result[1] then 
           
        else 
            MySQL.Async.execute('INSERT INTO retro_rewards (id, taken, time) VALUES (@id, @taken, @time)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
                ['@time'] = os.time(os.date("!*t"))
            }, function(rowsChanged)
                local name = GetPlayerName(source)
                local message = name..' registered for rewards '
                local color = 56108
                local webhook = 'https://discord.com/api/webhooks/803504972032901170/M9PWG-v4XNUAhgip6rcxpizBFmGFeqk4QY1sKTmA6o0YNrWtNppeWOldG9Wt_bjOIjVU'
           
                     
                sendToDiscord(name,message,color, webhook)
            end)
        end

    end)

end)

RegisterCommand("dailyreward", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)

    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

        if result[1] then 
            print('calling menu trigger')
            TriggerClientEvent('retro_scripts:rewardsmenu', source)
        else 
            print('SERVER ERROR ON RETRO CITY REWARDS')
            --[[
 MySQL.Async.execute('INSERT INTO retro_rewards (id, taken, time) VALUES (@id, @taken, @time)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
                ['@time'] = os.time(os.date("!*t"))
            }, function(rowsChanged)
                local name = GetPlayerName(source)
                local message = name..' registered for rewards '
                local color = 56108
                local webhook = 'https://discord.com/api/webhooks/803504972032901170/M9PWG-v4XNUAhgip6rcxpizBFmGFeqk4QY1sKTmA6o0YNrWtNppeWOldG9Wt_bjOIjVU'
           
                     
                sendToDiscord(name,message,color, webhook)

                Citizen.Wait(500)
                TriggerClientEvent('retro_scripts:rewardsmenu', source)
            end)
            ]]--
           
        end

    end)


end)

function GetLicenses(source)
    TriggerEvent('esx_license:getLicenses', source, function (licenses)
        TriggerClientEvent('suku:GetLicenses', source, licenses)
    end)
end

RegisterServerEvent('suku:buyLicense')
AddEventHandler('suku:buyLicense', function ()
    print('Buy License')
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= 50000 then


		xPlayer.removeMoney(50000)


		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You registered a Fire Arms license.' })
		TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
			GetLicenses(_source)
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You do not have enough money!' })
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


--[[

RegisterCommand("rewardregister", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)
    print('License '..player.license..' registered for Retro City Daily rewards!')

    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

        if result[1] then 
            --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already registered! Ginagawamue? ' })
        else 
            MySQL.Async.execute('INSERT INTO retro_rewards (id, taken, time) VALUES (@id, @taken, @time)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
                ['@time'] = os.time(os.date("!*t"))
            }, function(rowsChanged)
               -- xPlayer.showNotification(_U('ambulance_belongs', plate))
               --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You are now eligible to get daily rewards from Retro City!' })
                --cb(true)
            end)
        
        end

    end)
    
end)


RegisterServerEvent('retro_scripts:loginrewardstart')
AddEventHandler('retro_scripts:loginrewardstart', function(source)
	local _source = source
    local player = getIdentity(_source)
    local min = os.time(os.date("!*t"))
    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

        --print(result)

        if result[1] then 
            if result[1] ~= 0 and  result[1].time == 0 then
                
                MySQL.Async.execute('UPDATE retro_rewards SET `isonline` = @isonline, time = @time WHERE id = @id', {
                    ['@id'] = player.license,
                    ['@isonline'] = 1,
                    ['@time'] = os.time(os.date("!*t"))
                }, function(rowsChanged)
                    if rowsChanged == 0 then
                     
                    end
                end)
            end
        else 
        end

        
    end)

end)



RegisterCommand("dailyreward", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local retroCoin = xPlayer.getInventoryItem('retro_coin').count

    local player = getIdentity(source)
    local minNow = os.time()
   -- print('License '..player.license..' registered for Retro City Daily rewards!')

     local day = (os.date("%d"))

     local type = ""
     local weapon = ""
     local amount = 0
     local item  = ""

     print(day)

    

    if  day == "null" then
        type = "money" 
        amount = 25000
    elseif day == "01" then 
        type = "black" 
        amount = 20000
    elseif day == "02" then 
        type = "black" 
        amount = 20000
    elseif day == "03" then
        type = "item" 
        item = "bandage"
        amount = 5
    elseif day == "04" then
        type = "item" 
        item = "bread"
        amount = 15
    elseif day == "05" then
        type = "money" 
        amount = 15000
    elseif day == "06" then
        type = "money" 
        amount = 30000
    elseif day == "07" then
        type = "item" 
        item = "jewels"
        amount = 150
    elseif day == "08" then
        type = "item" 
        item = "carokit"
        amount = 3
    elseif day == "09" then
        type = "item" 
        item = "armor"
        amount = 5
    elseif day == "10" then
        type = "weapon" 
        item = "weapon_pistol"
        amount = 300
    elseif day == "11" then
        type = "black" 
        amount = 30000
    elseif day == "12" then
        type = "item" 
        item = "packaged_chicken"
        amount = 50
    elseif day == "13" then
        type = "black" 
        amount = 30000
    elseif day == "14" then
        type = "item" 
        item = "packaged_chicken"
        amount = 50
    elseif day == "15" then
        type = "money" 
        amount = 25000
    elseif day == "16" then
        type = "item" 
        item = "weed_pooch"
        amount = 100
    elseif day == "17" then
        type = "item" 
        item = "opoium_pooch"
        amount = 100
    elseif day == "18" then
        type = "weapon" 
        item = "weapon_advancedrifle"
        amount = 300
    elseif day == "19" then
        type = "black" 
        amount = 35000
    elseif day == "20" then
        type = "item" 
        item = "jewels"
        amount = 100
    elseif day == "21" then
        type = "money" 
        amount = 30000
    elseif day == "22" then
        type = "black" 
        amount = 40000
    elseif day == "23" then
        type = "item" 
        item = "packaged_chicken"
        amount = 150
    elseif day == "24" then
        type = "item" 
        item = "armor2"
        amount = 10
    elseif day == "25" then
        type = "weapon" 
        item = "weapon_pistol"
        amount = 300
    elseif day == "26" then
        type = "item" 
        item = "opoium_pooch"
        amount = 100
    elseif day == "27" then
        type = "item" 
        item = "weed_pooch"
        amount = 100
    elseif day == "28" then
        type = "item" 
        item = "carokit"
        amount = 5
    elseif day == "29" then
        type = "item" 
        item = "bandage"
        amount = 10
    elseif day == "30" then
        type = "money" 
        amount = 30000
    elseif day == "31" then
        type = "black" 
        amount = 50000
    end
    print('player recived'.. type)
   

    if retroCoin > 0 then 
        amount = (amount * 1.5) + amount
        print('player have VIP Coin')
    end

   


    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
        
    },
    function(result)


  

      local epochunix = os.time(os.date("!*t"))

      --  print( )

             if result[1] then 

                        if result[1].taken == 0 then

                            ----TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'player has been playing for '.. epochunix - result[1].time })

                            if epochunix - result[1].time >= 2500 then 
                            
                            if type == "money" then 
                                xPlayer.addMoney(amount)
                                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of clean money' })
                            elseif type == "item" then 
                                xPlayer.addInventoryItem(item, amount)
                                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of '..item })
                            elseif type == "black" then 
                                xPlayer.addAccountMoney('black_money', amount)
                                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..amount..' of dirty money' })
                            elseif type == "weapon" then 
                                xPlayer.addWeapon(item, amount)
                                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..item..' with '..amount..' of bullets.'})
                            end

                            MySQL.Async.execute('UPDATE retro_rewards SET `taken` = @taken WHERE id = @id', {
                                ['@id'] = player.license,
                                ['@taken'] = 1,
                            }, function(rowsChanged)
                                if rowsChanged == 0 then
                                
                                end
                            end)

                            else 
                                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! You must play for a while first before receiving your daily reward!' })
                                Citizen.Wait(5000)
                            end

                            else 
                            --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already claimed a daily reward. Wait until 6:00 A.M to get more rewards!' })
                            end



            else 

                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is not yet registerd to daily rewards type /rewardregister' })
            end


 

    end)
    
end)


]]--

--[[


RegisterServerEvent('retro_scripts:loginrewardend')
AddEventHandler('retro_scripts:loginrewardend', function(user)
	local _source = user
    local player = getIdentity(_source)
    local min = os.time()
    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

       -- print(result)

       if result[1] ~= 0 then
                
        MySQL.Async.execute('UPDATE retro_rewards SET `isonline` = @isonline  WHERE id = @id', {
            ['@id'] = player.license,
            ['@isonline'] = 0,
        }, function(rowsChanged)
            if rowsChanged == 0 then
             
            end
        end)
    end
    end)

end)

]]--




     
--[[
  if result[1] then 
            --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already registered! Ginagawamue? ' })
        else 
            MySQL.Async.execute('INSERT INTO retro_rewards (id, taken) VALUES (@id, @taken)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
            }, function(rowsChanged)
               -- xPlayer.showNotification(_U('ambulance_belongs', plate))
               --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You are now eligible to get daily rewards from Retro City!' })
                --cb(true)
            end)
        
        end
]]--
      