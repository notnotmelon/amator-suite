require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/overwrites.lua'

APM_LOG_HEADER(self)

-- ----------------------------------------------------------------------------------------------------------
-- This block should make this mod more compatible with other by setting the basic fuel categories for burners
-- apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition(entity_type, conditional_category, t_categories)
-- ----------------------------------------------------------------------------------------------------------
APM_LOG_INFO(self, '', 'BEGIN: basic overwrites of the fuel categories')
-- overwrite fuel categorys on all assembling-machine if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('assembling-machine', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all inserter if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('inserter', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all labs if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('lab', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all furnace if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('furnace', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all generators if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('generator', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all boiler if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('boiler', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all car if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('car', 'chemical', {'chemical', 'apm_refined_chemical'})
-- overwrite fuel categorys on all locomotive if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('locomotive', 'chemical', {'chemical','apm_refined_chemical', 'apm_rocket'})
-- overwrite fuel categorys on all mining-drill if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('mining-drill', 'chemical', {'chemical','apm_refined_chemical'})
-- overwrite fuel categorys on all pump if they have a burner and uses 'checmical' as fuel category
apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('pump', 'chemical', {'chemical','apm_refined_chemical'})
--
APM_LOG_INFO(self, '', 'END: basic overwrites of the fuel categories')
-- ----------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------

-- tanks
apm.lib.utils.car.set.fuel_category('tank', {'apm_refined_chemical'})

-- Boilers
apm.lib.utils.boiler.overhaul('boiler', 1)
apm.lib.utils.boiler.set.next_upgrade('boiler', 'apm_boiler_2')

-- Generators
apm.lib.utils.generator.overhaul('steam-engine', 1)
apm.lib.utils.generator.set.next_upgrade('steam-engine', 'apm_steam_engine_2')

-- Furnaces
apm.lib.utils.furnace.overhaul('stone-furnace')
apm.lib.utils.furnace.overhaul('steel-furnace', nil, true)

-- Burner inserter
apm.lib.utils.inserter.burner.overhaul('burner-inserter')
apm.lib.utils.item.overwrite.group('burner-inserter', 'apm_power', 'apm_power_inserter', 'ab_a')
apm.lib.utils.inserter.burner.overhaul('apm_burner_filter_inserter')
apm.lib.utils.inserter.burner.overhaul('apm_burner_long_inserter')

-- Assembler
apm.lib.utils.assembler.add.fluid_connections('assembling-machine-1', 1)
apm.lib.utils.assembler.mod.crafting_speed('assembling-machine-1', 0.75)
apm.lib.utils.assembler.mod.crafting_speed('assembling-machine-2', 1)

apm.lib.utils.assembler.mod.module_specification('assembling-machine-1', 2)
apm.lib.utils.assembler.mod.module_specification('assembling-machine-2', 3)

-- Miner
apm.lib.utils.mining_drill.burner.overhaul('burner-mining-drill', 1)
apm.lib.utils.icon.add_tier_lable('burner-mining-drill', 1)
apm.lib.utils.mining_drill.burner.overhaul('apm_burner_miner_drill_2', 2)

--labs
apm.lib.utils.lab.overhaul('lab')

-- science-packs
apm.lib.utils.recipe.disable('automation-science-pack')

-- miner
apm.lib.utils.item.overwrite.group('burner-mining-drill', 'apm_power', 'apm_power_machines_miner', 'aa_a')

-- bots 
apm.lib.utils.bot.logistic.overhaul('logistic-robot', 1)
apm.lib.utils.bot.construction.overhaul('construction-robot', 1)