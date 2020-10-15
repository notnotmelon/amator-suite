local starfall_script = {}

-- Requires Defines------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

-- Events ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local on_impact = script.generate_event_name()

-- Definitions ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local area_border_inner = {x=4*32, y=4*32}
local area_border_outer = {x=15*32, y=15*32}
local on_min_tick = settings.global['apm_starfall_event_min_minutes'].value * 60 * 60
local on_max_tick = settings.global['apm_starfall_event_max_minutes'].value * 60 * 60
local resource_patch_size_max = 7
local resource_patch_size_min = 4
local guaranteed_starting_meteroids = 2
local max_meteroids = 2
local mark_impact_on_map = settings.global['apm_starfall_mark_impact_on_map'].value
local richness_multiplikator = settings.global['apm_starfall_richness_multiplikator'].value
local resources_list
local resources_list_without_fuild = {}
local resources_list_with_fuild = {}
local resources_list_size = 0
local resources_list_without_fuild_size = 0
local resources_list_with_fuild_size = 0

-- Initial --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function starfall_script.init()
    if global.apm_starfall == nil then global.apm_starfall = {} end
    if global.apm_starfall.event_queue == nil then global.apm_starfall.event_queue = {} end
    if global.apm_starfall.start_impacts == nil then 
        global.apm_starfall.start_impacts = not settings.global['apm_starfall_compat_start_impacts'].value
    end
    if global.apm_starfall.near_impact_counter == nil then global.apm_starfall.near_impact_counter = 1 end
    if global.apm_starfall.surfaces == nil then global.apm_starfall.surfaces = {} end
    if global.apm_starfall.surfaces_borders == nil then global.apm_starfall.surfaces_borders = {} end
end

-- Settings -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function starfall_script.mod_setting_changed()
    mark_impact_on_map = settings.global['apm_starfall_mark_impact_on_map'].value
    richness_multiplikator = settings.global['apm_starfall_richness_multiplikator'].value

    -- event: min_minutes + max_minutes ---
    local new_on_min_tick = settings.global['apm_starfall_event_min_minutes'].value * 60 * 60
    local new_on_max_tick = settings.global['apm_starfall_event_max_minutes'].value * 60 * 60
    if on_min_tick ~= new_on_min_tick then
        log('Changed: apm_starfall_event_min_minutes from: "' .. tostring(on_min_tick) .. '" to "' ..tostring(new_on_min_tick))
        on_min_tick = new_on_min_tick
    end

    if on_max_tick ~= new_on_max_tick then
        log('Changed: apm_starfall_event_min_minutes from: "' .. tostring(on_max_tick) .. '" to "' ..tostring(new_on_max_tick))
        on_max_tick = new_on_max_tick
    end

    -- Now a test against a wrong user input if he sets the min. event tick bigger then the max. event tick.
    if on_min_tick > on_max_tick then
        on_max_tick = on_min_tick
    end
end

-- Function -------------------------------------------------------------------
-- This a simple, naive implementation. It only copies the top level value and 
-- its direct children; there is no handling of deeper children, metatables or 
-- special types such as userdata or coroutines. It is also susceptible to 
-- influence by the __pairs metamethod.
-- copy&paste from: http://lua-users.org/wiki/CopyTable
-- ----------------------------------------------------------------------------
local function clone(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_random_multi()
    local rnd = math.random()
    if rnd >= 0.5 then
        return -1
    end
    return 1
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function calculate_borders(surface_index)
    local surface = game.surfaces[surface_index]
    if surface == nil then return end
    if not surface.valid then return end

    local x = global.apm_starfall.surfaces_borders[surface.index].x/32
    local new_x = 0
    local y = global.apm_starfall.surfaces_borders[surface.index].y/32
    local new_y = 0

    for chunk in surface.get_chunks() do
        if math.pow(chunk.x, 2) > new_x then new_x = math.pow(chunk.x, 2) end
        if math.pow(chunk.y, 2) > new_y then new_y = math.pow(chunk.y, 2) end
    end

    if math.sqrt(new_x) - 1 > x then
        local new_border_x = (math.sqrt(new_x) - 1)*32
        global.apm_starfall.surfaces_borders[surface.index].x = new_border_x
        log('Set outer border x to: ' ..tostring(new_border_x) .. ' tiles range for surface: "' ..tostring(surface.index) .. '"')
    end

    if math.sqrt(new_y) -1 > y then
        local new_border_y = (math.sqrt(new_y) - 1)*32
        global.apm_starfall.surfaces_borders[surface.index].y = new_border_y
        log('Set outer border y to: ' ..tostring(new_border_y) .. ' tiles range for surface: "' ..tostring(surface.index) .. '"')
    end
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

    if global.apm_starfall.surfaces[index] then return false end
    global.apm_starfall.surfaces[index] = true
    global.apm_starfall.surfaces_borders[index] = clone(area_border_outer)
    log('Info: add_surface(): added: surface: "' ..tostring(surface.name).. '" with index: "' ..tostring(index).. '"')
    calculate_borders(index)
    return true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remove_event_by_surface_index(index)
     for i = #global.apm_starfall.event_queue, 1, -1 do
        local event = global.apm_starfall.event_queue[i]
        if event.surface_index == index then
            table.remove(global.apm_starfall.event_queue, i)
            log('Info: remove_event_by_surface_index(): removed event for surface with index: "' ..tostring(index).. '"')
        end
    end
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remove_surface(index)
    if not global.apm_starfall.surfaces[index] then return false end
    global.apm_starfall.surfaces[index] = nil
    global.apm_starfall.surfaces_borders[index] = nil
    remove_event_by_surface_index(index)
    log('Info: remove_surface(): removed: surface with index: "' ..tostring(index).. '"')
    return true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_border(surface)
    local width = surface.map_gen_settings.width
    local height  = surface.map_gen_settings.height

    local inner_border = clone(area_border_inner)
    local outer_border = global.apm_starfall.surfaces_borders[surface.index]

    if width ~= 0 and math.pow(outer_border.x,2) > math.pow(width,2) then
        global.apm_starfall.surfaces_borders[surface.index].x = width
        log('Warning: setting: outer border: x too big for surface: "' .. tostring(surface.name) .. '"')
    end
    if width ~= 0 and math.pow(inner_border.x,2) > math.pow(width,2) then
        inner_border.x = round(width/4)
        log('Warning: setting: inner border: x too big for surface: "' .. tostring(surface.name) .. '"')
    end

    if height ~= 0 and math.pow(outer_border.y,2) > math.pow(height,2) then
        global.apm_starfall.surfaces_borders[surface.index].y = height
        log('Warning: setting: outer border: y too big for surface: "' .. tostring(surface.name) .. '"')
    end
    if height ~= 0 and math.pow(inner_border.y,2) > math.pow(height,2) then
        inner_border.y = round(height/4)
        log('Warning: setting: inner border: y too big for surface: "' .. tostring(surface.name) .. '"')
    end

    return {outer=global.apm_starfall.surfaces_borders[surface.index], inner=inner_border}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_random_position(surface, range)
    local position_x = 0
    local position_y = 0
    local x_multi = get_random_multi()
    local y_multi = get_random_multi()
    local border = get_border(surface)

    if range ~= nil then
        position_x = x_multi * math.random(0, range.max)
        position_y = y_multi * math.random(0, range.max)
        if math.pow(position_x,2) < math.pow(range.min,2) and math.pow(position_y,2) < math.pow(range.min,2) then
            if math.pow(position_x,2) < math.pow(range.min,2) then
                position_x = position_x + x_multi*range.min
            else
                position_y = position_y + x_multi*range.min
            end
        end
        return {x=position_x, y=position_y, state=0}
    end

    local border_outer_x = border.outer.x - 32*2
    local border_outer_y = border.outer.y - 32*2

    if math.random() <= 0.05 * global.apm_starfall.near_impact_counter then
        border_outer_x = border_outer_x/2
        border_outer_y = border_outer_y/2
        global.apm_starfall.near_impact_counter = 1
    else
        global.apm_starfall.near_impact_counter = global.apm_starfall.near_impact_counter + 1
    end

    position_x = get_random_multi() * round(math.random(0, border_outer_x), 0)
    position_y = get_random_multi() * round(math.random(0, border_outer_y), 0)
    if math.pow(position_x,2) < math.pow(border.inner.x,2) and math.pow(position_y,2) < math.pow(border.inner.y,2) then
        if math.pow(position_x,2) < math.pow(10,2) then
            position_x = position_x + x_multi*border.inner.x
        else
            position_y = position_y + x_multi*border.inner.y
        end
    end   
    return {x=position_x, y=position_y, state=0}
end

-- Function ----------------------------------------------------------------
--
--
-- -------------------------------------------------------------------------
local function get_chunk_position(position)
    local chunk_position = {}
    chunk_position.x = round(position.x/32, 0)
    chunk_position.y = round(position.y/32, 0)
    return chunk_position
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_if_position_is_valid(surface, position)
    local water_tiles = {"water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud"}
    local tiles = surface.find_tiles_filtered({position=position, radius=resource_patch_size_max+2, name=water_tiles})
    if next(tiles) ~= nil then
        return false
    end

    local resources = surface.find_entities_filtered({position=position, radius=resource_patch_size_max+2, type='resource'})
    if next(resources) ~= nil then
        return false
    end

    return true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_alerts(surface, positions)
    local forces = game.forces
    for _, force in pairs(forces) do
        if force.name ~= 'enemy' and force.name ~= 'neutral' then
            for _, player in pairs(force.connected_players) do
                if player.surface.name == surface.name then
                    for _, position in pairs(positions) do
                        local marker = surface.create_entity({name = "apm_starfall_target_explosion", position = position})
                        player.add_custom_alert(marker, {type = "item", name = "apm_starfall_target_marker"}, {"", "Expected meteorite impact zone."}, true)
                    end
                    if settings.get_player_settings(player)['apm_starfall_event_player_alert_sound'].value then
                        local setting_volume = settings.get_player_settings(player)['apm_starfall_event_player_sound_volume'].value
                        if setting_volume == 'apm_sound_type_very_low' then
                            player.play_sound({path = 'apm_meteorite_discovered', volume_modifier = 0.25})
                        elseif setting_volume == 'apm_sound_type_low' then
                            player.play_sound({path = 'apm_meteorite_discovered', volume_modifier = 0.5})
                        elseif setting_volume == 'apm_sound_type_normal' then
                            player.play_sound({path = 'apm_meteorite_discovered', volume_modifier = 0.75})
                        end
                    end
                end
            end
        end
    end
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_overwrite_patch_size(overwrite_patch_size)
    local patch_size = overwrite_patch_size

    if overwrite_patch_size == nil then
        patch_size = math.random(resource_patch_size_min, resource_patch_size_max)
    end

    return patch_size
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function fire_probability(x, y, outer_size, inner_size)
    inner_size = inner_size / 3 * 2
    outer_size = outer_size - 4

    if math.pow(x,2)+math.pow(y,2) < math.pow((inner_size),2) then
        return false
    end

    if x < 0 then x = x * -1 end
    if y < 0 then y = y * -1 end

    local high_value = x + y
    local probability = math.random()

    if probability <= ((outer_size * 2 + 1 - high_value) / (outer_size * 2)) then 
        return true 
    end

    return false
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_impact_fire(surface, position, patch_size)
    local fire_radius = 8 + patch_size
    for x=-fire_radius, fire_radius do
        for y=-fire_radius, fire_radius do
            if fire_probability(x, y, fire_radius, patch_size) then
                local spawn_position = {position.x+x, position.y+y}
                surface.create_entity({name = 'fire-flame', position = spawn_position})
                --surface.create_entity({name = 'fire-flame-on-tree', position = spawn_position})
            end
        end
    end
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function ore_probability(x, y, size)
    if x < 0 then x = x * -1 end
    if y < 0 then y = y * -1 end

    local high_value = x + y
    local probability = math.random()

    if probability <= ((size * 2 + 1 - high_value) / (size * 2)) then 
        return true 
    end
    return false
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_amount(x, y, size, richness_bonus)
    if x < 0 then x = x * -1 end
    if y < 0 then y = y * -1 end

    local amount_max = 10000 * richness_multiplikator * richness_bonus
    if amount_max > 20000 then amount_max = amount_max / 1.5 end

    local amount_min = 20 * size * richness_multiplikator * richness_bonus
    if amount_min > 1500 then amount_min = 1500 end

    local high_value = x + y
    local amount = round(math.random(amount_min, amount_max) * (size * 2 + 1 - high_value) / (size * 2) * richness_multiplikator * richness_bonus, 0)

    return amount
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_ore_remains(surface, position, overwrite_ore, patch_size)
    local ore_name = overwrite_ore
    if not overwrite_ore then
        local ore_key = math.random(1, resources_list_size)
        ore_name = resources_list[ore_key]
    end

    --local border = get_border(surface)
    local fraction_value  = math.pow(position.x,2)+math.pow(position.y,2)
    local total_value = math.pow(area_border_outer.x,2)+math.pow(area_border_outer.y,2)
    local richness_bonus = 1 + ((fraction_value / total_value) / 3)
    
    for y=-patch_size, patch_size do
        for x=-patch_size, patch_size do
            local spawn_position = {position.x+x, position.y+y}
            local spawn_amount = get_amount(x, y, patch_size, richness_bonus)

            if position.x == position.x+x and position.y == position.y+y then
                surface.create_entity({name = ore_name, position = spawn_position, amount = spawn_amount, force='neutral'})
            else
                if ore_probability(x, y, patch_size) then
                    surface.create_entity({name = ore_name, position = spawn_position, amount = spawn_amount, force='neutral'})
                end
            end
        end
    end
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_map_tag(surface, position)
    if mark_impact_on_map then
        local forces = game.forces
        for _, force in pairs(forces) do
            if force.name ~= 'enemy' and force.name ~= 'neutral' then
                local text = 'Meteorite'
                local tag = {icon={type='item', name='apm_starfall_target_marker'}, position=position, text=text}
                force.add_chart_tag(surface, tag)
            end
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function play_impact_sound(surface)
    local forces = game.forces
    for _, force in pairs(forces) do
        if force.name ~= 'enemy' and force.name ~= 'neutral' then
            for _, player in pairs(force.connected_players) do
                if player.surface.name == surface.name then
                    if settings.get_player_settings(player)['apm_starfall_event_player_impact_sound'].value then
                        local setting_volume = settings.get_player_settings(player)['apm_starfall_event_player_sound_volume'].value
                        if setting_volume == 'apm_sound_type_very_low' then
                            player.play_sound({path = 'apm_meteorite_impact', volume_modifier = 0.25})
                        elseif setting_volume == 'apm_sound_type_low' then
                            player.play_sound({path = 'apm_meteorite_impact', volume_modifier = 0.5})
                        elseif setting_volume == 'apm_sound_type_normal' then
                            player.play_sound({path = 'apm_meteorite_impact', volume_modifier = 0.75})
                        end
                    end
                end
            end
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function create_impact(surface, positions)
    local iteration_ore = 1
    local overwrite_ore
    local overwrite_patch_size

    for _, position in pairs(positions) do
        local entity = surface.create_entity({name='apm_starfall_dummy_target', position=position})
        surface.create_entity({name = "massive-explosion", position=entity.position})
        surface.create_entity({name = 'apm_meteorite_impact', target = entity, speed = 1.0, position = entity.position})
        entity.destroy()

        if global.apm_starfall.start_impacts == false then
            overwrite_patch_size = 7
            overwrite_ore = resources_list_without_fuild[iteration_ore]
        end
        
        local patch_size = get_overwrite_patch_size(overwrite_patch_size)

        create_impact_fire(surface, position, patch_size)
        create_ore_remains(surface, position, overwrite_ore, patch_size)
        play_impact_sound(surface)

        iteration_ore = iteration_ore + 1
        if iteration_ore > #resources_list_without_fuild then
            iteration_ore = 1
        end

        -- create map tag
        create_map_tag(surface, position)

        -- raise custom event
        script.raise_event(on_impact, {surface = surface.index, position = position})
    end
    global.apm_starfall.start_impacts = true
end

-- Function -------------------------------------------------------------------
-- global.apm_starfall.event_queue a table of events
-- definition for an event: {surface, surface_index, event_state, amount, positions, event_time}
-- 
-- surface: LuaSurface
-- surface_index: LuaSurface.index
-- event_time: int GameTicks
--
-- event_state:
-- 0 == pending (need work)
-- 1 == ready for execution
--
-- amount: amount of impacts generated by this event
--
-- positions: table{position, ...}
-- position: table:{pos.x, pos.y, position_state}
-- position_state: 
-- 0 == pending (need work)
-- 1 == ready for notification
-- 2 == ready for execution
-- ----------------------------------------------------------------------------
local function event_queue_add(surface, surface_index, amount, event_time, range)
    local event = {state=0, surface=surface, surface_index=surface_index, amount=amount, positions={}, time=event_time, range=range}
    table.insert(global.apm_starfall.event_queue, event)
    log('Info: event_queue_add(): for surface: "' ..tostring(surface.name).. '" with index: "' ..tostring(surface_index).. '" at tick: "'  ..tostring(event_time).. '"' )
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function process_event(event)
    if event.state == 1 and game.tick >= event.time-60*30 then
        local positions = {}
        for _, pos in pairs(event.positions) do
            table.insert(positions, {x=pos.x,y=pos.y})
        end
        create_alerts(event.surface, positions)
        event.state = 2
        return false
    end

    if event.state == 2 and game.tick >= event.time then
        local positions = {}
        for _, pos in pairs(event.positions) do
            table.insert(positions, {x=pos.x,y=pos.y})
        end
        create_impact(event.surface, positions)
        return true
    elseif event.state == 2 and game.tick < event.time then
        return false
    end

    if event.state == 0 then
        if #event.positions < event.amount then
            local position = get_random_position(event.surface, event.range)
            table.insert(event.positions, position)
            event.time = event.time + 60
            return false
        end

        for i = #event.positions, 1, -1 do
            local position = event.positions[i]
            if position.state == 0 then

                local chunk_position = get_chunk_position(position)
                if not event.surface.is_chunk_generated(chunk_position) then
                    event.surface.request_to_generate_chunks(position, 1)
                    event.time = event.time + 10
                    return false
                end

                if check_if_position_is_valid(event.surface, {x=position.x, y=position.y}) then
                    position.state = 1
                    return false
                end

                table.remove(event.positions, i)
                event.time = event.time + 10
                return false
            end
        end

        event.state = 1
    end
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function process_event_queue()
    for i = #global.apm_starfall.event_queue, 1, -1 do
        local event = global.apm_starfall.event_queue[i]
        if event.surface.valid then
            if process_event(event) then
                table.remove(global.apm_starfall.event_queue, i)
            end
        else
            remove_surface(event.surface_index)
            table.remove(global.apm_starfall.event_queue, i)
        end
    end
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function determine_next_event()
    for surface_index, _ in pairs(global.apm_starfall.surfaces) do
        local surface = game.surfaces[surface_index]
        local range
        local time = game.tick + math.random(on_min_tick, on_max_tick)

        local amount = 1

        local i = 1
        while i < max_meteroids do
            if math.random() <= 0.25 then
               amount = amount + 1
            end
            i = i + 1
        end

        event_queue_add(surface, surface.index, amount, time, range)
    end
end

-- Function ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function determine_start_event()
    for surface_index, _ in pairs(global.apm_starfall.surfaces) do
        local surface = game.surfaces[surface_index]
        local range = {min=60,max=60}
        local amount = guaranteed_starting_meteroids
        local time = game.tick + 1000

        event_queue_add(surface, surface.index, amount, time, range)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function starts_with(str, start)
   return str:sub(1, #start) == start
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function generate_resource_lists()
    if not resources_list then
        resources_list = {}
        resources_list_without_fuild = {}
        resources_list_with_fuild = {}
        for _, resource in pairs(game.entity_prototypes) do
            if starts_with(resource.name, 'apm_meteorite_ore_') then
                table.insert(resources_list, resource.name)
                if resource.subgroup.name =='apm_starfall_res' then
                    table.insert(resources_list_without_fuild, resource.name)
                else
                    table.insert(resources_list_with_fuild, resource.name)
                end
            end
        end
        resources_list_size = #resources_list
        resources_list_without_fuild_size = #resources_list_without_fuild
        resources_list_with_fuild_size = #resources_list_with_fuild
        
        log('---- Info: generate_resource_lists(): ----------------------')
        log('Number of total resources: ' .. tostring(resources_list_size))
        log('Number of resources without needed fluid: ' .. tostring(resources_list_without_fuild_size))
        log('Number of resources with needed fluid: ' .. tostring(resources_list_with_fuild_size))
        log('------------------------------------------------------------')
    end
end

-- Function -------------------------------------------------------------------
-- 
--
-- ----------------------------------------------------------------------------
function starfall_script.recalculate_borders(index)
    if index ~= nil then
        calculate_borders(index)
        return
    end

    for surface_index, _ in pairs(global.apm_starfall.surfaces) do
        calculate_borders(surface_index)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function starfall_script.on_tick()
    generate_resource_lists()

    if game.tick <= 180 or #global.apm_starfall.surfaces == 0 then
        return
    end

    if not global.apm_starfall.start_impacts and next(global.apm_starfall.event_queue) == nil then
        determine_start_event()
        return
    end

    if next(global.apm_starfall.event_queue) == nil then
        determine_next_event()
        return
    end

    if game.tick % 60 == 37 then
        process_event_queue()
    end
end

-- Remote Function ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remote_list_surfaces()
    if not global.apm_starfall.surfaces[index] then return {} end
    return global.apm_starfall.surfaces
end

-- Remote Function ------------------------------------------------------------
--
-- surface_index: index of an existing surface
-- amount: amount of impacts
-- time: tick, has to be greater then game.tick + 600
-- range: (optional) an area definition like: {max=100, min=10}, calculated from center {x=0,y=0}
-- ----------------------------------------------------------------------------
local function remote_add_event(surface_index, amount, time, range)
    
    local surface = game.surfaces[surface_index]   
    if surface == nil then return false end
    if amount < 1 then return false end
    if time <= game.tick then return false end

    event_queue_add(surface, surface_index, amount, time, range)

    return true
end

-- Remote Interface -----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- /c remote.call('apm_starfall', 'add_surface', 1)
-- /c remote.call('apm_starfall', 'remove_surface', 1)
-- /c remote.call('apm_starfall', 'list_surfaces')
-- /c remote.call('apm_starfall', 'add_event', 1, 2, game.tick+600)
-- /c remote.call('apm_starfall', 'add_event', 1, 2, game.tick+600, {max=128,min=10})
--
-- subscribing events:
-- script.on_event(remote.call("apm_starfall", "event_on_impact"), function(event)
--    -- your stuff here
--  end)
--  WARNING: this has to be done within on_init and on_load, otherwise the game will error about the remote.call

remote.add_interface("apm_starfall",{
    add_surface = function(index) return add_surface(index) end,
    remove_surface = function(index) return remove_surface(index) end,
    list_surfaces = function() return remote_list_surfaces() end,
    add_event = function(surface_index, amount, time, range) return remote_add_event(surface_index, amount, time, range) end,
    event_on_impact = function() return on_impact end
    -- event.surface = Index of the LuaSurface
    -- event.position = Types/Position of the impact center
    })

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function Event_warptorio2_warp(event)
    remove_surface(event.oldsurface.index)
    add_surface(event.newsurface.index)
    if math.random() <= 0.5 then
        local amount = math.random(1, 2)
        local time = game.tick + math.random(600, 18000)
        event_queue_add(event.newsurface, event.newsurface.index, amount, time, {max=5*32, min=2*32})
    end
end

-- Hook to mod events ---------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function starfall_script.register_to_mod_events()
    if remote.interfaces["warptorio2"] then
        script.on_event(remote.call("warptorio2","event_warp"), function(event) Event_warptorio2_warp(event) end)
        log('Info: starfall.register_to_mod_events(): register events for "warptorio2"')
    end
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return starfall_script
