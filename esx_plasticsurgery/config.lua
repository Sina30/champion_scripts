Config = {}
Config.Locale = 'en'

Config.MarkerType   = -1
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}

Config.BlipPlasticSurgery = {
	Sprite = 468,
	Color = 8,
	Display = 2,
	Scale = 1.0
}

Config.Price = 25000 

Config.EnableUnemployedOnly = false 
Config.EnableBlips = true
Config.EnablePeds = true 

Config.Locations = {
	{ x = 356.1, y = -596.33, z = 27.77, heading = 255.22 },
}

Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
