tESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("announce", function(source, args)
    local argString = table.concat(args, " ")
    if argString ~= nil then
		TriggerClientEvent('champion_notifyannounce_server:on', -1, argString)
    end
end, true)