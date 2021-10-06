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
local PlayerData = {}

local RobTimer = 60
local RobCooldown = 0
local needCops = 0

local mix_val = 15000
local max_val = 20000

local enableField = false

local atms = {
	{name="ATM", id=277, x=-386.733, y=6045.953, z=31.501},
	{name="ATM", id=277, x=435.89, y=-976.43, z=30.72},
	{name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
	{name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
	{name="ATM", id=277, x=-135.165, y=6365.738, z=31.101},
	{name="ATM", id=277, x=-110.753, y=6467.703, z=31.784},
	{name="ATM", id=277, x=-94.9690, y=6455.301, z=31.784},
	{name="ATM", id=277, x=155.4300, y=6641.991, z=31.784},
	{name="ATM", id=277, x=174.6720, y=6637.218, z=31.784},
	{name="ATM", id=277, x=1703.138, y=6426.783, z=32.730},
	{name="ATM", id=277, x=1735.114, y=6411.035, z=35.164},
	{name="ATM", id=277, x=1702.842, y=4933.593, z=42.051},
	{name="ATM", id=277, x=412.41, y=-1616.86, z=29.29},

	{name="ATM", id=277, x=315.11, y=-593.64, z=43.28},
	{name="ATM", id=277, x=1088.1, y = 219.64, z = -49.2},
	{name="ATM", id=277, x=1967.333, y=3744.293, z=32.272},
	{name="ATM", id=277, x=1821.917, y=3683.483, z=34.244},
	{name="ATM", id=277, x=1174.532, y=2705.278, z=38.027},
	{name="ATM", id=277, x=540.0420, y=2671.007, z=42.177},
	{name="ATM", id=277, x=2564.399, y=2585.100, z=38.016},
	{name="ATM", id=277, x=2558.683, y=349.6010, z=108.050},
	{name="ATM", id=277, x=2558.051, y=389.4817, z=108.660},
	{name="ATM", id=277, x=1077.692, y=-775.796, z=58.218},
	{name="ATM", id=277, x=1139.018, y=-469.886, z=66.789},
	{name="ATM", id=277, x=1168.975, y=-457.241, z=66.641},
	{name="ATM", id=277, x=1153.884, y=-326.540, z=69.245},
	{name="ATM", id=277, x=381.2827, y=323.2518, z=103.270},
	{name="ATM", id=277, x=236.4638, y=217.4718, z=106.840},
	{name="ATM", id=277, x=265.0043, y=212.1717, z=106.780},
	{name="ATM", id=277, x=285.2029, y=143.5690, z=104.970},
	{name="ATM", id=277, x=-164.568, y=233.5066, z=94.919},
	{name="ATM", id=277, x=-1827.04, y=785.5159, z=138.020},
	{name="ATM", id=277, x=-1409.39, y=-99.2603, z=52.473},
	{name="ATM", id=277, x=-1205.35, y=-325.579, z=37.870},
	{name="ATM", id=277, x=-1215.64, y=-332.231, z=37.881},
	{name="ATM", id=277, x=-2072.41, y=-316.959, z=13.345},
	{name="ATM", id=277, x=-2975.72, y=379.7737, z=14.992},
	{name="ATM", id=277, x=-2962.60, y=482.1914, z=15.762},
	{name="ATM", id=277, x=-2955.70, y=488.7218, z=15.486},
	{name="ATM", id=277, x=-3241.10, y=996.6881, z=12.500},
	{name="ATM", id=277, x=-3241.11, y=1009.152, z=12.877},
	{name="ATM", id=277, x=-1305.40, y=-706.240, z=25.352},
	{name="ATM", id=277, x=-538.225, y=-854.423, z=29.234},
	{name="ATM", id=277, x=-711.156, y=-818.958, z=23.768},
	{name="ATM", id=277, x=-717.614, y=-915.880, z=19.268},
	{name="ATM", id=277, x=-526.566, y=-1222.90, z=18.434},
	{name="ATM", id=277, x=-256.831, y=-719.646, z=33.444},
	{name="ATM", id=277, x=-203.548, y=-861.588, z=30.205},
	{name="ATM", id=277, x=112.4102, y=-776.162, z=31.427},
	{name="ATM", id=277, x=112.9290, y=-818.710, z=31.386},
	{name="ATM", id=277, x=119.9000, y=-883.826, z=31.191},
	{name="ATM", id=277, x=149.4551, y=-1038.95, z=29.366},
	{name="ATM", id=277, x=-846.304, y=-340.402, z=38.687},
	{name="ATM", id=277, x=-1204.35, y=-324.391, z=37.877},
	{name="ATM", id=277, x=-1216.27, y=-331.461, z=37.773},
	{name="ATM", id=277, x=-56.1935, y=-1752.53, z=29.452},
	{name="ATM", id=277, x=-261.692, y=-2012.64, z=30.121},
	{name="ATM", id=277, x=-273.001, y=-2025.60, z=30.197},
	{name="ATM", id=277, x=314.187, y=-278.621, z=54.170},
	{name="ATM", id=277, x=-351.534, y=-49.529, z=49.042},
	{name="ATM", id=277, x=24.589, y=-946.056, z=29.357},
	{name="ATM", id=277, x=-254.112, y=-692.483, z=33.616},
	{name="ATM", id=277, x=-1570.197, y=-546.651, z=34.955},
	{name="ATM", id=277, x=-1415.909, y=-211.825, z=46.500},
	{name="ATM", id=277, x=-1430.112, y=-211.014, z=46.500},
	{name="ATM", id=277, x=33.232, y=-1347.849, z=29.497},
	{name="ATM", id=277, x=129.216, y=-1292.347, z=29.269},
	{name="ATM", id=277, x=287.645, y=-1282.646, z=29.659},
	{name="ATM", id=277, x=289.012, y=-1256.545, z=29.440},
	{name="ATM", id=277, x=295.839, y=-895.640, z=29.217},
	{name="ATM", id=277, x=1686.753, y=4815.809, z=42.008},
	{name="ATM", id=277, x=-302.408, y=-829.945, z=32.417},
	{name="ATM", id=277, x=5.134, y=-919.949, z=29.557},
	{name="ATM", id=277, x=527.26, y=-160.76, z=57.09},

	{name="ATM", id=277, x=-867.19, y=-186.99, z=37.84},
	{name="ATM", id=277, x=-821.62, y=-1081.88, z=11.13},
	{name="ATM", id=277, x=-1315.32, y=-835.96, z=16.96},
	{name="ATM", id=277, x=-660.71, y=-854.06, z=24.48},
	{name="ATM", id=277, x=-1109.73, y=-1690.81, z=4.37},
	{name="ATM", id=277, x=-1091.5, y=2708.66, z=18.95},
	{name="ATM", id=277, x=1171.98, y=2702.55, z=38.18},
	{name="ATM", id=277, x=2683.09, y=3286.53, z=55.24},
	{name="ATM", id=277, x=89.61, y=2.37, z=68.31},
	{name="ATM", id=277, x=-30.3, y=-723.76, z=44.23},
	{name="ATM", id=277, x=-28.07, y=-724.61, z=44.23},
	{name="ATM", id=277, x=-613.24, y=-704.84, z=31.24},
	{name="ATM", id=277, x=-618.84, y=-707.9, z=30.5},
	{name="ATM", id=277, x=-1289.23, y=-226.77, z=42.45},
	{name="ATM", id=277, x=-1285.6, y=-224.28, z=42.45},
	{name="ATM", id=277, x=-1286.24, y=-213.39, z=42.45},
	{name="ATM", id=277, x=1318.23, y=-1651.83, z=52.15},
	{name="ATM", id=277, x=-1282.54, y=-210.45, z=42.45},
	{name="ATM", id=277, x=-315.36, y=-593.76, z=43.28},	
}



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


function open()
	ESX.TriggerServerCallback('champion_bank:getUserInfo', function(user)
		SetNuiFocus(true, true)
		enableField = true		
		
		SendNUIMessage({
	
			action = "open",
			name = user.firstname .. "_" .. user.lastname,
			cash = user.money,
			bank = user.bank
	
		})
	end)
end
  
function close()
  
	SetNuiFocus(false, false)
	enableField = false
	
	SendNUIMessage({
	
		action = "close"
	
	})
	
end

function OpenMain()
		local elements = {}
		table.insert(elements, {label = 'Benutzen', value = 'use'})
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format("Ausrauben"), value = 'rob'})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'atm_maininteractions', {
			title    = 'Bankautomat - Menü',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			ESX.UI.Menu.CloseAll()

			if data.current.value == 'use' then
				open()
			elseif data.current.value == 'rob' then
					if not robbing then
						if RobCooldown == 0 then
							RobATM()
						else
							ESX.ShowNotification(("Bitte warte %s Sekunden!"):format(RobCooldown))
						end
					else
						ESX.ShowNotification("Du raubst bereits einen Bankautomaten aus!")
					end
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNUICallback('auszahlung', function(data, cb)	
	ESX.TriggerServerCallback('champion_bank:auszahlung', function(executed)

		if executed then
			ESX.ShowNotification(('Du hebst %s$ ab!'):format(data.money))
		else
			ESX.ShowNotification('Fehler!')
		end

		cb("ok")
	end, data.money)
end)

RegisterNUICallback('einzahlung', function(data, cb)
	
	ESX.TriggerServerCallback('champion_bank:einzahlung', function(executed)

		if executed then
			ESX.ShowNotification(('Du zahlst $%s ein!'):format(data.money))
		else
			ESX.ShowNotification('Fehler!')
		end

		cb("ok")
	end, data.money)
end)

RegisterNUICallback('escape', function(data, cb)
	SetNuiFocus(false, false)
	enableField = false
  
	SendNUIMessage({
  
	  action = "close"
  
	})

	close()
end)

local robbing = false

function RobATM()

	local location = GetEntityCoords(GetPlayerPed(-1))

	local x,y,z = table.unpack(location)

    local coords = {x = x, y = y, z = z}

    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', "Aktiver Bankautomaten Raub. Alle Einheiten anfahren!", coords, {

    	coords = {x = x, y = y, z = z},

    })
    TriggerServerEvent('esx_addons_gcphone:startCall', 'fbi', "Aktiver Bankautomaten Raub. Alle Einheiten anfahren!", coords, {

    	coords = {x = x, y = y, z = z},

    })

	TriggerEvent("mythic_progressbar:client:progress", {
		name = "unique_action_name",
		duration = 60000,
		label = "",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "amb@prop_human_atm@male@idle_a",
			anim = "idle_b",
		}
	}, function(status)
		if not status then



		end
	end)      

	local reward = math.random(mix_val, max_val)
	robbing = true
	ESX.ShowNotification(("Der Raub wurde gestartet! Bitte warte %s Sekunden."):format(RobTimer))
	Citizen.Wait(RobTimer * 1000)
	if robbing then
		TriggerServerEvent('champion_bank:getRobReward', reward)
		ESX.ShowNotification(("Du erhälst $%s."):format(reward))
		ESX.ShowNotification('Du fasst das Geld an! Eine Farbbombe ist explodiert!')
		TriggerServerEvent('champion_bank:setFarbbomb', 1)
		robbing = false
		RobCooldown = 850
	end
end
local nearATM = false

local allowedAtms = 
{
    [-1364697528] = true,
	[-870868698] = true,
	[-1364697528] = true,
		[-1364697528] = true,
	[506770882] = true
}
function FindNearestATM()
	local coords = GetEntityCoords(PlayerPedId())
	local ATMs = {}
	local handle, object = FindFirstObject()
	local success

	repeat
		if allowedAtms[GetEntityModel(object)] then

			table.insert(ATMs, object)
		end

		success, object = FindNextObject(handle, object)
	until not success

	EndFindObject(handle)

	local ATMObject = 0
	local ATMDistance = 1000

	for _, fuelATMObject in pairs(ATMs) do
		local dstcheck = GetDistanceBetweenCoords(coords, GetEntityCoords(fuelATMObject))

		if dstcheck < ATMDistance then
			ATMDistance = dstcheck
			ATMObject = fuelATMObject
		end
	end

	return ATMObject, ATMDistance
end

CreateThread(function()
    while true do
        local ATMObject, ATMDistance = FindNearestATM()

		if ATMDistance < 2.0 then
			nearATM = ATMObject
        else
            nearATM = false 
        end

        Wait(500)
    end
end)


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if nearATM then
				ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~ um den ~b~Bankautomaten ~w~zu öffnen.")

				if IsControlJustPressed(0,38) then
					open()
				end
        end
    end
end)
