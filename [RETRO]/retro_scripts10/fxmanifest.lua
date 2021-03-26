fx_version 'adamant'

game 'gta5'

description 'ESX Advanced Garage'

Author 'Human Tree92 | Velociti Entertainment'

version '1.0.0'


ui_page 'html/index.html'


server_scripts {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',
  

	
	'esx-ecobottles/server/main.lua',
	
  'retro_logs/server/server.lua',
  'retro_logs/versioncheck.lua',

  	
	'esx_AdvancedFishing/server.lua',
	'esx_AdvancedFishing/server_config.lua',
	
  'AddictionRentBoats/server.lua',

  'chat_commands.lua',
}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  '@PolyZone/client.lua',
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',

 
 
 'esx-ecobottles/client/main.lua',
 
 'retro_logs/client/client.lua',

 'ragdoll/client.lua',

 'cl_pvp.lua',

 'cl_acc.lua',

 'cl_discrich.lua',

 'AddictionRentBoats/client.lua',

 'esx_AdvancedFishing/client.lua',
}


file 'retro_logs/postals.json'
postal_file 'retro_logs/postals.json'
file 'retro_logs/version.json'


--[[
server_scripts {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',
  

  'retro_logs/server/server.lua',
  'retro_logs/versioncheck.lua',

  --'hunting/server/main.lua',

    --'esx_TruckRobbery/server.lua',
	
	'esx_AdvancedFishing/server.lua',
	'esx_AdvancedFishing/server_config.lua',
	
	'esx-ecobottles/server/main.lua',
	
  'AddictionRentBoats/server.lua',
  'emsbeds/server.lua' ,

  'chat_commands.lua',

  'cl_discrich.lua'
 
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',

 'retro_logs/client/client.lua',

 'HideInTrunk/client.lua',

 --'hunting/client/main.lua',

-- 'esx_TruckRobbery/client.lua',
 
 'esx_AdvancedFishing/client.lua',
 
 'ragdoll/client.lua',

 'cl_pvp.lua',

 'cl_acc.lua',

 'cl_discrich.lua',
 
 'esx-ecobottles/client/main.lua',
 
 'AddictionRentBoats/client.lua',
 'emsbeds/client.lua',
 
 'weapon-dmg.lua'
}
]]--

