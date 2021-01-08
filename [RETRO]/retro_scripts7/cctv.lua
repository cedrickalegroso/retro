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

scanId = 0
cityRobbery = false
local myspawns = {}
CCTVCamLocations = {
	
	--HP
	[1] =  { ['x'] = -452.12023925781,['y'] = -398.00900268555,['z'] = 43.367488861084,['h'] = 212.6, ['info'] = ' HP', ["recent"] = false },
	--PD
	[2] =  { ['x'] = 425.00146484375,['y'] = -948.67236328125,['z'] = 41.992057800293,['h'] = 173.26, ['info'] = ' PD', ["recent"] = false },
	--BRIDGE NEAR PD
	[3] =  { ['x'] = 800.09991455078,['y'] = -989.89984130859,['z'] = 39.200000762939,['h'] = 75.0, ['info'] = ' Street 1', ["recent"] = false },
    --PG
	[4] =  { ['x'] = 43.101955413818,['y'] = -903.98779296875,['z'] = 35.039684295654,['h'] = 35.04, ['info'] = 'PG', ["recent"] = false },
    --JOB CENTER
	[5] =  { ['x'] = -233.31382751465,['y'] = -974.89978027344,['z'] = 35.038841247559,['h'] = 122.97, ['info'] = 'JOB CENTER', ["recent"] = false },
	 --MECH
	[6] =  { ['x'] = -39.495140075684,['y'] = -1828.6320800781,['z'] =33.760990142822,['h'] = 173.97, ['info'] = 'MECH', ["recent"] = false },
	 --WEAZEL
	 [7] =  { ['x'] = -626.361328125,['y'] = -942.92358398438,['z'] =28.819599151611,['h'] = 338.96, ['info'] = 'WEAZEL', ["recent"] = false },
	  --CAR
	  [8] =  { ['x'] = -78.733833312988,['y'] = -1122.6527099609,['z'] =32.807167053223,['h'] = 248.95, ['info'] = 'CAR DEALER', ["recent"] = false },
 --HYW 1
	  [9] =  { ['x'] = -3002.1872558594,['y'] = 2065.8059082031,['z'] =52.463283538818,['h'] = 233.94, ['info'] = 'HIGH WAY 1', ["recent"] = false },
--POSTAL 5000
	  [10] =  { ['x'] = -541.04113769531,['y'] = 2838.8898925781,['z'] =43.024574279785,['h'] = 233.94, ['info'] = 'POSTAL 5000', ["recent"] = false },
	  --POSTAL 5024
	  [11] =  { ['x'] = 1287.4049072266,['y'] = 1212.0751953125,['z'] =113.54605865479,['h'] = 274.94, ['info'] = 'POSTAL 5024', ["recent"] = false },
	  [12] =  { ['x'] = -42.791797637939,['y'] = -1754.9866943359,['z'] =29.747611999512,['h'] = 79.85, ['info'] = 'POSTAL 9094', ["recent"] = false },
	  [13] =  { ['x'] = -1483.3177490234,['y'] = -380.63800048828,['z'] =41.108379364014,['h'] = 74.88, ['info'] = 'POSTAL 7169', ["recent"] = false },
	  [14] =  { ['x'] =  -1225.3762207031,['y'] = -910.26916503906,['z'] =13.320523262024,['h'] = 336.88, ['info'] = 'POSTAL 8093', ["recent"] = false },
	  [15] =  { ['x'] = -704.76904296875,['y'] = -908.53753662109,['z'] =19.601583480835,['h'] = 113.54, ['info'] = 'POSTAL 8140', ["recent"] = false },
	  [16] =  { ['x'] = 24.5882396698,['y'] = -1348.7779541016,['z'] =30.32403755188,['h'] = 296.57, ['info'] = 'POSTAL 9046', ["recent"] = false },
	  [17] =  { ['x'] =  1133.5686035156,['y'] = -978.37054443359,['z'] =47.116744995117,['h'] = 225.66, ['info'] = 'POSTAL 7326', ["recent"] = false },
	  [18] =  { ['x'] = 1165.1739501953,['y'] = -318.32751464844,['z'] =69.717147827148,['h'] = 225.66, ['info'] = 'POSTAL 7302', ["recent"] = false },
	  [19] =  { ['x'] = 372.28631591797,['y'] = 324.94189453125,['z'] =104.19003295898,['h'] = 302.81, ['info'] = 'POSTAL 7093', ["recent"] = false },
	  [20] =  { ['x'] = -1822.1756591797,['y'] = 797.90740966797,['z'] =138.52102661133,['h'] = 302.81, ['info'] = 'POSTAL 5016', ["recent"] = false },
	  [21] =  { ['x'] = -3047.0234375,['y'] = 582.12744140625,['z'] =9.0930051803589, ['h'] = 331.67, ['info'] = 'POSTAL 5047', ["recent"] = false },
	  [22] =  { ['x'] = -3250.7373046875,['y'] = 1000.865234375,['z'] = 13.33399772644, ['h'] = 309.95, ['info'] = 'POSTAL 5037', ["recent"] = false },
	  [23] =  { ['x'] = 550.07336425781,['y'] = 2662.8354492188,['z'] = 42.52799987793, ['h'] = 51.09, ['info'] = 'POSTAL 4019', ["recent"] = false },
	  [24] =  { ['x'] = 1169.8388671875,['y'] = 2711.1728515625,['z'] = 38.604465484619, ['h'] = 128.82, ['info'] = 'POSTAL 4024', ["recent"] = false },
	  [25] =  { ['x'] = 2670.4152832031,['y'] = 3283.5444335938,['z'] = 56.429000854492, ['h'] = 283.39, ['info'] = 'POSTAL 3051', ["recent"] = false },
	  [26] =  { ['x'] = 1955.92578125,['y'] = 3747.3664550781,['z'] = 32.717998504639, ['h'] = 259.17, ['info'] = 'POSTAL 3008', ["recent"] = false },
	  [27] =  { ['x'] = -2966.541015625,['y'] = 387.08828735352,['z'] =15.795997619629,['h'] = 42.68, ['info'] = 'POSTAL 1000', ["recent"] = false },
	  [28] =  { ['x'] = 143.36492919922,['y'] = -1040.0875244141,['z'] =29.608064651489,['h'] = 288.68, ['info'] = 'POSTAL 8170', ["recent"] = false },
	  [29] =  { ['x'] = 256.17816162109,['y'] = 209.78234863281,['z'] =110.88922119141,['h'] = 339.68, ['info'] = 'POSTAL 7090', ["recent"] = false },
	  [30] =  { ['x'] = 256.17816162109,['y'] = 209.78234863281,['z'] =110.88922119141,['h'] = 339.68, ['info'] = 'POSTAL 7090', ["recent"] = false },
	  [31] =  { ['x'] =  -108.41609191895,['y'] = 6462.19140625,['z'] =31.569828033447,['h'] = 343.68, ['info'] = 'POSTAL 1055', ["recent"] = false },
	  [32] =  { ['x'] =  -2961.1865234375,['y'] = 476.55648803711,['z'] =15.937076568604,['h'] = 343.68, ['info'] = 'POSTAL 5070', ["recent"] = false },
	  [33] =  { ['x'] =   1181.361328125,['y'] =2708.4521484375,['z'] =38.328010559082,['h'] = 154.68, ['info'] = 'POSTAL 4024', ["recent"] = false },
	  [34] =  { ['x'] =    -1217.5894775391,['y'] =-334.8860168457,['z'] =38.01545715332,['h'] = 337.68, ['info'] = 'POSTAL 7175', ["recent"] = false },
	  [35] =  { ['x'] =    -357.38436889648,['y'] =-49.252403259277,['z'] =49.272918701172,['h'] = 337.68, ['info'] = 'POSTAL 7185', ["recent"] = false },
	  [36] =  { ['x'] =    307.73236083984,['y'] =-278.47225952148,['z'] =54.404773712158,['h'] = 289.68, ['info'] = 'POSTAL 7193', ["recent"] = false },

	 
	
	  
	  
	
	 
	  
}



ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
  end)

RegisterCommand("policetv", function (source, args, rawCommand)

	local cam = args[1]

	local xPlayer = ESX.GetPlayerData()
	local job = xPlayer.job
	local jobname = xPlayer.job.name
	if job and jobname == 'police' then
		TriggerEvent('cctv:camera', cam)
	end

end)

inCam = false
cctvCam = 0
RegisterNetEvent("cctv:camera")
AddEventHandler("cctv:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #CCTVCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("cctv:startcamera",camNumber)
		else
			exports['mythic_notify']:SendAlert('error', "This camera appears to be faulty")
		end
	end
end)

RegisterNetEvent("cctv:startcamera")
AddEventHandler("cctv:startcamera", function(camNumber)

	-- TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = CCTVCamLocations[camNumber]["x"]
	local y = CCTVCamLocations[camNumber]["y"]
	local z = CCTVCamLocations[camNumber]["z"]
	local h = CCTVCamLocations[camNumber]["h"]

	print("starting cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)
	local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	local lPed = GetPlayerPed(-1)
	cctvCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cctvCam,x,y,z+1.2)						
	SetCamRot(cctvCam, -15.0,0.0,h)
	SetCamFov(cctvCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while inCam do
		SetCamCoord(cctvCam,x,y,z+1.2)						
		-- SetCamRot(cctvCam, -15.0,0.0,h)
		PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
		PushScaleformMovieFunctionParameterFloat(GetEntityCoords(h).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(cctvCam, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(cctvCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(cctvCam, 2)

			if IsControlPressed(1, Keys['N4']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['N6']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['N8']) then
				SetCamRot(cctvCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['N5']) then
				SetCamRot(cctvCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)