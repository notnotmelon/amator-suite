require('util')
require('lib.log')

local self = 'apm_lib/prototypes/alternatives.lua'

APM_LOG_HEADER(self)

-- Alternative Definitions-----------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CLEANING_SOLUTION', 'stone') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CLEANING_SOLUTION', 'apm_crushed_stone', 5, 2) -- apm: crushed stone
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CLEANING_SOLUTION', 'stone-crushed', 30, 2) -- angels: crushed stone

apm.lib.utils.builder.recipe.item.alternatives.add('APM_MOLD_BASE', 'stone-brick')  -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_MOLD_BASE', 'apm_stone_brick_raw', 5) -- apm
apm.lib.utils.builder.recipe.item.alternatives.add('APM_MOLD_BASE', 'clay-brick-raw', 30) -- angels

apm.lib.utils.builder.recipe.item.alternatives.add('APM_FLUORITE', 'apm_fluorite_ore') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_FLUORITE', 'fluorite-ore', 20) -- bob

apm.lib.utils.builder.recipe.item.alternatives.add('APM_NUCLEAR_ACID', 'sulfuric-acid') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_NUCLEAR_ACID', 'nitric-acid', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_NUCLEAR_ACID', 'liquid-nitric-acid', 20) -- angels

apm.lib.utils.builder.recipe.item.alternatives.add('APM_WATER', 'water') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_WATER', 'pure-water', 10) -- bobs: pure-water
apm.lib.utils.builder.recipe.item.alternatives.add('APM_WATER', 'water-purified', 20) -- angels: pure-water

apm.lib.utils.builder.recipe.item.alternatives.add('APM_SALINE_WATER', 'water') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_SALINE_WATER', 'water-saline', 30) -- angels

apm.lib.utils.builder.recipe.item.alternatives.add('APM_CRUSHED_STONE', 'stone') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CRUSHED_STONE', 'apm_crushed_stone', 5) -- apm: crushed stone
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CRUSHED_STONE', 'stone-crushed', 30) -- angels: crushed stone

apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM_SLAG', 'stone') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM_SLAG', 'apm_crushed_stone', 5, 2) -- apm: crushed stone
apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM_SLAG', 'stone-crushed', 20, 2) -- angels: slag
apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM_SLAG', 'slag', 30, 2) -- angels: slag

apm.lib.utils.builder.recipe.item.alternatives.add('APM_SLAG', 'stone') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_SLAG', 'apm_crushed_stone', 5) -- apm: crushed stone
apm.lib.utils.builder.recipe.item.alternatives.add('APM_SLAG', 'stone-crushed', 20) -- angels: slag
apm.lib.utils.builder.recipe.item.alternatives.add('APM_SLAG', 'slag', 30) -- angels: slag

apm.lib.utils.builder.recipe.item.alternatives.add('APM_SULFUR_RESULT', 'sulfur') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_SULFUR_RESULT', 'water-yellow-waste', 20) -- angels: water-yellow-waste

apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM', 'apm_thorium_ore') -- apm: apm_thorium_ore
apm.lib.utils.builder.recipe.item.alternatives.add('APM_THORIUM', 'thorium-ore', 10) -- bobs: thorium-ore

apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T0', 'electronic-circuit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T0', 'basic-circuit-board', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T0', 'apm_mechanical_relay', 50) -- apm: wet steam relay
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T1', 'electronic-circuit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T1', 'basic-circuit-board', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T1', 'apm_steam_relay', 50) -- apm: wet steam relay
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T2', 'electronic-circuit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T2', 'basic-circuit-board', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T3', 'electronic-circuit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T3', 'electronic-circuit', 10)  -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T4', 'advanced-circuit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T4', 'advanced-circuit', 10)  -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T5', 'processing-unit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T5', 'processing-unit', 10)  -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T6', 'processing-unit') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_CIRCUIT_T6', 'advanced-processing-unit', 10)  -- bob

apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T0', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T0', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T1', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T1', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T1', 'steel-gear-wheel', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T2', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T2', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T2', 'brass-gear-wheel', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T3', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T3', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T3', 'cobalt-steel-gear-wheel', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T4', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T4', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T4', 'titanium-gear-wheel', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T5', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T5', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T5', 'tungsten-gear-wheel', 10) -- bob
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T6', 'iron-gear-wheel') -- fallback to vanilla
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T6', 'apm_gearing', 5) -- apm 
apm.lib.utils.builder.recipe.item.alternatives.add('APM_GEAR_T6', 'nitinol-gear-wheel', 10) -- bob
