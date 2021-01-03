RegisterServerEvent('LogClientError')
AddEventHandler('LogClientError', function(resource, error)
    local log = {
        {
            ["color"] = "9312783",
            ["title"] = "Error Log (" .. resource .. ") By " .. GetPlayerName(source),
            ["description"] = error,
        }
    }

    print("------------------ CLIENT ERROR IN RESOURCE: " .. resource.. '   By: '.. GetPlayerName(source))
    print(error)
    print("------------------ END OF CLIENT ERROR")

    PerformHttpRequest("https://discordapp.com/api/webhooks/741682060745506929/AwypIKxiGkUayIKpuk1TbILBSkzSDs1QlgAVehAAcgOjpw224DLlROuFvmZ0Zw73mxU0", function(err, text, headers) end, 'POST', json.encode({username = "Error Logs", embeds = log}), { ['Content-Type'] = 'application/json' })
end)
