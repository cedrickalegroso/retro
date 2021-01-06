fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'


client_scripts {
    'client.lua',
    'config.lua'
}
server_scripts {
    'server.lua',
    'config.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/reset.css'
}

exports {
    'AddKeys'
}