


ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('champion_xmenu3:giveCash')
AddEventHandler('champion_xmenu3:giveCash', function(target, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)

    if xPlayer.getMoney() < count then
        TriggerClientEvent('champion:notify', _source, "Player - System", "Du hast nicht genug Geld!", "red", 3500)


    else
	xPlayer.removeMoney(count)
    TriggerClientEvent('champion:notify', _source, "Player - System", "Du hast " .. GetPlayerName(target) .. " " .. count .. "$ übergeben.", "green", 3500)

	xTarget.addMoney(count)
    TriggerClientEvent('champion:notify', target, "Player - System", GetPlayerName(_source) .. " hat dir " .. count .. "$ übergeben.", "green", 3500)
    end

end)




RegisterServerEvent('player_menu:uwe')
AddEventHandler('player_menu:uwe', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_ambulancejob:ja', target)
end)

RegisterServerEvent('PommesMitWasser:trytoget')
AddEventHandler('PommesMitWasser:trytoget', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)

    if xTarget ~= nil then
        if xTarget.getInventoryItem('kabelbinder').count == 0 then
            TriggerClientEvent('notifications', target, "Du hast kein Seil!")


        else

        xTarget.removeInventoryItem('kabelbinder', 1)
        TriggerClientEvent('PommesMitWasser:handcuffdran', source)
        end
    end
end)
RegisterServerEvent('PommesMitWasser:trytoweg')
AddEventHandler('PommesMitWasser:trytoweg', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)

    if xTarget ~= nil then
        xTarget.addInventoryItem('kabelbinder', 1)
        TriggerClientEvent('PommesMitWasser:handcuffweg', source)
    end
end)


RegisterServerEvent('PommesMitWasser:handcuff')
AddEventHandler('PommesMitWasser:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('PommesMitWasser:handcuff', target)
end)

ESX.RegisterServerCallback('PommesMitWasser:getOtherPlayerData', function(source, cb, target)
		local xPlayer = ESX.GetPlayerFromId(target)
		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}


		cb(data)
end)