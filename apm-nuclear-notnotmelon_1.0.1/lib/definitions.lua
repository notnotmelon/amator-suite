require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/lib/definitions.lua'

APM_LOG_HEADER(self)

if apm.nuclear.color == nil then apm.nuclear.color = {} end
if apm.nuclear.constants == nil then apm.nuclear.constants = {} end
if apm.nuclear.icons == nil then apm.nuclear.icons = {} end
if apm.nuclear.icons.path == nil then apm.nuclear.icons.path = {} end

-- Colors ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.nuclear.color.radioactive_water = {r=0.62, g=0.81, b=0.0}
apm.nuclear.color.depleted_uranium_mix = {r=0.325, g=0.554, b=0.444}
apm.nuclear.color.generic_ash = {r=0.35, g=0.35, b=0.35}

apm.nuclear.color.fuel_glow = {}
apm.nuclear.color.fuel_glow.fuel_rod = {}
apm.nuclear.color.fuel_glow.breeder = {}
--Fuel glow
apm.nuclear.color.fuel_glow.shielded_nuclear_fuel = {r=0.969, g=0.874, b=0.031, a=0.500}
apm.nuclear.color.fuel_glow.fuel_rod.uranium = {r=0.296, g=1.000, b=0.000, a=0.000}
apm.nuclear.color.fuel_glow.fuel_rod.thorium = {r=1.000, g=0.500, b=0.000, a=0.500}
apm.nuclear.color.fuel_glow.fuel_rod.mox = {r=0.969, g=0.874, b=0.031, a=0.500}
apm.nuclear.color.fuel_glow.fuel_rod.neptunium = {r=0.953, g=0.274, b=0.274, a=0.000}
--Breeder glow
apm.nuclear.color.fuel_glow.breeder.uranium = {r=0.750, g=1.000, b=0.000, a=0.500}
apm.nuclear.color.fuel_glow.breeder.thorium = {r=1.000, g=0.500, b=0.000, a=0.500}

-- Constants ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.nuclear.constants.fuel_value_exponent = 0.95
apm.nuclear.constants.amount_of_oxide_pellets = 10

apm.nuclear.constants.probability_neptunium = 1.2
apm.nuclear.constants.probability_thorium = 0.6
apm.nuclear.constants.probability_plutonium = 0.4

apm.nuclear.constants.amount_of_tbp_30 = 75
apm.nuclear.constants.amount_of_rocow = 50
apm.nuclear.constants.amount_for_rocow_recycling = 500

apm.nuclear.constants.fuel_value = {}
apm.nuclear.constants.fuel_value.fuel_rod = {}
apm.nuclear.constants.fuel_value.breeder = {}

-- Fuel rods fuel value
apm.nuclear.constants.fuel_value.shielded_nuclear_fuel = tostring(apm.lib.utils.math.round(0.7^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
apm.nuclear.constants.fuel_value.fuel_rod.uranium = tostring(apm.lib.utils.math.round(7^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
apm.nuclear.constants.fuel_value.fuel_rod.thorium = tostring(apm.lib.utils.math.round(9.1^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
apm.nuclear.constants.fuel_value.fuel_rod.mox = tostring(apm.lib.utils.math.round(8.0^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
apm.nuclear.constants.fuel_value.fuel_rod.neptunium = tostring(apm.lib.utils.math.round(5^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
-- Breeder fuel value
-- 3.8^fuel_value_exponent is like 80sec per breeding cycle (same as the old assembler implementation)
apm.nuclear.constants.fuel_value.breeder.thorium = tostring(apm.lib.utils.math.round(3.8^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"
apm.nuclear.constants.fuel_value.breeder.uranium = tostring(apm.lib.utils.math.round(3.8^apm.nuclear.constants.fuel_value_exponent, 2)) .. "GJ"

-- Icon path ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.nuclear.icons.path.seperation = '__apm_resource_pack__/graphics/icons/dynamics/apm_seperation.png'
apm.nuclear.icons.path.solid_fluorite = '__apm_resource_pack__/graphics/icons/apm_fluorite_ore.png'
apm.nuclear.icons.path.waste_container = '__apm_resource_pack__/graphics/icons/apm_waste_container.png'
apm.nuclear.icons.path.waste_radioactive = '__apm_resource_pack__/graphics/icons/apm_waste_radioactive.png'
apm.nuclear.icons.path.rtg = '__apm_resource_pack__/graphics/icons/apm_rtg.png'
apm.nuclear.icons.path.bromine = '__apm_resource_pack__/graphics/icons/dynamics/apm_bromine.png'
apm.nuclear.icons.path.bromine_trifluoride = '__apm_resource_pack__/graphics/icons/dynamics/apm_bromine_trifluoride.png'
apm.nuclear.icons.path.breeder_reactor = '__apm_resource_pack__/graphics/icons/apm_nuclear_breeder.png'
apm.nuclear.icons.path.cooling_pond = '__apm_resource_pack__/graphics/icons/apm_cooling_pond.png'
apm.nuclear.icons.path.staballoy = '__apm_resource_pack__/graphics/icons/apm_staballoy.png'
apm.nuclear.icons.path.yellowcake = '__apm_resource_pack__/graphics/icons/apm_yellowcake.png'
apm.nuclear.icons.path.potassium_bromide = '__apm_resource_pack__/graphics/icons/apm_potassium_bromide.png'
apm.nuclear.icons.path.uranium_hexafluoride = '__apm_resource_pack__/graphics/icons/dynamics/apm_uranium_hexafluoride.png'
apm.nuclear.icons.path.enrichment_tier = '__apm_resource_pack__/graphics/icons/dynamics/apm_top_right_'
apm.nuclear.icons.path.fluorite = "__apm_resource_pack__/graphics/icons/mip/apm_fluorite.png"
apm.nuclear.icons.path.fluorite_1 = "__apm_resource_pack__/graphics/icons/mip/apm_fluorite_1.png"
apm.nuclear.icons.path.fluorite_2 = "__apm_resource_pack__/graphics/icons/mip/apm_fluorite_2.png"
apm.nuclear.icons.path.fluorite_3 ="__apm_resource_pack__/graphics/icons/mip/apm_fluorite_3.png"
apm.nuclear.icons.path.thorium_ore = "__apm_resource_pack__/graphics/icons/mip/apm_thorium_ore.png"
apm.nuclear.icons.path.thorium_ore_1 = "__apm_resource_pack__/graphics/icons/mip/apm_thorium_ore_1.png"
apm.nuclear.icons.path.thorium_ore_2 = "__apm_resource_pack__/graphics/icons/mip/apm_thorium_ore_2.png"
apm.nuclear.icons.path.thorium_ore_3 = "__apm_resource_pack__/graphics/icons/mip/apm_thorium_ore_3.png"
apm.nuclear.icons.path.sciencepack = "__apm_resource_pack__/graphics/icons/apm_nuclear_science_pack.png"
apm.nuclear.icons.path.hexafluoride_sample = "__apm_resource_pack__/graphics/icons/apm_hexafluoride_sample.png"
apm.nuclear.icons.path.oxide_pellet_u238 = '__apm_resource_pack__/graphics/icons/apm_oxide_pellet_u238.png'
apm.nuclear.icons.path.oxide_pellet_u235 = '__apm_resource_pack__/graphics/icons/apm_oxide_pellet_u235.png'
apm.nuclear.icons.path.oxide_pellet_th232 = '__apm_resource_pack__/graphics/icons/apm_oxide_pellet_th232.png'
apm.nuclear.icons.path.oxide_pellet_np237 = '__apm_resource_pack__/graphics/icons/apm_oxide_pellet_np237.png'
apm.nuclear.icons.path.oxide_pellet_pu239 = '__apm_resource_pack__/graphics/icons/apm_oxide_pellet_pu239.png'
apm.nuclear.icons.path.breeder_container = '__apm_resource_pack__/graphics/icons/apm_breeder_container.png'
apm.nuclear.icons.path.breeder_container_worn = '__apm_resource_pack__/graphics/icons/apm_breeder_container_worn.png'
apm.nuclear.icons.path.breeder_container_thorium = '__apm_resource_pack__/graphics/icons/apm_breeder_container_thorium.png'
apm.nuclear.icons.path.breeder_container_thorium_loaded = '__apm_resource_pack__/graphics/icons/apm_breeder_container_thorium_loaded.png'
apm.nuclear.icons.path.breeder_container_thorium_active = '__apm_resource_pack__/graphics/icons/apm_breeder_container_thorium_active.png'
apm.nuclear.icons.path.breeder_container_thorium_cooled = '__apm_resource_pack__/graphics/icons/apm_breeder_container_thorium_cooled.png'
apm.nuclear.icons.path.breeder_container_thorium_seperated = '__apm_resource_pack__/graphics/icons/apm_breeder_container_thorium_seperated.png'
apm.nuclear.icons.path.breeder_container_uranium = '__apm_resource_pack__/graphics/icons/apm_breeder_container_uranium.png'
apm.nuclear.icons.path.breeder_container_uranium_loaded = '__apm_resource_pack__/graphics/icons/apm_breeder_container_uranium_loaded.png'
apm.nuclear.icons.path.breeder_container_uranium_active = '__apm_resource_pack__/graphics/icons/apm_breeder_container_uranium_active.png'
apm.nuclear.icons.path.breeder_container_uranium_cooled = '__apm_resource_pack__/graphics/icons/apm_breeder_container_uranium_cooled.png'
apm.nuclear.icons.path.breeder_container_uranium_seperated = '__apm_resource_pack__/graphics/icons/apm_breeder_container_uranium_seperated.png'
apm.nuclear.icons.path.fuel_container = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_container.png'
apm.nuclear.icons.path.fuel_container_worn = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_container_worn.png'
apm.nuclear.icons.path.fuel_container_neptunium = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_neptunium.png'
apm.nuclear.icons.path.fuel_container_neptunium_active = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_neptunium_active.png'
apm.nuclear.icons.path.fuel_container_neptunium_cooled = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_neptunium_cooled.png'
apm.nuclear.icons.path.fuel_container_thorium = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_thorium.png'
apm.nuclear.icons.path.fuel_container_thorium_active = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_thorium_active.png'
apm.nuclear.icons.path.fuel_container_thorium_cooled = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_thorium_cooled.png'
apm.nuclear.icons.path.fuel_container_uranium = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_uranium.png'
apm.nuclear.icons.path.fuel_container_uranium_active = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_uranium_active.png'
apm.nuclear.icons.path.fuel_container_uranium_cooled = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_uranium_cooled.png'
apm.nuclear.icons.path.fuel_container_mox = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_mox.png'
apm.nuclear.icons.path.fuel_container_mox_active = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_mox_active.png'
apm.nuclear.icons.path.fuel_container_mox_cooled = '__apm_resource_pack__/graphics/icons/apm_nuclear_fuel_mox_cooled.png'
apm.nuclear.icons.path.phosphorus = '__apm_resource_pack__/graphics/icons/apm_phosphorus.png'
apm.nuclear.icons.path.phosphorpentachlorid  = '__apm_resource_pack__/graphics/icons/apm_phosphorpentachlorid.png'
apm.nuclear.icons.path.phosphoroxychlorid  = '__apm_resource_pack__/graphics/icons/dynamics/apm_phosphoroxychlorid.png'
apm.nuclear.icons.path.trimethyl_phosphate = '__apm_resource_pack__/graphics/icons/dynamics/apm_trimethyl_phosphate.png'
apm.nuclear.icons.path.breeder_uranium_unloading = '__apm_resource_pack__/graphics/icons/apm_breeder_uranium_unloading.png'
apm.nuclear.icons.path.breeder_thorium_unloading = '__apm_resource_pack__/graphics/icons/apm_breeder_thorium_unloading.png'
apm.nuclear.icons.path.hybrid_cooling_tower = '__apm_resource_pack__/graphics/icons/apm_hybrid_cooling_tower_0.png'
apm.nuclear.icons.path.shielded_nuclear_fuel_cell = '__apm_resource_pack__/graphics/icons/apm_shielded_nuclear_fuel_cell.png'
apm.nuclear.icons.path.shielded_nuclear_fuel_cell_used = '__apm_resource_pack__/graphics/icons/apm_shielded_nuclear_fuel_cell_used.png'

apm.nuclear.icons.path.angel_sort_icon = '__angelsrefining__/graphics/icons/sort-icon.png'
apm.nuclear.icons.path.angel_slag_processing_blank = '__angelsrefining__/graphics/icons/slag-processing-blank.png'

-- Icons ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.nuclear.icons.seperation = {icon=apm.nuclear.icons.path.seperation, icon_size=64}
apm.nuclear.icons.phosphorus = {icon=apm.nuclear.icons.path.phosphorus, icon_size=64}
apm.nuclear.icons.phosphorpentachlorid = {icon=apm.nuclear.icons.path.phosphorpentachlorid, icon_size=64}
apm.nuclear.icons.phosphoroxychlorid = {icon=apm.nuclear.icons.path.phosphoroxychlorid, icon_size=64}
apm.nuclear.icons.generic_ash = {icon=apm.lib.icons.path.dust, icon_size=64, tint=apm.nuclear.color.generic_ash}
apm.nuclear.icons.trimethyl_phosphate = {icon=apm.nuclear.icons.path.trimethyl_phosphate, icon_size=64}
apm.nuclear.icons.fluorite = {size=64, icon=apm.nuclear.icons.path.fluorite, filename=apm.nuclear.icons.path.fluorite, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.fluorite_1 = {size=64, icon=apm.nuclear.icons.path.fluorite_1, filename=apm.nuclear.icons.path.fluorite_1, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.fluorite_2 = {size=64, icon=apm.nuclear.icons.path.fluorite_2, filename=apm.nuclear.icons.path.fluorite_2, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.fluorite_3 = {size=64, icon=apm.nuclear.icons.path.fluorite_3, filename=apm.nuclear.icons.path.fluorite_3, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.thorium_ore = {size=64, icon=apm.nuclear.icons.path.thorium_ore, filename=apm.nuclear.icons.path.thorium_ore, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.thorium_ore_1 = {size=64, icon=apm.nuclear.icons.path.thorium_ore_1, filename=apm.nuclear.icons.path.thorium_ore_1, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.thorium_ore_2 = {size=64, icon=apm.nuclear.icons.path.thorium_ore_2, filename=apm.nuclear.icons.path.thorium_ore_2, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.thorium_ore_3 = {size=64, icon=apm.nuclear.icons.path.thorium_ore_3, filename=apm.nuclear.icons.path.thorium_ore_3, scale=0.25, icon_mipmaps=4, icon_size=64}
apm.nuclear.icons.waste_container = {icon=apm.nuclear.icons.path.waste_container, icon_size=64}
apm.nuclear.icons.waste_radioactive = {icon=apm.nuclear.icons.path.waste_radioactive, icon_size=64}
apm.nuclear.icons.rtg = {icon=apm.nuclear.icons.path.rtg, icon_size=64}
apm.nuclear.icons.bromine = {icon=apm.nuclear.icons.path.bromine, icon_size=64}
apm.nuclear.icons.bromine_trifluoride = {icon=apm.nuclear.icons.path.bromine_trifluoride, icon_size=64}
apm.nuclear.icons.breeder_reactor = {icon=apm.nuclear.icons.path.breeder_reactor, icon_size=64}
apm.nuclear.icons.cooling_pond = {icon=apm.nuclear.icons.path.cooling_pond, icon_size=64}
apm.nuclear.icons.staballoy = {icon=apm.nuclear.icons.path.staballoy, icon_size=64}
apm.nuclear.icons.yellowcake = {icon=apm.nuclear.icons.path.yellowcake, icon_size=64}
apm.nuclear.icons.potassium_bromide = {icon=apm.nuclear.icons.path.potassium_bromide, icon_size=64}
apm.nuclear.icons.sciencepack = {icon=apm.nuclear.icons.path.sciencepack, icon_size=64}
apm.nuclear.icons.hexafluoride_sample = {icon=apm.nuclear.icons.path.hexafluoride_sample, icon_size=64}
apm.nuclear.icons.depleted_uranium_mix = {icon=apm.lib.icons.path.dust, icon_size=64, tint=apm.nuclear.color.depleted_uranium_mix}
apm.nuclear.icons.oxide_pellet_u238 = {icon=apm.nuclear.icons.path.oxide_pellet_u238, icon_size=64}
apm.nuclear.icons.oxide_pellet_u235 = {icon=apm.nuclear.icons.path.oxide_pellet_u235, icon_size=64}
apm.nuclear.icons.oxide_pellet_th232 = {icon=apm.nuclear.icons.path.oxide_pellet_th232, icon_size=64}
apm.nuclear.icons.oxide_pellet_np237 = {icon=apm.nuclear.icons.path.oxide_pellet_np237, icon_size=64}
apm.nuclear.icons.oxide_pellet_pu239 = {icon=apm.nuclear.icons.path.oxide_pellet_pu239, icon_size=64}
apm.nuclear.icons.breeder_container = {icon=apm.nuclear.icons.path.breeder_container, icon_size=64}
apm.nuclear.icons.breeder_container_worn = {icon=apm.nuclear.icons.path.breeder_container_worn, icon_size=64}
apm.nuclear.icons.breeder_container_thorium = {icon=apm.nuclear.icons.path.breeder_container_thorium, icon_size=64}
apm.nuclear.icons.breeder_container_thorium_loaded = {icon=apm.nuclear.icons.path.breeder_container_thorium_loaded, icon_size=64}
apm.nuclear.icons.breeder_container_thorium_active = {icon=apm.nuclear.icons.path.breeder_container_thorium_active, icon_size=64}
apm.nuclear.icons.breeder_container_thorium_cooled = {icon=apm.nuclear.icons.path.breeder_container_thorium_cooled, icon_size=64}
apm.nuclear.icons.breeder_container_thorium_seperated = {icon=apm.nuclear.icons.path.breeder_container_thorium_seperated, icon_size=64}
apm.nuclear.icons.breeder_container_uranium = {icon=apm.nuclear.icons.path.breeder_container_uranium, icon_size=64}
apm.nuclear.icons.breeder_container_uranium_loaded = {icon=apm.nuclear.icons.path.breeder_container_uranium_loaded, icon_size=64}
apm.nuclear.icons.breeder_container_uranium_active = {icon=apm.nuclear.icons.path.breeder_container_uranium_active, icon_size=64}
apm.nuclear.icons.breeder_container_uranium_cooled = {icon=apm.nuclear.icons.path.breeder_container_uranium_cooled, icon_size=64}
apm.nuclear.icons.breeder_container_uranium_seperated = {icon=apm.nuclear.icons.path.breeder_container_uranium_seperated, icon_size=64}
apm.nuclear.icons.fuel_container = {icon=apm.nuclear.icons.path.fuel_container, icon_size=64}
apm.nuclear.icons.fuel_container_worn = {icon=apm.nuclear.icons.path.fuel_container_worn, icon_size=64}
apm.nuclear.icons.fuel_container_neptunium = {icon=apm.nuclear.icons.path.fuel_container_neptunium, icon_size=64}
apm.nuclear.icons.fuel_container_neptunium_active = {icon=apm.nuclear.icons.path.fuel_container_neptunium_active, icon_size=64}
apm.nuclear.icons.fuel_container_neptunium_cooled = {icon=apm.nuclear.icons.path.fuel_container_neptunium_cooled, icon_size=64}
apm.nuclear.icons.fuel_container_thorium = {icon=apm.nuclear.icons.path.fuel_container_thorium, icon_size=64}
apm.nuclear.icons.fuel_container_thorium_active = {icon=apm.nuclear.icons.path.fuel_container_thorium_active, icon_size=64}
apm.nuclear.icons.fuel_container_thorium_cooled = {icon=apm.nuclear.icons.path.fuel_container_thorium_cooled, icon_size=64}
apm.nuclear.icons.fuel_container_uranium = {icon=apm.nuclear.icons.path.fuel_container_uranium, icon_size=64}
apm.nuclear.icons.fuel_container_uranium_active = {icon=apm.nuclear.icons.path.fuel_container_uranium_active, icon_size=64}
apm.nuclear.icons.fuel_container_uranium_cooled = {icon=apm.nuclear.icons.path.fuel_container_uranium_cooled, icon_size=64}
apm.nuclear.icons.fuel_container_mox = {icon=apm.nuclear.icons.path.fuel_container_mox, icon_size=64}
apm.nuclear.icons.fuel_container_mox_active = {icon=apm.nuclear.icons.path.fuel_container_mox_active, icon_size=64}
apm.nuclear.icons.fuel_container_mox_cooled = {icon=apm.nuclear.icons.path.fuel_container_mox_cooled, icon_size=64}
apm.nuclear.icons.breeder_uranium_unloading = {icon=apm.nuclear.icons.path.breeder_uranium_unloading, icon_size=64}
apm.nuclear.icons.breeder_thorium_unloading = {icon=apm.nuclear.icons.path.breeder_thorium_unloading, icon_size=64}
apm.nuclear.icons.hybrid_cooling_tower = {icon=apm.nuclear.icons.path.hybrid_cooling_tower, icon_size=64}
apm.nuclear.icons.shielded_nuclear_fuel_cell = {icon=apm.nuclear.icons.path.shielded_nuclear_fuel_cell, icon_size=64}
apm.nuclear.icons.shielded_nuclear_fuel_cell_used = {icon=apm.nuclear.icons.path.shielded_nuclear_fuel_cell_used, icon_size=64}

apm.nuclear.icons.angel_sort_icon = {icon=apm.nuclear.icons.path.angel_sort_icon, icon_size=32}
apm.nuclear.icons.angel_slag_processing_blank = {icon=apm.nuclear.icons.path.angel_slag_processing_blank, icon_size=32}