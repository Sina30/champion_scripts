ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('champion_einreiseauswahl:illegaleinreise')
AddEventHandler('champion_einreiseauswahl:illegaleinreise', function(name, count)
	xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon('WEAPON_KNIFE', 1)
    xPlayer.removeMoney(10000)
end)