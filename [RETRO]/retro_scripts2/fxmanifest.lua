fx_version 'adamant'

game 'gta5'

description 'RETRO SCRIPTS 2 OPTIMIZED'

Author 'CEDRICK ALEGROSO '

version '1.0.0'

ui_page 'html/index.html'

server_scripts {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'config.lua',
    'locales/en.lua',
    --MONEYWASH
    'esx_moneywash/server/main.lua',
    'esx_moneywash/version.lua',
    --DUTY
    'esx_duty/server/main.lua',
    --NKREPAIR
    'nk_repair/server.lua',
    --Ruski
    'esx_ruskiarrest/server/main.lua',
     --Jail
  'esx_qallejail/server/server.lua',
    --doorlock
    'esx_doorlock/server/main.lua',
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
    --cahingrooms
    'ChangingRooms/client.lua',
    --MONEYWASH
    'esx_moneywash/client/main.lua',
    --DUTY
    'esx_duty/client/main.lua',
    --NKREPAIR
    'nk_repair/client.lua',
    --Ruski
    'esx_ruskiarrest/client/main.lua',
     --Jail
    'esx_qallejail/client/utils.lua',
    'esx_qallejail/client/client.lua',
        --doorlock
        'esx_doorlock/client/main.lua',

    --[[ NEED OPTIMIZATION / CHANGE SCRIPT ]]
    --SIMPLETP
    --'simpletp/client.lua',
     --time
    -- 'cl_time.lua',
}

files {
    'html/index.html',
    'html/assets/css/*.css',
    'html/assets/js/*.js',
    'html/assets/fonts/roboto/*.woff',
    'html/assets/fonts/roboto/*.woff2',
    'html/assets/fonts/justsignature/JustSignature.woff',
    'html/assets/images/*.png'
}

dependencies {}

export 'GeneratePlate'
