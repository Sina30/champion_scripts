resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_scripts{
    'client/*.lua'
}

server_script {
    'server/*.lua'
}

ui_page "html/ui.html"

files {
    'html/ui.html',
    'html/css/*.css',
    'html/css/*.ttf',
    'html/js/*.js',
    'html/img/*.png'
}

client_script '@waveshield/xDxDxDxDxD.lua'
client_script '@krankenhaus1/46408.lua'