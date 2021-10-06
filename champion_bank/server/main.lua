ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent('champion_bank:getRobReward')
AddEventHandler('champion_bank:getRobReward', function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(money)
end)

ESX.RegisterServerCallback('champion_bank:getPoliceCount', function(source, cb)
	local xPlayers, xPlayer = ESX.GetPlayers(), nil
	local number = 0

	for i=1, #xPlayers, 1 do
		xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' then
			number = number + 1
		end
	end

	cb(number)
end)

ESX.RegisterServerCallback('champion_bank:getUserInfo', function(source, cb)
	local _source = source
	local xSource = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', 
	{
		['@identifier'] = xSource.identifier
	}
	, function(info)
		info[1].money = xSource.getMoney()
		info[1].bank = xSource.getBank()
		cb(info[1])
	end)
end)

ESX.RegisterServerCallback('champion_bank:auszahlung', function(source, cb, money)
	local _source = source
	local xSource = ESX.GetPlayerFromId(_source)
	
	if xSource.getBank() >= tonumber(money) then
		xSource.removeBank(tonumber(money))
		xSource.addMoney(tonumber(money))
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('champion_bank:einzahlung', function(source, cb, money)
	local _source = source
	local xSource = ESX.GetPlayerFromId(_source)
	
	if xSource.getMoney() >= tonumber(money) then
		xSource.removeMoney(tonumber(money))
		xSource.addBank(tonumber(money))
		cb(true)
	else
		cb(false)
	end
end)