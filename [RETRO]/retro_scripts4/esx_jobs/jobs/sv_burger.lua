--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------

-- LEPIEJ NIE DOTYKAJ -- CHYBA ŻE WIESZ CO ROBISZ --


ESX 					= nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('chocolate', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('wburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'zjadłeś burgera')

end)

RegisterServerEvent('wojtek_burgerownia:hajs')
AddEventHandler('wojtek_burgerownia:hajs', function()
	-- Definicje hajsu
	local h1 = ConfigBurger.Wyplata1
	local h2 = ConfigBurger.Wyplata2
	local ht = ConfigBurger.Wyplatanielosuj
	local h3 = math.random(h1,h2)
	--
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vburger = xPlayer.getInventoryItem('wburger').count

if vburger > 0 then

	if ConfigBurger.losujwyplate == true then
	xPlayer.addMoney(h3)
	TriggerClientEvent('esx:showNotification', source, 'You earned ~g~'..h3..' $')
	xPlayer.removeInventoryItem('wburger', 1)
	else
	xPlayer.addMoney(ht)
	TriggerClientEvent('esx:showNotification', source, 'You earned ~g~'..ht..' $')
	xPlayer.removeInventoryItem('wburger', 1)
	end

	TriggerClientEvent('wojtek_burgerownia:losowanko', source)

else
	TriggerClientEvent('esx:showNotification', source, '~r~You dont have burgers for sale!')
end

	TriggerClientEvent('wojtek_burgerownia:falarm', source)

end)

RegisterServerEvent('wojtek_burgerownia:pow')
AddEventHandler('wojtek_burgerownia:pow', function()
	-- Definicje hajsu
	local h1 = ConfigBurger.Wyplata1
	local h2 = ConfigBurger.Wyplata2
	local h3 = math.random(h1,h2)
	local ht = ConfigBurger.Wyplatanielosuj
	--
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('esx:showNotification', source, '~b~Youre starting a change!')
	if ConfigBurger.losujwyplate == true then
	TriggerClientEvent('esx:showNotification', source, 'For each burger you will receive a salary from ~g~'..h1..'$~w~ of ~g~'..h2..'$' )
	else
	TriggerClientEvent('esx:showNotification', source, 'Youll be rewarded for each burger: ~g~'..ht..'$' )
	end
end)

RegisterServerEvent('wojtek_burgerownia:pow2')
AddEventHandler('wojtek_burgerownia:pow2', function()

    local _source = source

	TriggerClientEvent('esx:showNotification', source, '~r~Youre ending the change!')
end)

RegisterServerEvent('wojtek_burgerownia:pow4')
AddEventHandler('wojtek_burgerownia:pow4', function()

    local _source = source

	TriggerClientEvent('esx:showNotification', source, '~g~You cleaned the toilet!')
end)

RegisterServerEvent('wojtek_burgerownia:pow3')
AddEventHandler('wojtek_burgerownia:pow3', function()

    local _source = source
	local cosiestalo = math.random(1,5)

        if cosiestalo == 1 then
            TriggerClientEvent('esx:showNotification', source, '~r~This meat was probably spoiled')
        elseif cosiestalo == 2 then
            TriggerClientEvent('esx:showNotification', source, '~r~This lettuce was probably broken')
        elseif cosiestalo == 3 then
            TriggerClientEvent('esx:showNotification', source, '~r~This tomato probably was broken')
        elseif cosiestalo == 4 then
            TriggerClientEvent('esx:showNotification', source, '~r~This ketchup probably was broken')
        else
            TriggerClientEvent('esx:showNotification', source, '~r~This bun was probably broken')
        end

            TriggerClientEvent('esx:showNotification', source, '~o~Kilent vomited after eating your burger')
            TriggerClientEvent('esx:showNotification', source, '~b~You need to clean the ~y~Toilet')
	
end)

RegisterServerEvent('wojtek_burgerownia:dajitembulka')
AddEventHandler('wojtek_burgerownia:dajitembulka', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vbulka = xPlayer.getInventoryItem('wbulka').count

	if vbulka < ConfigBurger.maxbulka then
	TriggerClientEvent('esx:showNotification', source, '~b~You take out the bun!')
	xPlayer.addInventoryItem('wbulka', 1)
	else
	TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum number of rolls!')
	end
end)

RegisterServerEvent('wojtek_burgerownia:dajitempomidor')
AddEventHandler('wojtek_burgerownia:dajitempomidor', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vpomidor = xPlayer.getInventoryItem('wpomidor').count

	if vpomidor < ConfigBurger.maxpomidor then
		TriggerClientEvent('esx:showNotification', source, '~b~You take out the tomato!')
		xPlayer.addInventoryItem('wpomidor', 1)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum number of tomatoes!')
	end
end)

RegisterServerEvent('wojtek_burgerownia:dajitemsalata')
AddEventHandler('wojtek_burgerownia:dajitemsalata', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vsalata = xPlayer.getInventoryItem('wsalata').count

	if vsalata < ConfigBurger.maxsalata then
		TriggerClientEvent('esx:showNotification', source, '~b~You take out lettuce')
		xPlayer.addInventoryItem('wsalata', 1)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum amount of lettuce!')
	end
end)

RegisterServerEvent('wojtek_burgerownia:dajitemmieso')
AddEventHandler('wojtek_burgerownia:dajitemmieso', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vmieso = xPlayer.getInventoryItem('wmieso').count

	if vmieso < ConfigBurger.maxmieso then
		TriggerClientEvent('esx:showNotification', source, '~b~You take out the meat!')
		xPlayer.addInventoryItem('wmieso', 1)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum amount of meat!')
	end
end)

RegisterServerEvent('wojtek_burgerownia:dajitemketchup')
AddEventHandler('wojtek_burgerownia:dajitemketchup', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vketchup = xPlayer.getInventoryItem('wketchup').count

	if vketchup < ConfigBurger.maxketchup then
		TriggerClientEvent('esx:showNotification', source, '~b~You take out ketchup!')
		xPlayer.addInventoryItem('wketchup', 1)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum amount of ketchup!')
	end
end)

RegisterServerEvent('wojtek_burgerownia:dajitemburger')
AddEventHandler('wojtek_burgerownia:dajitemburger', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vburger = xPlayer.getInventoryItem('wburger').count

end)

RegisterServerEvent('wojtek_burgerownia:czymozesmazyc')
AddEventHandler('wojtek_burgerownia:czymozesmazyc', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vmieso = xPlayer.getInventoryItem('wmieso').count
	local vgmieso = xPlayer.getInventoryItem('wgmieso').count

	if vmieso > 0 and vgmieso < ConfigBurger.maxgmieso then 
	xPlayer.removeInventoryItem('wmieso', 1)
	TriggerClientEvent('wojtek_burgerownia:animacjasmazenia', source)
	elseif vmieso < 0 or vmieso == 0 then
		TriggerClientEvent('esx:showNotification', source, '~r~You dont have meat!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	elseif vgmieso == ConfigBurger.maxgmieso or vgmieso > ConfigBurger.maxgmieso then
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum amount of fried meat!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	end

end)

RegisterServerEvent('wojtek_burgerownia:czymozemyc') 
AddEventHandler('wojtek_burgerownia:czymozemyc', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vsalata = xPlayer.getInventoryItem('wsalata').count
	local vgsalata = xPlayer.getInventoryItem('wgsalata').count

	if vsalata > 0 and vgsalata < ConfigBurger.maxgsalata then 
	xPlayer.removeInventoryItem('wsalata', 1)
	TriggerClientEvent('wojtek_burgerownia:animacjamycia', source)
	elseif vsalata < 0 or vsalata == 0 then
		TriggerClientEvent('esx:showNotification', source, '~r~You dont have lettuce!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	elseif vgsalata == 5 or vgsalata > 5 then
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum amount of lettuce you wash!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	end

end)

RegisterServerEvent('wojtek_burgerownia:czymozekroic') 
AddEventHandler('wojtek_burgerownia:czymozekroic', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local vpomidor = xPlayer.getInventoryItem('wpomidor').count
	local vgpomidor = xPlayer.getInventoryItem('wgpomidor').count

	if vpomidor > 0 and vgpomidor < ConfigBurger.maxgpomidor then 
	xPlayer.removeInventoryItem('wpomidor', 1)
	TriggerClientEvent('wojtek_burgerownia:animacjakrojenia', source)
	elseif vpomidor < 0 or vpomidor == 0 then
		TriggerClientEvent('esx:showNotification', source, '~r~You dont have tomatoes!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	elseif vgpomidor == 5 or vgpomidor > 5 then
		TriggerClientEvent('esx:showNotification', source, '~r~You already have the maximum number of chopped tomatoes!') 
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	end

end)

RegisterServerEvent('wojtek_burgerownia:czymozeprzygotowac') 
AddEventHandler('wojtek_burgerownia:czymozeprzygotowac', function()

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	local vgpomidor = xPlayer.getInventoryItem('wgpomidor').count
	local vgsalata = xPlayer.getInventoryItem('wgsalata').count
	local vgmieso = xPlayer.getInventoryItem('wgmieso').count
	local vketchup = xPlayer.getInventoryItem('wketchup').count
	local vbulka = xPlayer.getInventoryItem('wbulka').count

	if vgpomidor > 0 and vgsalata > 0 and vgmieso > 0 and vketchup > 0 and vbulka > 0 then 

	xPlayer.removeInventoryItem('wgpomidor', 1)
	xPlayer.removeInventoryItem('wgsalata', 1)
	xPlayer.removeInventoryItem('wgmieso', 1)
	xPlayer.removeInventoryItem('wketchup', 1)
	xPlayer.removeInventoryItem('wbulka', 1)

	TriggerClientEvent('wojtek_burgerownia:animacjaprzygotowania', source)
	else
		TriggerClientEvent('esx:showNotification', source, '~r~You dont have enough ingredients')
		TriggerClientEvent('esx:showNotification', source, '~w~To prepare a burger you will sweat: ~y~1x ~b~bulka~w~, ~y~1x ~b~fried meat~w~, ')
		TriggerClientEvent('esx:showNotification', source, '~w~~y~1x ~b~chopped tomato~w~, ~y~1x ~b~washed lettuce~w~, ~y~1x ~b~ketchup')
		TriggerClientEvent('wojtek_burgerownia:falarm', source)
	end

end)

RegisterServerEvent('wojtek_burgerownia:dajitemgmieso')
AddEventHandler('wojtek_burgerownia:dajitemgmieso', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)



	xPlayer.addInventoryItem('wgmieso', 1)


end)

RegisterServerEvent('wojtek_burgerownia:dajitemgpomidor')
AddEventHandler('wojtek_burgerownia:dajitemgpomidor', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)



	xPlayer.addInventoryItem('wgpomidor', 1)


end)

RegisterServerEvent('wojtek_burgerownia:dajitemgsalata')
AddEventHandler('wojtek_burgerownia:dajitemgsalata', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)



	xPlayer.addInventoryItem('wgsalata', 1)


end)

RegisterServerEvent('wojtek_burgerownia:dajitemburger')
AddEventHandler('wojtek_burgerownia:dajitemburger', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)



	xPlayer.addInventoryItem('wburger', 1)


end)
--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------