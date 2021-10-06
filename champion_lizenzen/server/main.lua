ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent('champion_lizenzen:load')
AddEventHandler('champion_lizenzen:load', function(target)
	local t = ESX.GetPlayerFromId(target)
	local s = source
	local x = ESX.GetPlayerFromId(s)
		
	MySQL.Async.fetchAll(
		'SELECT * FROM user_licenses WHERE owner = @owner',
		{
			['@owner'] = x.identifier
		},
		function(result)
			for i = 1, #result, 1 do
				local label = MySQL.Sync.fetchScalar("SELECT label FROM licenses WHERE type = @type", {['@type'] = result[i].type})
				result[i].label = label
			end

			local label = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {['@identifier'] = x.identifier})
			local name = label[1].firstname .. ' ' .. label[1].lastname

			local pos = MySQL.Sync.fetchAll("SELECT * FROM licenses")

			TriggerClientEvent('champion_lizenzen:open', target, result, pos, name)
		end
	)
end)