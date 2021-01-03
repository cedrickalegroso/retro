

RegisterNetEvent('waypoint')
AddEventHandler('waypoint', function(x, y)
    print("Waypoint sets to x = " .. x .. " y = " .. y)
    SetNewWaypoint(x, y)
end)

