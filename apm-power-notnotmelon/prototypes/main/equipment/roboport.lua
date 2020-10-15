require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/roboport.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_equipment_roboport_small'
item.flags = {'hidden', 'hide-from-bonus-gui'}
item.icons = {
    apm.power.icons.equipment_roboport_small
}
item.stack_size = 20
item.group = "apm_other"
item.subgroup = "apm_starter_armor"
item.order = "aa_d"
item.placed_as_equipment_result = "apm_equipment_roboport_small"
data:extend({item})

-- Equipment ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local equipment = {}
equipment.type = "roboport-equipment"
equipment.name = "apm_equipment_roboport_small"
equipment.flags = {'hidden', 'hide-from-bonus-gui'}
equipment.sprite = {}
equipment.sprite.filename = "__base__/graphics/equipment/personal-roboport-equipment.png"
equipment.sprite.width = 64
equipment.sprite.height = 64
equipment.sprite.priority = "medium"
equipment.shape = {}
equipment.shape.width = 2
equipment.shape.height = 2
equipment.shape.type = "full"
equipment.energy_source = {}
equipment.energy_sourcetype = "electric"
equipment.energy_source.buffer_capacity = "12.5MJ"
equipment.energy_source.input_flow_limit = "150KW"
equipment.energy_source.drain = "10KW"
equipment.energy_source.usage_priority = "secondary-input"
equipment.charging_energy = "750kW"
equipment.robot_limit = 5
equipment.construction_radius = 15
equipment.spawn_and_station_height = 0.4
equipment.spawn_and_station_shadow_height_offset = 0.5
equipment.charge_approach_distance = 2.6
equipment.robots_shrink_when_entering_and_exiting = true
equipment.recharging_animation = {}
equipment.recharging_animation.filename = "__base__/graphics/entity/roboport/roboport-recharging.png"
equipment.recharging_animation.priority = "high"
equipment.recharging_animation.width = 37
equipment.recharging_animation.height = 35
equipment.recharging_animation.frame_count = 16
equipment.recharging_animation.scale = 1.5
equipment.recharging_animation.animation_speed = 0.5
equipment.recharging_light = {intensity = 0.4, size = 5}
equipment.stationing_offset = {0, -0.6}
equipment.charging_station_shift = {0, 0.5}
equipment.charging_station_count = 5
equipment.charging_distance = 1.6
equipment.charging_threshold_distance = 5
equipment.categories = {"apm_starter_equipment"}
data:extend({equipment})