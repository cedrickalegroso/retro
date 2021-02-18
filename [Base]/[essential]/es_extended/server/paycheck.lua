ESX.StartPayCheck = function()

	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local job     = xPlayer.job.grade_name
			local salary  = xPlayer.job.grade_salary
			local job2     = xPlayer.job2.grade_name
			local salary2  = xPlayer.job2.grade_salary


			if salary > 0 then
				if job == 'unemployed' then -- unemployed
					xPlayer.addAccountMoney('bank', salary)
					TriggerClientEvent('esx:showAdvancedNotification', 'Retro City Bank', _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
				elseif Config.EnableSocietyPayouts then -- possibly a society
					TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
						if society ~= nil then -- verified society
							TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
								if account.money >= salary then -- does the society money to pay its employees?
									
									local tax = salary * 0.20
									local playerSal  = salary - tax
									
									
									xPlayer.addAccountMoney('bank', playerSal)
									account.removeMoney(salary)
									
									TriggerEvent('esx_society:depositTax',xPlayer.source, 'government', tax)
	
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', 'Received Paycheck with tax of '..tax, _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', 'Received Paycheck with tax of '..tax, _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
								else
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
								end
							end)
						else -- not a society
							xPlayer.addAccountMoney('bank', salary)
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
						end
					end)
				else -- generic job
					xPlayer.addAccountMoney('bank', salary)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
				end
			end

			if salary2 > 0 then
				if job2 == 'unemployed' then -- unemployed
					xPlayer.addAccountMoney('bank', salary2)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_help', salary2), 'CHAR_BANK_MAZE', 9)
				elseif Config.EnableSocietyPayouts then -- possibly a society
					TriggerEvent('esx_society:getSociety', xPlayer.job2.name, function (society)
						if society ~= nil then -- verified society
							TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
								if account.money >= salary2 then -- does the society money to pay its employees?
									xPlayer.addAccountMoney('bank', salary2)
									account.removeMoney(salary2)
	
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_salary', salary2), 'CHAR_BANK_MAZE', 9)
								else
									TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
								end
							end)
						else -- not a society
							xPlayer.addAccountMoney('bank', salary2)
							TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_salary', salary2), 'CHAR_BANK_MAZE', 9)
						end
					end)
				else -- generic job
					xPlayer.addAccountMoney('bank', salary2)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Retro City Bank', _U('received_paycheck'), _U('received_salary', salary2), 'CHAR_BANK_MAZE', 9)
				end
			end

		end

		SetTimeout(Config.PaycheckInterval, payCheck)

	end

	SetTimeout(Config.PaycheckInterval, payCheck)

end
