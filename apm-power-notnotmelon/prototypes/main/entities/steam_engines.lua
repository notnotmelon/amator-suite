require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/entities/steam_engines.lua'

APM_LOG_HEADER(self)

-- Smoke ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local steam_engine = table.deepcopy(data.raw.generator['steam-engine'])
steam_engine.name = 'apm_steam_engine_2'
steam_engine.icons = {
    apm.power.icons.steam_engine,
    apm.lib.icons.dynamics.t2
}
--steam_engine.icon_size = apm.power.icons.steam_engine.icon_size
steam_engine.minable = {mining_time = 0.2, result = "apm_steam_engine_2"}
steam_engine.fast_replaceable_group = 'steam-engine'
steam_engine.max_health = 500
steam_engine.maximum_temperature = 240
steam_engine.fluid_usage_per_tick = 0.45
steam_engine.horizontal_animation.layers[3] = table.deepcopy(steam_engine.horizontal_animation.layers[1])
steam_engine.horizontal_animation.layers[3].filename = '__apm_resource_pack__/graphics/masks/steam_engine/steam-engine-H.png'
steam_engine.horizontal_animation.layers[3].tint = apm.power.color.steam_engine_tier_2
steam_engine.horizontal_animation.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/steam_engine/hr-steam-engine-H.png'
steam_engine.horizontal_animation.layers[3].hr_version.tint = apm.power.color.steam_engine_tier_2
steam_engine.vertical_animation.layers[3] = table.deepcopy(steam_engine.vertical_animation.layers[1])
steam_engine.vertical_animation.layers[3].filename = '__apm_resource_pack__/graphics/masks/steam_engine/steam-engine-V.png'
steam_engine.vertical_animation.layers[3].tint = apm.power.color.steam_engine_tier_2
steam_engine.vertical_animation.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/steam_engine/hr-steam-engine-V.png'
steam_engine.vertical_animation.layers[3].hr_version.tint = apm.power.color.steam_engine_tier_2
data:extend({steam_engine})