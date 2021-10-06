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
local RPWorking = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))})
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(GetPlayerPed(-1), false), IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						--SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
						--SetVehicleJetEngineOn(vehicle[1], vehicle[2])
						if not IsPedInAnyVehicle(GetPlayerPed(-1), false) or (IsPedInAnyVehicle(GetPlayerPed(-1), false) and vehicle[1]~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
							if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
								if vehicle[2] then
									SetHeliBladesFullSpeed(vehicle[1])
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

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
RegisterNUICallback('radio', function(data, cb)
    --PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    toggleField(false)
    if Citizen.InvokeNative(0x5F43D83FD6738741, Citizen.ReturnResultAnyway()) == 1 then
        SetVehicleRadioEnabled(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
        TriggerEvent('champion:notify', "Fahrzeug - Manager", "Du hast das Radio abgeschaltet.", "red", 3500)
    else
        SetVehicleRadioEnabled(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
        TriggerEvent('champion:notify', "Fahrzeug - Manager", "Du hast das Radio angeschaltet.", "green", 3500)

    end


end)

RegisterNUICallback('seat', function(data, cb)
    toggleField(false)
    beltOn = not beltOn 
    if beltOn then
    Citizen.Wait(100)
    TriggerEvent('champion:notify', "Fahrzeug - Manager", "Du hast deinen Anschnallgurt angelegt.", "green", 3500)
        
      isUiOpen = true 
    else 
        TriggerEvent('champion:notify', "Fahrzeug - Manager", "Du hast deinen Anschnallgurt abgelegt.", "red", 3500)
    

      isUiOpen = true  
    end


end)


RegisterNUICallback('engine', function(data, cb)
    toggleField(false)
    local plyPed = PlayerPedId()


    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if GetIsVehicleEngineRunning(plyVeh) then
        SetVehicleEngineOn(plyVeh, false, false, true)
        SetVehicleUndriveable(plyVeh, true)
        TriggerEvent('champion:notify', "Fahrzeug - Manager", "Motor ausgeschaltet", "red", 3500)
    elseif not GetIsVehicleEngineRunning(plyVeh) then
        SetVehicleEngineOn(plyVeh, true, false, true)
        SetVehicleUndriveable(plyVeh, false)
        TriggerEvent('champion:notify', "Fahrzeug - Manager", "Motor angeschaltet", "green", 3500)
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
 
 
        if IsControlJustPressed(0, 73) then
            if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 

            toggleField(true)

            end
        end
    end
end)



Citizen.CreateThread(function()
	while true do
        Citizen.Wait(100)
        if beltOn then 
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        end

		if (IsPlayerDead(PlayerId()) and isUiOpen == true and beltOn == true) then

			isUiOpen = false
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