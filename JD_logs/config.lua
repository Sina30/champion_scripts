Config = {}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "Champion Roleplay | Logs" 							-- Bot Username
Config.avatar = "https://cdn.discordapp.com/attachments/873656362184347699/873665895770255410/C_1.png"				-- Bot Avatar
Config.communtiyName = "Champion Roleplay"					-- Icon top of the embed
Config.communtiyLogo = "https://cdn.discordapp.com/attachments/873656362184347699/873665895770255410/C_1.png"		-- Icon top of the embed
Config.FooterText = "© CRP"						-- Footer text for the embed
Config.FooterIcon = "https://cdn.discordapp.com/attachments/873656362184347699/873665895770255410/C_1.png"			-- Footer icon for the embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.InlineFields = true			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = true				-- set to false to disable license in the logs
Config.IP = true					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "#A1A1A1",				-- Chat Message
	joins = "#3AF241",				-- Player Connecting
	leaving = "#F23A3A",			-- Player Disconnected
	deaths = "#000000",				-- Shooting a weapon
	shooting = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {		-- For more info have a look at the docs: https://docs.prefech.com
	all = "https://discordapp.com/api/webhooks/873904751148945419/AfAw2OzRyZRVycoPRFYbLKuQBO8NCdMMWgwhPsv-AdcnrNEX0kyA2Yo-fTKz3cSxHblc",		-- All logs will be send to this channel
	chat = "https://discordapp.com/api/webhooks/873905220994871338/x5kwzOxmVyzkKYerTJzlpdmuidNhhEn5mhJGF5e3BqbyQFYLISID-E2uQXd_-MHVCwi9",		-- Chat Message
	joins = "https://discordapp.com/api/webhooks/873904610509742091/Pj06YX979gSdX_VepuxVSy6XR9fI8uG7LQDU4ffY-XDwKYglH6AN8x25ygk05YrBYKP-",		-- Player Connecting
	leaving = "https://discordapp.com/api/webhooks/873904773995319316/5NBgz06QniR2bXQUVnGuWOgfktYZ56yYDbImpgSY3-5dGVBQJJ8lVbi6TmJFRW6O061q",	-- Player Disconnected
	deaths = "https://discordapp.com/api/webhooks/873904879041667122/0qOrtOp6GRvlsjcg-mlSsE8O9jIHxkTcCZvjxwQvcC8h3JH-08g5y1y445BDWRt15Tk_",		-- Shooting a weapon
	shooting = "https://discordapp.com/api/webhooks/873904835890671689/uV3tWyYZWrEbaYQYCod1tTwdPXFicvepgoTu1OpQSXOfQFG0mn-D73CbZusgR55IsHe9",	-- Player Died
	resources = "https://discordapp.com/api/webhooks/873904791556874301/hVmWyCZxcARN7gL0NgvbckdyE7L3GndXGRzKZE_uKTl3_TKrBwaQtecgb6MOqrk3eWF8",	-- Resource Stopped/Started	
}

Config.TitleIcon = {		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "💬",				-- Chat Message
	joins = "📥",				-- Player Connecting
	leaving = "📤",			-- Player Disconnected
	deaths = "💀",				-- Shooting a weapon
	shooting = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}

Config.Plugins = {
	--["PluginName"] = {color = "#FFFFFF", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
	["NameChange"] = {color = "#03fc98", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.3.0"
