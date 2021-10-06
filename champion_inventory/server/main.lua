ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterServerCallback("champion_inventory:loadTarget", function(source, cb)
	local s = source
	local x = ESX.GetPlayerFromId(s)
	cb(x.getInventory())
end)

ESX.RegisterServerCallback("champion_inventory:loadTargetWeapons", function(source, cb)
	local s = source
	local x = ESX.GetPlayerFromId(s)
	cb(x.getLoadout())
end)


ESX.RegisterServerCallback("champion_inventory:loadmoney", function(source, cb)
	local s = source
	local x = ESX.GetPlayerFromId(s)
	cb(x.getMoney())
end)

RegisterNetEvent('champion_inventory:useItem')
AddEventHandler('champion_inventory:useItem', function(name, count)
	if name ~= nil then
		ESX.UseItem(source, name)
	end
end)

RegisterNetEvent('champion_inventory:throwItem')
AddEventHandler('champion_inventory:throwItem', function(name, count)
	local playerPed = GetPlayerPed(-1)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    --Items
	if name == 'bandage' or 'bread' or 'bulletproof' or 'clip' or 'contract' or 'cuffs' or 'cuff_keys' or 'drill' or 'fixkit' or 'jewels' or 'medikit' or 'meth' or 'phone' or 'water' or 'kroeten' or 'kroeten_pooch' or 'ephi' or 'aramidfasern' or 'aramid' or 'kevlar' or 'holz' or 'schraube' or 'huelse' or 'radio' or 'bauxit' or 'aluminiumoxid' or 'aluminium' or 'eisenerz' or 'magazin' or 'trauben' or 'traubenverarbeitet' or 'lspdstandard' or 'orangen' or 'orangenverarbeitet' or 'lsfstandard' or 'weedsamen' or 'weed' or 'joint' or 'kocher' or 'tfcoupon' or 'ffcoupon' or 'teddy' or 'rose' or 'srose' or 'kaffee' or 'cola' or 'steine' or 'fib1' or 'fib2' or 'fib3' or 'lspdweste1' or 'lspdweste2' or 'lspdweste3' then
		xPlayer.removeInventoryItem(name, count)
	end
end)

RegisterNetEvent('champion_inventory:throwWeapon')
AddEventHandler('champion_inventory:throwWeapon', function(name, count)
	local playerPed = GetPlayerPed(-1)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    --Waffen
	if name == 'weapon_gusenberg' or 'weapon_pistol' or 'weapon_heavypistol' or 'weapon_assaultrifle' or 'weapon_advancedrifle' or 'weapon_nightstick' or 'weapon_stungun' or 'weapon_bzgas' or 'weapon_pumpshotgun' or 'weapon_specialcarbine' or 'weapon_bullpuprifle' then
		xPlayer.removeWeapon(name, count)
	end
end)

RegisterNetEvent('champion_inventory:throwCash')
AddEventHandler('champion_inventory:throwCash', function(count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(count)
	TriggerClientEvent('champion_inventory:setMoney', source, xPlayer.getMoney())
end)

RegisterNetEvent('champion_inventory:giveItem')
AddEventHandler('champion_inventory:giveItem', function(name, count, target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)

	if item == 'bandage' or 'bread' or 'bulletproof' or 'clip' or 'contract' or 'cuffs' or 'cuff_keys' or 'drill' or 'fixkit' or 'jewels' or 'medikit' or 'meth' or 'phone' or 'water' or 'kroeten' or 'kroeten_pooch' or 'ephi' or 'aramidfasern' or 'aramid' or 'kevlar' or 'holz' or 'schraube' or 'huelse' or 'radio' or 'bauxit' or 'aluminiumoxid' or 'aluminium' or 'eisenerz' or 'magazin' or 'trauben' or 'traubenverarbeitet' or 'lspdstandard' or 'orangen' or 'orangenverarbeitet' or 'lsfstandard' or 'weedsamen' or 'weed' or 'joint' or 'kocher' or 'tfcoupon' or 'ffcoupon' or 'teddy' or 'rose' or 'srose' or 'kaffee' or 'cola' or 'steine' or 'fib1' or 'fib2' or 'fib3' or 'lspdweste1' or 'lspdweste2' or 'lspdweste3' then
	xPlayer.removeInventoryItem(name, count)
	xTarget.addInventoryItem(name, count)
	TriggerClientEvent('esx:showNotification', target, "Du hast " ..count.. "x " ..name.. "  bekommen ")

	TriggerClientEvent('champion_inventory:setMax', source, count)
	end
end)

--Waffen
RegisterNetEvent('champion_inventory:giveWeapon')
AddEventHandler('champion_inventory:giveWeapon', function(name, count, target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	
	if name == 'weapon_gusenberg' or 'weapon_pistol' or 'weapon_heavypistol' or 'weapon_assaultrifle' or 'weapon_advancedrifle' or 'weapon_nightstick' or 'weapon_stungun' or 'weapon_bzgas' or 'weapon_pumpshotgun' or 'weapon_specialcarbine' or 'weapon_bullpuprifle' then
	xPlayer.removeWeapon(name, count)
	xTarget.addWeapon(name, 30) --30 Schuss
	TriggerClientEvent('esx:showNotification', target, "Du hast " ..count.. "x " ..name.. "  bekommen ")

	TriggerClientEvent('champion_inventory:setMax', source, count)
	end
end)

RegisterNetEvent('champion_inventory:giveCash')
AddEventHandler('champion_inventory:giveCash', function(count, target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)

	xPlayer.removeMoney(count)
    
	xTarget.addMoney(count)
	TriggerClientEvent('esx:showNotification', target, "Du hast " ..count.. "$ bekommen")
	
	TriggerClientEvent('champion_inventory:setMax', source, count - 1)
	TriggerClientEvent('champion_inventory:setMax', target, 1 - count)
end)