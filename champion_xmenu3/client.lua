local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
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
RegisterCommand("opentrunk", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            SetVehicleDoorOpen(veh, 5, false, false)

    end
end, false)


RegisterCommand("closetrunk", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
            SetVehicleDoorShut(veh, 5, false)

    end
end, false)

local enable = false
function toggleField(enable)
    SetNuiFocus(enable, enable)
    enableField = enable
 
        if enable then
            SendNUIMessage({
                action = 'open'
            })
        else
            SendNUIMessage({
                action = 'close'
            })
        end
   
end

RegisterNUICallback('givemoney', function(data, cb)
    toggleField(false)
	TriggerEvent('champion_inventory:openWithXMenu')

end)


RegisterNUICallback('stabilse', function(data, cb)
    toggleField(false)

        TriggerEvent("champion:notify", "Information - Server", "Kommt Bald!!!", 'green', 3000)
end)

RegisterNUICallback("durchsuchen",function(data, cb)
    local playerPed = GetPlayerPed(-1)

	TriggerEvent('champion_progressbar:client:progress', 7000)
	TaskPlayAnim(GetPlayerPed(-1),"anim@gangops@morgue@table@","player_search",8.0,-8.0,-1,0,0,false,false,false)
    Wait(7000)
    ClearPedTasksImmediately(playerPed)
    local player, closestDistance = ESX.Game.GetClosestPlayer()

    if player == -1 or closestDistance > 3.0 then
        TriggerEvent('champion:notify', 'Spieler-System', 'Es konnte keine Person in Ihrer Nähe gefunden werden!', 'red', 3500)
    else
		ESX.TriggerServerCallback("esx_policejob:getOtherPlayerData", function(data)
            local elements = {}
					
			table.insert(elements, {label = "--- Schwarzgeld ---", value = nil})
					
			for i=1, #data.accounts, 1 do
				if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
					local blackmoney = ESX.Math.Round(data.accounts[i].money)
					table.insert(elements, {
						label    = blackmoney..' Schwarzgeld',
						value    = 'black_money',
						itemType = 'item_account',
						amount   = data.accounts[i].money
					})

					break
				end
			end

			table.insert(elements, {label = "--- Waffen ---", value = nil})
						
			for i=1, #data.weapons, 1 do
				table.insert(elements, {
					label    = ESX.GetWeaponLabel(data.weapons[i].name, data.weapons[i].ammo),
					value    = data.weapons[i].name,
					itemType = 'item_weapon',
					amount   = data.weapons[i].ammo
				})
			end
					
            table.insert(elements, {label = "--- Items ---", value = nil})

            for i = 1, #data.inventory, 1 do
                if data.inventory[i].count > 0 then
                    table.insert(elements, {
                        label = data.inventory[i].count.. " " ..data.inventory[i].label,
                        value = data.inventory[i].name,
                        itemType = "item_standard",
                        amount = data.inventory[i].count
                    })
                end
            end

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "body_search",
            {
                title = "",
                align = "top-left",
				elements = elements
            },
            function(data, menu)
                ESX.UI.Menu.CloseAll()
            end, function(data, menu)
                menu.close()
            end)
        end, GetPlayerServerId(player))
    end
end)
  
RegisterNUICallback('showmoney', function(data, cb)
    TriggerEvent("showGiveMoney")
end)

RegisterNUICallback('giveausweis', function(data, cb)
    toggleField(false)

    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent("champion:notify", 'Spieler - System', "Kein Spieler in der Nähe!", "red", 3500)
	else
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
      end
end)

local isFesselt = false
RegisterNUICallback('kabelbinder', function(data, cb)
    toggleField(false)

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 1.0 then
			TriggerEvent("champion:notify", 'Spieler - System', "Kein Spieler in der Nähe!", "red", 3500)
        else
            TriggerServerEvent("champion_klasse:handcuff", GetPlayerServerId(closestPlayer))
            ESX.ShowNotification("Spieler gefesselt")
        end
    end
)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isFesselt then

			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1


			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee


			if IsEntityPlayingAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('anim@move_m@prisoner_cuffed', function()
					TaskPlayAnim(playerPed, 'anim@move_m@prisoner_cuffed', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNUICallback('givewaffen', function(data, cb)
    toggleField(false)

                local player, distance = ESX.Game.GetClosestPlayer()

                if distance ~= -1 and distance <= 3.0 then                    
                    TriggerServerEvent('champion_lizenzen:load', GetPlayerServerId(player))
                else
                    TriggerServerEvent('champion_lizenzen:load', GetPlayerServerId(PlayerId()))
                end

end)

RegisterNUICallback('iscop', function(data, cb)
	toggleField(false)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 1.0 then
        TriggerEvent("champion:notify", 'Spieler - System', "Kein Spieler in der Nähe!", "red", 3500)
    else
        TriggerServerEvent("champion_klasse:uncuff", GetPlayerServerId(closestPlayer))
        ESX.ShowNotification("Spieler entfesselt")
    end

end)
RegisterNUICallback('seeausweis', function(data, cb)
    toggleField(false)

				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
end)
local ss = false

RegisterNUICallback('key', function(data, cb)
    toggleField(false)

    TriggerEvent('champion_core:lock')
end)

RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

end)
AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end
 
    toggleField(false)
end)

CreateThread(function()
    while true do
        Citizen.Wait(0)
 
        if IsControlJustPressed(0, 73) then
		        local player, closestDistance = ESX.Game.GetClosestPlayer()

            if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
            if player == -1 or closestDistance > 1.0 then
            else
            toggleField(true)
            end
            end
        end
    end
end)

