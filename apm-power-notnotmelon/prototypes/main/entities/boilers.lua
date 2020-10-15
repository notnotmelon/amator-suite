require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/entities/boilers.lua'

APM_LOG_HEADER(self)

-- Smoke ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local boiler = table.deepcopy(data.raw.boiler['boiler'])
boiler.name = 'apm_boiler_2'
boiler.icons = {
    apm.power.icons.boiler,
    apm.lib.icons.dynamics.t2
}
--boiler.icon_size = apm.power.icons.boiler.icon_size
boiler.minable = {mining_time = 0.2, result = "apm_boiler_2"}
boiler.fast_replaceable_group = 'boiler'
boiler.max_health = 250
boiler.energy_consumption = '3.6MW'
boiler.target_temperature = 240
boiler.energy_source.fuel_inventory_size = 1
boiler.energy_source.burnt_inventory_size = 1
boiler.energy_source.fuel_category = nil
boiler.energy_source.fuel_categories = {'apm_refined_chemical'}
boiler.energy_source.emissions_per_minute = 20
boiler.structure.north.layers[3] = table.deepcopy(boiler.structure.north.layers[1])
boiler.structure.north.layers[3].filename = '__apm_resource_pack__/graphics/masks/boiler/boiler-N-idle.png'
boiler.structure.north.layers[3].tint = apm.power.color.boiler_tier_2
boiler.structure.north.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/boiler/hr-boiler-N-idle.png'
boiler.structure.north.layers[3].hr_version.tint = apm.power.color.boiler_tier_2
boiler.structure.east.layers[3] = table.deepcopy(boiler.structure.east.layers[1])
boiler.structure.east.layers[3].filename = '__apm_resource_pack__/graphics/masks/boiler/boiler-E-idle.png'
boiler.structure.east.layers[3].tint = apm.power.color.boiler_tier_2
boiler.structure.east.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/boiler/hr-boiler-E-idle.png'
boiler.structure.east.layers[3].hr_version.tint = apm.power.color.boiler_tier_2
boiler.structure.south.layers[3] = table.deepcopy(boiler.structure.south.layers[1])
boiler.structure.south.layers[3].filename = '__apm_resource_pack__/graphics/masks/boiler/boiler-S-idle.png'
boiler.structure.south.layers[3].tint = apm.power.color.boiler_tier_2
boiler.structure.south.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/boiler/hr-boiler-S-idle.png'
boiler.structure.south.layers[3].hr_version.tint = apm.power.color.boiler_tier_2
boiler.structure.west.layers[3] = table.deepcopy(boiler.structure.west.layers[1])
boiler.structure.west.layers[3].filename = '__apm_resource_pack__/graphics/masks/boiler/boiler-W-idle.png'
boiler.structure.west.layers[3].tint = apm.power.color.boiler_tier_2
boiler.structure.west.layers[3].hr_version.filename = '__apm_resource_pack__/graphics/masks/boiler/hr-boiler-W-idle.png'
boiler.structure.west.layers[3].hr_version.tint = apm.power.color.boiler_tier_2

data:extend({boiler})