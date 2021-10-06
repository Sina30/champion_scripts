ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterServerCallback('rw:hasMoney', function(source, cb, amount, remove)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= amount then
        if remove then
            xPlayer.removeMoney(1000)
        end
        cb(true)
    else
        cb(false)
    end

end)
