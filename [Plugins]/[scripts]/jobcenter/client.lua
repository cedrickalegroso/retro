---------------------------------- VAR ----------------------------------
isCop = false
curJob = nil

local changeYourJob = { 
  {name="Job Center", colour=17, id=351, x=-1105.79, y=-277.64, z=37.7},
}

local jobs = {
  {name="Unemployed", id="unemployed"},
  {name="Fisherman Job", id="fisherman"},
  {name="Miner Job", id="miner"},
  {name="Taxi Job", id="taxi"},
  {name="Garbage Job", id="garbage"},
}

---------------------------------- FUNCTIONS ----------------------------------

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end

function menuJobs()
  MenuTitle = "Jobs"
  ClearMenu()


  for _, item in pairs(jobs) do
    local nameJob = item.name
    local idJob = item.id
    Menu.addButton(nameJob,"SetJob",idJob)
  end

  Menu.addButton('Exit',"SetJob",'exit')


end

function SetJob(job)
  if job == 'exit' then
    ClearMenu()
  else
    TriggerServerEvent('jobsystem:Job', job)
  end
end

local zones = {
  vector3(-1081.93, -248.09, 37.76)
}

-- #MarkedForMarker
Citizen.CreateThread(function()
  
  while true do
    Citizen.Wait(0)
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for k,v in pairs(zones) do
      local dist = Vdist2(GetEntityCoords(PlayerPedId()), v.x,v.y,v.z)
      if dist < 50 then
        DrawMarker(27,v.x,v.y,v.z, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0) 
        if dist < 5 then
        drawTxt('Press ~b~E~s~ to access jobs center',0,1,0.5,0.8,0.35,255,255,255,255)
          if IsControlJustPressed(0, 38) then
            menuJobs()
            Menu.hidden = not Menu.hidden 
          end
        end
      else
        Citizen.Wait(1000)
      end
    end

    Menu.renderGUI()

    
  end
end)


local blips = {
   {title="Job Center", colour=5, id=408, x=-1082.09, y=-247.89, z=37.76}
}
    
Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 408)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.6)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)

