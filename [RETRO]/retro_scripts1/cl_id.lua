PlayerData = {}

local done = false

ESX = nil
 Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
    done = true
end)
--==============ESX^^^^^^No TOUCHING!================---

local policeblips = { 
	 {title="MCPD", colour=25, id=140, x = 1525.29, y= 1710.02, z= 109.00}, 
}

local ambulanceblips = { 
	 {title="EMS", colour=25, id=140, x = 1525.29, y= 1710.02, z= 109.00}, 
}
--Police blips
 Citizen.CreateThread(function() 
    while not done do
        Citizen.Wait(10)
    end
    if PlayerData.job.name == 'police' then 
        for _, info in pairs(policeblips) do 
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, false)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
      done = true
    end
end
end)

-- Ambulance blips
 Citizen.CreateThread(function() 
    while not done do
        Citizen.Wait(10)
    end
    if PlayerData.job.name == 'ambulance' then 
        for _, info in pairs(ambulanceblips) do 
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, false)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
      done = true
    end
end
end)


Citizen.CreateThread(function()
    while true do
	local id = GetPlayerServerId(PlayerId())
    Citizen.Wait(0)
DrawTxt(0.65, 1.39, 1.0,1.0,0.50,"~w~RETRO ID: ~r~".. id .."~w~", 255,255,255,255)
	end
end)

function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2 , y - height/2 + 0.005)
end
