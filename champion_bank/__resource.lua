server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/*.lua'
}

client_scripts {
  'client/*.lua'
}

dependency 'es_extended'

ui_page('html/index.html')

files {
	'html/index.html',
  -- javascript
	'html/*.js',
  -- style
  'html/*.css',
  -- fonts
  'html/*.ttf',
  -- images
	'html/*.png',
  'html/*.jpg',
}