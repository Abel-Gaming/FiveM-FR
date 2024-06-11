Status = '10-7'

----- Script Loaded -----
print('Loaded FiveMFR by Abel Gaming')

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
            lib.notify({
              description = "You are now on duty!"
            })
          end
        else
          if lib.isTextUIOpen() then
            lib.hideTextUI()
          end
        end
      end
end