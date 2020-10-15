require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/fuel.lua'

APM_LOG_HEADER(self)

-- Ovewrwrite coal fuel value -------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.fuel.overwrite_coal_fuel_value()

-- --------------------------------------------------------------------------------------------------------------------
-- apm.lib.utils.fuel.overhaul(level, item_name, multiplicator, burnt_result, fuel_category)
-- --------------------------------------------------------------------------------------------------------------------
apm.lib.utils.fuel.overhaul(2, 'coal', 1.0, 'apm_generic_ash')
apm.lib.utils.fuel.overhaul(1, 'wood', 0.5, 'apm_generic_ash')
apm.lib.utils.fuel.overhaul(1, 'apm_tree_seeds', 0.35, 'apm_generic_ash')
apm.lib.utils.fuel.overhaul(1, 'apm_treated_wood_planks', 0.28, 'apm_generic_ash')

apm.lib.utils.fuel.overhaul(2, 'apm_coal_crushed', 0.75, 'apm_generic_ash') 
apm.lib.utils.fuel.overhaul(1, 'apm_wood_pellets', 0.42, 'apm_generic_ash')

apm.lib.utils.fuel.overhaul(2, 'apm_coal_briquette', 3.5, 'apm_generic_ash')
apm.lib.utils.fuel.overhaul(1, 'apm_wood_briquette', 1.75, 'apm_generic_ash')

apm.lib.utils.fuel.overhaul(3, 'apm_coke', 3.7, nil, 'apm_refined_chemical')							
apm.lib.utils.fuel.overhaul(2, 'apm_charcoal', 1.95, nil, 'apm_refined_chemical')

apm.lib.utils.fuel.overhaul(3, 'apm_coke_crushed', 2.46, nil, 'apm_refined_chemical')

apm.lib.utils.fuel.overhaul(3, 'apm_coke_brick', 14.8, nil, 'apm_refined_chemical')					
apm.lib.utils.fuel.overhaul(2, 'apm_charcoal_brick', 7.8, nil, 'apm_refined_chemical')

apm.lib.utils.fuel.overhaul(4, 'solid-fuel', 5, nil, 'apm_refined_chemical')
apm.lib.utils.fuel.overhaul(6, 'rocket-fuel', 40, nil, 'apm_rocket')
apm.lib.utils.fuel.overhaul(10, 'nuclear-fuel', 200, nil, 'apm_rocket')