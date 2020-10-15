require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/technologies.lua'

APM_LOG_HEADER(self)

-- Technologie ----------------------------------------------------------------
-- 
--
-- ----------------------------------------------------------------------------
local automation_science_pack = {}
automation_science_pack.type = 'technology'
automation_science_pack.name = 'apm_power_automation_science_pack'
automation_science_pack.icon = '__base__/graphics/technology/automation-science-pack.png'
automation_science_pack.icon_size = 128
automation_science_pack.effects = {
	{type = 'unlock-recipe', recipe = 'automation-science-pack'},
    {type = 'unlock-recipe', recipe = 'apm_electromagnet'},
}
automation_science_pack.prerequisites = {'apm_lab_1', 'apm_treated_wood_planks-1'}
automation_science_pack.unit = {}
automation_science_pack.unit.count = 100
automation_science_pack.unit.ingredients = {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}}
automation_science_pack.unit.time = 20
automation_science_pack.order = 'aa_a'
data:extend({automation_science_pack})

local apm_inserter_bonus = {}
apm_inserter_bonus.type = 'technology'
apm_inserter_bonus.name = 'apm_inserter_capacity_bonus'
apm_inserter_bonus.icon = '__base__/graphics/technology/inserter-capacity.png'
apm_inserter_bonus.icon_size = 128
apm_inserter_bonus.effects = {
    {type = 'inserter-stack-size-bonus', modifier = 1},
}
apm_inserter_bonus.prerequisites = {'apm_puddling_furnace_0'}
apm_inserter_bonus.unit = {}
apm_inserter_bonus.unit.count = 50
apm_inserter_bonus.unit.ingredients = {{"apm_industrial_science_pack", 1}}
apm_inserter_bonus.unit.time = 25
apm_inserter_bonus.order = 'aa_a'
data:extend({apm_inserter_bonus})

local apm_steam_mining_drill = {}
apm_steam_mining_drill.type = 'technology'
apm_steam_mining_drill.name = 'apm_steam_mining_drill'
apm_steam_mining_drill.icon = '__base__/graphics/technology/mining-productivity.png'
apm_steam_mining_drill.icon_size = 128
apm_steam_mining_drill.effects = {
    {type = 'unlock-recipe', recipe = 'apm_steam_mining_drill'},
}
apm_steam_mining_drill.prerequisites = {'apm_steam_science_pack'}
apm_steam_mining_drill.unit = {}
apm_steam_mining_drill.unit.count = 75
apm_steam_mining_drill.unit.ingredients = {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}}
apm_steam_mining_drill.unit.time = 20
apm_steam_mining_drill.order = 'aa_a'
data:extend({apm_steam_mining_drill})

local apm_electric_mining_drills = {}
apm_electric_mining_drills.type = 'technology'
apm_electric_mining_drills.name = 'apm_electric_mining_drills'
apm_electric_mining_drills.icon = '__base__/graphics/technology/mining-productivity.png'
apm_electric_mining_drills.icon_size = 128
apm_electric_mining_drills.effects = {
    {type = 'unlock-recipe', recipe = 'electric-mining-drill'},
}
apm_electric_mining_drills.prerequisites = {'apm_steam_mining_drill', 'apm_power_electricity', 'electronics'}
apm_electric_mining_drills.unit = {}
apm_electric_mining_drills.unit.count = 30
apm_electric_mining_drills.unit.ingredients = {{"automation-science-pack", 1}}
apm_electric_mining_drills.unit.time = 30
apm_electric_mining_drills.order = 'aa_a'
data:extend({apm_electric_mining_drills})

-- Technologie ----------------------------------------------------------------
-- electronic-circuit ??
--
-- ----------------------------------------------------------------------------

-- Crusher
apm.lib.utils.technology.new('apm_power',
    'apm_crusher_machine_0',
    {}, 
    {'apm_crusher_machine_0', 'apm_coal_crushed_1', 'apm_wood_pellets_1'},
    {{"apm_industrial_science_pack", 1}},
    5, 10)

-- Rubber I
apm.lib.utils.technology.new('apm_power',
    'apm_rubber-1',
    {'apm_crusher_machine_0'}, 
    {'apm_resin_1', 'apm_rubber_1'},
    {{"apm_industrial_science_pack", 1}},
    5, 10)

-- Rubber II
apm.lib.utils.technology.new('apm_power',
    'apm_rubber-2',
    {'apm_rubber-1', 'apm_coking_plant_0', 'apm_fuel-2'}, 
    {'apm_rubber_2'},
    {{"apm_industrial_science_pack", 1}},
    50, 25)

-- Press
apm.lib.utils.technology.new('apm_power',
    'apm_press_machine_0',
    {'apm_crusher_machine_0'}, 
    {'apm_press_machine_0', 'apm_coal_briquette_pressed_1', 'apm_wood_briquette_1', 'apm_wood_board_2'},
    {{"apm_industrial_science_pack", 1}},
    5, 10)

-- Stone bricks
apm.lib.utils.technology.new('apm_power',
    'apm_stone_bricks',
    {'apm_press_machine_0', 'apm_water_supply-1'}, 
    {'apm_crushed_stone', 'apm_stone_brick_raw_with_crushed', 'apm_stone_brick_raw_with_wed_mud', 'apm_stone_brick_raw_with_ash'},
    {{"apm_industrial_science_pack", 1}},
    15, 10)

-- Coking plant
apm.lib.utils.technology.new('apm_power',
    'apm_coking_plant_0',
    {'apm_press_machine_0', 'apm_stone_bricks'}, 
    {'apm_coking_plant_0', 'apm_pyrolysis_charcoal_1', 'apm_pyrolysis_coke_1'},
    {{"apm_industrial_science_pack", 1}},
    20, 10)

-- puddling furnace (aka early steel)
apm.lib.utils.technology.new('apm_power',
    'apm_puddling_furnace_0',
    {'apm_fuel-1', 'apm_water_supply-1', 'apm_stone_bricks'}, 
    {'apm_puddling_furnace_0', 'apm_raw_crucible_0', 'apm_raw_crucible_1', 'apm_stone_crucible', 'apm_steel_0', 'apm_burner_miner_drill_2'},
    {{"apm_industrial_science_pack", 1}},
    50, 20)

-- burner long insterter
apm.lib.utils.technology.new('apm_power',
    'apm_burner_long_inserter',
    {'apm_puddling_furnace_0'}, 
    {'apm_burner_long_inserter'},
    {{"apm_industrial_science_pack", 1}},
    50, 25)

-- Tools / Press
apm.lib.utils.technology.new('apm_power',
    'apm_tools_0',
    {'advanced-material-processing'}, 
    {'apm_press_plates', 'apm_press_plates_used_grind', 'apm_wood_briquette_3', 'apm_coal_briquette_pressed_3'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 30)

-- Tools / Crusher
apm.lib.utils.technology.new('apm_power',
    'apm_tools_1',
    {'advanced-material-processing'}, 
    {'apm_crusher_drums', 'apm_crusher_drums_used_repair', 'apm_wood_pellets_3', 'apm_coal_crushed_3', 'apm_resin_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 30)

-- Tools / Steel Saw
apm.lib.utils.technology.new('apm_power',
    'apm_tools_2',
    {'advanced-material-processing'}, 
    {'apm_saw_blade_steel', 'apm_saw_blade_steel_maintenance', 'apm_treated_wood_planks_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 30)

-- Better Steel
apm.lib.utils.technology.new('apm_power',
    'apm_steelworks-1',
    {'apm_puddling_furnace_0', 'advanced-material-processing'}, 
    {'apm_steelworks_0', 'apm_steel_1'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 30)

-- Better Steel
apm.lib.utils.technology.new('apm_power',
    'apm_steelworks-2',
    {'apm_steelworks-1', 'advanced-electronics-2', 'low-density-structure'},
    {'apm_steelworks_1'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    300, 30)

-- Fuel I
apm.lib.utils.technology.new('apm_power',
    'apm_fuel-1',
    {'apm_coking_plant_0'},
    {'apm_coke_crushed', 'apm_charcoal_brick', 'apm_coke_brick'},
    {{"apm_industrial_science_pack", 1}},
    30, 15)
apm.lib.utils.technology.mod.icon('apm_fuel-1', '__apm_resource_pack__/graphics/technologies/apm_fuel.png')

-- Fuel II
apm.lib.utils.technology.new('apm_power',
    'apm_fuel-2',
    {'apm_fuel-1', 'apm_coking_plant_0', 'apm_power_steam'},
    {'apm_pyrolysis_charcoal_2', 'apm_pyrolysis_coke_2'},
    {{"apm_industrial_science_pack", 1}},
    75, 20)
apm.lib.utils.technology.mod.icon('apm_fuel-2', '__apm_resource_pack__/graphics/technologies/apm_fuel.png')

-- Fuel III
apm.lib.utils.technology.new('apm_power',
    'apm_fuel-3',
    {'apm_fuel-2', 'apm_coking_plant_1'}, 
    {'apm_pyrolysis_charcoal_3', 'apm_pyrolysis_coke_3'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    75, 15)
apm.lib.utils.technology.mod.icon('apm_fuel-3', '__apm_resource_pack__/graphics/technologies/apm_fuel.png')

-- Fuel IV
apm.lib.utils.technology.new('apm_power',
    'apm_fuel-4',
    {'apm_fuel-3', 'apm_coking_plant_2'},
    {'apm_pyrolysis_charcoal_4', 'apm_pyrolysis_coke_4'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 30)
apm.lib.utils.technology.mod.icon('apm_fuel-4', '__apm_resource_pack__/graphics/technologies/apm_fuel.png')

-- Asphalt
apm.lib.utils.technology.new('apm_power',
    'apm_asphalt-1',
    {'apm_fuel-3'}, 
    {'apm_asphalt_1', 'apm_asphalt_2'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 20)
apm.lib.utils.technology.mod.icon('apm_asphalt-1', '__apm_resource_pack__/graphics/technologies/apm_asphalt.png')

-- Asphalt
apm.lib.utils.technology.new('apm_power',
    'apm_asphalt-2',
    {'apm_asphalt-1', 'advanced-oil-processing'},
    {'apm_asphalt_3', 'apm_asphalt_4'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    50, 30)
apm.lib.utils.technology.mod.icon('apm_asphalt-2', '__apm_resource_pack__/graphics/technologies/apm_asphalt.png')

-- Treated wood planks I
apm.lib.utils.technology.new('apm_power',
    'apm_treated_wood_planks-1',
    {'apm_fuel-3'}, 
    {'apm_treated_wood_planks_1', 'apm_saw_blade_iron', 'apm_saw_blade_iron_maintenance'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    75, 15)
apm.lib.utils.technology.mod.icon('apm_treated_wood_planks-1', '__apm_resource_pack__/graphics/technologies/apm_treated_wood_planks.png')

-- Treated wood planks II
apm.lib.utils.technology.new('apm_power',
    'apm_treated_wood_planks-2',
    {'apm_treated_wood_planks-1', 'oil-processing'},
    {'apm_treated_wood_planks_1b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    75, 15)
apm.lib.utils.technology.mod.icon('apm_treated_wood_planks-2', '__apm_resource_pack__/graphics/technologies/apm_treated_wood_planks.png')

-- Treated wood planks III
apm.lib.utils.technology.new('apm_power',
    'apm_treated_wood_planks-3',
    {'apm_treated_wood_planks-2', 'oil-processing', 'apm_tools_2'}, 
    {'apm_treated_wood_planks_2b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    100, 30)
apm.lib.utils.technology.mod.icon('apm_treated_wood_planks-3', '__apm_resource_pack__/graphics/technologies/apm_treated_wood_planks.png')

-- Water supply I
apm.lib.utils.technology.new('apm_power',
    'apm_water_supply-1',
    {'apm_rubber-1'}, 
    {'apm_offshore_pump_0', 'apm_centrifuge_0', 'apm_sealing_rings', 'apm_seawater_centrifuging', 'apm_dirty_water_purification'},
    {{"apm_industrial_science_pack", 1}},
    10, 10)

-- Fluid control (pumps and valves)
apm.lib.utils.technology.new('apm_power',
    'apm_fluid_control-1',
    {'apm_water_supply-1'}, 
    {'apm_pump_0', 'apm_valve_0', 'apm_valve_1', 'apm_valve_2'},
    {{"apm_industrial_science_pack", 1}},
    50, 15)

-- Water supply II
apm.lib.utils.technology.new('apm_power',
    'apm_water_supply-2',
    {'apm_power_electricity', 'apm_water_supply-1'}, 
    {'apm_offshore_pump_1'},
    {{"automation-science-pack", 1}},
    75, 30)

-- Steam
apm.lib.utils.technology.new('apm_power',
    'apm_power_steam',
    {'apm_fuel-1', 'apm_puddling_furnace_0', 'apm_water_supply-1', 'apm_stone_bricks'},
    {'boiler'},
    {{"apm_industrial_science_pack", 1}},
    75, 25)

-- Steam Science
apm.lib.utils.technology.new('apm_power',
    'apm_steam_science_pack',
    {'apm_power_steam'},
    {'apm_steam_science_pack', 'apm_steam_relay', 'apm_machine_frame_steam', 'apm_machine_frame_basic_maintenance', 'apm_steam_engine'},
    {{"apm_industrial_science_pack", 1}},
    75, 25)

-- steam sieve
apm.lib.utils.technology.new('apm_power',
    'apm_sieve_0',
    {'apm_coking_plant_1'},
    {'apm_sieve_0', 'apm_dry_mud', 'apm_sieve_iron', 'apm_dry_mud_sifting_iron', 'apm_sieve_copper', 'apm_dry_mud_sifting_copper'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    75, 30)

-- Greenhouse I
apm.lib.utils.technology.new('apm_power',
    'apm_greenhouse',
    {'apm_water_supply-1', 'apm_stone_bricks'}, 
    {'apm_greenhouse_0', 'apm_tree_seeds', 'apm_wood_0'},
    {{"apm_industrial_science_pack", 1}},
    20, 10)

-- Greenhouse II
apm.lib.utils.technology.new('apm_power',
    'apm_greenhouse-2',
    {'apm_greenhouse','apm_fuel-2', 'apm_steam_science_pack'},
    {'apm_greenhouse_1', 'apm_wood_1', 'apm_fertiliser_1'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 25)

-- Fertiliser 2
apm.lib.utils.technology.new('apm_power',
    'apm_fertiliser_2',
    {'apm_greenhouse-2', 'sulfur-processing'}, 
    {'apm_air_cleaning_2', 'apm_fertiliser_2', 'apm_wood_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    30, 100)

-- Steam assembler
apm.lib.utils.technology.new('apm_power',
    'apm_assembler_machine_1',
    {'apm_puddling_furnace_0', 'apm_steam_science_pack'},
    {'apm_assembling_machine_1'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    40, 25)

-- Steam centrifuge
apm.lib.utils.technology.new('apm_power',
    'apm_centrifuge_0',
    {'apm_puddling_furnace_0', 'apm_steam_science_pack'},
    {'apm_centrifuge_1', 'apm_coal_saturated_wastewater_seperation'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 25)

-- Steam air cleaner
apm.lib.utils.technology.new('apm_power',
    'apm_air_cleaner_machine',
    {'apm_centrifuge_0','apm_assembler_machine_1'}, 
    {'apm_air_cleaner_machine_0', 'apm_filter_charcoal', 'apm_filter_charcoal_used_recycling', 'apm_air_cleaning_1'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    75, 30)

-- Particle Filter 1
apm.lib.utils.technology.new('apm_power',
    'apm_particle_filter',
    {'apm_coking_plant_0'}, 
    {'apm_particle_filter_1'},
    {{"apm_industrial_science_pack", 1}},
    50, 15)

-- Particle Filter 2
apm.lib.utils.technology.new('apm_power',
    'apm_particle_filter-2',
    {'apm_particle_filter','apm_air_cleaner_machine'}, 
    {'apm_particle_filter_2'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    100, 30)

-- Particle Filter 3
apm.lib.utils.technology.new('apm_power',
    'apm_particle_filter-3',
    {'apm_particle_filter-2', 'sulfur-processing'}, 
    {'apm_particle_filter_3'},
    {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
    200, 30)

-- Steam crusher
apm.lib.utils.technology.new('apm_power',
    'apm_crusher_machine_1',
    {'apm_centrifuge_0','apm_crusher_machine_0', 'apm_puddling_furnace_0', 'apm_steam_science_pack'},
    {'apm_crusher_machine_1', 'apm_wood_pellets_2', 'apm_coal_crushed_2'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 20)

-- Steam press
apm.lib.utils.technology.new('apm_power',
    'apm_press_machine_1',
    {'apm_centrifuge_0', 'apm_press_machine_0', 'apm_puddling_furnace_0', 'apm_steam_science_pack'},
    {'apm_press_machine_1', 'apm_wood_briquette_2', 'apm_coal_briquette_pressed_2'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 20)

-- Steam lab
apm.lib.utils.technology.new('apm_power',
    'apm_lab_1',
    {'apm_centrifuge_0'}, 
    {'apm_lab_1'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    100, 30)

-- Coking plant II
apm.lib.utils.technology.new('apm_power',
    'apm_coking_plant_1',
    {'apm_coking_plant_0', 'apm_fuel-2', 'apm_assembler_machine_1'}, 
    {'apm_coking_plant_1'},
    {{"apm_industrial_science_pack", 1}, {"apm_steam_science_pack", 1}},
    50, 30)

-- Coking plant III
apm.lib.utils.technology.new('apm_power',
    'apm_coking_plant_2',
    {'apm_coking_plant_1', 'oil-processing'}, 
    {'apm_coking_plant_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    120, 30)

-- Ash...
apm.lib.utils.technology.new('apm_power',
    'apm_ash_production',
    {'apm_coking_plant_0'}, 
    {'apm_coal_ash_production', 'apm_wood_ash_production'},
    {{"apm_industrial_science_pack", 1}},
    30, 15)

-- Electricity
apm.lib.utils.technology.new('apm_power',
    'apm_power_electricity',
    {'apm_power_automation_science_pack', 'apm_fuel-3'}, 
    {'steam-engine', 'small-electric-pole', 'electronic-circuit', 'apm_machine_frame_advanced', 'apm_machine_frame_steam_maintenance', 'apm_machine_frame_advanced_maintenance'},
    {{"apm_industrial_science_pack", 1}, {"automation-science-pack", 1}, {"apm_steam_science_pack", 1}},
    100, 30)

-- Electric crusher
apm.lib.utils.technology.new('apm_power',
    'apm_crusher_machine_2',
    {'apm_crusher_machine_1', 'electric-engine'}, 
    {'apm_crusher_machine_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    75, 30)

-- Electric press
apm.lib.utils.technology.new('apm_power',
    'apm_press_machine_2',
    {'apm_press_machine_1', 'electric-engine'}, 
    {'apm_press_machine_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    75, 30)

-- Electric centrifuge
apm.lib.utils.technology.new('apm_power',
    'apm_centrifuge_2',
    {'apm_centrifuge_0', 'electric-engine'}, 
    {'apm_centrifuge_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    75, 30)

-- Greenhouse III
apm.lib.utils.technology.new('apm_power',
    'apm_greenhouse-3',
    {'apm_greenhouse-2','electric-engine'}, 
    {'apm_greenhouse_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    75, 30)

-- Equipment Burner Generator I
apm.lib.utils.technology.new('apm_power',
    'apm_equipment_burner_generator-1',
    {'modular-armor','electric-engine'},
    {'apm_equipment_burner_generator_basic'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    150, 30)

-- Equipment Burner Generator II
apm.lib.utils.technology.new('apm_power',
    'apm_equipment_burner_generator-2',
    {'apm_equipment_burner_generator-1','utility-science-pack'},
    {'apm_equipment_burner_generator_advanced'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"utility-science-pack", 1}},
    250, 30)

-- Wood liquefaction
apm.lib.utils.technology.new('apm_power',
    'apm_wood_liquefaction',
    {'advanced-oil-processing'},
    {'apm_refining_wood_1', 'apm_refining_creosote_1', 'apm_refining_coke_oven_gas_1'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    125, 30)
-- todo create own icon fot this technology
apm.lib.utils.technology.mod.icon('apm_wood_liquefaction', '__base__/graphics/technology/oil-processing.png')

-- Boiler
apm.lib.utils.technology.new('apm_power',
    'apm_power_boiler',
    {'apm_power_steam', 'advanced-material-processing'},
    {'apm_boiler_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    125, 30)
apm.lib.utils.technology.mod.icon('apm_power_boiler', '__apm_resource_pack__/graphics/technologies/apm_power_steam.png')

-- Steam Engine
apm.lib.utils.technology.new('apm_power',
    'apm_steam_engine',
    {'apm_power_electricity', 'apm_power_boiler'},
    {'apm_steam_engine_2'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    250, 30)