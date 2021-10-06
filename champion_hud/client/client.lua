local ESX = nil
local isMuted = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	TriggerEvent('esx:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)
	StartShowHudThread()
	ReplaceHudColour(116, 6)
end)
RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "money" then

	SendNUIMessage({type = "updateMoney", money = account.money})
	end
end)
function StartShowHudThread()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)
			
			SendNUIMessage({type = "updateMoney", money = ESX.GetPlayerData().money})
			SendNUIMessage({type = "muted", muted = micmuted})
		end
	end)
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(20)
		if IsPauseMenuActive(true) then
			TriggerEvent('ui:toggle', false)
		else
			TriggerEvent('ui:toggle', true)
		end
	end
end)

RegisterNetEvent('ui:toggle')
AddEventHandler('ui:toggle', function(show)
	SendNUIMessage({action = "toggle", show = show})
end)
RegisterNetEvent('SaltyChat_TalkStateChanged')
AddEventHandler('SaltyChat_TalkStateChanged', function(isTalking)
    SendNUIMessage({type = "updateSpeaking", muted = isMuted, speaking = isTalking})
end)

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges)
    SendNUIMessage({type = "updateRange", range = index})
end)

RegisterNetEvent('SaltyChat_MicStateChanged')
AddEventHandler('SaltyChat_MicStateChanged', function(isMicrophoneMuted)
    SendNUIMessage({type = "updateSpeaking", muted = isMicrophoneMuted, speaking = false})
    isMuted = isMicrophoneMuted
end)

RegisterNetEvent('SaltyChat_SetRadioChannel')
AddEventHandler('SaltyChat_SetRadioChannel', function(radiochannel, primary)
	local isFunk = true
	if radiochannel == nil or radiochannel == 0 or radiochannel == '0' or radiochannel == " " then isFunk = false end
	SendNUIMessage({type = "updateFunk", connected = isFunk});
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(e)
	SendNUIMessage({type = "updateMoney", money = e})
end)
