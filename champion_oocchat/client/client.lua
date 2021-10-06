ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('ooc', function(source, args)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local argString = table.concat(args, " ")
  
	if closestPlayer ~= -1 and closestDistance <= 4.5 then
		TriggerServerEvent('OOC', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), argString)
	else
		TriggerEvent("champion:notify", "FEHLER", "Es konnte kein Spieler gefunden werden.", "red", 3500)
	end
	
  end, false)