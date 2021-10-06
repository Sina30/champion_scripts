resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'champion_healing'

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'@es_extended/locale.lua',
    'server/main.lua',
}
client_script "api-ac_eTqUfinvjahH.lua"
client_script "api-ac_JzFpOzayCWif.lua"