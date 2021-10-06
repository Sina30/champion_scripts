ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('champion_tattos:GetPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

ESX.RegisterServerCallback('champion_tattos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})

		TriggerClientEvent('esx:showNotification', source, "Du hast dir ein Tatto stechen lassen für:" .. price)
		cb(true)
	else
		TriggerClientEvent('esx:showNotification', source, "Du hast nicht genug Geld Dabei")
		cb(false)
	end
end)

RegisterServerEvent('champion_tattos:RemoveTattoo')
AddEventHandler('champion_tattos:RemoveTattoo', function (tattooList)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
		['@tattoos'] = json.encode(tattooList),
		['@identifier'] = xPlayer.identifier
	})
end)
