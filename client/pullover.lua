function PerformTrafficStop()
    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)
    if GetVehicleClass(playerVeh) == 18 then
        local pvPos = GetEntityCoords(playerVeh)
        local inFrontOfPlayerVeh = GetOffsetFromEntityInWorldCoords(playerVeh, 0.0, distanceToCheck, 0.0 )
        local targetVeh = GetVehicleInDirection(pvPos, inFrontOfPlayerVeh)
        FreezeEntityPosition(targetVeh, true)
    end
end