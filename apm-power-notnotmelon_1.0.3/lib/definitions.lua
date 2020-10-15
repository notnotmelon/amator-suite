require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/lib/definitions.lua'

APM_LOG_HEADER(self)

if apm.power.color == nil then apm.power.color = {} end
if apm.power.constants == nil then apm.power.constants = {} end
if apm.power.icons == nil then apm.power.icons = {} end
if apm.power.icons.path == nil then apm.power.icons.path = {} end

-- Colors ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.power.color.sciencepack = {r=0.60, g=0.38, b=20}
apm.power.color.coal = {r=0.25, g=0.25, b=0.25}
apm.power.color.wood = {r=0.80, g=0.55, b=0.33}
--apm.power.color.charcoal = {r=0.19, g=0.15, b=0.12}
apm.power.color.charcoal = {r=0.31, g=0.27, b=0.24}
apm.power.color.coke = {r=0.15, g=0.15, b=0.15}
apm.power.color.generic_ash = {r=0.35, g=0.35, b=0.35}
apm.power.color.ammonium_sulfate = {r=0.95, g=0.95, b=0.95}
apm.power.color.asphalt  = {r=0.20, g=0.20, b=0.20}
apm.power.color.mud_wet = {r=0.193, g=0.123, b=0.064}
apm.power.color.mud_dry = {r=0.437, g=0.300, b=0.185}
apm.power.color.tar  = {r=0.187, g=0.135, b=0.104}
apm.power.color.coke_oven_gas = {r=0.244, g=0.141, b=0.141}
apm.power.color.sive_iron = {r=0.669,g=0.744,b=0.819}
apm.power.color.sieve_copper = {r=0.864,g=0.526,b=0.454}
apm.power.color.crushed_stone = {r=0.703,g=0.617,b=0.454}

apm.power.color.boiler_tier_2 = {r=0.600, g=0.000, b=0.000}
apm.power.color.burner_mining_drill_tier_2 = {r=0.600, g=0.000, b=0.000}
apm.power.color.steam_engine_tier_2 = {r=0.600, g=0.000, b=0.000}

apm.power.color.starter_set = {r=0.689, g=0.571, b=0.377}

-- Constants ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.power.constants.emissions = {}
apm.power.constants.emissions.t0 = 5
apm.power.constants.emissions.t1 = 3
apm.power.constants.emissions.t2 = 4
apm.power.constants.emissions.t3 = 2.5
apm.power.constants.emissions.gh_0 = 2.5
apm.power.constants.emissions.gh_1 = -5
apm.power.constants.emissions.gh_2 = -5
apm.power.constants.emissions.lab_0 = 10
apm.power.constants.emissions.lab_1 = 5
apm.power.constants.emissions.cp_0 = 8
apm.power.constants.emissions.cp_1 = 6
apm.power.constants.emissions.cp_2 = 4
apm.power.constants.emissions.cp_3 = 3
apm.power.constants.emissions.air_cleaner_0 = -50
apm.power.constants.emissions.offpump_0 = 3
apm.power.constants.emissions.offpump_1 = 2
apm.power.constants.emissions.steam_miner = 4.5
apm.power.constants.emissions.equipment_burner_generator_basic = 3.5
apm.power.constants.emissions.equipment_burner_generator_advanced = 2.5

apm.power.constants.energy_usage = {}
apm.power.constants.energy_usage.burner = '150kW'
apm.power.constants.energy_usage.steam =  '200kW'
apm.power.constants.energy_usage.steam_miner =  '200kW'
apm.power.constants.energy_usage.electric = '300kW'
apm.power.constants.energy_usage.lab_0 = '200kW'
apm.power.constants.energy_usage.lab_2 = '300kW'
apm.power.constants.energy_usage.greenhouse_0 = '75kW'
apm.power.constants.energy_usage.greenhouse_1 = '120kW'
apm.power.constants.energy_usage.greenhouse_2 = '165kW'
apm.power.constants.energy_usage.coking_plant_0 = '250kW'
apm.power.constants.energy_usage.coking_plant_1 = '350kW'
apm.power.constants.energy_usage.coking_plant_2 = '450kW'
apm.power.constants.energy_usage.air_cleaner_0 = '300kW'
apm.power.constants.energy_usage.puddling_furnace_0 = '490kW'
apm.power.constants.energy_usage.steelworks_0 = '910kW'
apm.power.constants.energy_usage.steelworks_1 = '1092kW'

apm.power.constants.engery_drain = {}
apm.power.constants.engery_drain.electric = '30kW'
apm.power.constants.engery_drain.steelworks_0 = '300kW'
apm.power.constants.engery_drain.steelworks_1 = '350kW'

apm.power.constants.modules = {}
apm.power.constants.modules.specification_0 = {module_slots = 1}
apm.power.constants.modules.allowed_effects_0 = {"pollution"}
apm.power.constants.modules.specification_1 = {module_slots = 2}
apm.power.constants.modules.allowed_effects_1 = {"consumption", "speed", "productivity", "pollution"}
apm.power.constants.modules.specification_2 = {module_slots = 3}
apm.power.constants.modules.allowed_effects_2 = {"consumption", "speed", "productivity", "pollution"}
apm.power.constants.modules.specification_3 = {module_slots = 4}
apm.power.constants.modules.allowed_effects_3 = {"consumption", "speed", "productivity", "pollution"}

apm.power.constants.modules.greenhouse = {}
apm.power.constants.modules.greenhouse.specification_0 = {module_slots = 1}
apm.power.constants.modules.greenhouse.allowed_effects_0 = {"pollution"}
apm.power.constants.modules.greenhouse.specification_1 = {module_slots = 2}
apm.power.constants.modules.greenhouse.allowed_effects_1 = {"consumption", "speed"}
apm.power.constants.modules.greenhouse.specification_2 = {module_slots = 3}
apm.power.constants.modules.greenhouse.allowed_effects_2 = {"consumption", "speed", "productivity"}

apm.power.constants.modules.air_cleaner = {}
apm.power.constants.modules.air_cleaner.specification_0 = {module_slots = 3}
apm.power.constants.modules.air_cleaner.allowed_effects_0 = {"consumption", "productivity"}

-- Icon path ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- base game
apm.power.icons.path.coal = '__base__/graphics/icons/icons-new/coal.png'
apm.power.icons.path.wood = '__base__/graphics/icons/wood.png'
apm.power.icons.path.offshore_pump = '__base__/graphics/icons/offshore-pump.png'
apm.power.icons.path.burner_mining_drill = '__base__/graphics/icons/burner-mining-drill.png'
apm.power.icons.path.electric_mining_drill = '__base__/graphics/icons/electric-mining-drill.png'
apm.power.icons.path.starter_armor = '__base__/graphics/icons/light-armor.png'
apm.power.icons.path.equipment_roboport_small = '__base__/graphics/icons/personal-roboport-equipment.png'
apm.power.icons.path.zx80_construction_robot = '__base__/graphics/icons/construction-robot.png'
apm.power.icons.path.boiler = '__base__/graphics/icons/boiler.png'
apm.power.icons.path.steam_engine = '__base__/graphics/icons/steam-engine.png'

apm.power.icons.path.resin = '__apm_resource_pack__/graphics/icons/apm_resin.png'
apm.power.icons.path.rubber = '__apm_resource_pack__/graphics/icons/apm_rubber.png'
apm.power.icons.path.gearing = '__apm_resource_pack__/graphics/icons/apm_gearing.png'
apm.power.icons.path.wood_board = '__apm_resource_pack__/graphics/icons/apm_wood_board.png'
apm.power.icons.path.mechanical_relay = '__apm_resource_pack__/graphics/icons/apm_mechanical_relay.png'
apm.power.icons.path.steam_relay = '__apm_resource_pack__/graphics/icons/apm_steam_relay.png'
apm.power.icons.path.sealing_rings = '__apm_resource_pack__/graphics/icons/apm_sealing_rings.png'
apm.power.icons.path.treated_wood_planks = '__apm_resource_pack__/graphics/icons/apm_treated_wood_planks.png'
apm.power.icons.path.electromagnet = '__apm_resource_pack__/graphics/icons/apm_electromagnet.png'
apm.power.icons.path.sciencepack_1 ="__apm_resource_pack__/graphics/icons/apm_industrial_science_pack.png"
apm.power.icons.path.sciencepack_2 ="__apm_resource_pack__/graphics/icons/apm_steam_science_pack.png"
apm.power.icons.path.filter_charcoal = '__apm_resource_pack__/graphics/icons/apm_filter_charcoal.png'
apm.power.icons.path.filter_charcoal_used = '__apm_resource_pack__/graphics/icons/apm_filter_charcoal_used.png'
apm.power.icons.path.crucible_raw = '__apm_resource_pack__/graphics/icons/apm_stone_crucibel_raw.png'
apm.power.icons.path.crucible = '__apm_resource_pack__/graphics/icons/apm_stone_crucibel.png'
apm.power.icons.path.tree_seeds = '__apm_resource_pack__/graphics/icons/apm_tree_seeds.png'
apm.power.icons.path.fertiliser_1 = '__apm_resource_pack__/graphics/icons/apm_fertiliser_1.png'
apm.power.icons.path.fertiliser_2 = '__apm_resource_pack__/graphics/icons/apm_fertiliser_2.png'
apm.power.icons.path.sieve = '__apm_resource_pack__/graphics/icons/dynamics/sieve.png'
apm.power.icons.path.sieve_handel = '__apm_resource_pack__/graphics/icons/dynamics/sieve_handel.png'
apm.power.icons.path.crusher_drums = '__apm_resource_pack__/graphics/icons/apm_crusher_drumms.png'
apm.power.icons.path.crusher_drums_used = '__apm_resource_pack__/graphics/icons/apm_crusher_drumms_used.png'
apm.power.icons.path.press_plates = '__apm_resource_pack__/graphics/icons/apm_press_plates.png'
apm.power.icons.path.press_plates_used = '__apm_resource_pack__/graphics/icons/apm_press_plates_used.png'
apm.power.icons.path.saw_blade_iron = '__apm_resource_pack__/graphics/icons/apm_saw_blade_iron.png'
apm.power.icons.path.saw_blade_iron_used = '__apm_resource_pack__/graphics/icons/apm_saw_blade_iron_used.png'
apm.power.icons.path.saw_blade_steel = '__apm_resource_pack__/graphics/icons/apm_saw_blade_steel.png'
apm.power.icons.path.saw_blade_steel_used = '__apm_resource_pack__/graphics/icons/apm_saw_blade_steel_used.png'
apm.power.icons.path.particle_filter_module = '__apm_resource_pack__/graphics/icons/apm_particle_filter_'
apm.power.icons.path.burner_filter_inserter = '__apm_resource_pack__/graphics/icons/apm_burner_filter_inserter.png'
apm.power.icons.path.burner_long_inserter = '__apm_resource_pack__/graphics/icons/apm_burner_long_inserter.png'
apm.power.icons.path.crushed_stone = "__apm_resource_pack__/graphics/icons/mip/apm_crushed_stone.png"
apm.power.icons.path.crushed_stone_1 = "__apm_resource_pack__/graphics/icons/mip/apm_crushed_stone_1.png"
apm.power.icons.path.crushed_stone_2 = "__apm_resource_pack__/graphics/icons/mip/apm_crushed_stone_2.png"
apm.power.icons.path.crushed_stone_3 = "__apm_resource_pack__/graphics/icons/mip/apm_crushed_stone_3.png"
apm.power.icons.path.stone_brick_raw = "__apm_resource_pack__/graphics/icons/apm_stone_brick_raw.png"
apm.power.icons.path.asphalt = "__apm_resource_pack__/graphics/icons/mip/apm_asphalt.png"
apm.power.icons.path.asphalt_1 = "__apm_resource_pack__/graphics/icons/mip/apm_asphalt_1.png"
apm.power.icons.path.valve_0 = '__apm_resource_pack__/graphics/icons/apm_valve_0.png'
apm.power.icons.path.valve_1 = '__apm_resource_pack__/graphics/icons/apm_valve_1.png'
apm.power.icons.path.valve_2 = '__apm_resource_pack__/graphics/icons/apm_valve_2.png'
apm.power.icons.path.coke_oven_gas_symbol = '__apm_resource_pack__/graphics/icons/apm_coke_oven_gas.png'
apm.power.icons.path.pistions = '__apm_resource_pack__/graphics/icons/apm_pistions.png'
apm.power.icons.path.simple_engine = '__apm_resource_pack__/graphics/icons/apm_simple_engine.png'
apm.power.icons.path.steam_engine_unit = '__apm_resource_pack__/graphics/icons/apm_steam_engine.png'
apm.power.icons.path.machine_frame_basic = '__apm_resource_pack__/graphics/icons/apm_machine_frame_basic.png'
apm.power.icons.path.machine_frame_steam = '__apm_resource_pack__/graphics/icons/apm_machine_frame_steam.png'
apm.power.icons.path.machine_frame_advanced = '__apm_resource_pack__/graphics/icons/apm_machine_frame_advanced.png'
apm.power.icons.path.machine_frame_basic_used = '__apm_resource_pack__/graphics/icons/apm_machine_frame_basic_used.png'
apm.power.icons.path.machine_frame_steam_used = '__apm_resource_pack__/graphics/icons/apm_machine_frame_steam_used.png'
apm.power.icons.path.machine_frame_advanced_used = '__apm_resource_pack__/graphics/icons/apm_machine_frame_advanced_used.png'
apm.power.icons.path.equipment_battery_tiny = '__apm_resource_pack__/graphics/icons/apm_equipment_battery_tiny.png'
apm.power.icons.path.item_burner_generator_basic = '__apm_resource_pack__/graphics/icons/apm_equipment_burner_generator_basic.png'
apm.power.icons.path.item_burner_generator_advanced = '__apm_resource_pack__/graphics/icons/apm_equipment_burner_generator_advanced.png'
apm.power.icons.path.equipment_burner_generator_basic = '__apm_resource_pack__/graphics/equipment/apm_equipment_burner_generator_basic.png'
apm.power.icons.path.equipment_burner_generator_advanced = '__apm_resource_pack__/graphics/equipment/apm_equipment_burner_generator_advanced.png'

-- Icons ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- base game
--apm.power.icons.coal = {icon=apm.power.icons.path.coal, icon_size=64, icon_mipmaps=4}
--apm.power.icons.wood = {icon=apm.power.icons.path.wood, icon_size=64, icon_mipmaps=4}
apm.power.icons.offshore_pump = {icon=apm.power.icons.path.offshore_pump, icon_size=64, icon_mipmaps=4}
apm.power.icons.burner_mining_drill = {icon=apm.power.icons.path.burner_mining_drill, icon_size=64, icon_mipmaps=4}
apm.power.icons.electric_mining_drill = {icon=apm.power.icons.path.electric_mining_drill, icon_size=64, icon_mipmaps=4}
apm.power.icons.starter_armor = {icon=apm.power.icons.path.starter_armor, icon_size=64, tint=apm.power.color.starter_set, icon_mipmaps=4}
apm.power.icons.equipment_roboport_small = {icon=apm.power.icons.path.equipment_roboport_small, icon_size=64, tint=apm.power.color.starter_set, icon_mipmaps=4}
apm.power.icons.boiler = {icon=apm.power.icons.path.boiler, icon_size=64, icon_mipmaps=4}
apm.power.icons.steam_engine = {icon=apm.power.icons.path.steam_engine, icon_size=64, icon_mipmaps=4}

apm.power.icons.pistions = {icon=apm.power.icons.path.pistions, icon_size=64}
apm.power.icons.simple_engine = {icon=apm.power.icons.path.simple_engine, icon_size=64}
apm.power.icons.steam_engine_unit = {icon=apm.power.icons.path.steam_engine_unit, icon_size=64}
apm.power.icons.machine_frame_basic = {icon=apm.power.icons.path.machine_frame_basic, icon_size=64}
apm.power.icons.machine_frame_steam = {icon=apm.power.icons.path.machine_frame_steam, icon_size=64}
apm.power.icons.machine_frame_advanced = {icon=apm.power.icons.path.machine_frame_advanced, icon_size=64}
apm.power.icons.machine_frame_basic_used = {icon=apm.power.icons.path.machine_frame_basic_used, icon_size=64}
apm.power.icons.machine_frame_steam_used = {icon=apm.power.icons.path.machine_frame_steam_used, icon_size=64}
apm.power.icons.machine_frame_advanced_used = {icon=apm.power.icons.path.machine_frame_advanced_used, icon_size=64}
apm.power.icons.sciencepack_1 = {icon=apm.power.icons.path.sciencepack_1, icon_size=64}
apm.power.icons.sciencepack_2 = {icon=apm.power.icons.path.sciencepack_2, icon_size=64}
apm.power.icons.resin = {icon=apm.power.icons.path.resin, icon_size=64}
apm.power.icons.rubber = {icon=apm.power.icons.path.rubber, icon_size=64}
apm.power.icons.coal_crushed = {icon=apm.lib.icons.path.crushed, icon_size=64, tint=apm.power.color.coal}
apm.power.icons.wood_crushed = {icon=apm.lib.icons.path.crushed, icon_size=64, tint=apm.power.color.wood}
apm.power.icons.coke_crushed = {icon=apm.lib.icons.path.crushed, icon_size=64, tint=apm.power.color.coke}
apm.power.icons.coke_chunk = {icon=apm.lib.icons.path.chunk, icon_size=64, tint=apm.power.color.coke}
apm.power.icons.charcoal_chunk = {icon=apm.lib.icons.path.chunk, icon_size=64, tint=apm.power.color.charcoal}
apm.power.icons.coal_brick = {icon=apm.lib.icons.path.briquette, icon_size=64, tint=apm.power.color.coal}
apm.power.icons.coke_brick = {icon=apm.lib.icons.path.briquette, icon_size=64, tint=apm.power.color.coke}
apm.power.icons.wood_brick = {icon=apm.lib.icons.path.briquette, icon_size=64, tint=apm.power.color.wood}
apm.power.icons.charcoal_brick = {icon=apm.lib.icons.path.briquette, icon_size=64, tint=apm.power.color.charcoal}
apm.power.icons.generic_ash = {icon=apm.lib.icons.path.dust, icon_size=64, tint=apm.power.color.generic_ash}
apm.power.icons.filter_charcoal = {icon=apm.power.icons.path.filter_charcoal, icon_size=64}
apm.power.icons.filter_charcoal_used = {icon=apm.power.icons.path.filter_charcoal_used, icon_size=64}
apm.power.icons.mud_wet = {icon=apm.lib.icons.path.heap, icon_size=64, tint=apm.power.color.mud_wet}
apm.power.icons.mud_dry = {icon=apm.lib.icons.path.heap, icon_size=64, tint=apm.power.color.mud_dry}
apm.power.icons.crucible_raw = {icon=apm.power.icons.path.crucible_raw, icon_size=64}
apm.power.icons.crucible  = {icon=apm.power.icons.path.crucible, icon_size=64}
apm.power.icons.tree_seeds = {icon=apm.power.icons.path.tree_seeds, icon_size=64}
apm.power.icons.fertiliser_1 = {icon=apm.power.icons.path.fertiliser_1, icon_size=64}
apm.power.icons.fertiliser_2 = {icon=apm.power.icons.path.fertiliser_2, icon_size=64}
apm.power.icons.ammonium_sulfate = {icon=apm.lib.icons.path.dust, icon_size=64, tint=apm.power.color.ammonium_sulfate}
apm.power.icons.gearing = {icon=apm.power.icons.path.gearing, icon_size=64}
apm.power.icons.wood_board = {icon=apm.power.icons.path.wood_board, icon_size=64}
apm.power.icons.mechanical_relay = {icon=apm.power.icons.path.mechanical_relay, icon_size=64}
apm.power.icons.steam_relay = {icon=apm.power.icons.path.steam_relay, icon_size=64}
apm.power.icons.sealing_rings = {icon=apm.power.icons.path.sealing_rings, icon_size=64}
apm.power.icons.treated_wood_planks = {icon=apm.power.icons.path.treated_wood_planks, icon_size=64}
apm.power.icons.electromagnet = {icon=apm.power.icons.path.electromagnet, icon_size=32} --todo: take new item.
apm.power.icons.sieve_iron = {icon=apm.power.icons.path.sieve, icon_size=64, tint=apm.power.color.sieve_iron}
apm.power.icons.sieve_copper = {icon=apm.power.icons.path.sieve, icon_size=64, tint=apm.power.color.sieve_copper}
apm.power.icons.sieve_handel = {icon=apm.power.icons.path.sieve_handel, icon_size=64}
apm.power.icons.crusher_drums = {icon=apm.power.icons.path.crusher_drums, icon_size=64}
apm.power.icons.crusher_drums_used = {icon=apm.power.icons.path.crusher_drums_used, icon_size=64}
apm.power.icons.press_plates = {icon=apm.power.icons.path.press_plates, icon_size=64}
apm.power.icons.press_plates_used = {icon=apm.power.icons.path.press_plates_used, icon_size=64}
apm.power.icons.saw_blade_iron = {icon=apm.power.icons.path.saw_blade_iron, icon_size=64}
apm.power.icons.saw_blade_iron_used = {icon=apm.power.icons.path.saw_blade_iron_used, icon_size=64}
apm.power.icons.saw_blade_steel = {icon=apm.power.icons.path.saw_blade_steel, icon_size=64}
apm.power.icons.saw_blade_steel_used = {icon=apm.power.icons.path.saw_blade_steel_used, icon_size=64}
apm.power.icons.burner_filter_inserter = {icon=apm.power.icons.path.burner_filter_inserter, icon_size=64, icon_mipmaps=4}
apm.power.icons.burner_long_inserter = {icon=apm.power.icons.path.burner_long_inserter, icon_size=64, icon_mipmaps=4}
apm.power.icons.crushed_stone = {size=64, icon=apm.power.icons.path.crushed_stone, filename=apm.power.icons.path.crushed_stone, scale=0.25, icon_mipmaps=4, tint=apm.power.color.crushed_stone, icon_size=64}
apm.power.icons.crushed_stone_1 = {size=64,icon=apm.power.icons.path.crushed_stone_1, filename=apm.power.icons.path.crushed_stone_1, scale=0.25, icon_mipmaps=4, tint=apm.power.color.crushed_stone, icon_size=64}
apm.power.icons.crushed_stone_2 = {size=64, icon=apm.power.icons.path.crushed_stone_2, filename=apm.power.icons.path.crushed_stone_2, scale=0.25, icon_mipmaps=4, tint=apm.power.color.crushed_stone, icon_size=64}
apm.power.icons.crushed_stone_3 = {size=64,icon=apm.power.icons.path.crushed_stone_3, filename=apm.power.icons.path.crushed_stone_3, scale=0.25, icon_mipmaps=4, tint=apm.power.color.crushed_stone, icon_size=64}
apm.power.icons.stone_brick_raw ={icon=apm.power.icons.path.stone_brick_raw, icon_size=64}
apm.power.icons.asphalt = {size=64, icon=apm.power.icons.path.asphalt, filename=apm.power.icons.path.asphalt, scale=0.25, icon_mipmaps=2, icon_size=64}
apm.power.icons.asphalt_1 = {size=64, icon=apm.power.icons.path.asphalt_1, filename=apm.power.icons.path.asphalt_1, scale=0.25, icon_mipmaps=2, icon_size=64}
apm.power.icons.valve_0 = {icon=apm.power.icons.path.valve_0, icon_size=64}
apm.power.icons.valve_1 = {icon=apm.power.icons.path.valve_1, icon_size=64}
apm.power.icons.valve_2 = {icon=apm.power.icons.path.valve_2, icon_size=64}
apm.power.icons.coke_oven_gas_symbol = {icon=apm.power.icons.path.coke_oven_gas_symbol, icon_size=64}
apm.power.icons.zx80_construction_robot = {icon=apm.power.icons.path.zx80_construction_robot, icon_size=64, tint={r=0.689, g=0.571, b=0.377}, icon_mipmaps=4}
apm.power.icons.equipment_battery_tiny = {icon=apm.power.icons.path.equipment_battery_tiny, icon_size=64}
apm.power.icons.item_burner_generator_basic = {icon=apm.power.icons.path.item_burner_generator_basic, icon_size=64}
apm.power.icons.item_burner_generator_advanced = {icon=apm.power.icons.path.item_burner_generator_advanced, icon_size=64}
apm.power.icons.equipment_burner_generator_basic = {icon=apm.power.icons.path.equipment_burner_generator_basic, icon_size=128}
apm.power.icons.equipment_burner_generator_advanced = {icon=apm.power.icons.path.equipment_burner_generator_advanced, icon_size=128}

