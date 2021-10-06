ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--LSPD/FIB Schutzwesten 

ESX.RegisterUsableItem('lspdweste1', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste1', 1)
  
  TriggerClientEvent('champion_healing:LSPD1', source)
  end
end)


ESX.RegisterUsableItem('lspdweste2', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste2', 1)

  TriggerClientEvent('champion_healing:LSPD2', source)
  end
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lspdweste3', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste3', 1)

  TriggerClientEvent('champion_healing:LSPD1', source)
  end
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('fib1', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'fib' then
  xPlayer.removeInventoryItem('fib1', 1)

  TriggerClientEvent('champion_healing:fib1', source)
  end
end)


ESX.RegisterUsableItem('fib2', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'fib' then
  xPlayer.removeInventoryItem('fib2', 1)

  TriggerClientEvent('champion_healing:fib2', source)
  end
end)



ESX.RegisterUsableItem('fib3', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'fib' then
  xPlayer.removeInventoryItem('fib3', 1)

  TriggerClientEvent('champion_healing:fib3', source)
  end
end)

--Hotkeys für normale Schutzwesten
RegisterServerEvent('champion_healing:schutzwestecheck')
AddEventHandler('champion_healing:schutzwestecheck', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local bulletproof = xPlayer.getInventoryItem('bulletproof', 1)

      if bulletproof and bulletproof.count ~= 0 then
        TriggerClientEvent('champion_healing:bulletproof', source)
        xPlayer.removeInventoryItem('bulletproof', 1)
      else
        TriggerClientEvent('esx:showNotification', source, "Du hast keine Schutzweste")
      end
end)


RegisterServerEvent('champion_healing:medikitcheck')
AddEventHandler('champion_healing:medikitcheck', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local medikit = xPlayer.getInventoryItem('medikit', 1)

      if medikit and medikit.count ~= 0 then
        TriggerClientEvent('champion_healing:medikit', source)
        xPlayer.removeInventoryItem('medikit', 1)
      else
        TriggerClientEvent('esx:showNotification', source, "Du hast kein Verbandskasten")
      end
end)

ESX.RegisterUsableItem('bulletproof', function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('bulletproof', 1)

    TriggerClientEvent('champion_healing:bulletproof', source)
end)

-- Weapon Clip
ESX.RegisterUsableItem('clip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:clipcli', source)
	xPlayer.removeInventoryItem('clip', 1)
end)
