require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/mining_drills.lua'

APM_LOG_HEADER(self)

local burner_miner = table.deepcopy(data.raw['mining-drill']['burner-mining-drill'])
burner_miner.name = 'apm_burner_miner_drill_2'
burner_miner.module_specification = apm.power.constants.modules.specification_0
burner_miner.allowed_effects = apm.power.constants.modules.allowed_effects_0
burner_miner.icon = nil
burner_miner.icons = {
    apm.power.icons.burner_mining_drill,
    apm.lib.icons.dynamics.t2
}
--burner_miner.icon_size = apm.power.icons.burner_mining_drill.icon_size
burner_miner.minable = {mining_time = 0.3, result = "apm_burner_miner_drill_2"}
burner_miner.animations.north.layers[3] = table.deepcopy(burner_miner.animations.north.layers[1])
burner_miner.animations.north.layers[3].filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/burner-mining-drill-N.png'
burner_miner.animations.north.layers[3].tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.north.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/hr-burner-mining-drill-N.png'
burner_miner.animations.north.layers[3].hr_version.tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.east.layers[3] = table.deepcopy(burner_miner.animations.east.layers[1])
burner_miner.animations.east.layers[3].filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/burner-mining-drill-E.png'
burner_miner.animations.east.layers[3].tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.east.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/hr-burner-mining-drill-E.png'
burner_miner.animations.east.layers[3].hr_version.tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.south.layers[3] = table.deepcopy(burner_miner.animations.south.layers[1])
burner_miner.animations.south.layers[3].filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/burner-mining-drill-S.png'
burner_miner.animations.south.layers[3].tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.south.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/hr-burner-mining-drill-S.png'
burner_miner.animations.south.layers[3].hr_version.tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.west.layers[3] = table.deepcopy(burner_miner.animations.west.layers[1])
burner_miner.animations.west.layers[3].filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/burner-mining-drill-W.png'
burner_miner.animations.west.layers[3].tint = apm.power.color.burner_mining_drill_tier_2
burner_miner.animations.west.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/burner_mining_drill/hr-burner-mining-drill-W.png'
burner_miner.animations.west.layers[3].hr_version.tint = apm.power.color.burner_mining_drill_tier_2
data:extend({burner_miner})

local steam_mining_drill = table.deepcopy(data.raw['mining-drill']['electric-mining-drill'])
steam_mining_drill.name = "apm_steam_mining_drill"
steam_mining_drill.icon = nil
steam_mining_drill.icons = {apm.power.icons.electric_mining_drill}
steam_mining_drill.minable = {mining_time = 0.3, result = "apm_steam_mining_drill"}
steam_mining_drill.resource_categories = {"basic-solid"}
steam_mining_drill.mining_speed = 0.55
steam_mining_drill.input_fluid_box = nil
steam_mining_drill.energy_source = {}
steam_mining_drill.energy_source.type = "fluid"
steam_mining_drill.energy_source.fluid_box = {}
steam_mining_drill.energy_source.fluid_box.production_type = "input-output"
steam_mining_drill.energy_source.fluid_box.pipe_covers = pipecoverspictures()
steam_mining_drill.energy_source.fluid_box.base_area = 1
steam_mining_drill.energy_source.fluid_box.pipe_connections = {
  { type="input-output", position = {2, 0}},
  { type="input-output", position = {0, 2}},
  { type="input-output", position = {-2, 0}}
}
steam_mining_drill.energy_source.fluid_box.filter = "steam"
steam_mining_drill.energy_source.minimum_temperature = 100.0
steam_mining_drill.energy_source.maximum_temperature = 1000.0
steam_mining_drill.energy_source.burns_fluid = false
steam_mining_drill.energy_source.scale_fluid_usage = true
steam_mining_drill.energy_source.emissions_per_minute = apm.power.constants.emissions.steam_miner
steam_mining_drill.energy_source.smoke = {}
steam_mining_drill.energy_source.smoke[1] = {}
steam_mining_drill.energy_source.smoke[1].name = "light-smoke"
steam_mining_drill.energy_source.smoke[1].deviation = {0.1, 0.1}
steam_mining_drill.energy_source.smoke[1].frequency = 8
steam_mining_drill.energy_source.smoke[1].position = nil
steam_mining_drill.energy_source.smoke[1].north_position = {0, 1}
steam_mining_drill.energy_source.smoke[1].south_position = {0, -1}
steam_mining_drill.energy_source.smoke[1].east_position = {-1, 0}
steam_mining_drill.energy_source.smoke[1].west_position = {1, 0}
steam_mining_drill.energy_source.smoke[1].starting_vertical_speed = 0.08
steam_mining_drill.energy_source.smoke[1].starting_frame_deviation = 60
steam_mining_drill.energy_source.smoke[1].slow_down_factor = 1
steam_mining_drill.energy_usage = apm.power.constants.energy_usage.steam_miner
steam_mining_drill.resource_searching_radius = 2.49
steam_mining_drill.vector_to_place_result = {0, -1.85}
steam_mining_drill.module_specification = apm.power.constants.modules.specification_1
steam_mining_drill.allowed_effects = apm.power.constants.modules.allowed_effects_1
steam_mining_drill.monitor_visualization_tint = {r=78, g=173, b=255}
steam_mining_drill.fast_replaceable_group = "mining-drill"
data:extend({steam_mining_drill})