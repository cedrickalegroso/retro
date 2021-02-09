Config                      = {}

Config.DrawDistance         = 100.00
Config.MarkerType           = 1
Config.MarkerSize           = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor          = {r = 102, g = 204, b = 102}

Config.Zones = {}

Config.ChangingRooms = {
	vector3(463.32928466797,-998.99377441406,29.689512252808),
	vector3(429.661,-811.554,28.591),
	vector3(-119.53133392334,-1780.7321777344,28.938479995728),
	vector3(-819.987,-1067.44,11.328),
	vector3(-1447.1,-240.396,49.819),
	vector3(3.917,6506.042,31.878),
	vector3(118.674,-224.98,54.558),
	vector3(1698.673,4818.352,42.063),
	vector3(620.432,2766.495,42.088),
  vector3(-3177.755,1043.381,20.863),
 
  vector3(-1889.5599365234,2060.9504394531,139.99999999027),
  vector3(-2734.2880859375,-94.493133544922,16.196044540405), --ver
  vector3(993.59,-135.82,73.10), --thelost
  vector3(-1407.8740234375,632.34246826172,196.52646484375), --riri
  vector3(-1435.3162841797,660.93664550781,196.59989929199), --riri2
   
}

for i=1, #Config.ChangingRooms, 1 do
	Config.Zones['Changing_Rooms' .. i] = {
		Pos   = Config.ChangingRooms[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end