resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/v_int_shop.ytyp'

files {
    'stream/v_int_shop.ytyp'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'config/config.lua',
    'server/main.lua',
    'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
    'config/config.lua',
    'client/main.lua',
    'locales/en.lua'
}

