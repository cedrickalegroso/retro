fx_version 'adamant' 
game 'gta5' 
description 'Check in at the hospital.'
version '1.1'
 
client_scripts {
	'@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua', 
	'language.lua', 
	'license/client/main.lua',
	'check/client.lua',
	'tv/client.lua',
	'handcuff/client.lua',
	'rope/client.lua',
	'bag/client/main.lua',
	'deff/client/main.lua',
	'drug/client/client.lua',
	'drugb/client/client.lua',
	'drugb/client/uitls.lua',
	'bank/client/client.lua',
	'bank/client/protection_cl.lua',
	'bank/client/ulits.lua',
	'keys/script_files/language.lua',
	'keys/script_files/config.lua',
	'keys/script_files/client.lua',
	'keys/script_files/utils.lua',
	'keys/protection/client.lua' 
} 
 
server_scripts { 
	'@es_extended/locale.lua',
    'locales/en.lua',
	'config.lua', 
	'language.lua', 
	'handcuff/server.lua',
	'rope/server.lua',
	'tv/server.lua',
	'check/server.lua',
	'bag/server/main.lua',
	'deff/server/main.lua',
	'bank/server/protection_sv.lua',
	'bank/server/server.lua',
	'drug/server/server.lua',
	'drugb/server/server.lua',
	'license/server/main.lua',
	'keys/script_files/language.lua',
	'keys/script_files/config.lua',
	'keys/script_files/server.lua',
	'keys/protection/server.lua',
	'@mysql-async/lib/MySQL.lua'
} 
