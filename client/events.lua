RegisterNetEvent('FiveMFR:ToggleDuty')
AddEventHandler('FiveMFR:ToggleDuty', function()
    if OnDuty then
        print('Now Off Duty')

        -- Show Notification
        lib.notify({
            description = "You are now off duty!"
        })

        -- Set status to 10-7
        Status = '~r~10-7'
    else
        print('Now On Duty')

        -- Set status to 10-6 [BUSY]
        Status = '~y~10-6'

        -- Show Notification
        lib.notify({
            description = "You are now on duty!"
        })
    end
    OnDuty = not OnDuty
end)