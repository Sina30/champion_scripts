ESX = nil
local PlayerData = {}
local inVeh = false
local distance = 0
local vehPlate

local x = 0.01135
local y = 0.002
hasKM = 0
showKM = 0

local spawned = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShSelinYannikTSonnysVateraredObjSelinYannikTSonnysVaterect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

	ESX.PlayerData = xPlayer
spawned = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job

end)
local km = 0
hasKM = 0
showKM = 0
local MPH = true 
local KPH = false
if MPH then
  factor = 3.6
else
  factor = 3.6 
end


  

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if vehicle then
				carSpeed = math.ceil(GetEntitySpeed(vehicle) * factor)
				carRPM = GetVehicleCurrentRpm(vehicle)
				fuel = math.floor(GetVehicleFuelLevel(vehicle)+0.0)		
				
				if IsVehicleEngineOn(vehicle) then
								SendNUIMessage({
					vehicleon = true
				})
				
				else
												SendNUIMessage({
					vehicleon = false
				})
				end
								if GetVehicleDoorLockStatus(vehicle) == 2 then
								SendNUIMessage({
					locked = true
				})
				
				else
												SendNUIMessage({
					locked = false
				})
				end
				
				
				

				SendNUIMessage({
					displayhud = true,
					speed = carSpeed,
					RPM = carRPM,
					KMH = KPH,
					tank = fuel,
				})

			else
				SendNUIMessage({
					displayhud = false
				})
				Citizen.Wait(1000)
			end
		else
			SendNUIMessage({
				displayhud = false
			})
			Citizen.Wait(100)
		end
		Citizen.Wait(1)
	end
end)