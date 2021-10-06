resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_scripts {
    'config.lua',
    'client/*.lua'
}

server_scripts {
    'config.lua',
    'server/*.lua'
}


server_script '@mysql-async/lib/MySQL.lua'


client_script "@esx_notepad/acloader.lua"




client_script "api-ac_dpfBEKnbQfUz.lua"
client_script "api-ac_VFYviblBeUeH.lua"