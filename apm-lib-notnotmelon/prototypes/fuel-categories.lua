require('util')
require('lib.log')

local self = 'apm_lib/prototypes/fuel-categories.lua'

APM_LOG_HEADER(self)

-- apm_power
apm.lib.utils.fuel.category.create('apm_refined_chemical')
apm.lib.utils.fuel.category.create('apm_petrol')
apm.lib.utils.fuel.category.create('apm_vehicle_only')
apm.lib.utils.fuel.category.create('apm_rocket')

-- apm_nuclear
apm.lib.utils.fuel.category.create('apm_nuclear_uranium')
apm.lib.utils.fuel.category.create('apm_nuclear_mox')
apm.lib.utils.fuel.category.create('apm_nuclear_neptunium')
apm.lib.utils.fuel.category.create('apm_nuclear_thorium')
apm.lib.utils.fuel.category.create('apm_nuclear_deuterium')
apm.lib.utils.fuel.category.create('apm_nuclear_breeder')
apm.lib.utils.fuel.category.create('apm_nuclear_shielded_cell')
apm.lib.utils.fuel.category.create('apm_nuclear_fusion_cell')

-- apm_starfall
apm.lib.utils.fuel.category.create('apm_starfall_alien')

-- apm_energy_addon
apm.lib.utils.fuel.category.create('apm_electrical')

