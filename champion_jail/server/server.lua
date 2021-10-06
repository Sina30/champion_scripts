ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("champion_reinda:reinda")
AddEventHandler("champion_reinda:reinda", function(targetSrc, jailTime, jailReason)
	local src = source
	local einjailer = ESX.GetPlayerFromId(src)
	local targetSrc = tonumber(targetSrc)
	local xPlayer = ESX.GetPlayerFromId(src)
	local xTarget = ESX.GetPlayerFromId(targetSrc)

	if xPlayer["job"]["name"] == "police" or xPlayer["job"]["name"] == "fib" then
	Inhaft(targetSrc, jailTime)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
			TriggerClientEvent('champion:notify', 'Jail - System', einjailer.getName() .. ' hat '.. xTarget.getName() .. ' inhaftiert | '.. jailTime .. ' Hafteinheiten.', 'orange', 3500)

		end
	end
	end
	--GetRPName(targetSrc, function(Firstname, Lastname)
	--	TriggerClientEvent('chat:addMessage', -1, { args = { "Justiz ",  Firstname .. " " .. Lastname .. " Ist nun im Gef�ngnis - Grund: " .. jailReason }, color = { 249, 166, 0 } })
	--end)


end)

RegisterCommand("jailtime", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then
			TriggerClientEvent("champion:notify", src, "Jail - System", "Du hast noch " .. JailTime .. " Hafteinheiten übrig.", 'white', 3500)
		else
			TriggerClientEvent("champion:notify", src, "Jail - System", "Du bist nicht inhaftiert.", 'red', 3500)

		end

	end)

end)



RegisterServerEvent('test:forcedelete')
AddEventHandler('test:forcedelete', function(netId)

        TriggerClientEvent("deleteobject:allow", -1, netId)
end)
RegisterServerEvent("PommesMitDoener:removeDoenerBox")
AddEventHandler("PommesMitDoener:removeDoenerBox", function(item)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)

end)


RegisterServerEvent("PommesMitDoener:edittime")
AddEventHandler("PommesMitDoener:edittime", function(newJailTime)
	local src = source

	UpdateE(src, newJailTime)
end)

ESX.RegisterUsableItem('sgschaufel', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('PommesMitDoener:trytostartschaufel', source)
end)


ESX.RegisterUsableItem('sgpickaxe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('PommesMitDoener:trytostartpickaxe', source)
end)






function Inhaft(jailPlayer, jailTime)
	TriggerClientEvent("PommesMitDoener:haftlos", jailPlayer, jailTime)

	UpdateE(jailPlayer, jailTime)
end
RegisterServerEvent("PommesMitDoener:rausda")
AddEventHandler("PommesMitDoener:rausda", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)
	local Ziel = ESX.GetPlayerFromId(src)

	if xPlayer ~= nil then
		Rausholen(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fib' then
			TriggerClientEvent('champion:notify', "Jail - System", xPlayers[i], Ziel.getName() .. " hat jemanden freigelassen.", 'green', 3500)
		end
	end
end)



function Rausholen(jailPlayer)
	TriggerClientEvent("PommesMitDoener:rausda", jailPlayer)

	UpdateE(jailPlayer, 0)
end

function UpdateE(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("PommesMitDoener:rausmitdenen", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("PommesMitDoener:getzahl", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)