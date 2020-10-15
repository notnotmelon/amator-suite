require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/final-overwrites.lua'

APM_LOG_HEADER(self)

local apm_power_overhaul_machine_frames = settings.startup["apm_power_overhaul_machine_frames"].value
local apm_power_steam_assembler_craftin_with_fluids = settings.startup["apm_power_steam_assembler_craftin_with_fluids"].value
local apm_power_inherit_industrial_science = settings.startup["apm_power_inherit_industrial_science"].value
local apm_power_inherit_steam_science = settings.startup["apm_power_inherit_steam_science"].value

local apm_power_compat_bob = settings.startup["apm_power_compat_bob"].value
local apm_power_compat_bob_overhaul_machine_frames = settings.startup["apm_power_compat_bob_overhaul_machine_frames"].value
local apm_power_compat_angel = settings.startup["apm_power_compat_angel"].value
local apm_power_compat_angel_overhaul_machine_frames = settings.startup["apm_power_compat_angel_overhaul_machine_frames"].value
local apm_power_compat_angel_overwrite_crystal_saw_blades = settings.startup["apm_power_compat_angel_overwrite_crystal_saw_blades"].value
local apm_power_compat_sctm = settings.startup["apm_power_compat_sctm"].value
local apm_power_compat_sct_overhaul_machine_frames = settings.startup["apm_power_compat_sct_overhaul_machine_frames"].value
local apm_power_compat_earendel = settings.startup["apm_power_compat_earendel"].value
local apm_power_compat_bio_industries = settings.startup["apm_power_compat_bio_industries"].value
local apm_power_compat_expensivelandfillrecipe = settings.startup["apm_power_compat_expensivelandfillrecipe"].value
local apm_power_compat_kingarthur = settings.startup["apm_power_compat_kingarthur"].value
local apm_power_compat_mferrari = settings.startup["apm_power_compat_mferrari"].value
local apm_power_compat_linver = settings.startup["apm_power_compat_linver"].value
local apm_power_compat_realistic_reactors = settings.startup["apm_power_compat_realistic_reactors"].value
local apm_power_compat_reverse_factory = settings.startup["apm_power_compat_reverse_factory"].value
local apm_power_compat_arcitos = settings.startup["apm_power_compat_arcitos"].value

APM_LOG_SETTINGS(self, 'apm_power_overhaul_machine_frames', apm_power_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_steam_assembler_craftin_with_fluids', apm_power_steam_assembler_craftin_with_fluids)
APM_LOG_SETTINGS(self, 'apm_power_inherit_industrial_science', apm_power_inherit_industrial_science)
APM_LOG_SETTINGS(self, 'apm_power_inherit_steam_science', apm_power_inherit_steam_science)

APM_LOG_SETTINGS(self, 'apm_power_compat_bob', apm_power_compat_bob)
APM_LOG_SETTINGS(self, 'apm_power_compat_bob_overhaul_machine_frames', apm_power_compat_bob_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel', apm_power_compat_angel)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel_overhaul_machine_frames', apm_power_compat_angel_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel_overwrite_crystal_saw_blades', apm_power_compat_angel_overwrite_crystal_saw_blades)
APM_LOG_SETTINGS(self, 'apm_power_compat_sctm', apm_power_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_power_compat_sct_overhaul_machine_frames', apm_power_compat_sct_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_earendel', apm_power_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_power_compat_bio_industries', apm_power_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_power_compat_expensivelandfillrecipe', apm_power_compat_expensivelandfillrecipe)
APM_LOG_SETTINGS(self, 'apm_power_compat_kingarthur', apm_power_compat_kingarthur)
APM_LOG_SETTINGS(self, 'apm_power_compat_mferrari', apm_power_compat_mferrari)
APM_LOG_SETTINGS(self, 'apm_power_compat_linver', apm_power_compat_linver)
APM_LOG_SETTINGS(self, 'apm_power_compat_realistic_reactors', apm_power_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_power_compat_reverse_factory', apm_power_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_power_compat_arcitos', apm_power_compat_arcitos)

-- AsphaltRoads ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['AsphaltRoads'] and apm_power_compat_arcitos then
end

-- bio_industries -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.Bio_Industries and apm_power_compat_bio_industries then
	apm.lib.utils.recipe.result.replace_all('bi-seed', 'apm_tree_seeds')
	apm.lib.utils.recipe.ingredient.replace_all('bi-seed', 'apm_tree_seeds')
	apm.lib.utils.recipe.result.replace_all('bi-ash', 'apm_generic_ash')
	apm.lib.utils.recipe.ingredient.replace_all('bi-ash', 'apm_generic_ash')
	apm.lib.utils.recipe.result.replace_all('wood-charcoal', 'apm_charcoal')
	apm.lib.utils.recipe.ingredient.replace_all('wood-charcoal', 'apm_charcoal')
end

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if (mods.bobplates or mods.bobelectronics) and apm_power_compat_bob then
	apm.lib.utils.recipe.disable('bob-resin-wood')
	apm.lib.utils.recipe.disable('bob-rubber')
end

-- wooden boards
apm.lib.utils.recipe.result.replace_all('wooden-board', 'apm_wood_board')
apm.lib.utils.recipe.ingredient.replace_all('wooden-board', 'apm_wood_board')
apm.lib.utils.item.remove('wooden-board')

-- resin
apm.lib.utils.recipe.result.replace_all('resin', 'apm_resin')
apm.lib.utils.recipe.ingredient.replace_all('resin', 'apm_resin')
apm.lib.utils.item.remove('resin')

-- rubber
apm.lib.utils.recipe.result.replace_all('rubber', 'apm_rubber')
apm.lib.utils.recipe.ingredient.replace_all('rubber', 'apm_rubber')
apm.lib.utils.item.remove('rubber')

-- angel ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.angelsrefining and apm_power_compat_angel then
	apm.lib.utils.item.remove('burner-ore-crusher')
	-- unification of mud items:
	apm.lib.utils.recipe.result.replace_all('solid-mud', 'apm_wet_mud')
	apm.lib.utils.recipe.ingredient.replace_all('solid-mud', 'apm_dry_mud')

	apm.lib.utils.item.remove('apm_crushed_stone')
end

if mods.angelspetrochem and apm_power_compat_angel then
	apm.lib.utils.recipe.result.replace_all('solid-resin', 'apm_resin')
	apm.lib.utils.recipe.ingredient.replace_all('solid-resin', 'apm_resin')
	apm.lib.utils.item.remove('solid-resin')
	apm.lib.utils.recipe.result.replace_all('solid-rubber', 'apm_rubber')
	apm.lib.utils.recipe.ingredient.replace_all('solid-rubber', 'apm_rubber')
	apm.lib.utils.item.remove('solid-rubber')
	apm.lib.utils.recipe.ingredient.replace_all('coal-crushed', 'apm_coal_crushed')
	apm.lib.utils.recipe.ingredient.replace_all('pellet-coke', 'apm_coke_brick')
	apm.lib.utils.item.remove('coal-crushed')
	apm.lib.utils.item.remove('pellet-coke')
	apm.lib.utils.item.remove('apm_coke')
end

if mods.angelsbioprocessing and apm_power_compat_angel then
	apm.lib.utils.recipe.ingredient.replace_all('wood-pellets', 'apm_wood_pellets')
	apm.lib.utils.recipe.ingredient.replace_all('wood-bricks', 'apm_wood_briquette')
	apm.lib.utils.item.remove('wood-pellets')
	apm.lib.utils.item.remove('wood-bricks')

	apm.lib.utils.recipe.ingredient.replace_all('solid-saw', 'apm_saw_blade_iron')
	apm.lib.utils.recipe.result.replace_all('solid-saw', 'apm_saw_blade_iron_used')
	apm.lib.utils.item.remove('solid-saw')

	if apm_power_compat_angel_overwrite_crystal_saw_blades then
		apm.lib.utils.recipe.ingredient.replace_all('solid-crystal-tipped-saw', 'apm_saw_blade_steel')
		apm.lib.utils.recipe.result.replace_all('solid-crystal-tipped-saw', 'apm_saw_blade_steel_used')
		apm.lib.utils.recipe.ingredient.replace_all('solid-crystal-full-saw', 'apm_saw_blade_steel')
		apm.lib.utils.recipe.result.replace_all('solid-crystal-full-saw', 'apm_saw_blade_steel_used')
		apm.lib.utils.item.remove('solid-crystal-tipped-saw')
		apm.lib.utils.item.remove('solid-crystal-full-saw')
	end
end

-- kingarthur -----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.PyCoalTBaA and apm_power_compat_kingarthur then
	apm.lib.utils.recipe.result.replace_all('py-asphalt', 'apm_asphalt')
	apm.lib.utils.recipe.ingredient.replace_all('py-asphalt', 'apm_asphalt')
	--apm.lib.utils.item.remove('py-asphalt')
	apm.lib.utils.item.delete_hard('py-asphalt')

	apm.lib.utils.recipe.result.replace_all('apm_creosote', 'creosote')
	apm.lib.utils.recipe.ingredient.replace_all('apm_creosote', 'creosote')
	--apm.lib.utils.fluid.remove('creosote')
	apm.lib.utils.fluid.delete_hard('apm_creosote')

	apm.lib.utils.recipe.result.replace_all('treated-wood', 'apm_treated_wood_planks')
	apm.lib.utils.recipe.ingredient.replace_all('treated-wood', 'apm_treated_wood_planks')
	--apm.lib.utils.item.remove('treated-wood')
	apm.lib.utils.item.delete_hard('treated-wood')
end

-- Crushed stone integration --------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if (mods.Bio_Industries and apm_power_compat_bio_industries) or (mods.angelsrefining and apm_power_compat_angel) then
	apm.lib.utils.recipe.ingredient.replace_all('apm_crushed_stone', 'stone-crushed')
	apm.lib.utils.recipe.result.replace_all('apm_crushed_stone', 'stone-crushed')
	apm.lib.utils.recipe.overwrite.group('apm_crushed_stone', 'apm_power', 'apm_power_intermediates', 'ak_a')

	local item_icon_a = apm.lib.utils.icon.get.from_item('apm_asphalt')
	local item_icon_b = apm.lib.utils.icon.get.from_item('stone-crushed')
	item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-9, -9})
	local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
	apm.lib.utils.recipe.set.icons('apm_asphalt_2', icons)
	apm.lib.utils.recipe.set.icons('apm_asphalt_4', icons)

	local item_icon_a = apm.lib.utils.icon.get.from_item('apm_stone_brick_raw')
	local item_icon_b = apm.lib.utils.icon.get.from_item('stone-crushed')
	item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-9, -9})
	local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
	apm.lib.utils.recipe.set.icons('apm_stone_brick_raw_with_crushed', icons)
end

-- entity description updates -------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- do not edit the hidden entities for aai-programmable-vehicles
if mods['aai-programmable-vehicles'] and apm_power_compat_earendel then
    local composite_suffix = "-_-"
	for _, vehicle in pairs(data.raw.car) do
		local solid_name = vehicle.name .. composite_suffix.."solid"
		local ghost_name = vehicle.name .. composite_suffix.."ghost"
		apm.lib.utils.description.entities.exclude_list.add(solid_name)
		apm.lib.utils.description.entities.exclude_list.add(ghost_name)
	end
end

apm.lib.utils.description.entities.update()

-- fix offshore-pump
local apm_offshore_pump_0 = data.raw['offshore-pump']['apm_offshore_pump_0']
local apm_offshore_pump_burner = data.raw['assembling-machine']['apm_offshore_pump_burner']
apm_offshore_pump_0.localised_description = apm_offshore_pump_burner.localised_description

-- science packs --------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if apm_power_inherit_industrial_science then
	apm.lib.utils.technology.add.science_pak_conditional('apm_industrial_science_pack', 'automation-science-pack')
end

if apm_power_inherit_steam_science then
	apm.lib.utils.technology.add.science_pak_conditional('apm_steam_science_pack', 'automation-science-pack')
end

-- recipes allow productivity modules -----------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.recipe.allow_productivity('apm_raw_crucible_0')
apm.lib.utils.recipe.allow_productivity('apm_raw_crucible_1')
apm.lib.utils.recipe.allow_productivity('apm_stone_crucible')
apm.lib.utils.recipe.allow_productivity('apm_steel_0')
apm.lib.utils.recipe.allow_productivity('apm_steel_1')
apm.lib.utils.recipe.allow_productivity('apm_dry_mud')
apm.lib.utils.recipe.allow_productivity('apm_sieve_iron')
apm.lib.utils.recipe.allow_productivity('apm_sieve_copper')
apm.lib.utils.recipe.allow_productivity('apm_dry_mud_sifting_iron')
apm.lib.utils.recipe.allow_productivity('apm_dry_mud_sifting_copper')
apm.lib.utils.recipe.allow_productivity('apm_stone_brick_raw_with_ash')
apm.lib.utils.recipe.allow_productivity('apm_landfill')
apm.lib.utils.recipe.allow_productivity('apm_coal_ash_washing')
apm.lib.utils.recipe.allow_productivity('apm_coal_ash_production')
apm.lib.utils.recipe.allow_productivity('apm_wood_ash_production')
apm.lib.utils.recipe.allow_productivity('apm_treated_wood_planks_1')
apm.lib.utils.recipe.allow_productivity('apm_treated_wood_planks_1b')
apm.lib.utils.recipe.allow_productivity('apm_treated_wood_planks_2')
apm.lib.utils.recipe.allow_productivity('apm_treated_wood_planks_2b')
apm.lib.utils.recipe.allow_productivity('apm_refining_creosote_1')
apm.lib.utils.recipe.allow_productivity('apm_refining_coke_oven_gas_1')
apm.lib.utils.recipe.allow_productivity('apm_crusher_drums')
apm.lib.utils.recipe.allow_productivity('apm_coal_crushed_1')
apm.lib.utils.recipe.allow_productivity('apm_coal_crushed_2')
apm.lib.utils.recipe.allow_productivity('apm_coal_crushed_3')
apm.lib.utils.recipe.allow_productivity('apm_press_plates')
apm.lib.utils.recipe.allow_productivity('apm_coal_briquette_pressed_1')
apm.lib.utils.recipe.allow_productivity('apm_coal_briquette_pressed_2')
apm.lib.utils.recipe.allow_productivity('apm_coal_briquette_pressed_3')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_coke_1')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_coke_2')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_coke_3')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_coke_4')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_coke_5')
apm.lib.utils.recipe.allow_productivity('apm_coke_crushed')
apm.lib.utils.recipe.allow_productivity('apm_coke_brick')
apm.lib.utils.recipe.allow_productivity('apm_wood_pellets_1')
apm.lib.utils.recipe.allow_productivity('apm_wood_pellets_2')
apm.lib.utils.recipe.allow_productivity('apm_wood_briquette_1')
apm.lib.utils.recipe.allow_productivity('apm_wood_briquette_2')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_charcoal_1')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_charcoal_2')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_charcoal_3')
apm.lib.utils.recipe.allow_productivity('apm_pyrolysis_charcoal_4')
apm.lib.utils.recipe.allow_productivity('apm_charcoal_brick')
apm.lib.utils.recipe.allow_productivity('apm_tree_seeds')
apm.lib.utils.recipe.allow_productivity('apm_fertiliser_1')
apm.lib.utils.recipe.allow_productivity('apm_fertiliser_2')
apm.lib.utils.recipe.allow_productivity('apm_electromagnet')
apm.lib.utils.recipe.allow_productivity('apm_resin_1')
apm.lib.utils.recipe.allow_productivity('apm_resin_2')
apm.lib.utils.recipe.allow_productivity('apm_rubber_1')
apm.lib.utils.recipe.allow_productivity('apm_rubber_2')
apm.lib.utils.recipe.allow_productivity('apm_gearing')
apm.lib.utils.recipe.allow_productivity('apm_wood_board_1')
apm.lib.utils.recipe.allow_productivity('apm_wood_board_2')
apm.lib.utils.recipe.allow_productivity('apm_steam_relay')
apm.lib.utils.recipe.allow_productivity('apm_sealing_rings')
apm.lib.utils.recipe.allow_productivity('apm_crushed_stone')
apm.lib.utils.recipe.allow_productivity('apm_stone_brick_raw')
apm.lib.utils.recipe.allow_productivity('apm_stone_brick_raw_with_wed_mud')
apm.lib.utils.recipe.allow_productivity('apm_industrial_science_pack_1')
apm.lib.utils.recipe.allow_productivity('apm_saw_blade_iron')
apm.lib.utils.recipe.allow_productivity('apm_saw_blade_steel')
apm.lib.utils.recipe.allow_productivity('apm_asphalt_1')
apm.lib.utils.recipe.allow_productivity('apm_asphalt_2')
apm.lib.utils.recipe.allow_productivity('apm_filter_charcoal')
