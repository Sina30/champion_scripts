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


Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

--LSPD
RegisterNetEvent('champion_uniformen:lspdstandard')
AddEventHandler('champion_uniformen:lspdstandard', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    --Männlich
    if skin.sex == 0 then
		local clothesSkin = {
    ['tshirt_1'] = 58,  ['tshirt_2'] = 0,
		['torso_1'] = 55,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 30,
		['pants_1'] = 31,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
    }
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)  
  ESX.ShowNotification('Du hast dir LSPD Kleidung (Standard) angezogen')
  else--Weiblich    
    local clothesSkin = {
      ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
      }
    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    ESX.ShowNotification('Du hast dir LSPD Kleidung (Standard) angezogen')
    end
	end)
end)   

--lsmd
RegisterNetEvent('champion_uniformen:lsmdstandard')
AddEventHandler('champion_uniformen:lsmdstandard', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    --Männlich
    if skin.sex == 0 then
		local clothesSkin = {
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 123,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 24,   ['pants_2'] = 5,
		['shoes_1'] = 77,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 126,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0
    }
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)  
  ESX.ShowNotification('Du hast dir LSMD Kleidung (Standard) angezogen')
  else--Weiblich    
    local clothesSkin = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 119,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 23,   ['pants_2'] = 0,
			['shoes_1'] = 81,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
      }
    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    ESX.ShowNotification('Du hast dir LSMD Kleidung (Standard) angezogen')
    end
	end)
end)


local coordonate = {
  {338.53,-586.9,73.17,"Garage lsmd Dach",241.39,0xF06B849D,"s_m_m_autoshop_02"},
  {339.3835144043,-586.43634033203,28.796859741211,"Garage lsmd Unten",73.50,0xF06B849D,"s_m_m_autoshop_02"},
  {460.10531616211,-986.87194824219,24.699831008911,"Garage LSPD Vorne",93.74,0xF06B849D,"s_m_m_autoshop_02"},
  {461.47,-980.06,42.69,"Garage LSPD Dach Helis",181.21,0xF06B849D,"s_m_m_autoshop_02"},
  {95.16,-723.86,32.13,"Garage FIB Unten",296.17,0xF06B849D,"s_m_m_autoshop_02"},
  {116.21,-739.37,261.85,"Garage FIB Dach",251.68,0xF06B849D,"s_m_m_autoshop_02"},
  {473.05,-1018.51,27.15,"Garage LSPD Hinten",179.24,0xF06B849D,"s_m_m_autoshop_02"},
  {-126.97,1922.49,196.31,"NPC für Kröten Verarbeitung",355.3,0xD2B27EC1,"mp_f_meth_01"},
  {298.69,-609.33,42.29,"NPC für Kröten Verarbeitung",73.3,0xF06B849D,"s_m_m_autoshop_02"},
  {2078.35,1687.02,102.12,"NPC für Ephi Verarbeitung",179.85,0xF6157D8F,"g_m_m_chemwork_01"},
  {28.08,3665.35,39.44,"NPC für Ephi zu Meth Verarbeiter",238.64,0xD2B27EC1,"mp_f_meth_01"},
  {-760.75,2579.21,59.48,"NPC für Meth Verkäufer",30.41,0xB594F5C3,"cs_lestercrest"},
  {2763.6804199219,1348.0274658203,24.523994445801,"Garage 17",38.77,0xF06B849D,"s_m_m_autoshop_02"},
  {-1099.9774169922,-2174.4682617188,12.3914775848392,"Garage Medellin",38.77,0xF06B849D,"s_m_m_autoshop_02"},
  {-814.37,-183.86,36.57,"Friseur 1",119.66,0xB7C61032,"a_f_y_business_04"},
  {136.98,-1707.82,28.29,"Friseur 2",139.99,0xB7C61032,"a_f_y_business_04"},
  {-1282.58,-1116.79,5.99,"Friseur 3",89.98,0xB7C61032,"a_f_y_business_04"},
  {1931.53,3729.94,31.84,"Friseur 4",208.03,0xB7C61032,"a_f_y_business_04"},
  {1212.06,-472.51,65.21,"Friseur 5",73.57,0xB7C61032,"a_f_y_business_04"},
  {-32.43,-151.49,56.08,"Friseur 6",341.38,0xB7C61032,"a_f_y_business_04"},
  {-278.07,6228.52,30.7,"Friseur 7",43.09,0xB7C61032,"a_f_y_business_04"},
  {-33.61,-1102.01,25.42,"Fahrzeughändler - Luxus",72.18,0x9760192E,"cs_bankman"},
  {-760.92,-2629.54,12.94,"Fahrzeughändler - Trucks",333.48,0x9760192E,"cs_bankman"},
  {5054.1098632812,-4597.1533203125,2.8836166858673,"Fahrzeughändler - CayoPerico",141.24,0x9760192E,"cs_bankman"},
  {268.62,-1155.38, 28.29,"Fahrzeughändler - Motorrad",91.01,0x9760192E,"cs_bankman"},
  {-40.83,-1674.74, 28.47,"Fahrzeughändler - Lowrider",141.29,0x9760192E,"cs_bankman"},
  {-239.04,-1397.73, 30.28,"Fahrzeughändler - Standard",278.42,0x9760192E,"cs_bankman"},
  {-766.92504882812,-23.183588027954,40.08129119873,"NPC NAMEN",207.42,0x9760192E,"cs_bankman"},
  {-1153.38,-1425.68,3.95,"Tattooshop 2",35.54,0x94AE2B8C,"u_m_y_tattoo_01"},
  {1323.71,-1652.28,51.28,"Tattooshop 1",35.85,0x94AE2B8C,"u_m_y_tattoo_01"},
  {-3170.49,1075.22, 19.83,"Tattooshop 4",248.43,0x94AE2B8C,"u_m_y_tattoo_01"},
  {321.96,181.29,102.59,"Tattooshop 3",165.58,0x94AE2B8C,"u_m_y_tattoo_01"},
  {1863.81,3749.63,32.03,"Tattooshop 5",37.73,0x94AE2B8C,"u_m_y_tattoo_01"},
  {-293.13,6198.01,30.49,"Tattooshop 6",230.01,0x94AE2B8C,"u_m_y_tattoo_01"},
  {-236.82150268555,-256.55776977539,38.117431640625,"KEVLARVERARBEITER",.83,0xD2B27EC1,"mp_f_meth_01"},
  {-623.10467529297,-225.5422668457,37.057006835938,"KettenVerkauf",154.54,0x9760192E,"cs_bankman"},
  {-1328.1129150391,-237.95068359375,41.700180053711,"Perlen Verarbeiten",287.54,0x9760192E,"cs_bankman"},
  {-646.42883300781,-1778.9036865234,23.486190795898,"Muscheln Verarbeiten",207.54,0x9760192E,"cs_bankman"},
  {860.98071289062,-2535.5026855469,27.446743011475,"Koks Verkauf",175.54,0x9760192E,"cs_bankman"},
  {939.71,-2198.65,29.55,"NPC für Juwelen Verkauf",358.48,0xB594F5C3,"cs_lestercrest"},
  {2747.66,3472.95,54.67,"NPC für Baumarktshop",246.83,0xB7C61032,"a_f_y_business_04"},
  {240.97,-1379.05,32.74,"NPC für Fahrschule",141.3,0x5244247D,"u_m_y_baygor"},
  {1003.12,-2409.22,29.51,"NPC für Bauxit zu Aluminiumoxid vearbeiter",177.14,0xD2B27EC1,"mp_f_meth_01"},
  {-2276.12890625,332.27993774414,173.60186767578,"NPC für Eisen zu Eisenerz verarbeiter",20.87,0xD2B27EC1,"mp_f_meth_01"},
  {849.07983398438,2383.5700683594,53.160648345947,"NPC für Eisenerz zu Eisen verarbeiter",226.94,0xD2B27EC1,"mp_f_meth_01"},
  {1201.24,1849.54,77.87,"NPC für Trauben zu Traubensaft verarbeiter",42.7,0xD2B27EC1,"mp_f_meth_01"},
  {-87.67,1880.32,196.33,"NPC für Trauben zu Traubensaft",274.49,0xD2B27EC1,"mp_f_meth_01"},
  {1238.72,1877.18,77.87,"NPC für Orangen zu Orangensaft verarbeiter",309.5,0xD2B27EC1,"mp_f_meth_01"},
  {2741.57,4412.92,47.62,"NPC für Traubensaft Verkäufer",195.29,0xD2B27EC1,"mp_f_meth_01"},
  {1195.93,1819.73,77.95,"NPC für Weedsamen zu Weed verarbeiter",111.97,0xD2B27EC1,"mp_f_meth_01"},
  {1213.9689941406,-1250.8322753906,35.325752258301,"Kevlar Verarbeiter",92.97,0xD2B27EC1,"mp_f_meth_01"},
  {780.9,1274.83,360.28,"NPC für Weed zu Joint verarbeiter",268.98,0xD2B27EC1,"mp_f_meth_01"},
  {4982.5478515625,-5116.9672851562,2.6065654754639,"NPC für Eisen zu Waffen verarbeiter",268.98,0xD2B27EC1,"mp_f_meth_01"},
  {1362.04,-608.8,73.34,"Garage Grove",87.17,0xF06B849D,"s_m_m_autoshop_02"},
  {-1129.6,-1604.67,3.4,"Garage Vagos",216.04,0xF06B849D,"s_m_m_autoshop_02"},
  {102.09,-1958.7,19.79,"Garage Ballas",0.64,0xF06B849D,"s_m_m_autoshop_02"},
  {1161.25,-1643.0,35.95,"Garage MG13",202.87,0xF06B849D,"s_m_m_autoshop_02"},
  {-1531.93,79.03,55.76,"Garage LCN",348.93,0xF06B849D,"s_m_m_autoshop_02"},
  {1992.68,3041.37,46.21,"Garage LOSTMC",145.27,0xF06B849D,"s_m_m_autoshop_02"},
  {1405.83,1122.96,113.84,"Garage Triaden",182.17,0xF06B849D,"s_m_m_autoshop_02"},
  {-1520.47,849.17,180.59,"Garage Yakuza",24.63,0xF06B849D,"s_m_m_autoshop_02"},
  {-949.13,333.57,70.33,"NPC Rasenmähen",359.55,0xF06B849D,"s_m_m_autoshop_02"},
  {-1621.1378173828,-3152.6879882812,12.991728782654,"Flugzeug Garage",46.55,0xF06B849D,"s_m_m_autoshop_02"},
  {1726.5034179688,3291.3171386719,41.185501098633,"Flugzeug Garage Sandy",194.55,0xF06B849D,"s_m_m_autoshop_02"},
  {4446.134765625,-4478.6284179688,3.3282618522644,"Flugzeug Garage Cayo",201.55,0xF06B849D,"s_m_m_autoshop_02"},
  {1060.58,-2433.81,29.3,"NPC Für Crafter (Zivi)",174.22,0xF06B849D,"s_m_m_autoshop_02"},
  {961.53,-1585.93,29.42,"NPC Für Crafter (Fraks)",274.68,0xF06B849D,"s_m_m_autoshop_02"},
  {-984.31,-2641.02,12.97,"NPC für Rollershop Flughafen",155.17,0xF06B849D,"s_m_m_autoshop_02"},
  {1695.4498291016,2539.8876953125,44.56485748291,"NPC Für Stein Verkauf (Knast)",314.94,0x188099A9,"csb_rashcosvki"},
  {4501.8090820312,-4514.8344726562,3.2134952545166,"Garage Stadtpark",38.08,0xF06B849D,"s_m_m_autoshop_02"},
  {480.35815429688,-996.76135253906,29.689647674561,"PD shop",88.01,0x5E3DA4A4,"s_m_y_cop_01"},
  {-128.44375610352,1009.6395874023,234.73207092285,"Garage NGA",199.51,0xF06B849D,"s_m_m_autoshop_02"},
  {-117.11532592773,998.41778564453,234.75225830078,"Garage NGA Delete",113.01,0xF06B849D,"s_m_m_autoshop_02"},
  {966.72125244141,-115.62369537354,73.353149414062,"Garage SONS",222.01,0xF06B849D,"s_m_m_autoshop_02"},
  {961.46954345703,-120.53275299072,73.353057861328,"Garage SONS Delete",222.01,0xF06B849D,"s_m_m_autoshop_02"},
  {140.83178710938,-1698.0002441406,28.291667938232 ,"Garage ETGC",327.01,0xF06B849D,"s_m_m_autoshop_02"},
  {-637.61596679688,-1650.3645019531,24.825078964233,"Garage MPR Delete",222.01,0xF06B849D,"s_m_m_autoshop_02"},
  {-1490.3664550781,4981.5463867188,62.35608291626,"NPC KokaBlätter verarbeiten",77.97,0xD2B27EC1,"mp_f_meth_01"},
  {999.45941162109,-2402.5483398438,30.175214767456,"NPC KokaBlätter Verkaufen",315.540802,0xD2B27EC1,"mp_f_meth_01"},
  {218.62149047852,-918.21929931641,29.692010879517, "NPC REWARD",6.871,0xB7C61032,"a_f_y_business_04"},
  {-1804.9047851562,401.22952270508,112.7864074707, "CALI GARAGE",205.51,0xB7C61032,"a_f_y_business_04"},
  {4803.88,-4295.46,4.23, "Cayo NPC für Einreise",173.17,0xF06B849D,"a_f_y_business_04"},

}

local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("coords", function()
    ToggleCoords()
end)

Citizen.CreateThread(function()

  for _,v in pairs(coordonate) do
    RequestModel(GetHashKey(v[7]))
    while not HasModelLoaded(GetHashKey(v[7])) do
      Wait(1)
    end

    RequestAnimDict("mini@strip_club@idles@bouncer@base")
    while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
      Wait(1)
    end
    ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
    SetEntityHeading(ped, v[5])
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
  end
end)



function DrawText3D(x,y,z, text, scl, font) 

  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*scl
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov
 
  if onScreen then
      SetTextScale(0.0*scale, 1.1*scale)
      SetTextFont(font)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
  end
end

Citizen.CreateThread(function()
  local dict = "mp_am_hold_up"
  local playerPed = GetPlayerPed(-1)

RequestAnimDict(dict)
while not HasAnimDictLoaded(dict) do
  Citizen.Wait(100)
end
  local handsup = false
while true do
  Citizen.Wait(0)
  if IsControlJustPressed(304, 304, 304, 304) then 
          if not handsup then
              TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
              handsup = true
          else
              handsup = false
              ClearPedTasks(GetPlayerPed(-1))
          end
      end
  end
end)


-- BLIPS

local blips = {


  --Fahrzeughändler - Roller
  {title="Fahrzeughändler - Starter ", colour=0, id=326, x=-984.64, y=-2641.52, z=13.97},

  {title="Staatsgefängnis ", colour=1, id=188, x=1692.28, y=2578.88, z=45.91},


  


  --Fraaks
  {title="LSPD", colour=29, id=60, x=425.1, y=-979.5, z=30.7},

  {title="LSMD", colour=1, id=61, x=294.51, y=-583.79, z=43.17},

  
}

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)


--TIERMENU--

RegisterNetEvent('champion:tiermenu')
AddEventHandler("champion:tiermenu", function(t)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tiermenu', {
		title    = 'Tiermenu',
		align    = 'top-right',
		elements = {
			{label = "Husky", value = "a_c_husky"},
			{label = "Wildschwein", value = "a_c_boar"},
			{label = "Katze 1", value = "a_c_cat_01"},
			{label = "Huhn", value = "a_c_chickenhawk"},
			{label = "Affe", value = "a_c_chimp"},
			{label = "Chop", value = "a_c_chop"},
			{label = "Kormoran", value = "a_c_cormorant"},
			{label = "Kuh", value = "a_c_cow"},
			{label = "Kojote", value = "a_c_coyote"},
			{label = "Krähe", value = "a_c_crow"},
			{label = "Hirsch", value = "a_c_deer"},
			{label = "Delfin", value = "a_c_dolphin"},
			{label = "Fisch", value = "a_c_fish"},
			{label = "Henne", value = "a_c_hen"},
			{label = "Buckel", value = "a_c_humpback"},
			{label = "Killer Wal", value = "a_c_killerwhale"},
			{label = "Löwe", value = "a_c_mtlion"},
			{label = "Schwein", value = "a_c_pig"},
			{label = "Taube", value = "a_c_pigeon"},
			{label = "Pudel", value = "a_c_poodle"},
			{label = "Mops", value = "a_c_pug"},
			{label = "Hase 1", value = "a_c_rabbit_01"},
			{label = "Ratte", value = "a_c_rat"},
			{label = "Retriever", value = "a_c_retriever"},
			{label = "Rhesus", value = "a_c_rhesus"},
			{label = "Rottweiler", value = "a_c_rottweiler"},
			{label = "Möwe", value = "a_c_seagull"},
			{label = "Shepherd", value = "a_c_shepherd"}
		}
	}, function(data, menu)
		tiermenu(data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end)

function tiermenu(animal)
    local hash = GetHashKey(animal)
	local player = PlayerId()
	RequestModel(hash)
	while not HasModelLoaded(hash) do
        Wait(500)
    end
	if IsModelInCdimage(hash) then
    	SetPlayerModel(player,hash)
	end
end

SetMillisecondsPerGameMinute(60000)
RegisterNetEvent("realtime:event")
AddEventHandler("realtime:event", function(h, m, s)
	NetworkOverrideClockTime(h, m, s)
end)
TriggerServerEvent("realtime:event")




CreateThread(function()
	while true do
		Wait(0)
		SetVehicleDensityMultiplierThisFrame(0.0)
		SetPedDensityMultiplierThisFrame(0.0)
		SetRandomVehicleDensityMultiplierThisFrame(0.0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)

		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);

		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
		DisablePlayerVehicleRewards(PlayerId())
        SetPedSuffersCriticalHits(PlayerPedId(), false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        ResetPlayerStamina(PlayerId())
		SetFlashLightKeepOnWhileMoving(true)
    end
end)


-- Hudcolor ändern ;)
Citizen.CreateThread(function()
	ReplaceHudColourWithRgba(116, 224, 50, 50, 255)
end)

--[[local blips = {
    --{title="Hen House", colour=73, id=770, x = -295.33, y = 6255.17, z = 31.47},
    {title="Copacabana", colour=67, id=93, x = 378.34, y = -1072.13, z = 29.45},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.85)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)--]]

local tiempo = 4000 -- 1000 ms = 1s
local isTaz = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsPedBeingStunned(GetPlayerPed(-1)) then
			
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
			
		end
		
		if IsPedBeingStunned(GetPlayerPed(-1)) and not isTaz then
			
			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			
		elseif not IsPedBeingStunned(GetPlayerPed(-1)) and isTaz then
			isTaz = false
			Wait(5000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(10000)
			
      SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)

--Anti-VDM
Citizen.CreateThread(function()
    while true do
        SetWeaponDamageModifier(-1553120962, 0.0)
        Wait(0)
    end
end)


----------------------------------------------------------------------------
-- MELEE AND WEAPONS DAMAGE 
----------------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 0.8)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.5)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_STUNGUN"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ADVANCEDRIFLE"), 0.9) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 0.8) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 1.0) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTSMG"), 0.9) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLAREGUN"), 0.5)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PARACHUTE"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNIPERRIFLE"), 0.5)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GUSENBERG"), 0.9)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLARE"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.5)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 0.8) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_50PISTOL"), 0.7) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.3) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 0.9) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SPECIALCARBINE"), 0.6) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 0.9) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 1.0) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"), 0.5) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.7)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.5)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BULLPUPRIFLE"), 1.0)
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 1.0)  
Wait(0)
  end
end)

--Headshot
Citizen.CreateThread(function()
  while true do
      Wait(0)

      SetPedSuffersCriticalHits(PlayerPedId(), false)
  end
end)
----------------------------------------------------------------------------
--stop PISTOL WHIPPING
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
		   DisableControlAction(1, 140, true)
       	   DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        end
    end
end)

 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if injuredcounter == 20000 then
		ApplyDamageToPed(GetPlayerPed(-1),  23, false)
		elseif injuredcounter == 36000 then
		local ped = GetPlayerPed(-1)
 		local currentHealth = GetEntityHealth(ped)
		GetEntityHealth(ped, currentHealth - 5)
        Citizen.Wait(5000)
		elseif injuredcounter == 46000 then -- 46000
		elseif injuredcounter == 54000 then -- 54000
			-- dead kill them AGAIN
			ApplyDamageToPed(player, 800, false)

		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(10)

		if StillInjured then
			injuredcounter = injuredcounter + 1
		else
			Wait(10)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		StatSetInt('MP0_STAMINA', 100, true)
		Citizen.Wait(100)			
	end
end)

Citizen.CreateThread(function() 
  while true do
    N_0xf4f2c0d4ee209e20() 
    Wait(1000)
  end 
end)

Citizen.CreateThread(function()
  while true do
      Wait(0)
      letSleep = true
      if IsPedArmed(PlayerPedId(), 4) then
          letSleep = false
          SetPlayerLockonRangeOverride(PlayerId(), 2.0)
      end
      if letSleep then
          Wait(500)
      end
  end
end)

RegisterNetEvent('champion_core:lock')
AddEventHandler('champion_core:lock', function()
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local hasAlreadyLocked = false
	cars = ESX.Game.GetVehiclesInArea(coords, 3)
	local carstrie = {}
	local cars_dist = {}		
	notowned = 0
	if #cars == 0 then
    TriggerEvent("champion:notify", "Fahrzeug - Manager", "Keiner deiner Fahrzeug in deiner Nähe", "red", 3500)
	else
		for j=1, #cars, 1 do
			local coordscar = GetEntityCoords(cars[j])
			local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
			table.insert(cars_dist, {cars[j], distance})
		end
		for k=1, #cars_dist, 1 do
			local z = -1
			local distance, car = 999
			for l=1, #cars_dist, 1 do
				if cars_dist[l][2] < distance then
					distance = cars_dist[l][2]
					car = cars_dist[l][1]
					z = l
				end
			end
			if z ~= -1 then
				table.remove(cars_dist, z)
				table.insert(carstrie, car)
			end
		end
		for i=1, #carstrie, 1 do
			local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
			ESX.TriggerServerCallback('champion_core:isVehicleOwner', function(owner)
				if owner and hasAlreadyLocked ~= true then
					local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
					vehicleLabel = GetLabelText(vehicleLabel)
					local lock = GetVehicleDoorLockStatus(carstrie[i])
					if lock == 1 or lock == 0 then
						SetVehicleDoorShut(carstrie[i], 0, false)
						SetVehicleDoorShut(carstrie[i], 1, false)
						SetVehicleDoorShut(carstrie[i], 2, false)
						SetVehicleDoorShut(carstrie[i], 3, false)
						SetVehicleDoorsLocked(carstrie[i], 2)
						PlayVehicleDoorCloseSound(carstrie[i], 1)
						TriggerEvent("champion:notify", "Fahrzeug - Manager", "Fahrzeug abgeschlossen", "red", 3500)
	  
						if not IsPedInAnyVehicle(PlayerPedId(), true) then
									  
						end
						SetVehicleLights(carstrie[i], 2)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 0)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 2)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 0)
						hasAlreadyLocked = true
					elseif lock == 2 then
						SetVehicleDoorsLocked(carstrie[i], 1)
						PlayVehicleDoorOpenSound(carstrie[i], 0)
						TriggerEvent("champion:notify", "Fahrzeug - Manager", "Fahrzeug aufgeschlossen", "green", 3500)
	  
	  
						if not IsPedInAnyVehicle(PlayerPedId(), true) then
									  
						end
						SetVehicleLights(carstrie[i], 2)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 0)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 2)
						Citizen.Wait(150)
						SetVehicleLights(carstrie[i], 0)
						hasAlreadyLocked = true
					end
				else
					notowned = notowned + 1
				end
				if notowned == #carstrie then
          TriggerEvent("champion:notify", "Fahrzeug - Manager", "Keiner deiner Fahrzeug in deiner Nähe", "red", 3500)
				end	
			end, plate)
		end			
	end
end)

--LSFD
RegisterNetEvent('champion_core:lsfdstandard')
AddEventHandler('champion_core:lsfdstandard', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    --Männlich
    if skin.sex == 0 then
		local clothesSkin = {
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 123,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 24,   ['pants_2'] = 5,
		['shoes_1'] = 77,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 126,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0
    }
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)  
  ESX.ShowNotification('Du hast dir LSFD Kleidung (Standard) angezogen')
  else--Weiblich    
    local clothesSkin = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 119,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 23,   ['pants_2'] = 0,
			['shoes_1'] = 81,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
      }
    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    ESX.ShowNotification('Du hast dir LSFD Kleidung (Standard) angezogen')
    end
	end)
end)   

--[[ SEAT SHUFFLE ]]--
--[[ BY JAF ]]--

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

local vehWeapons = {
	0x1D073A89, -- ShotGun
	0x83BF0278, -- Carbine
	0x5FC3C11, -- Sniper
}


local hasBeenInPoliceVehicle = false

local alreadyHaveWeapon = {}

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not hasBeenInPoliceVehicle) then
				hasBeenInPoliceVehicle = true
			end
		else
			if(hasBeenInPoliceVehicle) then
				for i,k in pairs(vehWeapons) do
					if(not alreadyHaveWeapon[i]) then
						TriggerServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon",k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end

	end

end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false)==1) then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)


RegisterNetEvent("PoliceVehicleWeaponDeleter:drop")
AddEventHandler("PoliceVehicleWeaponDeleter:drop", function(wea)
	RemoveWeaponFromPed(GetPlayerPed(-1), wea)
end)

local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)
