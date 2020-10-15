local solar_script = {}

-- Events ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local solar_flare_start = script.generate_event_name()
local solar_flare_end = script.generate_event_name()
local solar_eclipse_start = script.generate_event_name()
local solar_eclipse_end = script.generate_event_name()

-- Definitions ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local duration_min = 2*60*60 --settings.global['apm_solar_event_min_minutes'].value * 60 * 60
local duration_max = 5*80*80 --settings.global['apm_solar_event_max_minutes'].value * 60 * 60

-- Initial --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function solar_script.init()
    if global.solar == nil then global.solar = {} end
    if global.solar.event_queue == nil then global.solar.event_queue = {} end
    if global.solar.surfaces == nil then global.solar.surfaces = {} end
end

-- Settings -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function solar_script.mod_setting_changed()
    -- ...
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function add_surface(index)
    local surface = game.surfaces[index]
    if surface == nil then
        log('Info: add_surface(): surface with index: "' ..tostring(index).. '" does not exist')
        return false
    end

    if global.solar.surfaces[index] then return false end
    global.solar.surfaces[index] = true
    log('Info: add_surface(): added: surface: "' ..tostring(surface.name).. '" with index: "' ..tostring(index).. '"')
    return true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remove_event_by_surface_index(index)
     for i = #global.solar.event_queue, 1, -1 do
        local event = global.solar.event_queue[i]
        if event.surface_index == index then
            table.remove(global.solar.event_queue, i)
        end
    end
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remove_surface(index)
    if not global.solar.surfaces[index] then return false end
    global.solar.surfaces[index] = nil
    remove_event_by_surface_index(index)
    log('Info: remove_surface(): removed: surface with index: "' ..tostring(index).. '"')
    return true
end

-- Function -------------------------------------------------------------------
-- global.solar.event_queue a table of events
-- definition for an event: {surface, surface_index, type, state, time, duration}
--
-- surface: LuaSurface
-- surface_index: LuaSurface.index
-- type:
-- 0 = solar eclipse
-- 1 = solar flare
-- time: int+x == >GameTicks
-- duration: int GameDays
--
-- state:
-- 0 == pending (need work)
-- 1 == ready for notification
-- 2 == ready for execution
-- 3 == running
--
-- ----------------------------------------------------------------------------
local function event_queue_add(surface, surface_index, type, time, duration)

    local type_name

    if type == 0 then
        type_name = 'Solar eclipse'
    elseif type == 1 then
        type_name = 'Solar flare'
    else return false end

    local event = {state=0, surface=surface, surface_index=surface_index, type=type, time=time, duration=duration}
    table.insert(global.solar.event_queue, event)

    log('Info: event_queue_add(): for surface: "' ..tostring(surface.name).. '" with index: "' ..tostring(surface_index).. '" at tick: "'  ..tostring(time).. '" added event: "' ..tostring(type_name).. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_alerts(event)
    for _, force in pairs(game.forces) do
        if force.name ~= 'enemy' and force.name ~= 'neutral' then
            force.print('DEBUG: test alarm for: ' ..tostring(event.type))
        end
    end
    event.state = 2
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_solar_eclipse_start(event)
    local surface = event.surface

    for _, force in pairs(game.forces) do
        if force.name ~= 'enemy' and force.name ~= 'neutral' then
            force.print('DEBUG: test start')
        end
    end

    surface.daytime = surface.evening + 0.05
    surface.freeze_daytime = true
    event.state = 3
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_start(event)
    if event.type == 0 then
        event_solar_eclipse_start(event)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_solar_eclipse_end(event)
    local surface = event.surface

    for _, force in pairs(game.forces) do
        if force.name ~= 'enemy' and force.name ~= 'neutral' then
            force.print('DEBUG: test end')
        end
    end

    surface.freeze_daytime = false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_finished(event)
    if event.type == 0 then
        event_solar_eclipse_end(event)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function process_event(event)
    if event.state == 3 and game.tick >= event.duration then
        event_finished(event)
        return true
    elseif event.state == 3 and game.tick < event.duration then
        return false
    end

    if event.state == 2 and game.tick >= event.time then
        event_start(event)
        return false
    elseif event.state == 2 and game.tick < event.time then
        return false
    end

    if event.state == 1 and game.tick >= event.time-60*30 then
        create_alerts(event)
        return false
    end

    if event.state == 0 then
        event.state = 1
    end

    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function process_event_queue()
    for i = #global.solar.event_queue, 1, -1 do
        local event = global.solar.event_queue[i]
        if event.surface.valid then
            if process_event(event) then
                table.remove(global.solar.event_queue, i)
            end
        else
            remove_surface(event.surface_index)
            table.remove(global.solar.event_queue, i)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function solar_script.on_tick()
    if game.tick <= 180 or #global.solar.surfaces == 0 then
        return
    end

    if game.tick % 60 == 37 then
        process_event_queue()
    end
end

-- Remote Function ------------------------------------------------------------
--
-- surface_index: index of an existing surface
-- type:
-- time: tick, has to be greater then game.tick + 600
-- duration:
-- ----------------------------------------------------------------------------
local function remote_add_event(surface_index, type, time, duration)

    local surface = game.surfaces[surface_index]
    if surface == nil then return false end
    if time <= game.tick then return false end
    if duration then
        if duration+time <= game.tick then return false end
    else
        duration = math.random(duration_min, duration_max)
    end

    event_queue_add(surface, surface_index, type, time, duration)

    return true
end

-- Remote Interface -----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- /c remote.call('apm_solar', 'add_surface', 1)
-- /c remote.call('apm_solar', 'remove_surface', 1)
-- /c remote.call('apm_solar', 'list_surfaces')
-- /c remote.call('apm_solar', 'add_event', 1, game.tick+600, game.tick+600+600)
--
-- subscribing events:
--
-- script.on_event(remote.call("apm_solar", "event_solar_eclipse_start"), function(event)
--    -- your stuff here
--  end)
-- script.on_event(remote.call("apm_solar", "event_solar_eclipse_end"), function(event)
--    -- your stuff here
--  end)
-- script.on_event(remote.call("apm_solar", "event_solar_flare_start"), function(event)
--    -- your stuff here
--  end)
-- script.on_event(remote.call("apm_solar", "event_solar_flare_end"), function(event)
--    -- your stuff here
--  end)
--
--  WARNING: this has to be done within on_init and on_load, otherwise the game will error about the remote.call

remote.add_interface("apm_solar",{
    add_surface = function(index) return add_surface(index) end,
    remove_surface = function(index) return remove_surface(index) end,
    --list_surfaces = function() return remote_list_surfaces() end,
    add_event = function(surface_index, type, time, duration) return remote_add_event(surface_index, type, time, duration) end,
    event_solar_eclipse_start = function() return solar_eclipse_start end,
    event_solar_eclipse_end = function() return solar_eclipse_end end,
    event_solar_flare_start = function() return solar_flare_start end,
    event_solar_flare_end = function() return solar_flare_end end
    -- event.surface = Index of the LuaSurface
    -- event.position = Types/Position of the impact center
    })

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return solar_script
