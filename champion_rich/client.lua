Citizen.CreateThread(function()
	while true do
	local count = 0

local text = {
"Champion Roleplay"
}
		for _, __ in pairs(text) do 
			count = count + 1
		end
			
		local presence  = math.random(1, count)
		local player = GetPlayerPed(-1)

		SetDiscordAppId('870047572113391616')
		SetDiscordRichPresenceAsset('championlogofirst') -- Name vom 1 Bild
	    SetDiscordRichPresenceAssetText('') -- Unwichtig
        SetDiscordRichPresenceAssetSmall('championlogofirst') -- Name vom 2 Bild
		SetDiscordRichPresenceAssetSmallText('https://discord.gg/championrp') -- Unwichtig
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/championrp") --  Button 1 für Discord Link

		while true do
        Citizen.Wait(1500)
        players = {}
        for i = 0, 512 do
            if NetworkIsPlayerActive( i ) then
                table.insert( players, i )
            end
        end
        SetRichPresence("Spieler (" .. #players + 0 .. " von 512)") -- RichPresence

	end
		Citizen.Wait(300000) -- 5 minutes 
	end
end)
