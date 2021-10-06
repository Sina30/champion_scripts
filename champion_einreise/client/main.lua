ESX              = nil
local PlayerData = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



local isMenuOpen = false


RegisterNUICallback("einreiselegalbtn", function(data)
    SetNuiFocus(false, false)

    SetEntityCoords(PlayerPedId(), -1037.55,-2737.6,20.17, 0, 0, 0, false)
    TriggerEvent('champion:notify', 'ERFOLG', 'Erfolgreich ausgewähltes Einreise Art ausgeführt (Legal)', 'green', 3500)
    Wait(5000)
    TriggerEvent('champion:notify', 'INFORMATION', 'Die Papiere wurden erfolgreich übergeben. Viel Spaß auf Los Santos', 'white', 3500)
    Wait(2000)
    TriggerEvent('champion:notify', 'ACHTUNG', 'Das RP fängt nun an. Versetze dich in deine Rolle und habe Spaß! Los Gehts!', 'white', 5000)
    TriggerEvent('setDimension', 0)

end)

RegisterNUICallback("einreiseillegalbtn", function(data, source)
    SetNuiFocus(false, false)

    SetEntityCoords(PlayerPedId(), 4801.14,-4306.54,4.94, 0, 0, 0, false)
    TriggerServerEvent('champion_einreiseauswahl:illegaleinreise')

    TriggerEvent('champion:notify', 'ERFOLG', 'Erfolgreich ausgewähltes Einreise Art ausgeführt (Illegal)', 'green', 3500)
    TriggerEvent('champion:notify', 'ACHTUNG', 'Du reist illegal ein! Ebenso hast du ein Messer dabei. Und von nun an bist du in deinem IC Charakter', 'white', 3500)
    Wait(5000)
    TriggerEvent('champion:notify', 'INFORMATION', 'Laufe vor zum Mann, um ein Boot zu bekommen, und los gehts', 'white', 3500)
    TriggerEvent('setDimension', 0)

end)

RegisterNUICallback("einreisesgbtn", function(data)
    SetNuiFocus(false, false)

    SetEntityCoords(PlayerPedId(), 1712.12,2565.86,45.56, 0, 0, 0, false)

    TriggerEvent('champion:notify', 'ERFOLG', 'Erfolgreich ausgewähltes Einreise Art ausgeführt (Durch das SG)', 'green', 3500)
    TriggerEvent('skinchanger:getSkin', function(skin)
		if GetHashKey(GetEntityModel(PlayerPedId())) == Male then
			local clothesSkin = {
				['tshirt_1'] = 14, ['tshirt_2'] = 0,
				['torso_1'] = 23, ['torso_2'] = 0,
				['arms'] = 0,
				['pants_1'] = 66, ['pants_2'] = 6,
				['shoes_1'] = 10, ['shoes_2'] = 0,
                ['chain_1'] = 0, ['chain_2'] = 0,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else
			local clothesSkin = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 5, ['torso_2'] = 0,
				['arms'] = 5,
				['pants_1'] = 64, ['pants_2'] = 6,
				['shoes_1'] = 6, ['shoes_2'] = 0,
                ['chain_1'] = 0, ['chain_2'] = 0,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)
    Wait(2000)
    TriggerEvent('champion:notify', 'ACHTUNG', 'Von nun an fängt das RP richtig an, also verhalte dich wie ein Häftling!', 'white', 5000)
    TriggerEvent('setDimension', 0)

end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

RegisterNetEvent('champion_einreise:show')
AddEventHandler('champion_einreise:show', function(title)
    SendNUIMessage({
        title = title,
    })

    SetNuiFocus(true, true)
end)

RegisterCommand("test123", function()
    TriggerEvent("champion_einreise:show")
end)

function bootausparkenmenu()
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'bootausparkenmenu',
	  {
		  title    = 'Boot Ausparker',
		  elements = {
			  {label = 'Boot ausparken', value = 'bootasuparken'},
			  {label = 'Schließen', value = 'closemenu'},
		  }
	  },
	  function(data, menu)
		  local val = data.current.value
		  
		  if val == 'bootasuparken' then
            ESX.Game.SpawnVehicle('dinghy3', vector3(4793.09, -4243.02, 2.8), 101.82, function(vehicle)
                TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                local vehProps = ESX.Game.GetVehicleProperties(vehicle)
            end)
            ESX.UI.Menu.CloseAll() 
            ESX.ShowNotification("Fahrzeug erfolgreich ausgeparkt Minjung, sei vorsichtig! Und verursache dem Boot keine Schäden!")
		  elseif val == 'closemenu' then
			ESX.UI.Menu.CloseAll() 
		end
	  end,
	  function(data, menu)
		  menu.close()
	  end
  )
end


local boot = {
    {x = 4803.55,   y = -4296.98,  z = 4.2}
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())

        for key, value in pairs(boot) do
            local position = vector3(value.x, value.y, value.z)
            local dist = #(coords - position)

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Drücke E um ein Boot auszparken")

                if IsControlJustReleased(0, 38) then
					bootausparkenmenu()
                end
            end
        end
    end
end)