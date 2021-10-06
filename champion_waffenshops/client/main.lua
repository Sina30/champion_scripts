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

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

    ESX.TriggerServerCallback('champion_waffenshops:loadItems', function(items)
        for key, value in pairs(items) do
            AddItem(value.name, value.display, value.price)
        end
    end)
end)

local laden = {
    {x = -662.1,    y = -935.3,  z = 20.8},
    {x = 810.2,     y = -2157.3,  z = 28.6},
	{x = 1693.4,    y = 3759.5,  z = 33.7},
	{x = -330.2,    y = 6083.8, z = 30.4},
	{x = 252.3,     y = -50.0, z = 68.9},
	{x = 22.0,      y = -1107.2, z = 28.8},
	{x = 2567.6,    y = 294.3, z = 107.7},
    {x = -1117.5,   y = 2698.6, z = 17.5},
    {x = 842.4,     y = -1033.4,  z = 27.1}
}

local enableField = false

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

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    toggleField(false)
end)

RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
    local warenkorb = data.warenkorb
    local totalprice = 0

    for key, value in pairs(warenkorb) do
        totalprice = totalprice + value.price
    end

    local withTax = totalprice + (totalprice * 0.00)
    
    ESX.TriggerServerCallback('champion_waffenshops:canAfford', function(bool)
        if bool then
            ESX.ShowNotification(("Du hast einen Einkauf für $%s getätigt"):format(withTax))
        else
            ESX.ShowNotification(("Du kannst dir den Einkauf für $%s nicht leisten"):format(withTax))
        end
    end, withTax, warenkorb)

    cb('ok')
end)

function AddItem(name, display, price)
    SendNUIMessage({
        action = 'add',
        name = name,
        display = display,
        price = price
    })
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for key, value in pairs(laden) do
            DrawMarker(-1, vector3(value.x, value.y, value.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        for key, value in pairs(laden) do
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~ um auf den Waffenladen zuzugreifen")

                if IsControlJustReleased(0, 38) then
                    toggleField(true)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for _, coords in pairs(laden) do
        local blip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))

        SetBlipSprite(blip, 110)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 0)
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Waffenladen")
        EndTextCommandSetBlipName(blip)
    end
end)