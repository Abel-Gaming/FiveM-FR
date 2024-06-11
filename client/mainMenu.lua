----- REGISTER RADIAL MENU -----
lib.registerRadial({
    id = 'fivemfr_police_menu',
    items = {
      {
        label = 'Set Status',
        menu = 'fivemfr_police_menu_status'
      },
      {
        label = 'Toggle Duty',
        onSelect = function()
            TriggerEvent('FiveMFR:ToggleDuty')
        end
      }
    }
})

lib.registerRadial({
    id = 'fivemfr_police_menu_status',
    items = {
      {
        label = '10-8',
        onSelect = function()
            lib.notify({
                title = 'Status Update',
                description = 'You are now 10-8',
                type = 'success'
            })
            Status = '10-8'
        end
      },
      {
        label = '10-7',
        onSelect = function()
            lib.notify({
                title = 'Status Update',
                description = 'You are now 10-7',
                type = 'warning'
            })
            Status = '10-7'
        end
      },
      {
        label = '10-6',
        onSelect = function()
            lib.notify({
                title = 'Status Update',
                description = 'You are now 10-6',
                type = 'inform'
            })
            Status = '10-6'
        end
      },
      {
        label = '10-23',
        onSelect = function()
            lib.notify({
                title = 'Status Update',
                description = 'You are now 10-23',
                type = 'inform'
            })
            Status = '10-23'
        end
      },
      {
        label = '10-97',
        onSelect = function()
            lib.notify({
                title = 'Status Update',
                description = 'You are now 10-97',
                type = 'inform'
            })
            Status = '10-97'
        end
      },
    }
})

----- ADD FIVEMFR TO RADIAL MENU -----
lib.addRadialItem({
    {
      id = 'fivemfr_police',
      label = 'FiveMFR',
      icon = 'shield-halved',
      menu = 'fivemfr_police_menu'
    }
})
 
RegisterCommand('fivemfr:mainmenu', function()
    lib.showMenu('main_menu')
end)