ESX = nil
local cuffed = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("cuffs", function(source)
    TriggerClientEvent("champion_carmenu:checkCuff", source)
end)

ESX.RegisterUsableItem("cuff_keys", function(source)
    TriggerClientEvent("champion_carmenu:wegda", source)
end)

RegisterServerEvent("champion_carmenu:wegda")
AddEventHandler("champion_carmenu:wegda",function(player)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("cuffs",1)
    cuffed[player]=false
    TriggerClientEvent('champion_carmenu:forceUncuff', player)
end)

RegisterServerEvent("champion_carmenu:randa")
AddEventHandler("champion_carmenu:randa",function(player,state)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    cuffed[player]=state
    TriggerClientEvent('champion_carmenu:randa', player)
    xPlayer.addInventoryItem("cuffs",1)
end)

ESX.RegisterServerCallback("champion_carmenu:isCuffed",function(source,cb,target)
    cb(cuffed[target]~=nil and cuffed[target])
end)