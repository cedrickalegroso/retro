ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job, bimby)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade


    print(bimby)
    

    if job == 'police' or job == 'ambulance' or job == 'groove' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('retro_scripts:radiofreqpoliceoff', source, job)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('retro_scripts:radiofreqpolon', source, job)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('retro_scripts:radiofreqemson', source, job)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offgroove' then
        xPlayer.setJob('groove', grade)
        TriggerClientEvent('retro_scripts:radiofreqgrooveon', source, job)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    end

end)




