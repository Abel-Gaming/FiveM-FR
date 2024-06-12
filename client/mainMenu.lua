----- REGISTER RADIAL MENUS -----
lib.registerRadial(
  {
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
      },
      {
        label = 'Ped Options',
        menu = 'fivemfr_police_menu_ped'
      },
    }
  }
)

lib.registerRadial(
  {
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
            Status = '~g~10-8'
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
            Status = '~r~10-7'
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
            Status = '~y~10-6'
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
            Status = '~o~10-23'
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
            Status = '~o~10-97'
        end
      },
    }
  }
)

lib.registerRadial(
  {
    id = 'fivemfr_police_menu_ped',
    items = {
      {
        label = 'Stop Ped',
        onSelect = function()
          StopPed()
        end
      },
      {
        label = 'Release Ped',
        onSelect = function()
          ReleasePed()
        end
      },
      {
        label = 'Arrest Ped',
        onSelect = function()
          ArrestPed()
        end
      },
      {
        label = 'Grab Ped',
        onSelect = function()
          GrabPed()
        end
      },
      {
        label = 'Kneel Ped',
        onSelect = function()
          KneelPed()
        end
      }
    }
  }
)

----- CREATE CONTEXT MENU INSTEAD OF RADIAL -----
lib.registerContext({
  id = 'fivemr_main_menu',
  title = 'FiveM:FR Main Menu',
  options = {
    {
      title = 'Toggle Duty',
      onSelect = function()
        TriggerEvent('FiveMFR:ToggleDuty')
      end
    },
    {
      title = 'Status Menu',
      menu = 'fivemfr_status_menu',
      arrow = false
    },
    {
      title = 'Ped Menu',
      menu = 'fivemfr_ped_menu',
      arrow = false
    },
  }
})

lib.registerContext({
  id = 'fivemfr_status_menu',
  title = 'FiveM:FR Status Menu',
  options = {
    {
      title = '10-8',
      onSelect = function()
        lib.notify({
          title = 'Status Update',
          description = 'You are now 10-8',
          type = 'success'
        })
        Status = '~g~10-8'
      end
    }
  }
})

lib.registerContext({
  id = 'fivemfr_ped_menu',
  title = 'FiveM:FR Ped Menu',
  options = {
    {
      title = 'Stop Ped',
      onSelect = function()
        StopPed()
      end
    },
    {
      title = 'Release Ped',
      onSelect = function()
        ReleasePed()
      end
    },
    {
      title = 'Arrest Ped',
      onSelect = function()
        ArrestPed()
      end
    },
    {
      title = 'Grab Ped',
      onSelect = function()
        GrabPed()
      end
    },
    {
      title = 'Kneel Ped',
      onSelect = function()
        KneelPed()
      end
    }
  }
})

----- ADD FIVEMFR TO RADIAL MENU -----
if Config.UseRadialMenu then
  lib.addRadialItem(
    {
      {
        id = 'fivemfr_police',
        label = 'FiveMFR',
        icon = 'shield-halved',
        menu = 'fivemfr_police_menu'
      }
    }
  )
end

if not Config.UseRadialMenu then
  RegisterCommand('fivemfr:mainmenu', function()
    lib.showContext('fivemr_main_menu')
  end)
end