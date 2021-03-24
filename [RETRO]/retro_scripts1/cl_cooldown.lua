--- CrazyFox Discord Channel: https://discord.gg/4E8sth5
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local cooldown = 0
local ispriority = false
local ishold = false

RegisterCommand("resetpcd", function()
    TriggerServerEvent("cancelcooldown")
end, false)

RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustReleased(0, Keys['F10']) and IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)

		-- D-pad up on controllers works, too!
		elseif IsControlJustReleased(0, 172) and not IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)
		end
	end
end)


local scorebo = false
function ToggleScoreBoard()
	scorebo = not scorebo
	if scorebo then
		Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5)
                if ishold == true then
                    DrawText2("Priority Cooldown: ~b~Priorities Are On Hold")
                elseif ispriority == false then
                    DrawText2("Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
                elseif ispriority == true then
                    DrawText2("Priority Cooldown: ~g~Priority In Progress")
                end
            end
        end)
	else
		Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5)
               
                    DrawText2("")
               
            end
        end)
	end
	SendNUIMessage({
		action = 'toggle'
	})
end

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ishold == true then
			DrawText2("Priority Cooldown: ~b~Priorities Are On Hold")
		elseif ispriority == false then
			DrawText2("Priority Cooldown: ~r~".. cooldown .." ~w~Mins")
		elseif ispriority == true then
			DrawText2("Priority Cooldown: ~g~Priority In Progress")
		end
	end
end)
]]--

function DrawText2(text)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.3)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(0.15, 0.923)
    end


	

  

