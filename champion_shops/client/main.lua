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

    ESX.TriggerServerCallback('champion_shops:loadItems', function(items)
        for key, value in pairs(items) do
            AddItem(value.name, value.display, value.price)
        end
    end)
end)

local laden = {
    {x = 373.875,   y = 325.896,  z = 102.566},
    {x = 2557.458,  y = 382.282,  z = 107.622},
	{x = -3038.939, y = 585.954,  z = 6.908},
	{x = -3241.927, y = 1001.462, z = 11.830},
	{x = 547.431,   y = 2671.710, z = 41.156},
	{x = 1961.464,  y = 3740.672, z = 31.343},
	{x = 2678.916,  y = 3280.671, z = 54.241},
    {x = 1729.216,  y = 6414.131, z = 34.037},
    {x = 1135.808,  y = -982.281,  z = 45.415},
    {x = -1222.915, y = -906.983,  z = 11.326},
	{x = -1487.553, y = -379.107,  z = 39.163},
	{x = -2968.243, y = 390.910,   z = 14.043},
	{x = 1166.024,  y = 2708.930,  z = 37.157},
	{x = 1392.562,  y = 3604.684,  z = 33.980},
	{x = 127.830,   y = -1284.796, z = 28.280},
	{x = -1393.409, y = -606.624,  z = 29.319},
    {x = -559.906,  y = 287.093,   z = 81.176},
    {x = -48.519,   y = -1757.514, z = 28.421},
	{x = 1163.373,  y = -323.801,  z = 68.205},
	{x = -707.501,  y = -914.260,  z = 18.215},
	{x = -1820.523, y = 792.518,   z = 137.118},
	{x = 1698.388,  y = 4924.404,  z = 41.063},
		{x = 5131.53, y = -4619.96, z = 2.2},
		{x = 4987.03, y = -5878.97,  z = 20.54},
        {x = 25.73, y = -1346.94,  z = 29.5}


	
}

local coordinate = {
{ 5131.53, -4619.96, 2.2, nil, 161.79, nil, 416176080},
{ 5138.0, -4623.65, 2.28, nil, 162.32, nil, -1289578670},
{ 4987.03, -5878.97, 20.54, nil, 33.0, nil, 416176080},








    
}

Citizen.CreateThread(function()

    for _,v in pairs(coordinate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  

      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
	  SetEntityInvincible(ped, true)

      SetBlockingOfNonTemporaryEvents(ped, true)
	end

end)



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

    local withTax = totalprice + (totalprice * 0.07)
    
    ESX.TriggerServerCallback('champion_shops:canAfford', function(bool)
        if bool then
            ESX.ShowNotification(("Du bezahlst bar: $%s"):format(withTax))
        else
            ESX.ShowNotification(("Dir fehlen: $%s Bargeld!"):format(withTax))
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
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~ um den Laden zu öffnen")

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

        SetBlipSprite(blip, 52)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 2)
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Laden")
        EndTextCommandSetBlipName(blip)
    end
end)