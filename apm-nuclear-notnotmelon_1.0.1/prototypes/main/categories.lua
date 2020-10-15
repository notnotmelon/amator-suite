require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/categories.lua'

APM_LOG_HEADER(self)

-- Action ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.category.create.group('apm_nuclear', '__apm_resource_pack__/graphics/categories/apm_nuclear.png', '70')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_ore', 'aa_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_chemistry', 'aa_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_hexafluoride', 'ab_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_oxide_pellets', 'ac_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_fuel', 'ad_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_used_fuel', 'ae_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_used_fuel_cold', 'ae_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_recycling_stage_a', 'af_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_recycling_stage_b', 'af_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_breeding_uranium', 'ag_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_breeding_thorium', 'ah_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_oxide_pellets_plutonium', 'ai_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_products', 'aj_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_waste_products', 'ak_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_machines_1', 'al_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_cooling_tower', 'al_b')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_machines_2', 'al_c')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_science', 'am_a')
    apm.lib.utils.category.create.subgroup('apm_nuclear', 'apm_nuclear_other', 'an_a')
