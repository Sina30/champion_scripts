local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback("ESX:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

function sendToDiscord(color, name, title, message, footer)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. title .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer,
			  },
		  }
	  }  
	PerformHttpRequest('https://discord.com/api/webhooks/821762698277683222/JuX4kbp-OaYF3BgdK85kGZzPTZoeSv1BpQc3Vei8afoQR-3WGnfUFRwUhi7GU1pJuVUv', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent('reloadchar')
AddEventHandler('reloadchar', function(target)
    TriggerClientEvent('esx:setplayerinclouds', target)
    Wait(500)
    TriggerClientEvent('esx:endjoinsession', target)
end)


RegisterServerEvent('tc')
AddEventHandler('tc', function(msg)
    TriggerClientEvent('adminnotify2', -1, msg, GetPlayerName(source) .. " | ID: " .. source)
end)


ESX.RegisterServerCallback('esx:getGroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getGroup())
end)

RegisterCommand("aduty", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "projektleiter" or xPlayer.getGroup() =="admin" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "supporter" or xPlayer.getGroup() == "guide" then
        TriggerClientEvent('toggleAduty', source)
    else
        TriggerClientEvent('champion:notify', source, "ADMINISTRATION", "Du hast keine Rechte.", "red", 3500)
    end
end, false)

RegisterCommand("addmoney", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    local argString = table.concat(args, " ")
    if xPlayer.getGroup() == "projektleiter" or xPlayer.getGroup() =="admin" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "supporter" or xPlayer.getGroup() == "guide" then
        if argString ~= nil then
            xPlayer.addMoney(argString)
            TriggerClientEvent('champion:notify', source, "ADMINISTRATION", "Du hast dir " .. argString .. "$ Geld gegeben", "green", 3500)
        end
    else
        TriggerClientEvent('champion:notify', source, "ADMINISTRATION", "Du hast keine Rechte.", "red", 3500)
    end 
end)

RegisterCommand("removemoney", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    local argString = table.concat(args, " ")
    if xPlayer.getGroup() == "projektleiter" or xPlayer.getGroup() =="admin" or xPlayer.getGroup() == "mod" or xPlayer.getGroup() == "supporter" or xPlayer.getGroup() == "guide" then
        if argString ~= nil then
            xPlayer.removeMoney(argString)
            TriggerClientEvent('champion:notify', source, "ADMINISTRATION", "Du hast " .. argString .. "$ entfernt", "green", 3500)
        end
    else
        TriggerClientEvent('champion:notify', source, "ADMINISTRATION", "Du hast keine Rechte.", "red", 3500)
    end 
end)