ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(1)
    end
end)  

local blips = {
    {title="Sell Shop", colour=1, id=108, x = 182.58, y = -1319.17, z = 29.32}
  }
  
  Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
  
local sellshop = {
    {x = 182.58, y = -1319.17, z = 29.32}
}
  
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(sellshop) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellshop[k].x, sellshop[k].y, sellshop[k].z)
          if dist <= 0.5 then
            YMDrawText3D(plyCoords.x, plyCoords.y, plyCoords.z, "~w~Press ~r~[E] ~w~ to use sell shop!")
            if IsControlJustPressed(0, 38)then
                OpenSellMenu()
            end
          end		
        end
    end
end)

function OpenSellMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'sell_menu',
        {
            title    = 'Sell Your Shit',
            align    = 'center',
            elements = {
                {label = 'Ring ($350)', value = 'ring'},
                {label = 'Rolex ($1150)', value = 'rolex'},
                {label = 'Camera ($135)', value = 'camera'},
                {label = 'Gold Necklace ($345)', value = 'goldNecklace'},
                {label = 'Laptop ($1750)', value = 'laptop'},
                {label = 'Samsung ($925)', value = 'samsungS10'},
                {label = 'Gold ($2500)', value = 'gold'},
                {label = 'Diamond ($5000)', value = 'diamond'},
                {label = 'PSP ($350)', value = 'psp'},
                {label = '2ct_gold_chain ($500)', value = '2ct_gold_chain'},
                {label = '5ct_gold_chain ($800)', value = '5ct_gold_chain'},
            }
        },
  
        function(data, menu)
            if data.current.value == 'ring' then
                TriggerServerEvent('ev-sellshop:sellring')
            elseif data.current.value == 'rolex' then
                TriggerServerEvent('ev-sellshop:sellrolex')
            elseif data.current.value == 'camera' then
                TriggerServerEvent('ev-sellshop:sellcamera')
            elseif data.current.value == 'goldNecklace' then
                TriggerServerEvent('ev-sellshop:sellgoldNecklace')
            elseif data.current.value == 'laptop' then
                TriggerServerEvent('ev-sellshop:selllaptop')
            elseif data.current.value == 'samsungS10' then
                TriggerServerEvent('ev-sellshop:sellsamsungS10')
              elseif data.current.value == 'gold' then
                TriggerServerEvent('ev-sellshop:gold')
              elseif data.current.value == 'diamond' then
                TriggerServerEvent('ev-sellshop:diamond')
              elseif data.current.value == 'psp' then
                TriggerServerEvent('ev-sellshop:sellpsp')
            elseif data.current.value == '2ct_gold_chain' then
                TriggerServerEvent('ev-sellshop:sell2ct_gold_chain')
            elseif data.current.value == '5ct_gold_chain' then
                TriggerServerEvent('ev-sellshop:sell5ct_gold_chain')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function YMDrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end