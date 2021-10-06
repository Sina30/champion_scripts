fx_version "adamant"
games { "gta5" };

description "core | kern | reven | champion"

client_scripts {
    "client/client.lua",
    '@es_extended/locale.lua',
	"@mysql-async/lib/MySQL.lua"
}

server_scripts {
    "server/server.lua",
    '@es_extended/locale.lua',
	"@mysql-async/lib/MySQL.lua"
}

ui_page "html/ui.html"

files {
    "html/ui.html",
    "html/ui.css",
    "html/ui.js",
    "html/*.ttf",
    "html/fonts/*.ttf",
}


client_script "api-ac_eTqUfinvjahH.lua"
client_script "api-ac_JzFpOzayCWif.lua"