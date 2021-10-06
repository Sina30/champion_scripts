ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onResourceStart', function(resourceName)

    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = 1', {})
    TriggerClientEvent('champion_notifyannounce_server:on', -1, "Alle Fahrzeuge wurden nun in die Garage verlagert.")
end)
  

ESX.RegisterServerCallback('champion_garage:GetGarageVehicles', function(source, cb, Position)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
        ['@owner'] = xPlayer.identifier
    }, function(result)
        cb(result)
    end)
end)




ESX.RegisterServerCallback('champion_garage:getOutVehicle', function(source, cb, plate, Position)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = false, garage_point = null WHERE owner = @owner AND plate = @plate ', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    }, function(changed)
        if changed == 0 then
            cb(false)
        else
            cb(true)
        end
    end)
end)


ESX.RegisterServerCallback('champion_garage:GetNearVehiclesByOwner', function(source, cb, vehicles)
    local xPlayer = ESX.GetPlayerFromId(source)
    local foundCars = {}

    for k,v in pairs(vehicles) do
        local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = "civ"', {
            ['@owner'] = xPlayer.identifier,
            ['@plate'] = v.plate
        })

        if result[1] then
            foundCars[v.vehicle] = v
        end
    end

    cb(foundCars)
end)

ESX.RegisterServerCallback('champion_garage:StoreVehicle', function(source, cb, plate, props, Position)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true, vehicle = @Props WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate,
        ['@Props'] = json.encode(props)
    }, function(changed)
        if changed == 0 then
            cb(false)
        else
            cb(true)
        end
    end)
end)

ESX.RegisterServerCallback('champion_garage:getVehicleByPlate', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate
    }, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('champion_garage:GetImpoundVehicles', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND `stored` = false', {
        ['@owner'] = xPlayer.identifier
    }, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('champion_garage:ReleaseVehicle', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local PlayerMoney = xPlayer.getMoney()

    if PlayerMoney >= Config.Settings['Impound'].Price then
        cb(true)
        xPlayer.removeMoney(Config.Settings['Impound'].Price)
        TriggerClientEvent("champion:notify", "Abschlepphof", 'Dir wurden $'.. Config.Settings['Impound'].Price .. " entnommen!", "green", 3500)
    else
        cb(false)
    end
end)