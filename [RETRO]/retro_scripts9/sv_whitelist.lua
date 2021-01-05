
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


RegisterCommand("loadweapons", function(source)

    print('take loadouts')

    TriggerEvent('esx:restoreLoadout', source)

    
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

        MySQL.Async.execute('UPDATE retro_rewards SET `taken` = @taken, time = @time', {
            ['@taken'] = 0,
            ['@time'] = 0
        }, function(rowsChanged)
            if rowsChanged == 0 then
              print('RETRO CITY REWARDS HAS BEEN RESTARTED!')
            end
        end)

    end
   
end)



RegisterCommand("rewardregister", function(source)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local player = getIdentity(source)
    print('License '..player.license..' registered for Retro City Daily rewards!')

    MySQL.Async.fetchAll('SELECT * FROM retro_rewards WHERE id = @id ', {
        ['@id'] = player.license,
    }, function(result)

        if result[1] then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already registered! Ginagawamue? ' })
        else 
            MySQL.Async.execute('INSERT INTO retro_rewards (id, taken, time) VALUES (@id, @taken, @time)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
                ['@time'] = os.time(os.date("!*t"))
            }, function(rowsChanged)
               -- xPlayer.showNotification(_U('ambulance_belongs', plate))
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You are now eligible to get daily rewards from Retro City!' })
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

                            --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'player has been playing for '.. epochunix - result[1].time })

                            if epochunix - result[1].time >= 2500 then 
                            
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
                                xPlayer.addWeapon(item, amount)
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You just claimed the reward for today! '..item..' with '..amount..' of bullets.'})
                            end

                            MySQL.Async.execute('UPDATE retro_rewards SET `taken` = @taken WHERE id = @id', {
                                ['@id'] = player.license,
                                ['@taken'] = 1,
                            }, function(rowsChanged)
                                if rowsChanged == 0 then
                                
                                end
                            end)

                            else 
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! You must play for a while first before receiving your daily reward!' })
                                Citizen.Wait(5000)
                            end

                            else 
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already claimed a daily reward. Wait until 6:00 A.M to get more rewards!' })
                            end



            else 

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is not yet registerd to daily rewards type /rewardregister' })
            end


 

    end)
    
end)


     
--[[
  if result[1] then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Ooff! This license is already registered! Ginagawamue? ' })
        else 
            MySQL.Async.execute('INSERT INTO retro_rewards (id, taken) VALUES (@id, @taken)', {
                ['@id'] = player.license,
                ['@taken'] = 0,
            }, function(rowsChanged)
               -- xPlayer.showNotification(_U('ambulance_belongs', plate))
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Success! You are now eligible to get daily rewards from Retro City!' })
                --cb(true)
            end)
        
        end
]]--
      