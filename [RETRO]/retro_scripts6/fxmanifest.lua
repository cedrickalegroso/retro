fx_version'adamant'
game 'gta5'

author 'Cedrick Alegroso'
description 'Optmized scripts pack '
version '2.1'

client_script {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'config.lua',

  --Em
  'Emergency/client.lua',
  'whistle/client.lua',

  'cl-vape.lua',
  'esx_hospital/client.lua'
}


server_script {
  '@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'config.lua',
  'locales/en.lua',

  --Em
  'Emergency/server.lua',

  'whistle/server.lua',
  'sv-vape.lua',
  'esx_hospital/server.lua'
}





-- client_script {
--   '@es_extended/locale.lua',
--   'locales/en.lua',
--   'config.lua',

--   --Em
--   'Emergency/client.lua',

--   'whistle/client.lua',

--   --hospital
--  'esx_hospital/client.lua',



--    --yacht
--    'esx_YachtHeist/client.lua',


  

--     --heli
--     'heli/heli_client.lua',

--     'cl-vape.lua'

 
   
-- }


-- server_script {
--   '@async/async.lua',
-- 	'@mysql-async/lib/MySQL.lua',
--   '@es_extended/locale.lua',
--   'config.lua',
--   'locales/en.lua',

--   --Em
--   'Emergency/server.lua',

--   'sv-vape.lua',

--   --hospital
--   'esx_hospital/server.lua',

--    'whistle/server.lua',


--       --yacht
--    'esx_YachtHeist/server.lua',


--    --heli
--    'heli/heli_server.lua',

 
-- }


