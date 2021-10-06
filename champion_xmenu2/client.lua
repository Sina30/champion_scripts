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
local isUiOpen = false 
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false
local vehicles = {}
local RPWorking = true

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

local allowedPumps = 
{
    [-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

function FindNearestFuelPump()
	local coords = GetEntityCoords(PlayerPedId())
	local fuelPumps = {}
	local handle, object = FindFirstObject()
	local success

	repeat
		if allowedPumps[GetEntityModel(object)] then
			table.insert(fuelPumps, object)
		end

		success, object = FindNextObject(handle, object)
	until not success

	EndFindObject(handle)

	local pumpObject = 0
	local pumpDistance = 1000

	for _, fuelPumpObject in pairs(fuelPumps) do
		local dstcheck = GetDistanceBetweenCoords(coords, GetEntityCoords(fuelPumpObject))

		if dstcheck < pumpDistance then
			pumpDistance = dstcheck
			pumpObject = fuelPumpObject
		end
	end

	return pumpObject, pumpDistance
end

CreateThread(function()
    while true do
        local pumpObject, pumpDistance = FindNearestFuelPump()

		if pumpDistance < 3.5 then
            nearPump = pumpObject
        else
            nearPump = false 
        end

        Wait(500)
    end
end)

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

RegisterNUICallback('tank', function(data, cb)
    TriggerEvent('notifications', "#0004ff", "FAHRZEUGMANAGMENT", "Diese Funktion ist deaktiviert.")
    cb('ok')
end)

RegisterNUICallback('seat', function(data, cb)
    TriggerEvent('opentrunk')
    cb('ok')

end)



function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end
-- mini@repair / fixing_a_player

RegisterCommand("repair", function()
	        SetVehicleFixed(vehicle)
                SetVehicleDeformationFixed(vehicle)
                SetVehicleUndriveable(vehicle, false)
                SetVehicleEngineOn(vehicle, true, true)
end)

RegisterNUICallback('engine', function(data, cb)
    local vehicle   = ESX.Game.GetVehicleInDirection()
    if DoesEntityExist(vehicle) then

    ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
        if quantity > 0 then
                local playerPed = GetPlayerPed(-1)
                loadAnimDict('mini@repair')

                TriggerEvent('champion_progressbar:client:progress', 5000)
                TaskPlayAnim(GetPlayerPed(-1), "mini@repair" ,"fixing_a_player", 8.0, -8.0, -1, 0, 0, false, false, false)
                Wait(5000)   
                ClearPedTasksImmediately(playerPed)
            
                TriggerEvent('notifications', "red", "FAHRZEUGMANAGMENT", "Du hast das Fahrzeug repariert.")
				TriggerServerEvent('esx_ambulancejob:removeItem', 'fixkit')
                SetVehicleFixed(vehicle)
                SetVehicleDeformationFixed(vehicle)
                SetVehicleUndriveable(vehicle, false)
                SetVehicleEngineOn(vehicle, true, true)
				
    
            else
                ESX.ShowNotification("Du hast kein Reperaturkasten")
            end
        end, 'fixkit')

    else
        ESX.ShowNotification("Das Fahrzeug konnte nicht gefunden werden.")
    end
    
end)

RegisterNUICallback('key', function(data, cb)
    toggleField(false)

    TriggerEvent('champion_core:lock')
end)


RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

end)


CreateThread(function()
    while true do
        Citizen.Wait(0)
 
        local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(-1)), 3.0)
        local player, closestDistance = ESX.Game.GetClosestPlayer()

        if IsControlJustPressed(0, 73) then
            if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			if player == -1 or closestDistance > 1.0 then
		                for key, value in pairs(vehicles) do
                    toggleField(true)

                end
		    else

            end
            end
		else

		end
    end
end)

function table.contains(table, element)
    for _, value in pairs(table) do
      if value[1] == element then
        return true
      end
    end
    return false
  end