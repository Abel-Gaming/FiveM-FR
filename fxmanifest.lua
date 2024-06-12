fx_version 'cerulean'
game 'gta5'
description 'FiveMFR'
author 'Abel Gaming'
version '1.0'
lua54 'yes'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/mainMenu.lua',
	'client/alerts.lua',
	'client/events.lua',
	'client/functions.lua'
}

shared_script '@ox_lib/init.lua'