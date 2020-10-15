require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/valves.lua'

APM_LOG_HEADER(self)

local pipe_straight_vertical = {
    filename = "__base__/graphics/entity/pipe/hr-pipe-straight-vertical.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5
}
local pipe_straight_horizontal = {
    filename = "__base__/graphics/entity/pipe/hr-pipe-straight-horizontal.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5
}

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local symbol_direction_north_0 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_north_0.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5
}
local symbol_direction_east_0 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_east_0.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5
}
local symbol_direction_south_0 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_south_0.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5
}
local symbol_direction_west_0 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_west_0.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local symbol_direction_north_1 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_north_1.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_east_1 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_east_1.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_south_1 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_south_1.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_west_1 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_west_1.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local symbol_direction_north_2 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_north_2.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_east_2 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_east_2.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_south_2 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_south_2.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}
local symbol_direction_west_2 = {
    filename = "__apm_resource_pack__/graphics/entities/valve/symbol_west_2.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
}

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local valve = {}
valve.type = "storage-tank"
valve.name = "apm_valve_0"
valve.icons = {
    apm.power.icons.valve_0
}
valve.icon_size = 32
valve.flags = {"placeable-neutral", "placeable-player", "player-creation", "hide-alt-info"}
valve.minable = {mining_time = 0.2, result = "apm_valve_0"}
valve.fast_replaceable_group = 'pipe'

valve.next_upgrade = nil
valve.max_health = 100
valve.corpse = "small-remnants"
valve.resistances = {{type = "fire", percent = 90}}
valve.two_direction_only = false
valve.collision_box = {{-0.29, -0.29}, {0.29, 0.29}}
valve.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
valve.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
valve.fluid_box = {}
valve.fluid_box.base_area = 1
valve.fluid_box.base_level = -0.2
valve.fluid_box.pipe_covers = pipecoverspictures()
valve.fluid_box.pipe_connections = {
  { position = {0, -1}, type="output"},
  { position = {0, 1}, type="input" }
}
valve.pictures = {}
valve.pictures.picture = {}
valve.pictures.picture.north = {}
valve.pictures.picture.north.layers = {}
valve.pictures.picture.north.layers[1] = pipe_straight_vertical
valve.pictures.picture.north.layers[2] = symbol_direction_north_0
valve.pictures.picture.south = {}
valve.pictures.picture.south.layers = {}
valve.pictures.picture.south.layers[1] = pipe_straight_vertical
valve.pictures.picture.south.layers[2] = symbol_direction_south_0
valve.pictures.picture.west = {}
valve.pictures.picture.west.layers = {}
valve.pictures.picture.west.layers[1] = pipe_straight_horizontal
valve.pictures.picture.west.layers[2] = symbol_direction_west_0
valve.pictures.picture.east = {}
valve.pictures.picture.east.layers = {}
valve.pictures.picture.east.layers[1] = pipe_straight_horizontal
valve.pictures.picture.east.layers[2] = symbol_direction_east_0
valve.pictures.fluid_background = {}
valve.pictures.fluid_background.filename = "__core__/graphics/empty.png"
valve.pictures.fluid_background.width = 1
valve.pictures.fluid_background.height = 1
valve.pictures.window_background = {}
valve.pictures.window_background.filename = "__core__/graphics/empty.png"
valve.pictures.window_background.width = 1
valve.pictures.window_background.height = 1
valve.pictures.flow_sprite = {}
valve.pictures.flow_sprite.filename = "__core__/graphics/empty.png"
valve.pictures.flow_sprite.width = 1
valve.pictures.flow_sprite.height = 1
valve.pictures.gas_flow = {}
valve.pictures.gas_flow.filename = "__base__/graphics/entity/pipe/steam.png"
valve.pictures.gas_flow.width = 1
valve.pictures.gas_flow.height = 1
valve.pictures.gas_flow.frame_count = 1
valve.pictures.gas_flow.axially_symmetrical = false
valve.pictures.gas_flow.direction_count = 1
valve.pictures.gas_flow.animation_speed = 0.25
valve.circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points
valve.circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites
valve.circuit_wire_max_distance = default_circuit_wire_max_distance
valve.window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}}
valve.flow_length_in_ticks = 360
data:extend({valve})

local valve = table.deepcopy(valve)
valve.name = "apm_valve_1"
valve.icons = {
    apm.power.icons.valve_1
}
valve.minable = {mining_time = 0.2, result = "apm_valve_1"}
valve.fluid_box.base_area = 1
valve.fluid_box.base_level = 0.8
valve.pictures.picture.north.layers[2] = symbol_direction_north_1
valve.pictures.picture.south.layers[2] = symbol_direction_south_1
valve.pictures.picture.west.layers[2] = symbol_direction_west_1
valve.pictures.picture.east.layers[2] = symbol_direction_east_1
data:extend({valve})

local valve = table.deepcopy(valve)
valve.name = "apm_valve_2"
valve.icons = {
    apm.power.icons.valve_1
}
valve.minable = {mining_time = 0.2, result = "apm_valve_2"}
valve.fluid_box.base_area = 1
valve.fluid_box.base_level = nil
valve.pictures.picture.north.layers[2] = symbol_direction_north_2
valve.pictures.picture.south.layers[2] = symbol_direction_south_2
valve.pictures.picture.west.layers[2] = symbol_direction_west_2
valve.pictures.picture.east.layers[2] = symbol_direction_east_2
data:extend({valve})