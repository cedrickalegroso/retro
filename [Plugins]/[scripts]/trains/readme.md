This is a tutorial to make this script works as a charm...


1.Change the job in cl_cooking.lua line 49 and line 73 , the default one is "tailor" , change it to whatever you want 
2.If you want to change the blip , there's the blip in cl_cooking.lua line 46 - line 60 , theres an instrucstions there.. 
3.If you want to change Blip position on the map , its in cl_cooking.lua line 51.
4.If you want to change the marker , there's the marker in cl_cooking.lua line 74 , change the coords here, the format is x , y , z 
5.If you want to add more list on the menu , add in cl_cooking.lua line 109 - line 113, dont forget to add " , " 
After doing the step 5 , you need to add : 

	elseif value == 'menu5' then -- Change menu5 to menu6, menu7 , menu8 ... 
            menu.close()
            TriggerServerEvent('cooking:combination5') -- Change combination5 to combination6 , combination7 , combination8 , ... 
6. After adding the list , you need add in the server to make it works , just copy combination5 , to combination6 or ... 
7. Theres item1 and item2 in the server files , more item you need , if you need to add 3 or 4 combination of the items to make 1 item , just contact me , ill help you
			
			