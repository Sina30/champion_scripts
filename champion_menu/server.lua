ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

local function makeTargetedEventFunction(fn)
	return function(target, ...)
		if tonumber(target) == -1 then return end
		fn(target, ...)
	end
end

RegisterServerEvent('champion_menu:einstellen')
AddEventHandler('champion_menu:einstellen', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 0)
    TriggerEvent("champion:notify", "Fraktions - Manager", "Den Spieler erfolgreich eingestellt", "geeen", 3500)
	end
end))

RegisterServerEvent('champion_menu:entlassen')
AddEventHandler('champion_menu:entlassen', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			targetXPlayer.setJob('unemployed', 0)
      TriggerEvent("champion:notify", "Fraktions - Manager", "Den Spieler erfolgreich entlassen", "geeen", 3500)
		else
      TriggerEvent("champion:notify", "Fraktions - Manager", "Der Spieler ist nicht im gleichen Job wie du", "red", 3500)
		end
	else
    TriggerEvent("champion:notify", "Fraktions - Manager", "Du bist nicht der Rang 12er", "red", 3500)
	end
end))

RegisterServerEvent('champion_menu:promote')
AddEventHandler('champion_menu:promote', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) + 1

			if newGrade ~= getMaximumGrade(targetJob.name) then
				targetXPlayer.setJob(targetJob.name, newGrade)

        TriggerEvent("champion:notify", "Fraktions - Manager", "Den Spieler erfolgreich befördert", "green", 3500)
			else
        TriggerEvent("champion:notify", "Fraktions - Manager", "Fehler", "red", 3500)
			end
		else
      TriggerEvent("champion:notify", "Fraktions - Manager", "Der Spieler ist nicht im gleichen Job wie du", "red", 3500)
		end
	else
    TriggerEvent("champion:notify", "Fraktions - Manager", "Du bist nicht der Rang 12er", "red", 3500)
	end
end))

RegisterServerEvent('champion_menu:destitute')
AddEventHandler('champion_menu:destitute', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local targetJob = targetXPlayer.getJob()

		if sourceJob.name == targetJob.name then
			local newGrade = tonumber(targetJob.grade) - 1

			if newGrade >= 0 then
				targetXPlayer.setJob(targetJob.name, newGrade)

        TriggerEvent("champion:notify", "Fraktions - Manager", "Den Spieler erfolgreich degradiert", "green", 3500)
			else
        TriggerEvent("champion:notify", "Fraktions - Manager", "Fehler", "red", 3500)
			end
		else
      TriggerEvent("champion:notify", "Fraktions - Manager", "Der Spieler ist nicht im gleichen Job wie du", "red", 3500)
		end
	else
    TriggerEvent("champion:notify", "Fraktions - Manager", "Du bist nicht der Rang 12er", "red", 3500)
	end
end))