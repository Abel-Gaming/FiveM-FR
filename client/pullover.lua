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

function GetVehicleInDirection( coordFrom, coordTo )
    local player = PlayerPedId()
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, player, 0 )
    local _, _, _, _, targetVeh = GetRaycastResult( rayHandle )
    return targetVeh
end
