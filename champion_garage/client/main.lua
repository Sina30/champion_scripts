local ESX = nil
local UI, UI_Impound = false, false
local wasPlayerinGarage = false
local CurrentAction, CurrentActionText, CurrentActionData = nil, nil, {}
local GarageVehicles, NearVehicles, ImpoundVehicles = {}, {}, {}
local CanReleaseVehicle = true

-- <===========================>
--          Load ESX

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

-- <===========================>

Citizen.CreateThread(function()
    for k,v in pairs(Config.Garages) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Position)

            SetBlipSprite(blip, Config.Settings['Blip'].Type)
            SetBlipScale(blip, Config.Settings['Blip'].Scale)
            SetBlipColour(blip, Config.Settings['Blip'].Color)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Garage')
            EndTextCommandSetBlipName(blip)
        end
    end
    
    for k,v in pairs(Config.Impounds) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Position)

            SetBlipSprite(blip, Config.Settings['Impound']['Blip'].Type)
            SetBlipScale(blip, Config.Settings['Impound']['Blip'].Scale)
            SetBlipColour(blip, Config.Settings['Impound']['Blip'].Color)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Abschlepphof')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Garages) do
        RequestModel(GetHashKey(v['Ped'].name))
        
        while not HasModelLoaded(GetHashKey(v['Ped'].name)) do
            Citizen.Wait(1)
        end

        local SpawnNPC = CreatePed(4, GetHashKey(v['Ped'].name), v.Position, v['Ped'].heading, false, true)


        FreezeEntityPosition(SpawnNPC, true)
        SetEntityInvincible(SpawnNPC, true)
        SetBlockingOfNonTemporaryEvents(SpawnNPC, true)
    end

    for k,v in pairs(Config.Impounds) do 
        RequestModel(GetHashKey(v['Ped'].name))
        
        while not HasModelLoaded(GetHashKey(v['Ped'].name)) do
            Citizen.Wait(1)
        end

        local SpawnNPC = CreatePed(4, GetHashKey(v['Ped'].name), v.Position, v['Ped'].heading, false, true)


        FreezeEntityPosition(SpawnNPC, true)
        SetEntityInvincible(SpawnNPC, true)
        SetBlockingOfNonTemporaryEvents(SpawnNPC, true)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local PlayerCoords = GetEntityCoords(PlayerPedId())
        local inGarage = false
        local PointName, PointType

        for k, v in pairs(Config.Garages) do
            local distance = #(PlayerCoords - v.Position)

            if distance < Config.Settings['ActionDistance'] then
                inGarage = true
                PointName = k
                PointType = "Garage"
            end
            
        end

        for k, v in pairs(Config.Impounds) do
            local distance = #(PlayerCoords - v.Position)

            if distance < Config.Settings['ActionDistance'] then
                inGarage = true
                PointName = k
                PointType = "Impound"
            end
            
        end

        if (inGarage and not wasPlayerinGarage) then
            wasPlayerinGarage = true
            TriggerEvent('champion_garage:PlayerEnteredGarage', PointName, PointType)
        end

        if not inGarage and wasPlayerinGarage then
            wasPlayerinGarage = false
            TriggerEvent('champion_garage:PlayerLeaveGarage')
        end
    end
end)

AddEventHandler('champion_garage:PlayerEnteredGarage', function(PointName, PointType)
    CurrentAction = PointName
    CurrentActionData = {PointName = PointName, PointType = PointType}
end)

AddEventHandler('champion_garage:PlayerLeaveGarage', function(PointName)
    CurrentAction = nil
    if PointName == "Garage" then
        CloseGarageUI()
    elseif PointType == "Impound" then
        CloseImpoundUI()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if CurrentAction then
            -- ESX.ShowHelpNotification(CurrentActionText)

            if IsControlJustPressed(0,51) then -- E
                if CurrentActionData.PointType == "Garage" then
                    OpenGarageUI(CurrentActionData.PointName)
                elseif CurrentActionData.PointType == "Impound" then
                    OpenImpoundUI(CurrentActionData.PointName)
                end
            end
        end
    end
end)

function OpenGarageUI(Position)
    ESX.TriggerServerCallback('champion_garage:GetGarageVehicles', function(Cars)
        for k,v in pairs(Cars) do
            local props = json.decode(v.vehicle)
            local Vehmodelname = GetDisplayNameFromVehicleModel(props.model)
            local vehicleName = GetLabelText(Vehmodelname)
            Cars[k]['labelname'] = vehicleName
        end

        -- <======================================================>

        local vehiclesInArea, vehiclesInAreaPlates = ESX.Game.GetVehiclesInArea(Config.Garages[Position].Position, Config.Garages[Position].FindCarDistance), {}

        if #vehiclesInArea > 0 then
            for k,v in pairs(vehiclesInArea) do
                if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
                    table.insert(vehiclesInAreaPlates, {vehicle = v, plate = string.gsub(GetVehicleNumberPlateText(v), "^%s*(.-)%s*$", "%1"), labelname = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(v)))})
                end
            end
        end

        ESX.TriggerServerCallback('champion_garage:GetNearVehiclesByOwner', function(NearCars) 
            GarageVehicles = Cars
            NearVehicles   = NearCars
            
            UI = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                type    = 'ui',
                display = true,
                data    = {
                    garagepoint = Config.Garages[Position].label,
                    garagecars  = Cars,
                    nearcars    = NearCars,
                }
            })

        end, vehiclesInAreaPlates)
    end, Position)
end

function CloseGarageUI()
    UI = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'ui',
        display = false
    })
end

function OpenImpoundUI(Position)
    ESX.TriggerServerCallback('champion_garage:GetImpoundVehicles', function(Cars)

        for k,v in pairs(Cars) do
            local props = json.decode(v.vehicle)
            local Vehmodelname = GetDisplayNameFromVehicleModel(props.model)
            local vehicleName = GetLabelText(Vehmodelname)
            Cars[k]['labelname'] = vehicleName
        end

        ImpoundVehicles = Cars

        UI_Impound = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            type    = 'ui_impound',
            display = true,
            data    = {
                impoundpoint = Config.Impounds[Position].label,
                impoundcars  = Cars,
                infinityrelease = Config.Settings['Impound'].InfinityRelease,
                nextreleasetimer = Config.Settings['Impound'].NextReleaseTimer
            }
        })
    end)
end

function CloseImpoundUI()
    UI_Impound = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'ui_impound',
        display = false
    })
end

function NextReleaseTimer()
    local Timer = Config.Settings['Impound'].NextReleaseTimer * 60000
    local RemainingTimer = (Timer/1000)

    CanReleaseVehicle = false

    Citizen.CreateThread(function()
        while RemainingTimer > 0 do 
            Citizen.Wait(1000)
            RemainingTimer = RemainingTimer - 1
        end

        if RemainingTimer < 1 then
            CanReleaseVehicle = true
        end
    end)
end

-- <===========================>
--        UI - Callbacks

RegisterNUICallback('close', function()
    CloseGarageUI()
    CloseImpoundUI()
end)

RegisterNUICallback('getOutVehicle', function(data)
    local VehicleProps = {}
    CloseGarageUI()

    for k,v in pairs(GarageVehicles) do
        if v.plate == data.plate then
            VehicleProps = json.decode(v.vehicle)
            CurrentGarage = k
            break
        end
    end

    ESX.TriggerServerCallback('champion_garage:getOutVehicle', function(cb)
        if cb then
            ESX.Game.SpawnVehicle(VehicleProps.model, Config.Garages[CurrentActionData.PointName]['VehicleSpawn'].position, Config.Garages[CurrentActionData.PointName]['VehicleSpawn'].heading, function(vehicle)
               -- TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                ESX.Game.SetVehicleProperties(vehicle, VehicleProps)
            
                TriggerEvent("champion:notify", "Information", "Fahrzeug ausgeparkt", "green", 3500)
            end)
        else
            TriggerEvent("champion:notify", "Information", "Ein Fehler ist aufgetreten, versuche es nocheinmal!", "red", 3500)
        end
    end, VehicleProps.plate, CurrentActionData.PointName)

end)

RegisterNUICallback('putInVehicle', function(data)
    CloseGarageUI()
    local VehicleProps = ESX.Game.GetVehicleProperties(tonumber(data.vehicle))
    ESX.TriggerServerCallback('champion_garage:getVehicleByPlate', function(foundcar)

        
        local newVehicleProps = {}
        newVehicleProps = json.decode(foundcar[1].vehicle)
        newVehicleProps.fuelLevel = VehicleProps.fuelLevel
    
        ESX.TriggerServerCallback('champion_garage:StoreVehicle', function(cb)
            if cb then
                ESX.Game.DeleteVehicle(data.vehicle)
              TriggerEvent("champion:notify", "Information", "Fahrzeug eingeparkt", "green", 3500)
            else
                TriggerEvent("champion:notify", "Information", "Ein Fehler ist aufgetreten, versuche es nocheinmal!", "red", 3500)
            end
        end, VehicleProps.plate, newVehicleProps, CurrentActionData.PointName)
    end, VehicleProps.plate)
end)

RegisterNUICallback('releaseVehicle', function(data)
    if CanReleaseVehicle then
        local VehicleProps = {}
        local Vehicles, foundPlate = ESX.Game.GetVehicles()
        CloseImpoundUI()

        for k,v in pairs(ImpoundVehicles) do
            if v.plate == data.plate then
                VehicleProps = json.decode(v.vehicle)
                break
            end
        end

        for i=1, #Vehicles, 1 do
            local props = ESX.Game.GetVehicleProperties(Vehicles[i])

            if props.plate == data.plate then
                foundPlate = true
                break
            end
        end

        if foundPlate then
           TriggerEvent("champion:notify", "Information", "Du kannst dein Fahrzeug nicht ausparken, da es bereits ausgeparkt wurde!", "red", 3500)
        else
            if Config.Settings['Impound'].Price > 0 then
                ESX.TriggerServerCallback('champion_garage:ReleaseVehicle', function(cb)
                    if cb then
                        if not Config.Settings['Impound'].InfinityRelease then
                            NextReleaseTimer()
                        end
        
                        ESX.Game.SpawnVehicle(VehicleProps.model, Config.Impounds[CurrentActionData.PointName]['VehicleSpawn'].position, Config.Impounds[CurrentActionData.PointName]['VehicleSpawn'].heading, function(vehicle)
                           -- TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                            ESX.Game.SetVehicleProperties(vehicle, VehicleProps)
                                
                           TriggerEvent("champion:notify", "Information", "Fahrzeug ausgeparkt", "green", 3500)
                        end)
                    else
                        TriggerEvent("champion:notify","Information", "Du hast nicht genug Geld dabei!", "red", 3500)
                    end
                end)
            else
                if not Config.Settings['Impound'].InfinityRelease then
                    NextReleaseTimer()
                end

                ESX.Game.SpawnVehicle(VehicleProps.model, Config.Impounds[CurrentActionData.PointName]['VehicleSpawn'].position, Config.Impounds[CurrentActionData.PointName]['VehicleSpawn'].heading, function(vehicle)
                   -- TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.Game.SetVehicleProperties(vehicle, VehicleProps)
                        
                  TriggerEvent("champion:notify", "Information", "Fahrzeug ausgeparkt", "green", 3500)
                end)
            end
        end
    else
        TriggerEvent("champion:notify", "Information", "Du kannst nur alle 5 Minuten ein Fahrzeug freigeben", "red", 3500)
    end
end)