champion_action = {
    name = "",
    duration = 0,
    label = "",
    useWhileDead = false,
    canCancel = true,
    controlDisables = {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    },
    animation = {
        animDict = nil,
        anim = nil,
        flags = 0,
        task = nil,
    },
    prop = {
        model = nil,
    },
}

local isDoingAction = false
local disableMouse = false
local wasCancelled = false
local isAnim = false
local isProp = false
local prop_net = nil

RegisterNetEvent("champion_progressbar:client:progress")
AddEventHandler("champion_progressbar:client:progress", function(time, text)
    isAnim = false
    isProp = false
	
    SendNUIMessage({
        action = "champion_progress",
        duration = time,
        label = text
    })
end)

RegisterNetEvent("champion_progressbar:client:cancel")
AddEventHandler("champion_progressbar:client:cancel", function()
    isDoingAction = false
    wasCancelled = true

    TriggerEvent("champion_progressbar:client:actionCleanup")

    SendNUIMessage({
        action = "champion_progress_cancel"
    })
end)

RegisterNetEvent("champion_progressbar:client:actionCleanup")
AddEventHandler("champion_progressbar:client:actionCleanup", function()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    StopAnimTask(ped, champion_action.animDict, champion_action.anim, 1.0)
    DetachEntity(NetToObj(prop_net), 1, 1)
    DeleteEntity(NetToObj(prop_net))
    prop_net = nil
end)

-- Disable controls while GUI open
Citizen.CreateThread(function()
    while true do
        if isDoingAction then
            if not isAnim then
                if champion_action.animation ~= nil then
                    if champion_action.animation.task ~= nil then
                        TaskStartScenarioInPlace(PlayerPedId(), champion_action.animation.task, 0, true)
                    elseif champion_action.animation.animDict ~= nil and champion_action.animation.anim ~= nil then
                        if champion_action.animation.flags == nil then
                            champion_action.animation.flags = 1
                        end

                        local player = PlayerPedId()
                        if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
                            loadAnimDict( champion_action.animation.animDict )
                            TaskPlayAnim( player, champion_action.animation.animDict, champion_action.animation.anim, 3.0, 1.0, -1, champion_action.animation.flags, 0, 0, 0, 0 )     
                        end
                    else
                        
                    end
                end

                isAnim = true
            end
            if not isProp and champion_action.prop ~= nil and champion_action.prop.model ~= nil then
                RequestModel(champion_action.prop.model)

                while not HasModelLoaded(GetHashKey(champion_action.prop.model)) do
                    Citizen.Wait(0)
                end

                local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
                local modelSpawn = CreateObject(GetHashKey(champion_action.prop.model), pCoords.x, pCoords.y, pCoords.z, true, true, true)

                local netid = ObjToNet(modelSpawn)
                SetNetworkIdExistsOnAllMachines(netid, true)
                NetworkSetNetworkIdDynamic(netid, true)
                SetNetworkIdCanMigrate(netid, false)
                AttachEntityToEntity(modelSpawn, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                prop_net = netid

                isProp = true
            end

            DisableActions(GetPlayerPed(-1))
        end
        Citizen.Wait(0)
    end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function DisableActions(ped)
    if champion_action.controlDisables.disableMouse then
        DisableControlAction(0, 1, true) -- LookLeftRight
        DisableControlAction(0, 2, true) -- LookUpDown
        DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
    end

    if champion_action.controlDisables.disableMovement then
        DisableControlAction(0, 30, true) -- disable left/right
        DisableControlAction(0, 31, true) -- disable forward/back
        DisableControlAction(0, 36, true) -- INPUT_DUCK
        DisableControlAction(0, 21, true) -- disable sprint
    end

    if champion_action.controlDisables.disableCarMovement then
        DisableControlAction(0, 63, true) -- veh turn left
        DisableControlAction(0, 64, true) -- veh turn right
        DisableControlAction(0, 71, true) -- veh forward
        DisableControlAction(0, 72, true) -- veh backwards
        DisableControlAction(0, 75, true) -- disable exit vehicle
    end

    if champion_action.controlDisables.disableCombat then
        DisablePlayerFiring(ped, true) -- Disable weapon firing
        DisableControlAction(0, 24, true) -- disable attack
        DisableControlAction(0, 25, true) -- disable aim
        DisableControlAction(1, 37, true) -- disable weapon select
        DisableControlAction(0, 47, true) -- disable weapon
        DisableControlAction(0, 58, true) -- disable weapon
        DisableControlAction(0, 140, true) -- disable melee
        DisableControlAction(0, 141, true) -- disable melee
        DisableControlAction(0, 142, true) -- disable melee
        DisableControlAction(0, 143, true) -- disable melee
        DisableControlAction(0, 263, true) -- disable melee
        DisableControlAction(0, 264, true) -- disable melee
        DisableControlAction(0, 257, true) -- disable melee
    end
end

RegisterNUICallback('actionFinish', function(data, cb)
    -- Do something here
    isDoingAction = false
    TriggerEvent("champion_progressbar:client:actionCleanup")
    cb('ok')
end)

RegisterNUICallback('actionCancel', function(data, cb)
    -- Do something here
    cb('ok')
end)
