require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/transport_belts.lua'

APM_LOG_HEADER(self)

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local transport_belt = table.deepcopy(data.raw['transport-belt']['transport-belt'])
transport_belt.name = "apm_basic_transport_belt"
transport_belt.icon = "__base__/graphics/icons/transport-belt.png"
transport_belt.icon_size = 32
transport_belt.minable = {mining_time = 0.1, result = "apm_basic_transport_belt"}
transport_belt.max_health = 100
transport_belt.belt_animation_set = {}
transport_belt.belt_animation_set.animation_set = {}
transport_belt.belt_animation_set.animation_set.filename = "__apm_resource_pack__/graphics/entities/basic_transport_belt/basic_transport_belt.png"
transport_belt.belt_animation_set.animation_set.priority = "extra-high"
transport_belt.belt_animation_set.animation_set.width = 64
transport_belt.belt_animation_set.animation_set.height = 64
transport_belt.belt_animation_set.animation_set.frame_count = 16
transport_belt.belt_animation_set.animation_set.direction_count = 20
transport_belt.belt_animation_set.animation_set.hr_version = {}
transport_belt.belt_animation_set.animation_set.hr_version.filename = "__apm_resource_pack__/graphics/entities/basic_transport_belt/hr_basic_transport_belt.png"
transport_belt.belt_animation_set.animation_set.hr_version.priority = "extra-high"
transport_belt.belt_animation_set.animation_set.hr_version.width = 128
transport_belt.belt_animation_set.animation_set.hr_version.height = 128
transport_belt.belt_animation_set.animation_set.hr_version.scale = 0.5
transport_belt.belt_animation_set.animation_set.hr_version.frame_count = 16
transport_belt.belt_animation_set.animation_set.hr_version.direction_count = 20
transport_belt.fast_replaceable_group = "transport-belt"
transport_belt.next_upgrade = "transport-belt"
transport_belt.speed = 0.03125/2
data:extend({transport_belt})