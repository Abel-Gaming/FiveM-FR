RegisterNetEvent('FiveMFR:ToggleDuty')
AddEventHandler('FiveMFR:ToggleDuty', function()
    if OnDuty then
        print('Now Off Duty')
        lib.notify({title = "You are now off duty!"})
        Status = '~r~10-7'
    else
        print('Now On Duty')Status = '~y~10-6'
        lib.notify({title = "You are now on duty!"})
    end
    OnDuty = not OnDuty
end)