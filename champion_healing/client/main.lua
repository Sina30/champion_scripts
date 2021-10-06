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
local PlayerData = {}
local usedweste = false
local usedmedikit = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    
    while true do
        Citizen.Wait(0)

       if IsControlJustReleased(1, 207) then
        TriggerServerEvent('champion_healing:schutzwestecheck')
        Citizen.Wait(5000)
       elseif IsControlJustReleased(1, 208) then
        TriggerServerEvent('champion_healing:medikitcheck')
        Citizen.Wait(5000)
       end
    end
end)
    

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

  

RegisterNetEvent('champion_healing:bulletproof')
AddEventHandler('champion_healing:bulletproof', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 15, 2, 2)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x Schutzweste benutzt')
    usedweste = false
end)

--Westen LSPD

RegisterNetEvent('champion_healing:LSPD1')
AddEventHandler('champion_healing:LSPD1', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 12, 3, 3)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x LSPD Schutzweste (1) benutzt')
    usedweste = false
end)

RegisterNetEvent('champion_healing:LSPD2')
AddEventHandler('champion_healing:LSPD2', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 7, 0, 0)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x LSPD Schutzweste (2) benutzt')
    usedweste = false
end)

RegisterNetEvent('champion_healing:LSPD3')
AddEventHandler('champion_healing:LSPD3', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 12, 0, 0)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x LSPD Schutzweste (3) benutzt')
    usedweste = false
end)

--FIB Westen

RegisterNetEvent('champion_healing:fib1')
AddEventHandler('champion_healing:fib1', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 10, 1, 1)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x FIB Schutzweste (1) benutzt')
    usedweste = false
end)

RegisterNetEvent('champion_healing:fib2')
AddEventHandler('champion_healing:fib2', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 10, 3, 3)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x FIB Schutzweste (2) benutzt')
    usedweste = false
end)

RegisterNetEvent('champion_healing:fib3')
AddEventHandler('champion_healing:fib3', function()
    usedweste = not usedweste
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetPedComponentVariation(playerPed, 9, 3, 0, 0)
	AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)
    ESX.ShowNotification('Du hast 1x FIB Schutzweste (3) benutzt')
    usedweste = false
end)


RegisterNetEvent('champion_healing:medikit')
AddEventHandler('champion_healing:medikit', function()
    usedmedikit = not usedmedikit
    local playerPed = GetPlayerPed(-1)
    loadAnimDict('anim@heists@narcotics@funding@gang_idle')

    TriggerEvent('champion_progressbar:client:progress', 5000)
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(5000)   
    ClearPedTasksImmediately(playerPed)
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
    ESX.ShowNotification('Du hast 1x Verbandskasten benutzt')
    usedmedikit = false
end)

--Keys blockieren beim Schutzwesten Usen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if usedweste then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 74, true)
			DisableControlAction(0, 2, true) 
			DisableControlAction(0, 263, true) 
			DisableControlAction(0, 45, true) 
			DisableControlAction(0, 22, true) 
			DisableControlAction(0, 44, true) 
			DisableControlAction(0, 37, true) 
			DisableControlAction(0, 288,  true) 
			DisableControlAction(0, 289, true) 
			DisableControlAction(0, 170, true) 
			DisableControlAction(0, 167, true) 
            DisableControlAction(1, 254, true)
            DisableControlAction(0, 47, true)  
        end
    end
end)

--Keys blockieren beim Verbandskasten Usen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if usedmedikit then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 74, true)
			DisableControlAction(0, 2, true) 
			DisableControlAction(0, 263, true) 
			DisableControlAction(0, 45, true) 
			DisableControlAction(0, 22, true) 
			DisableControlAction(0, 44, true) 
			DisableControlAction(0, 37, true) 
			DisableControlAction(0, 288,  true) 
			DisableControlAction(0, 289, true) 
			DisableControlAction(0, 170, true) 
			DisableControlAction(0, 167, true) 
            DisableControlAction(1, 254, true)
            DisableControlAction(0, 47, true)  
        end
    end
end)

RegisterNetEvent('esx_extraitems:clipcli')
AddEventHandler('esx_extraitems:clipcli', function()
	local playerPed = GetPlayerPed(-1)
	ped = GetPlayerPed(-1)
	if IsPedArmed(ped, 4) then
		hash = GetSelectedPedWeapon(ped)
		if hash ~= nil then
			usedmunition = true
            TriggerEvent('champion_progressbar:client:progress', 2000)
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_PARKING_METER', 0, true)
			Citizen.Wait(2000)
			ClearPedTasksImmediately(playerPed)
			AddAmmoToPed(GetPlayerPed(-1), hash, 120)
			ESX.ShowNotification("Du hast eine Munitions Kiste benutzt")
			usedmunition = false
		else
			ESX.ShowNotification("Du hast keine Waffe in der Hand")
		end
	else
		--ESX.ShowNotification(_U("clip_not_suitable"))
	end
end)

--Keys blockieren beim Munition Usen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if usedmunition then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 74, true)
			DisableControlAction(0, 2, true) 
			DisableControlAction(0, 263, true) 
			DisableControlAction(0, 45, true) 
			DisableControlAction(0, 22, true) 
			DisableControlAction(0, 44, true) 
			DisableControlAction(0, 37, true) 
			DisableControlAction(0, 288, true) 
			DisableControlAction(0, 289, true) 
			DisableControlAction(0, 170, true) 
			DisableControlAction(0, 167, true) 
            DisableControlAction(1, 254, true)
            DisableControlAction(0, 47, true)  
        end
    end
end)