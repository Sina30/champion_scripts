
function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

function HauRin()
	Citizen.Wait(250)



	local Male = GetHashKey("mp_m_freemode_01")

	TriggerEvent('skinchanger:getSkin', function(skin)
		if GetHashKey(GetEntityModel(PlayerPedId())) == Male then
			local clothesSkin = {
				['tshirt_1'] = 14, ['tshirt_2'] = 0,
				['torso_1'] = 23, ['torso_2'] = 0,
				['arms'] = 0,
				['pants_1'] = 66, ['pants_2'] = 6,
				['shoes_1'] = 10, ['shoes_2'] = 0,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else
			local clothesSkin = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 5, ['torso_2'] = 0,
				['arms'] = 5,
				['pants_1'] = 64, ['pants_2'] = 6,
				['shoes_1'] = 6, ['shoes_2'] = 0,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)
	ReinDa()
end
