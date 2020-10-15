require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/categories.lua'

APM_LOG_HEADER(self)

-- Category -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.category.create.group('apm_power', '__apm_resource_pack__/graphics/categories/apm_power.png', '05')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_fluid', 'aa_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_tools', 'ab_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_sifting', 'ac_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_greenhouse', 'ad_a')
	apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_wood', 'ae_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_charcoal', 'ae_b')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_coal', 'af_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_coke', 'ag_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_starfall', 'ah_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_ash', 'ai_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_electric', 'aj_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_smelting', 'ak_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_intermediates', 'al_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_inserter', 'am_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_modules', 'an_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_0', 'ao_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_1', 'ao_b')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_2', 'ao_c')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_3', 'ao_e')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_4', 'ao_f')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_5', 'ao_g')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_machines_miner', 'ap_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_mobile', 'aq_a')
    apm.lib.utils.category.create.subgroup('apm_power', 'apm_power_science', 'ar_a')

-- Subgroups ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.category.create.subgroup('apm_other', 'apm_starter_armor', 'aa_a')