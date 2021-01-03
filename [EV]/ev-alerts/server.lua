ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Code

RegisterServerEvent('policealerts:server:AddPoliceAlert')
AddEventHandler('policealerts:server:AddPoliceAlert', function(data, forBoth)
    forBoth = forBoth ~= nil and forBoth or false
    TriggerClientEvent('policealerts:client:AddPoliceAlert', -1, data, forBoth)
end)