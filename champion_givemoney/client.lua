

ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('showGiveMoney')
AddEventHandler('showGiveMoney', function()

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

		SendNUIMessage({
			action = "open",
		})
		SetNuiFocus(true, true)

end)

RegisterNUICallback('closethat', function(data, cb)

		SetNuiFocus(false, false)

end)

RegisterNUICallback('givemoney', function(data, cb)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	SetNuiFocus(false, false)

    if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent("champion:notify", "GELDGEBEN", "Keine Spieler in der Nähe!", "red", 3500)
		SetNuiFocus(false, false)

	  else
		if data.money < 0 then
			TriggerEvent("champion:notify", "GELDGEBEN", "Nope!", "red", 3500)
			return
		end
		TriggerServerEvent("champion_xmenu3:giveCash", GetPlayerServerId(closestPlayer), tonumber(data.money))
		SetNuiFocus(false, false)

      end

    cb('ok')
end)