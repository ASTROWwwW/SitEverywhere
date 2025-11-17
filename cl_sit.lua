local Config = SeatConfig

local isSitting = false
local currentSeatNetId = nil
local currentSeatEntity = nil
local currentThreadActive = false
local currentSeatIndex = nil
local changeCooldown = 0

math.randomseed(GetGameTimer())

local function loadAnim(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
end

local function getRandomFromList(list)
    if type(list) ~= "table" or #list == 0 then
        return nil
    end
    return list[math.random(1, #list)]
end

local function getSitScenario()
    local s = getRandomFromList(Config.Behaviour.SitScenarios)
    return s
end

local function getWallScenario()
    local anims = {
        { dict = "amb@world_human_leaning@male@wall@back@foot_up@idle_a",         anim = "idle_a" },
        { dict = "amb@world_human_leaning@female@wall@back@hand_up@idle_a",       anim = "idle_a" },
        { dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a" }
    }



    return anims[math.random(1, #anims)]
end
local function playLeanAnim(ped, data)
    loadAnim(data.dict)
    TaskPlayAnim(ped, data.dict, data.anim, 8.0, -8.0, -1, 1, 0.0, false, false, false)
end


local function getSeatOffsetPosition(entity, offset)
    local coords = GetEntityCoords(entity)
    local forward = GetEntityForwardVector(entity)
    local rightX = -forward.y
    local rightY = forward.x
    local x = coords.x + forward.x * offset.y + rightX * offset.x
    local y = coords.y + forward.y * offset.y + rightY * offset.x
    local z = coords.z + offset.z
    return vector3(x, y, z)
end

local function getFreeBenchSeat(entity, cfg)
    local seats = cfg.Seats
    if not seats or #seats == 0 then
        return nil, nil
    end
    local used = {}
    local netId = NetworkGetNetworkIdFromEntity(entity)
    local data = LocalPlayer.state.as_chairs_inuse or {}
    if data[netId] then
        used = data[netId]
    end
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local bestSeat = nil
    local bestDist = nil
    local bestIndex = nil
    for i = 1, #seats do
        if not used[i] then
            local coords = getSeatOffsetPosition(entity, seats[i])
            local dist = #(pedCoords - coords)
            if not bestDist or dist < bestDist then
                bestDist = dist
                bestSeat = seats[i]
                bestIndex = i
            end
        end
    end
    return bestSeat, bestIndex
end

local function stopSitting()
    if not isSitting then
        return
    end
    local ped = PlayerPedId()
    ClearPedTasksImmediately(ped)
    ClearPedSecondaryTask(ped)
    isSitting = false
    currentThreadActive = false
    if currentSeatNetId then
        TriggerServerEvent('as_chairs:leaveSeat', currentSeatNetId, currentSeatIndex)
    end
    currentSeatNetId = nil
    currentSeatEntity = nil
    currentSeatIndex = nil
end

local function startSitLoop()
    if currentThreadActive then
        return
    end
    currentThreadActive = true
    CreateThread(function()
        while currentThreadActive and isSitting do
            Wait(0)
            local pedId = PlayerPedId()
            if (currentSeatEntity ~= nil and not DoesEntityExist(currentSeatEntity)) or IsPedDeadOrDying(pedId, true) or IsPedRagdoll(pedId) then
                ClearPedTasksImmediately(pedId)
                isSitting = false
                currentThreadActive = false
                if currentSeatNetId then
                    TriggerServerEvent('as_chairs:leaveSeat', currentSeatNetId, currentSeatIndex)
                end
                currentSeatNetId = nil
                currentSeatEntity = nil
                currentSeatIndex = nil
                break
            end
            if IsControlJustPressed(0, Config.Target.StandKey) or IsControlJustPressed(0, 202) or IsControlJustPressed(0, 73) then
                stopSitting()
                break
            end
            if IsControlJustPressed(0, 45) then
                if currentSeatEntity and currentSeatIndex then
                    local model = GetEntityModel(currentSeatEntity)
                    local cfg = Config.Chairs[model]
                    if cfg and cfg.Seats then
                        local total = #cfg.Seats
                        if total > 1 then
                            if GetGameTimer() >= changeCooldown then
                                changeCooldown = GetGameTimer() + 600
                                local used = {}
                                local netId = currentSeatNetId
                                local data = LocalPlayer.state.as_chairs_inuse or {}
                                if data[netId] then
                                    used = data[netId]
                                end
                                local nextIndex = currentSeatIndex + 1
                                if nextIndex > total then
                                    nextIndex = 1
                                end
                                if not used[nextIndex] then
                                    local ped = PlayerPedId()
                                    Wait(350)
                                    local offset = cfg.Seats[nextIndex]
                                    local pos = getSeatOffsetPosition(currentSeatEntity, offset)
                                    local heading = GetEntityHeading(currentSeatEntity) + cfg.HeadingOffset
                                    SetEntityCoords(ped, pos.x, pos.y, pos.z, false, false, false, false)
                                    SetEntityHeading(ped, heading)
                                    if currentSeatNetId then
                                        TriggerServerEvent('as_chairs:leaveSeat', currentSeatNetId, currentSeatIndex)
                                        TriggerServerEvent('as_chairs:requestSeat', currentSeatNetId, nextIndex)
                                    end
                                    local scenario = getSitScenario()
                                    if scenario then
                                        TaskStartScenarioAtPosition(ped, scenario, pos.x, pos.y, pos.z, heading, 0, true,
                                            true)
                                    end
                                    currentSeatIndex = nextIndex
                                end
                            end
                        end
                    end
                end
            end
            if Config.Behaviour.DisableControls then
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 22, true)
                DisableControlAction(0, 23, true)
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 35, true)
            end
        end
    end)
end

local function sitOnChair(entity, offset, seatIndex)
    if isSitting then
        return
    end
    if not DoesEntityExist(entity) then
        return
    end
    local model = GetEntityModel(entity)
    local cfg = Config.Chairs[model]
    local headingOffset = Config.DefaultOffset.HeadingOffset
    if cfg and cfg.HeadingOffset then
        headingOffset = cfg.HeadingOffset
    end
    local ped = PlayerPedId()
    ClearPedTasksImmediately(ped)
    local seatPos = getSeatOffsetPosition(entity, offset)
    local heading = GetEntityHeading(entity) + headingOffset
    local scenario = getSitScenario()
    if not scenario then
        return
    end
    TaskStartScenarioAtPosition(ped, scenario, seatPos.x, seatPos.y, seatPos.z, heading, 0, true, true)
    isSitting = true
    currentSeatEntity = entity
    currentSeatNetId = NetworkGetNetworkIdFromEntity(entity)
    currentSeatIndex = seatIndex
    startSitLoop()
end

local function raycastWall(maxDistance)
    local ped = PlayerPedId()
    local origin = GetEntityCoords(ped)
    local forward = GetEntityForwardVector(ped)
    local start = vector3(origin.x, origin.y, origin.z + 0.85)
    local dest = vector3(
        origin.x + forward.x * maxDistance,
        origin.y + forward.y * maxDistance,
        origin.z + 0.85
    )
    local ray = StartShapeTestRay(
        start.x, start.y, start.z,
        dest.x, dest.y, dest.z,
        17,
        ped,
        4
    )
    local _, hit, hitPos, normal, material, entityHit = GetShapeTestResult(ray)
    if hit == 1 then
        return true, origin, hitPos, normal
    end
    return false
end

local function startWallLean()
    if isSitting then
        return
    end
    local maxDistance = Config.Wall.MaxDistance or 1.8
    local offset = Config.Wall.OffsetFromWall or 0.35
    local hit, origin, hitPos, normal = raycastWall(maxDistance)
    if not hit then
        return
    end
    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)
    local vToPed = vector3(pedPos.x - hitPos.x, pedPos.y - hitPos.y, 0.0)
    local dot = vToPed.x * normal.x + vToPed.y * normal.y
    if dot < 0.0 then
        normal = vector3(-normal.x, -normal.y, normal.z)
    end
    local finalPos = vector3(
        hitPos.x + normal.x * offset,
        hitPos.y + normal.y * offset,
        pedPos.z
    )
    local heading = GetHeadingFromVector_2d(normal.x, normal.y)
    ClearPedTasksImmediately(ped)
    SetEntityCoords(ped, finalPos.x, finalPos.y, finalPos.z, false, false, false, false)
    SetEntityHeading(ped, heading)
    local scenario = getWallScenario()
    if not scenario then
        return
    end
    local lean = getWallScenario()
    playLeanAnim(ped, lean)

    isSitting = true
    currentSeatEntity = nil
    currentSeatNetId = nil
    currentSeatIndex = nil
    startSitLoop()
end

RegisterNetEvent('as_chairs:seatGranted', function(netId, seatIndex)
    if isSitting then
        return
    end
    if type(netId) ~= 'number' then
        return
    end
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then
        TriggerServerEvent('as_chairs:leaveSeat', netId, seatIndex)
        return
    end
    local model = GetEntityModel(entity)
    local cfg = Config.Chairs[model]
    local offset = nil
    if cfg and cfg.Seats then
        offset = cfg.Seats[seatIndex]
    else
        if cfg and cfg.Position then
            offset = cfg.Position
        else
            offset = Config.DefaultOffset.Position
        end
    end
    sitOnChair(entity, offset, seatIndex)
end)

RegisterNetEvent('as_chairs:seatDenied', function() end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then
        return
    end
    if isSitting then
        stopSitting()
    end
end)

CreateThread(function()
    local options = {
        {
            name = 'as_chairs:seat',
            icon = Config.Target.Icon,
            label = Config.Target.Label,
            distance = Config.Target.Distance,
            canInteract = function(entity)
                if isSitting then
                    return false
                end
                if not entity or not DoesEntityExist(entity) then
                    return false
                end
                if GetEntityType(entity) ~= 3 then
                    return false
                end
                local model = GetEntityModel(entity)
                if Config.Chairs[model] then
                    return true
                end
                if Config.Behaviour.AllowAllObjects then
                    return true
                end
                return false
            end,
            onSelect = function(data)
                if isSitting then
                    return
                end
                local entity = data.entity
                if not entity or not DoesEntityExist(entity) then
                    return
                end
                if not NetworkGetEntityIsNetworked(entity) then
                    NetworkRegisterEntityAsNetworked(entity)
                    Wait(0)
                end
                local model = GetEntityModel(entity)
                local cfg = Config.Chairs[model]
                local offset = nil
                local seatIndex = 1
                if cfg and cfg.Seats then
                    offset, seatIndex = getFreeBenchSeat(entity, cfg)
                    if not offset then
                        return
                    end
                else
                    if cfg and cfg.Position then
                        offset = cfg.Position
                    else
                        offset = Config.DefaultOffset.Position
                    end
                end
                local netId = NetworkGetNetworkIdFromEntity(entity)
                if not netId or netId == 0 then
                    sitOnChair(entity, offset, seatIndex)
                    return
                end
                TriggerServerEvent('as_chairs:requestSeat', netId, seatIndex)
            end
        }
    }
    exports.ox_target:addGlobalObject(options)
end)
CreateThread(function()
    while true do
        Wait(0)

        if isSitting then
            goto continue
        end

        local maxDistance = Config.Wall.MaxDistance or 1.8
        local ok = false

        local hit = raycastWall(maxDistance)
        if hit then
            ok = true
        end

        if not ok then
            DisableControlAction(0, `INPUT_CONTEXT`, false)
        end

        ::continue::
    end
end)

RegisterCommand("walllean", function()
    if not isSitting then
        startWallLean()
    end
end, false)

RegisterKeyMapping("walllean", "Se poser contre un mur", "keyboard", "K")
