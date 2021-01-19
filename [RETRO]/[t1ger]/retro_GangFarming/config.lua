Config              	= {}
Config.MarkerType   	= 1
Config.DrawDistance 	= 100.0
Config.ZoneSize     	= {x = 5.5, y = 5.5, z = 0.5}
Config.MarkerColor  	= {r = 100, g = 204, b = 100}
Config.KeyStopAction 	= 'C'
-- Show blip in map?
Config.ShowBlips    	= true

Config.Locale 			= 'en'

-- Before add any drug/item here you have to add the translation of the item
Config.Drugs = {
		-- Translated name
		['Oranges'] = {
			Item			= 'orange',				 	-- Item to pickup
			ItemTransform	= 'packaged_orange', 			-- Item to transform
			AlertCops		= false, 					-- Alert police?
			RequiredCops	= 0, 						-- How many cops need to the action start??
			QToProcess		= 1,						-- Quantity necessary to process
			QToSell			= 1,						-- Quantity necessary to sell
			TimeToFarm		= 5,						-- Time to farm in seconds
			TimeToProcess 	= 5,						-- Time to process in seconds
			TimeToSell		= 5,						-- Time to sell in seconds
			Usable			= false,						-- Can it be consumed?
			UseEffect		= false,						-- Effect after consume
			Zones 			= {
				-- Field: Farm location
				-- Processing: Process location
				-- Dealer: Seller location
				-- callPolice: true/false, call the police in the position?
				-- callPoliceChance: chance in percentage to call the police
				-- sellMin: Min receveid by selling
				-- sellMax: Max received by selling
				-- multiplierPolice: true/false Multiply the min/max based on cops online
				--,,,,,,,,,,,,
				Field 			= {x = 2566.3308105469,	y = 6396.7983398438,	z = 59.521663665771,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Processing 		= {x = 2568.1750488281,	y = 6561.236328125,	z =27.576608657837,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Dealer 			= {x = -452.8928527832,	y = -395.61981201172,	z = 32.52169418335, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100, NPCHash = 1777626099, sellMin = 200, sellMax = 500, multiplierPolice = true}
			}
		},
	
		-- Translated name
		['Banana'] = {
			Item			= 'banana',				 	-- Item to pickup
			ItemTransform	= 'packaged_banana', 			-- Item to transform
			AlertCops		= false, 					-- Alert police?
			RequiredCops	= 0, 						-- How many cops need to the action start??
			QToProcess		= 1,						-- Quantity necessary to process
			QToSell			= 1,						-- Quantity necessary to sell
			TimeToFarm		= 5,						-- Time to farm in seconds
			TimeToProcess 	= 5,						-- Time to process in seconds
			TimeToSell		= 5,						-- Time to sell in seconds
			Usable			= false,						-- Can it be consumed?
			UseEffect		= false,						-- Effect after consume
			Zones 			= {
				-- Field: Farm location
				-- Processing: Process location
				-- Dealer: Seller location
				-- callPolice: true/false, call the police in the position?
				-- callPoliceChance: chance in percentage to call the police
				-- sellMin: Min receveid by selling
				-- sellMax: Max received by selling
				-- multiplierPolice: true/false Multiply the min/max based on cops online
				--,,
				Field 			= {x =2564.04956054691,	y =6384.7270507812,	z = 61.953784942627,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Processing 		= {x = 2568.6970214844,	y = 6564.3129882812,	z = 27.411443710327,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Dealer 			= {x = 392.48922729492,	y =-982.59619140625,	z = 28.423219680786, h = 280.0,	name = _U('dealer', _U('coke')),		sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100, NPCHash = -1806291497, sellMin = 200, sellMax = 500, multiplierPolice = true}
			}
		},
	
	
			-- Translated name
			['Apple'] = {
				Item			= 'apple',				 	-- Item to pickup
				ItemTransform	= 'packaged_apple', 			-- Item to transform
				AlertCops		= false, 					-- Alert police?
				RequiredCops	= 0, 						-- How many cops need to the action start??
				QToProcess		= 1,						-- Quantity necessary to process
				QToSell			= 1,						-- Quantity necessary to sell
				TimeToFarm		= 5,						-- Time to farm in seconds
				TimeToProcess 	= 5,						-- Time to process in seconds
				TimeToSell		= 5,						-- Time to sell in seconds
				Usable			= false,						-- Can it be consumed?
				UseEffect		= false,						-- Effect after consume
				Zones 			= {
					-- Field: Farm location
					-- Processing: Process location
					-- Dealer: Seller location
					-- callPolice: true/false, call the police in the position?
					-- callPoliceChance: chance in percentage to call the police
					-- sellMin: Min receveid by selling
					-- sellMax: Max received by selling
					-- multiplierPolice: true/false Multiply the min/max based on cops online
					--,, ,,,, ,, ,, ,, ,,,,
					Field 			= {x = 2592.2546386719,	y =6444.943359375,	z = 48.740535736084,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
					Processing 		= {x = 2570.3654785156,	y = 6570.94140625,	z = 25.888879776001,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				 Dealer 			= {x = -51.568267822266,	y = -1817.5913085938,	z = 25.749603271484, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 0,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 1777626099, sellMin = 200, sellMax = 500, multiplierPolice = true}
				}
			},
	
				-- Translated name
				['Grapes'] = {
					Item			= 'grapes',				 	-- Item to pickup
					ItemTransform	= 'packaged_grapes', 			-- Item to transform
					AlertCops		= false, 					-- Alert police?
					RequiredCops	= 0, 						-- How many cops need to the action start??
					QToProcess		= 1,						-- Quantity necessary to process
					QToSell			= 1,						-- Quantity necessary to sell
					TimeToFarm		= 5,						-- Time to farm in seconds
					TimeToProcess 	= 5,						-- Time to process in seconds
					TimeToSell		= 5,						-- Time to sell in seconds
					Usable			= false,						-- Can it be consumed?
					UseEffect		= false,						-- Effect after consume
					Zones 			= {
						-- Field: Farm location
						-- Processing: Process location
						-- Dealer: Seller location
						-- callPolice: true/false, call the police in the position?
						-- callPoliceChance: chance in percentage to call the police
						-- sellMin: Min receveid by selling
						-- sellMax: Max received by selling
						-- multiplierPolice: true/false Multiply the min/max based on cops online
						--,,,, ,, ,,
						Field 			= {x = 2579.3669433594,	y =6418.9321289062,	z = 52.957683563232,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
						Processing 		= {x =2570.9338378906,	y = 6562.638671875,	z = 27.975006103516,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
						Dealer 			= {x = -456.96496582031,	y = -395.41470336914,	z = 32.646511077881, h = 11.0,	name = _U('dealer', _U('coke')),		sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100, NPCHash = 1777626099, sellMin = 200, sellMax = 500, multiplierPolice = true}
					}
				},
	

}
