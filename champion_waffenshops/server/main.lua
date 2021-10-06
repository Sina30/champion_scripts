ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterServerCallback('champion_waffenshops:canAfford', function(source, cb, value, warenkorb)
	local s = source
	local x = ESX.GetPlayerFromId(s)

	if x.getMoney() >= value then
		for key, value in pairs(warenkorb) do
			local iType = MySQL.Sync.fetchScalar("SELECT type FROM waffenshop WHERE name = @name", {['@name'] = value.name})

			if iType == 'item' then
				x.addInventoryItem(value.name, 1)
			elseif iType == 'weapon' then
				x.addWeapon(value.name, 30)
			end
		end

		x.removeMoney(value)

		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('champion_waffenshops:loadItems', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM waffenshop', {}, function(shops)
		cb(shops)
	end)
end)