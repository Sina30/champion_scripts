ESX                           = nil

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

RegisterNetEvent('support:notify')
AddEventHandler('support:notify', function(title, message, color, time)
    SendNUIMessage({
        title = title,
        text = message,
		color = color,
        time = time,
    })
	Wait(500)
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)