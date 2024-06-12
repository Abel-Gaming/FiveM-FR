Status = '~r~Off Duty'

OnDuty = false
isPedBeingGrabbed = false
isPedKneeling = false

StoppedPed = nil
ArrestedPed = nil
GrabbedPed = nil

----- Script Loaded -----
print('Loaded FiveMFR by Abel Gaming')

----- Draw Text -----
Citizen.CreateThread(function()
  while not NetworkIsSessionStarted() do
		Wait(500)
	end

  while true do
    Citizen.Wait(1)
    SetTextFont(0)
    SetTextScale(0.25, 0.25)
    SetTextEntry("STRING")
    AddTextComponentString('Current Status: ' .. Status) -- Main Text string
    DrawText(0.92, 0.025)
  end
end)

----- Stations -----
for k,v in pairs(Config.Stations) do
    local point = lib.points.new({
        coords = v.coords,
        distance = 5,
    })

    local marker = lib.marker.new({
        coords = v.coords,
        type = 1,
    })

    function point:nearby()
        marker:draw()
       
        if self.currentDistance < 1.5 then
          if not lib.isTextUIOpen() then
            lib.showTextUI("Press [E] to enter " .. v.name)
          end
       
          if IsControlJustPressed(0, 51) then
            TriggerEvent('FiveMFR:ToggleDuty')
          end
        else
          if lib.isTextUIOpen() then
            lib.hideTextUI()
          end
        end
      end
end
