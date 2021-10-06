fx_version "adamant"
game "gta5"


client_scripts {'client.lua', 'config.lua'}

server_scripts { '@mysql-async/lib/MySQL.lua', 'config.lua', 'server.lua'}

 files {
	'html/ui.html',
	'html/img/crosshairs-solid.png',
	'html/webfonts/*.*',
	'html/style.css',
    'html/pricedown_bl.woff',
	'html/pricedown_bl.woff2',
	'html/script.js'
 }

ui_page 'html/ui.html'