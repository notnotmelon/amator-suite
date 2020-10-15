require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/technologies.lua'

APM_LOG_HEADER(self)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_depleted_uranium',
    {'uranium-processing'}, 
    {'apm_depleted_uranium_metal_mixture', 'apm_depleted_uranium_ingots'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    250, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_science_pack',
    {'uranium-processing', 'apm_depleted_uranium'}, 
    {'apm_nuclear_science_pack', 'apm_hexafluoride_sample'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
    300, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_fuel',
    {'apm_nuclear_science_pack','rocket-fuel', 'nuclear-fuel-reprocessing'}, 
    {'nuclear-fuel'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    150, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_neptunium_fuel',
    {'apm_nuclear_science_pack', 'nuclear-fuel-reprocessing'}, 
    {'apm_fuel_rod_neptunium', 'apm_fuel_rod_neptunium_cooling', 'apm_fuel_cell_neptunium_recovery_stage_a', 'apm_fuel_cell_neptunium_recovery_stage_b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    200, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_rtg',
    {'apm_nuclear_science_pack', 'production-science-pack', 'utility-science-pack', 'nuclear-fuel-reprocessing'}, 
    {'apm_rtg_radioisotope_thermoelectric_generator'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"utility-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    300, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_breeder',
    {'apm_nuclear_science_pack', 'production-science-pack', 'apm_depleted_uranium', 'nuclear-fuel-reprocessing'}, 
    {'apm_nuclear_breeder','apm_breeder_container', 'apm_breeder_container_worn_maintenance'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    250, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_breeder_uranium',
    {'apm_nuclear_breeder'}, 
    {'apm_breeder_uranium', 'apm_breeder_uranium_loaded', 'apm_breeder_uranium_cooling',
    'apm_breeder_uranium_unloading', 'apm_breeder_uranium_seperation_process_a', 'apm_breeder_uranium_seperation_process_b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    750, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_thorium_processing',
    {'uranium-processing', 'apm_nuclear_science_pack'}, 
    {'apm_oxide_pellet_th232'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    200, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_thorium_fuel',
    {'apm_nuclear_thorium_processing', 'nuclear-fuel-reprocessing'},
    {'apm_fuel_rod_thorium', 'apm_fuel_cell_thorium_cooling', 'apm_fuel_cell_thorium_recovery_stage_a','apm_fuel_cell_thorium_recovery_stage_b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    500, 30)

apm.lib.utils.technology.new('apm_nuclear',
    'apm_nuclear_breeder_thorium',
    {'apm_nuclear_breeder', 'apm_nuclear_thorium_processing'}, 
    {'apm_breeder_thorium', 'apm_breeder_thorium_loaded', 'apm_breeder_thorium_cooling',
    'apm_breeder_thorium_unloading', 'apm_breeder_thorium_seperation_process_a', 'apm_breeder_thorium_seperation_process_b'},
    {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {'apm_nuclear_science_pack', 1}},
    750, 30)
