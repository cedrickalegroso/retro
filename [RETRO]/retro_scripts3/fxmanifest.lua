fx_version 'adamant'

game 'gta5'

description 'NEF OPTMIZED SCRIPTS FOR WHITELISTED'

Author 'CEDRICK ALEGROSO'

version '2.0.0'


ui_page 'rp-radio/index.html'

server_scripts {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',

   --ls
 'esx_lscustom/server/main.lua',

 'vSync/vs_server.lua',

 'eiiy_triggerlogs/eiiy_config.lua',
 'eiiy_triggerlogs/eiiy_ban.lua',
 
 
 'sv_annc.lua',
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

    --ls
   'esx_lscustom/client/main.lua',

 
   'vSync/vs_client.lua',

   'cl_annc.lua',

  -- 'recoil.lua',


}


files {
	'rp-radio/index.html',
	'rp-radio/on.ogg',
	'rp-radio/off.ogg',
}

exports {
	'GetFuel',
	'SetFuel'
}


shared_scripts {
	'config.lua',
}


provide 'tokovoip_script'

dependencies {
  'es_extended',


}

--[[
  server_scripts {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',

   --ls
 'esx_lscustom/server/main.lua',



  'vSync/vs_server.lua',



 'eiiy_triggerlogs/eiiy_config.lua',
 'eiiy_triggerlogs/eiiy_ban.lua',
  

  'sv_annc.lua',


 -- 'esx_YachtHeist/server.lua'

 -- 'sv_log.lua',
  'esx_pun_carwash/server.lua'


 
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',



 'vSync/vs_client.lua',

 'recoil.lua',


    --ls
   'esx_lscustom/client/main.lua',

 

  'esx_pun_carwash/client.lua',
  

      'cl_annc.lua',



      

      'cl_holster.lua',

}

]]--

