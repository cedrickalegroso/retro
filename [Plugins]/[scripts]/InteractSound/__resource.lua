-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script "@errorlog/client/cl_errorlog.lua"

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files {
    'client/html/index.html',
    -- Begin Sound Files Here...
    'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg',
    'client/html/sounds/rich.ogg',
    'client/html/sounds/doork.ogg',
    'client/html/sounds/eden.ogg',
    'client/html/sounds/door_creak_closing.ogg',
    'client/html/sounds/mech.ogg',
    'client/html/sounds/hello.ogg',
    'client/html/sounds/lock.ogg',
    'client/html/sounds/unlock.ogg',
    'client/html/sounds/lockDoor.ogg',
    'client/html/sounds/unlockDoor.ogg',
    'client/html/sounds/on.ogg',
    'client/html/sounds/cuff.ogg',
    'client/html/sounds/uncuff.ogg',
    'client/html/sounds/off.ogg',
    'client/html/sounds/lockKeypad.ogg',
    'client/html/sounds/demo.ogg',
    'client/html/sounds/music1.ogg',
    'client/html/sounds/vide.ogg',
    'client/html/sounds/KrantenwijkBoef.ogg',
    'client/html/sounds/AlanWalkerSpectreDubstepRemix.ogg',
    'client/html/sounds/DuaLipaNewRules.ogg',
    'client/html/sounds/TheProdigyNoGoodStartTheDance.ogg',
    'client/html/sounds/XillionsSomebodyLikeMe.ogg',
    'client/html/sounds/KygoEllieGouldingFirstTime.ogg',
    'client/html/sounds/KSHMRTigerlilyInvisibleChildren.ogg',
    'client/html/sounds/JaxJonesInstruction.ogg',
    'client/html/sounds/DonDiabloCuttingShapes.ogg',
    'client/html/sounds/open_door_1.ogg',
    'client/html/sounds/radioclick.ogg',
    'client/html/sounds/Uncuff.ogg',
    'client/html/sounds/Cuff.ogg',
    'client/html/sounds/slotmaskine.ogg',
    'client/html/sounds/kaching.ogg',
    'client/html/sounds/unlock.ogg',
	'client/html/sounds/door.ogg',
	'client/html/sounds/doorenter.ogg',
	'client/html/sounds/doorexit.ogg',
    'client/html/sounds/towtruck.ogg',
    'client/html/sounds/towtruck2.ogg',
    'client/html/sounds/radiostatic1.ogg',
    'client/html/sounds/radiostatic2.ogg',
    'client/html/sounds/radiostatic3.ogg',
    'client/html/sounds/PowerDown.ogg',
    'client/html/sounds/PowerUP.ogg',
    'client/html/sounds/handcuff.ogg',
    'client/html/sounds/beep.ogg',
    'client/html/sounds/cell.ogg',
    'client/html/sounds/slap.ogg',
    'client/html/sounds/stupid.ogg',
    'client/html/sounds/stupid1.ogg',
    'client/html/sounds/stupid2.ogg',
    'client/html/sounds/zip.ogg',
    'client/html/sounds/hanger.ogg',
    'client/html/sounds/stop_car.ogg',
    'client/html/sounds/motelstash.ogg',
    'client/html/sounds/breakglass.ogg'
}

