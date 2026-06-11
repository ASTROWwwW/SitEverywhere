local usedSeats = {}

local Config = SeatConfig

local playerReservation = {}

local lastRequest = {}
local REQUEST_INTERVAL = 250 -- ms minimum between requestSeat calls per source

local SEAT_TTL = 1800000 -- 30 min hard cap (refreshed on activity)
local seatExpiry = {}

local function publishSeats(netId)
    local seats = usedSeats[netId]
    if not seats or next(seats) == nil then
        GlobalState['as_chairs:' .. netId] = nil
    else
        -- expose occupied seat indexes as a boolean map (avoid leaking server ids to clients)
        local occupied = {}
        for index in pairs(seats) do
            occupied[index] = true
        end
        GlobalState['as_chairs:' .. netId] = occupied
    end
end

local function clearSeat(netId, seatIndex, src)
    local seats = usedSeats[netId]
    if not seats then return end
    if seats[seatIndex] == src then
        seats[seatIndex] = nil
        if seatExpiry[netId] then seatExpiry[netId][seatIndex] = nil end
        if playerReservation[src] then
            local r = playerReservation[src]
            if r.netId == netId and r.seatIndex == seatIndex then
                playerReservation[src] = nil
            end
        end
        if next(seats) == nil then
            usedSeats[netId] = nil
            seatExpiry[netId] = nil
        end
        publishSeats(netId)
    end
end

RegisterNetEvent('as_chairs:requestSeat', function(netId, seatIndex)
    local src = source

    local now = GetGameTimer()
    if lastRequest[src] and (now - lastRequest[src]) < REQUEST_INTERVAL then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end
    lastRequest[src] = now

    if type(netId) ~= 'number' or netId <= 0 or netId ~= math.floor(netId) then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end
    if type(seatIndex) ~= 'number' or seatIndex <= 0 or seatIndex ~= math.floor(seatIndex) then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not entity or entity == 0 or not DoesEntityExist(entity) then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end

    local model = GetEntityModel(entity)
    local cfg = Config.Chairs[model]
    if not cfg and not Config.Behaviour.AllowAllObjects then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end
    if cfg and cfg.Seats then
        if seatIndex > #cfg.Seats then
            TriggerClientEvent('as_chairs:seatDenied', src)
            return
        end
    elseif seatIndex ~= 1 then
        -- single-seat props only accept index 1
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end

    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end
    local pedCoords = GetEntityCoords(ped)
    local seatCoords = GetEntityCoords(entity)
    local dist = #(pedCoords - seatCoords)
    local maxDist = (Config.Target.Distance or 1.5) + 2.0 -- margin for offsets / latency
    if dist > maxDist then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end

    local prev = playerReservation[src]
    if prev then
        clearSeat(prev.netId, prev.seatIndex, src)
    end

    if not usedSeats[netId] then usedSeats[netId] = {} end
    if usedSeats[netId][seatIndex] and usedSeats[netId][seatIndex] ~= src then
        TriggerClientEvent('as_chairs:seatDenied', src)
        return
    end

    usedSeats[netId][seatIndex] = src
    seatExpiry[netId] = seatExpiry[netId] or {}
    seatExpiry[netId][seatIndex] = now + SEAT_TTL
    playerReservation[src] = { netId = netId, seatIndex = seatIndex }
    publishSeats(netId)
    TriggerClientEvent('as_chairs:seatGranted', src, netId, seatIndex)
end)

RegisterNetEvent('as_chairs:leaveSeat', function(netId, seatIndex)
    local src = source
    if type(netId) ~= 'number' or type(seatIndex) ~= 'number' then
        return
    end
    clearSeat(netId, seatIndex, src)
end)

AddEventHandler('playerDropped', function()
    local src = source
    lastRequest[src] = nil
    playerReservation[src] = nil
    for netId, seats in pairs(usedSeats) do
        local changed = false
        for i, owner in pairs(seats) do
            if owner == src then
                seats[i] = nil
                if seatExpiry[netId] then seatExpiry[netId][i] = nil end
                changed = true
            end
        end
        if next(seats) == nil then
            usedSeats[netId] = nil
            seatExpiry[netId] = nil
        end
        if changed then
            publishSeats(netId)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(60000)
        local now = GetGameTimer()
        for netId, seats in pairs(usedSeats) do
            local entity = NetworkGetEntityFromNetworkId(netId)
            local entityGone = (not entity) or entity == 0 or not DoesEntityExist(entity)
            local changed = false
            for seatIndex, owner in pairs(seats) do
                local expiry = seatExpiry[netId] and seatExpiry[netId][seatIndex]
                local ownerPed = GetPlayerPed(owner)
                local ownerGone = (not ownerPed) or ownerPed == 0
                if entityGone or ownerGone or (expiry and now >= expiry) then
                    seats[seatIndex] = nil
                    if seatExpiry[netId] then seatExpiry[netId][seatIndex] = nil end
                    if playerReservation[owner] then
                        local r = playerReservation[owner]
                        if r.netId == netId and r.seatIndex == seatIndex then
                            playerReservation[owner] = nil
                        end
                    end
                    changed = true
                end
            end
            if next(seats) == nil then
                usedSeats[netId] = nil
                seatExpiry[netId] = nil
            end
            if changed then
                publishSeats(netId)
            end
        end
    end
end)
