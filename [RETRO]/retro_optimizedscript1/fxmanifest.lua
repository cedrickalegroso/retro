fx_version'bodacious'
game 'gta5'

author 'Cedrick Alegroso'
description 'Optmized scripts pack '
version '2.1'




client_script {
  '@es_extended/locale.lua',
  'config.lua',
   'client.lua'
   
}


server_script {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  
  'server.lua'
    
}

files {
 
}

  

dependencies {
    'es_extended',
}

