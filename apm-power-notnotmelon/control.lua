-- Requires Defines------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local updates = require('lib.updates')
local core =  require('__apm-lib-notnotmelon__.lib.script.core')
local patch_aai =  require('__apm-lib-notnotmelon__.lib.script.patch.aai')
local patch_angel =  require('__apm-lib-notnotmelon__.lib.script.patch.angel')
local offshore_pumps = require('__apm-lib-notnotmelon__.lib.script.offshore_pump')

-- Locals ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_starter_items()
    local item_list =   {}
    item_list["burner-mining-drill"] = 2
    item_list["burner-inserter"] = 4
    item_list["apm_burner_filter_inserter"] = 2
    item_list["wood"] = 15
    item_list["stone-furnace"] = 2
    return item_list
end 

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function put_starter_armor_and_equipment(player)
    if not global.player_starter_set then global.player_starter_set = {} end

    local armor_name = 'apm_armor_starter'
    local equipments = {'apm_equipment_burner_generator_basic', 'apm_equipment_roboport_small',
                        'apm_equipment_battery_tiny', 'apm_equipment_battery_tiny'
    }
    local additions = {
        ['apm_zx80_construction_robot'] = 5
    }

    if core.player_insert_armor_safe(player, armor_name, equipments) then
        core.player_insert_items_safe(player, additions, true)
        global.player_starter_set[player.index] = true
        remote.call('apm_equipment', 'check_equipment_manager', player)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function give_starter_armor_and_equipment(player)
    if not settings.global['apm_power_starter_armor'].value then return end
    if not global.player_starter_set then global.player_starter_set = {} end
    if global.player_starter_set[player.index] then return end
    put_starter_armor_and_equipment(player)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function register_burner_equipment()
   remote.call('apm_equipment', 'add_burner_equipment', 'apm_equipment_burner_generator_basic')
   remote.call('apm_equipment', 'add_burner_equipment', 'apm_equipment_burner_generator_advanced')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function On_Init()
    updates.run()
    offshore_pumps.on_init()
    register_burner_equipment()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function on_load()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function on_update()
    updates.run()
    offshore_pumps.on_update()
    register_burner_equipment()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_on_tick()
    patch_aai.on_tick()
    patch_angel.on_tick()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_on_player_created(event)
    local player = game.players[event.player_index]
    local items = get_starter_items()

    core.player_insert_items_safe(player, items)
    give_starter_armor_and_equipment(player)

    patch_angel.player_create(event)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_on_player_joined_game(event)
    local player = game.players[event.player_index]
    give_starter_armor_and_equipment(player)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_on_build(event)
    if event.created_entity.valid ~= true then return end
    offshore_pumps.on_build(event.created_entity)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function event_on_robot_build(event)
    if event.created_entity.valid ~= true then return end
    offshore_pumps.on_build(event.created_entity)
end

-- Event Defines---------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local entity_build_filter = {
    {filter='type', type='offshore-pump'}
}

script.on_event(defines.events.on_player_created, function(event) event_on_player_created(event) end)
script.on_event(defines.events.on_player_joined_game, function(event) event_on_player_joined_game(event) end)
script.on_event(defines.events.on_tick, function(event) event_on_tick(event) end)
script.on_event(defines.events.on_built_entity, function(event) event_on_build(event) end, entity_build_filter)
script.on_event(defines.events.on_robot_built_entity, function(event) event_on_robot_build(event) end, entity_build_filter)

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
script.on_init(On_Init)
script.on_load(on_load)
script.on_configuration_changed(on_update)

-- Remote ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function remote_give_starter_armor(player_name)
    local player = core.get_player_by_name(player_name)
    if player then
        put_starter_armor_and_equipment(player)
    end
end

-- Remote Interface ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- /c remote.call('apm_power', 'give_starter_armor', 'player_name')
remote.add_interface("apm_power",{
    give_starter_armor = function(player_name) return remote_give_starter_armor(player_name) end,
    })