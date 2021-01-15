Config              	= {}
Config.MarkerType   	= 1
Config.DrawDistance 	= 100.0
Config.ZoneSize     	= {x = 2.5, y = 2.5, z = 0.5}
Config.MarkerColor  	= {r = 100, g = 204, b = 100}
Config.KeyStopAction 	= 'C'
-- Show blip in map?
Config.ShowBlips    	= true

Config.Locale 			= 'en'

-- Before add any drug/item here you have to add the translation of the item
Config.Drugs = {
	-- Translated name
	[_U('weed')] = {
		Item			= 'weed',				 	-- Item to pickup
		ItemTransform	= 'weed_pooch', 			-- Item to transform
		AlertCops		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess	= 5,						-- Time to process in seconds
		TimeToSell		= 15,			-- Time to sell in seconds
		Usable			= false,						-- Can it be consumed?
		UseEffect		= false,						-- Effect after consume
		Zones			= {
			-- Field: Farm location
			-- Processing: Process location
			-- Dealer: Seller location
			-- callPolice: true/false, call the police in the position?
			-- callPoliceChance: chance in percentage to call the police
			-- sellMin: Min receveid by selling
			-- sellMax: Max received by selling
			-- multiplierPolice: true/false Multiply the min/max based on cops online

			

			Field 			= {x =-750.19445800781,	y = 4321.5400390625,	z = 140.96272277832,	name = _U('field', _U('weed')),			sprite = 496,	color = 52, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 1714.57,	y = -1598.12,	z = 112.85,	name = _U('processing', _U('weed')),	sprite = 496,	color = 52, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x = 448.45,	y = 3521.1,	z = 32.60, h = 45.24,	name = _U('dealer', _U('weed')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('meth')] = {
		Item			= 'meth',				 	-- Item to pickup
		ItemTransform	= 'meth_pooch', 			-- Item to transform
		AlertCops 		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,					-- Time to sell in seconds
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
			Field 			= {x = -1384.19,	y = 4634.73,	z = 77.0,	        name = _U('field', _U('meth')),			sprite = 499,	color = 26, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = 3334.4580078125,	y = 5164.4731445312,	z = 17.510663223267,	name = _U('processing', _U('meth')),	sprite = 499,	color = 26, callPolice = false, callPoliceChance = 100},
			Dealer 		= {x =1961.1517333984,	y = 5185.060546875,	z = 47.250878143311, h = 45.24,	name = _U('dealer', _U('meth')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('opium')] = {
		Item			= 'opium',				 	-- Item to pickup
		ItemTransform	= 'opium_pooch', 			-- Item to transform
		AlertCops 		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,						-- Time to sell in seconds
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

	
			Field 			= {x = 1705.06,	y = 3845.58,	z = 34.10,	name = _U('field', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -58.77,	y = -2245.28,	z = 8.45,	name = _U('processing', _U('opium')), sprite = 51, color = 60, callPolice = false, callPoliceChance = 100},
			Dealer 			= {x = 2328.91,	y = 2571.36,	z = 45.95, h = 45.24, name = _U('dealer', _U('opium')),	sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true},
		}
	},
	-- Translated name
	[_U('coke')] = {
		Item			= 'coke',				 	-- Item to pickup
		ItemTransform	= 'coke_pooch', 			-- Item to transform
		AlertCops		= true, 					-- Alert police?
		RequiredCops	= 0, 						-- How many cops need to the action start??
		QToProcess		= 5,						-- Quantity necessary to process
		QToSell			= 1,						-- Quantity necessary to sell
		TimeToFarm		= 5,						-- Time to farm in seconds
		TimeToProcess 	= 5,						-- Time to process in seconds
		TimeToSell		= 15,						-- Time to sell in seconds
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
			Field 			= {x = 1671.54,	y = 6648.65,	z = 9.80,	name = _U('field', _U('coke')),			sprite = 501,	color = 40, callPolice = false, callPoliceChance = 100},
			Processing 		= {x = -2017.19,	y = 559.6,	z = 107.50,	name = _U('processing', _U('coke')),	sprite = 478,	color = 40, callPolice = false, callPoliceChance = 100},
		    Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
		}
	},
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
			TimeToSell		= 15,						-- Time to sell in seconds
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
				--,,,,,,
				Field 			= {x = 2588.8994140625,	y = 6160.6181640625,	z = 164.52153015137,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Processing 		= {x = 2568.1750488281,	y = 6561.236328125,	z =27.576608657837,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				--Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
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
			TimeToSell		= 15,						-- Time to sell in seconds
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
				--,, ,,,, ,, ,,
				Field 			= {x = 2553.9230957031,	y =6177.572265625,	z = 162.21463012695,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				Processing 		= {x = 2568.6970214844,	y = 6564.3129882812,	z = 27.411443710327,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
				--Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
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
				TimeToSell		= 15,						-- Time to sell in seconds
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
					--,, ,,,, ,, ,, ,,
					Field 			= {x = 2604.5385742188,	y =6161.8159179688,	z = 171.14680480957,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
					Processing 		= {x = 2570.3654785156,	y = 6570.94140625,	z = 25.888879776001,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
					--Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
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
					TimeToSell		= 15,						-- Time to sell in seconds
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
						--,,,,
						Field 			= {x = 2562.2932128906,	y =6201.7807617188,	z = 157.16159057617,	name = _U('field', _U('coke')),			sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
						Processing 		= {x =2570.9338378906,	y = 6562.638671875,	z = 27.975006103516,	name = _U('processing', _U('coke')),	sprite = 0,	color = 0, callPolice = false, callPoliceChance = 100},
						--Dealer 			= {x = -1969.54,	y = -516.39,	z = 10.90, h = 45.24,	name = _U('dealer', _U('coke')),		sprite = 500,	color = 75, callPolice = false, callPoliceChance = 100, NPCHash = 653210662, sellMin = 200, sellMax = 500, multiplierPolice = true}
					}
				},
	

			


}
