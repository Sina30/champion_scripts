ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'tiermenu', "projektleiter", function(source, args, user)
  TriggerClientEvent('champion:tiermenu',source)
end)

RegisterServerEvent('champion_uniformen:lspdstandard')
AddEventHandler('champion_uniformen:lspdstandard', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local lspdstandard = xPlayer.getInventoryItem('lspdstandard', 1)

      if lspdstandard and lspdstandard.count ~= 0 then
        TriggerClientEvent('champion_uniformen:lspdstandard', source)
        xPlayer.removeInventoryItem('lspdstandard', 1)
      end
end)

RegisterServerEvent('champion_uniformen:lsmdstandard')
AddEventHandler('champion_uniformen:lsmdstandard', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local lspdstandard = xPlayer.getInventoryItem('lsmdstandard', 1)

      if lspdstandard and lspdstandard.count ~= 0 then
        TriggerClientEvent('champion_uniformen:lsmdstandard', source)
        xPlayer.removeInventoryItem('lsmdstandard', 1)
      end
end)


ESX.RegisterUsableItem('lspdstandard', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lspdstandard', 1)

    TriggerClientEvent('champion_uniformen:lspdstandard', source)
end)

ESX.RegisterUsableItem('lsmdstandard', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('lsmdstandard', 1)

  TriggerClientEvent('champion_uniformen:lsmdstandard', source)
end)

RegisterNetEvent("realtime:event")
AddEventHandler("realtime:event", function()
	TriggerClientEvent("realtime:event", source, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)

ESX.RegisterServerCallback('champion_core:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('champion_core:lsfdstandard')
AddEventHandler('champion_core:lsfdstandard', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local lspdstandard = xPlayer.getInventoryItem('lsfdstandard', 1)

      if lspdstandard and lspdstandard.count ~= 0 then
        TriggerClientEvent('champion_core:lsfdstandard', source)
        xPlayer.removeInventoryItem('lsfdstandard', 1)
      end
end)

ESX.RegisterUsableItem('lsfdstandard', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('lsfdstandard', 1)

  TriggerClientEvent('champion_core:lsfdstandard', source)
end)

ESX.RegisterUsableItem('lspdweste1', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste1', 1)
  
  TriggerClientEvent('champion_core:LSPD1', source)
  end
end)


ESX.RegisterUsableItem('lspdweste2', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste2', 1)

  TriggerClientEvent('champion_core:LSPD2', source)
  end
end)

ESX.RegisterUsableItem('lspdweste3', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == 'police' then
  xPlayer.removeInventoryItem('lspdweste3', 1)

  TriggerClientEvent('champion_core:LSPD1', source)
  end
end)

local Cops = {
	"steam:100000000000",
}

RegisterServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon")
AddEventHandler("PoliceVehicleWeaponDeleter:askDropWeapon", function(wea)
	local isCop = false

	for _,k in pairs(Cops) do
		if(k == getPlayerID(source)) then
			isCop = true
			break;
		end
	end

	if(not isCop) then
		TriggerClientEvent("PoliceVehicleWeaponDeleter:drop", source, wea)
	end

end)


function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end