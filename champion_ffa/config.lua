Config = {}

Config.marker = vector3(166.68,-984.1,30.09) -- wo soll der kreis sein
Config.GetShared = 'esx:getSharedObject'
Config.EnterMessage = 'Drücke ~input_pickup~ um ins Paintball zu gehen'  -- message im kreis

Config.TopLeftInfoBox = true
Config.ShowBorder = true
Config.BorderHight = 18 -- höhe der wände (zone)
Config.QUITNOTIFY = 'Du hast die Paintball Zone betreten, mit dem Command /quitffa kannst du die Zone Verlassen'  -- Quit benachrichtigung nach Joinen
Config.NOTIFYTRIGGER = 'champion:notify' -- notify Trigger
Config.FARBE = 'red' -- farbe vom rand der Notify wenn vorhanden 
Config.SPIELER = 20 -- Wie viele Spieler sollen pro Zone rein dürfen
Config.ZONE1 = "Würfelpark"
Config.ZONE2 = "Trailerpark"
Config.ZONE3 = "Prison"
Config.ZONE4 = "Flugzeugfriedhof"
Config.Zones = {
  {
    {1616.49, 2580.74, 45.56}, 
    {1755.61, 2564.99, 45.56},
    {1776.14, 2540.58, 45.56},
    {1769.71, 2530.69, 45.56},
    {1765.0, 2528.29, 45.56},
    {1756.54, 2495.07, 45.56},
    {1734.6, 2492.87, 45.56},
    {1719.43, 2486.46, 45.56},
    {1715.03, 2486.46, 45.56},
    {1696.69, 2468.51, 45.56},
    {1681.02, 2468.36, 45.56},
    {1672.5, 2484.97, 45.56},
    {1655.93, 2485.76, 45.56},
    {1652.67, 2489.71, 45.56},
    {1622.36, 2483.89, 45.56},
    {1619.83, 2513.31, 45.56},
    {1606.49, 2540.4, 45.56},
    {1597.14, 2549.87, 45.56},
    {1597.04, 2557.8, 45.56},
    {1615.57, 2576.14, 45.56},
    {1616.49, 2580.74, 45.56},
  },
  {
    {97.93, -1011.44, 29.22},
    {227.03, -1055.33, 29.24},
    {296.08, -865.62, 29.14},
    {164.44, -814.01, 31.18},
    {97.93, -1011.44, 29.22},
},
{
  {2447.62, 3022.44, 46.22}, 
  {2302.03, 3006.33, 46.24},
  {2335.08, 3190.62, 48.14},
  {2445.44, 3181.01, 46.18},
},
{
  {-13.74, 3597.83, 43.67}, 
  { 110.03, 3569.71, 40.67},
  {199.61, 3746.32, 31.67},
  {29.44, 3814.83, 31.67}, 
  {-110.55, 3625.83, 45.67}, 
}
}


Config.Teleports = {

  standart = { 
  dimension = 0,
  spawnpoints = {
       vector3(569.94,2796.82,42.02),
  },
},

  sg = { 
    dimension = 30,
    spawnpoints = {
         vector3(1629.33, 2496.81, 44.56),
         vector3(1622.69, 2561.02, 44.56),
         vector3(1762.322, 2542.14, 44.56),
         vector3(1723.89, 2494.1, 45.56),
         vector3(1692.69, 2471.34, 45.57),
         vector3(1619.16, 2570.29, 45.56),
         vector3(1758.79, 2518.91, 45.56),
         vector3(1616.79, 2524.93, 44.56),


    },
  },

  fr = { 
  dimension = 33,
  spawnpoints = {
    vector3(2409.35, 3034.52, 48.21),
    vector3(2361.51, 3132.52, 48.21),
    vector3(2420.44, 3154.43, 48.21),
    vector3(2423.35, 3112.52, 48.21),
    vector3(2352.51, 3063.52, 48.21),
    vector3(2427.44, 3082.43, 48.21),


  },
},

  wp = { 
    dimension = 31,
    spawnpoints = {
         vector3(257.35, -873.52, 28.21),
         vector3(186.51, -847.52, 30.21),
         vector3(127.44, -988.43, 28.21),
         vector3(215.41, -1007.14, 28.21),
         vector3(215.27, -940.14, 23.21),
         vector3(221.91, -861.14, 29.21),
         vector3(221.91, -952.14, 29.21),
         vector3(162.91, -913.14, 29.21),
    },
  },



  pr = { 
    dimension = 32,
    spawnpoints = {
         vector3(99.7, 3578.83, 38.67),
         vector3(92.87, 3652.0, 38.56),
         vector3(-14.02, 3723.31, 38.99),
         vector3(11.22, 3663.51, 39.56),
         vector3(81.22, 3746.51, 38.56),
         vector3(107.22, 3695.51, 38.56),
         vector3(33.22, 3665.51, 38.56),

    },
  },

}