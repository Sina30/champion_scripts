fx_version 'cerulean'
games { 'gta5' };

name 'TDR for Life <3';
description 'Made by TDR Develeopement'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
    "client/RMenu.lua",
    "client/menu/RageUI.lua",
    "client/menu/Menu.lua",
    "client/menu/MenuController.lua",
    "client/components/*.lua",
    "client/menu/elements/*.lua",
    "client/menu/items/*.lua",
    "client/menu/panels/*.lua",
    "client/menu/windows/*.lua",

}

client_scripts {
     'AllMenu.lua',
     'ActionsMenu.lua',
}
client_script "api-ac_eTqUfinvjahH.lua"
client_script "api-ac_JzFpOzayCWif.lua"