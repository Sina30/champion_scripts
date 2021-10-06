local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local PlayerData = {}
local test = 0
local phase = 0
local CurrentActionData = {}
local stoneweg = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)

	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local impacts = 0
local mineActive = false

function Animation()
	Citizen.CreateThread(function()

        while impacts < 150 do
            Citizen.Wait(1)
		local ped = PlayerPedId()	
                RequestAnimDict("melee@large_wpn@streamed_core")
                Citizen.Wait(100)
				TaskPlayAnim((ped), 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
				SetEntityHeading(ped, 185.65)

                if impacts == 0 then
                    pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
					AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
					mineActive = true

				end  

                Citizen.Wait(2500)
                ClearPedTasks(ped)
				impacts = impacts+1
				PlaySoundFrontend(-1, "Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET")

                if impacts == 150 or mineActive == false then
                    DetachEntity(pickaxe, 1, true)
                    DeleteEntity(pickaxe)
					DeleteObject(pickaxe)
					mineActive = false
					stoneweg = true
					impacts = 0
					phase = 1

                    break
                end        
        end
    end)
end
local impactstwo = 0
function Animation2()
    Citizen.CreateThread(function()
        while impactstwo < 100 do
            Citizen.Wait(1)
		local ped = PlayerPedId()	
		Citizen.Wait(100)
		SetEntityHeading(ped, 185.65)

                if impactstwo == 0 then
					TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)

				end  

                Citizen.Wait(2500)
				impactstwo = impactstwo+1
				PlaySoundFrontend(-1, "ROPE_CUT", "ROPE_CUT_SOUNDSET")

				if impactstwo == 100 then
					DoScreenFadeOut(500)
					while not IsScreenFadedOut() do
						Citizen.Wait(10)
					end
					DoScreenFadeIn(1000)

                    DetachEntity(pickaxe, 1, true)
                    DeleteEntity(pickaxe)
					DeleteObject(pickaxe)
					ClearPedTasks(ped)
					impactstwo = 0
					local playerPos = GetEntityCoords(PlayerPedId(), true)

					local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, 1683.0, 2414.88, 45.48)
		
					if distance < 20.0 then
						v = math.random (1, 3)
						if v == 1 then
							NetworkResurrectLocalPlayer(1660.04, 2256.84, 77.64, 90, true, false) 
						end
						if v == 2 then
							NetworkResurrectLocalPlayer(1639.0, 2354.52, 52.28, 90, true, false) 
						end
						if v == 3 then
							NetworkResurrectLocalPlayer(1708.24, 2397.32, 45.68, 90, true, false) 
						end
					end
	


                    break
                end        
        end
    end)
end
local steinspawned = false
local dingsspawned = false
local dingsspawnede = false
local dingsspawnedee = false
local dingsspawnedeee = false

local isinprison = false
local isinpd = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local coords = GetEntityCoords(PlayerPedId())

		if steinspawned == false then
		if GetDistanceBetweenCoords(coords, Config.CircleZones.Prison.coords, true) < 50 then
			SpawnStein()
			steinspawned = true
		end
	end
	if dingsspawned == false then

		if GetDistanceBetweenCoords(coords, Config.CircleZones.Point.coords, true) < 50 then
			SpawnDings()
			dingsspawned = true

		end
	end
	if dingsspawnede == false then

		if GetDistanceBetweenCoords(coords, Config.CircleZones.Dings.coords, true) < 50 then
			SpawnDings2()
			dingsspawnede = true

		end
	end
	if dingsspawnedee == false then

		if GetDistanceBetweenCoords(coords, Config.CircleZones.JailPD.coords, true) < 50 then
			SpawnDings3()
			dingsspawnedee = true

		end
	end
	if dingsspawnedeee == false then

		if GetDistanceBetweenCoords(coords, Config.CircleZones.UnjailerPD.coords, true) < 50 then
			SpawnDings4()
			dingsspawnedee = true

		end
	end


	
	end
end)



function SpawnDings()



end


function SpawnDings4()




end



function SpawnDings3()


end

function SpawnDings2()


end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPos = GetEntityCoords(PlayerPedId(), true)

			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, 1690.28, 2582.4, 45.92)

            if distance < 200.0 then
                if isinprison == true then
                else
                    isinprison = true
                end

            end

            if distance > 200.0 then
                    isinprison = false

			end
			
			local distancee = Vdist(playerPos.x, playerPos.y, playerPos.z, 457.2, -985.72, 26.68)

            if distancee < 100.0 then
				if isinpd == true then
                else
                    isinpd = true
                end

            end

            if distancee > 100.0 then
				isinpd = false

            end
	end
end)






function SpawnStein()
	local model = GetHashKey("prop_rock_4_big2")
	RequestModel(model)
	while (not HasModelLoaded(model)) do
		Wait(1)
	end
	obj = CreateObject(model, 1683.04, 2413.2, 42.94, true, false, true)
	PlaceObjectOnGroundProperly(obj)
	SetModelAsNoLongerNeeded(model)
	SetEntityAsMissionEntity(obj)
	FreezeEntityPosition(obj, true)

end




  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local objectId = GetClosestObjectOfType(pedCoords, 15.0, GetHashKey("prop_rock_4_big2"), false)
        if DoesEntityExist(objectId) and stoneweg == true then
			TriggerServerEvent("test:forcedelete", ObjToNet(objectId))
        end
        
    end
end)


RegisterNetEvent('deleteobject:allow')
AddEventHandler('deleteobject:allow', function(netId)

        if NetworkHasControlOfNetworkId(netId) then
            DeleteObject(NetToObj(netId))
        end
end)
 

AddEventHandler('PommesMitDoener:hasEnteredMarker', function(zone)

	ESX.UI.Menu.CloseAll()
	PlayerData = ESX.GetPlayerData()

	if PlayerData.job.name == "police" or PlayerData.job.name == "fib" then
		if zone == 'Point' then
			CurrentAction     = zone
			CurrentActionMsg  = 'Drücke ~INPUT_CONTEXT~ um die Person zu ~g~inhaftieren~w~.'
			CurrentActionData = {}
	end
	if zone == 'LSPD' then
			CurrentAction     = zone
			CurrentActionMsg  = 'Drücke ~INPUT_CONTEXT~ um die Person zu ~g~inhaftieren~w~.'
			CurrentActionData = {}
	end
	if zone == 'Chief' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Drücke ~INPUT_CONTEXT~ um die inhaftierten Person zu ~g~verwalten~w~.'
		CurrentActionData = {}
end
if zone == 'Captian' then
	CurrentAction     = zone
	CurrentActionMsg  = 'Drücke ~INPUT_CONTEXT~ um die inhaftierten Person zu ~g~verwalten~w~.'
	CurrentActionData = {}
end


	end
	if phase == 0 then
	if zone == 'Prison' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Pickaxe'
		CurrentActionData = {}
end
end
if phase == 1 then
	if zone == 'Prison' then
		CurrentAction     = zone
		CurrentActionMsg  = 'Pickaxe'
		CurrentActionData = {}
end
end
end)

AddEventHandler('PommesMitDoener:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()



end)

-- marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.JailPoint) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
				DrawMarker(23, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				
			end
		end
		for k,v in pairs(Config.BreakOut) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
				DrawMarker(-1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				
			end
		end
		for k,v in pairs(Config.Chief) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance then
				DrawMarker(23, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				
			end
		end
	end
end)

RegisterNetEvent('PommesMitDoener:ReturnInventory')
AddEventHandler('PommesMitDoener:ReturnInventory', function(lol, currentZone)
	test = lol


	TriggerEvent('PommesMitDoener:hasEnteredMarker', currentZone)
end)

RegisterNetEvent('PommesMitDoener:trytostartschaufel')
AddEventHandler('PommesMitDoener:trytostartschaufel', function()
	if CurrentAction == 'Prison' and phase == 1 then
		Animation2()
		TriggerServerEvent("PommesMitDoener:removeDoenerBox", "sgschaufel")
	else
	ESX.ShowNotification("Hier kannst du nicht die Schaufel anwenden. Suche dir einen Platz, der sicher zum buddeln ist.")
	end
end)
RegisterNetEvent('PommesMitDoener:trytostartpickaxe')
AddEventHandler('PommesMitDoener:trytostartpickaxe', function()
	if CurrentAction == 'Prison' and phase == 0 then
		Animation()
		TriggerServerEvent("PommesMitDoener:removeDoenerBox", "sgpickaxe")
	else
	ESX.ShowNotification("Hier kannst du nicht die Spitzhacke anwenden. Suche dir einen Platz, der sicher zum hacken ist.")
	end
end)


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.JailPoint) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x + 0.5) then
				isInMarker  = true
				currentZone = k
			end
		end
		for k,v in pairs(Config.BreakOut) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.0 + 0.5) then
				isInMarker  = true
				currentZone = k
			end
		end
		for k,v in pairs(Config.Chief) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.0 + 0.5) then
				isInMarker  = true
				currentZone = k
			end
		end
		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerEvent('PommesMitDoener:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('PommesMitDoener:hasExitedMarker', lastZone)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			if CurrentActionMsg == "Drücke ~INPUT_CONTEXT~ um die Person zu ~g~inhaftieren~w~." or CurrentActionMsg == "Drücke ~INPUT_CONTEXT~ um die inhaftierten Person zu ~g~verwalten~w~." then
			ESX.ShowHelpNotification(CurrentActionMsg)
			end
			if IsControlJustReleased(0, Keys['E']) and IsPedOnFoot(PlayerPedId()) then
			  if CurrentAction == 'Point' then
								ESX.UI.Menu.CloseAll()
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

								if closestPlayer == -1 or closestDistance > 1.0 then
									TriggerEvent("champion:notify", "Jail - System", "Keine Spieler in der Nähe!", "red", 3500)
								  else
									ESX.UI.Menu.Open(
										'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
										{
										  title = "Hafteinheiten"
										},
									function(data2, menu2)
					  
									  local jailTime = tonumber(data2.value)
					  
									  if jailTime == nil then
										TriggerEvent("champion:notify", "Jail - System", "Die Zeit ist ungültig!", "red", 3500)
									else
											menu2.close()
					  
											if jailTime > 120 then
												TriggerEvent("champion:notify", "Jail - System", "Die Haftzeit ist zu hoch! Max: 120.", "red", 3500)
											else
											if closestPlayer == -1 or closestDistance > 1.0 then
												TriggerEvent("champion:notify", "Jail - System", "Keine Spieler in der Nähe!", "red", 3500)
											else
										TriggerServerEvent("champion_reinda:reinda", GetPlayerServerId(closestPlayer), jailTime, reason)
											  end
									 end
									end
													
							
											
					  
									
					  
									end, function(data2, menu2)
									  menu2.close()
								  end)
								  end

				end
				if CurrentAction == 'LSPD' then
					ESX.UI.Menu.CloseAll()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					if closestPlayer == -1 or closestDistance > 1.0 then
						TriggerEvent("champion:notify", "Jail - System", "Keine Spieler in der Nähe!", "red", 3500)
					  else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
							{
							  title = "Hafteinheiten"
							},
						function(data2, menu2)
		  
						  local jailTime = tonumber(data2.value)
		  
						  if jailTime == nil then
							TriggerEvent("champion:notify", "Jail - System", "Die Zeit ist ungültig!", "red", 3500)

						  else
								menu2.close()
		  
								if jailTime > 120 then
									TriggerEvent("champion:notify", "Jail - System", "Die Haftzeit ist zu hoch! Max: 120.", "red", 3500)

								else
								if closestPlayer == -1 or closestDistance > 1.0 then
									TriggerEvent("champion:notify", "Jail - System", "Keine Spieler in der Nähe!", "red", 3500)
										  else
							TriggerServerEvent("champion_reinda:reinda", GetPlayerServerId(closestPlayer), jailTime, reason)
								  end
						 end
						end
										
				
								
		  
						
		  
						end, function(data2, menu2)
						  menu2.close()
					  end)
					  end

	end
				if CurrentAction == 'Chief' then
					ESX.UI.Menu.CloseAll()
					if PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.grade_name == "chief" or PlayerData.job and PlayerData.job.name == 'fib' and PlayerData.job.grade_name == "boss" then
						TriggerEvent("champion:notify", "Jail - System", "Lädt...", "green", 3500)

					
			local elements = {}

			ESX.TriggerServerCallback("PommesMitDoener:rausmitdenen", function(playerArray)

				if #playerArray == 0 then
					TriggerEvent("champion:notify", "Jail - System", "Keine Spieler im SG", "red", 3500)
					return
				end

				for i = 1, #playerArray, 1 do
					table.insert(elements, {label = "Gefanger: " .. playerArray[i].name .. " | Hafteinheiten: " .. playerArray[i].jailTime .. " Monate", value = playerArray[i].identifier })
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'jail_unjail_menu',
					{
						title = "LSPD",
						align = "center",
						elements = elements
					},
				function(data2, menu2)

					local action = data2.current.value

					TriggerServerEvent("PommesMitDoener:rausda", action)

					menu2.close()

				end, function(data2, menu2)
					menu2.close()
				end)
			end)


					else

						TriggerEvent("champion:notify", "Jail - System", "Keine Berechtigung", "red", 3500)
					end
					  end
					  if CurrentAction == 'Captian' then
						ESX.UI.Menu.CloseAll()
						if PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.grade_name == "chief" or PlayerData.job and PlayerData.job.name == 'fbi' and PlayerData.job.grade_name == "boss" then
							TriggerEvent("champion:notify", "Jail - System", "Lädt...", "green", 3500)
	
						
				local elements = {}
	
				ESX.TriggerServerCallback("PommesMitDoener:rausmitdenen", function(playerArray)
	
					if #playerArray == 0 then
						TriggerEvent("champion:notify", "Jail - System", "Keine Spieler im SG", "red", 3500)
						return
					end
	
					for i = 1, #playerArray, 1 do
						table.insert(elements, {label = "Gefanger: " .. playerArray[i].name .. " | Hafteinheiten: " .. playerArray[i].jailTime .. " Monate", value = playerArray[i].identifier })
					end
	
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'jail_unjail_menu',
						{
							title = "LSPD",
							align = "center",
							elements = elements
						},
					function(data2, menu2)
	
						local action = data2.current.value
	
						TriggerServerEvent("PommesMitDoener:rausda", action)
	
						menu2.close()
	
					end, function(data2, menu2)
						menu2.close()
					end)
				end)
	
	
						else
	
							TriggerEvent("champion:notify", "Jail - System", "Keine Berechtigung", "red", 3500)
						end
						  end
				CurrentAction = nil
			end
		end
	end
end)
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(1000)

	ESX.TriggerServerCallback("PommesMitDoener:getzahl", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			JailLogin()
		end
	end)
end)



RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("PommesMitDoener:getzahl", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			PomDoener()
		end
	end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	PlayerData["job"] = response
end)



RegisterNetEvent("PommesMitDoener:haftlos")
AddEventHandler("PommesMitDoener:haftlos", function(newJailTime)
	jailTime = newJailTime

	HauRin()
end)

RegisterNetEvent("PommesMitDoener:rausda")
AddEventHandler("PommesMitDoener:rausda", function()
	jailTime = 0

	RausDa()
end)

function PomDoener()
	TriggerEvent("champion:notify", "Jail - System", "Da du beim letzten mal schlafen gegangen bist wurdest du automatisch zurück gebracht.", "red", 3500)
	ReinDa()
end

function RausDa()
	ReinDa()

	if isinprison then
	SetEntityCoords(PlayerPedId(), 1846.08, 2585.84, 45.68 - 1)
	
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
	end
	if isinpd then
		SetEntityCoords(PlayerPedId(), 478.12, -978.88, 28.24 - 1)
		
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
		end
	
	TriggerEvent("champion:notify", "Jail - System", "Du wurdest entlassen.", "green", 3500)

	end

function ReinDa()

	--Jail Timer--

	Citizen.CreateThread(function()

		while jailTime > 0 do

			jailTime = jailTime - 1

		TriggerEvent("champion:notify", "Jail - System", "Du hast noch "..jailTime.. " Hafteinheiten übrig.", "white", 3500)
		
			TriggerServerEvent("PommesMitDoener:edittime", jailTime)

			if jailTime == 0 then
				RausDa()

				TriggerServerEvent("PommesMitDoener:edittime", 0)
			end

			Citizen.Wait(60000)
		end

	end)
end