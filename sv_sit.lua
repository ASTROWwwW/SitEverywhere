local usedSeats = {}

RegisterNetEvent('as_chairs:requestSeat', function(netId, seatIndex)
    local src = source
    if not usedSeats[netId] then usedSeats[netId] = {} end
    if usedSeats[netId][seatIndex] and usedSeats[netId][seatIndex] ~= src then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end
    usedSeats[netId][seatIndex] = src
    TriggerClientEvent('as_chairs:seatGranted', src, netId, seatIndex)
end)

RegisterNetEvent('as_chairs:leaveSeat', function(netId, seatIndex)
    local src = source
    if usedSeats[netId] and usedSeats[netId][seatIndex] == src then
        usedSeats[netId][seatIndex] = nil
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    for netId, seats in pairs(usedSeats) do
        for i, owner in pairs(seats) do
            if owner == src then
                usedSeats[netId][i] = nil
            end
        end
    end
end)
