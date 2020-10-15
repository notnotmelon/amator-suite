require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/icons.lua'

APM_LOG_HEADER(self)

local apm_power_overhaul_machine_frames = settings.startup["apm_power_overhaul_machine_frames"].value
local apm_power_steam_assembler_craftin_with_fluids = settings.startup["apm_power_steam_assembler_craftin_with_fluids"].value
local apm_power_compat_bob = settings.startup["apm_power_compat_bob"].value
local apm_power_compat_bob_overhaul_machine_frames = settings.startup["apm_power_compat_bob_overhaul_machine_frames"].value
local apm_power_compat_angel = settings.startup["apm_power_compat_angel"].value
local apm_power_compat_angel_overhaul_machine_frames = settings.startup["apm_power_compat_angel_overhaul_machine_frames"].value
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

APM_LOG_SETTINGS(self, 'apm_power_overhaul_machine_frames', apm_power_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_steam_assembler_craftin_with_fluids', apm_power_steam_assembler_craftin_with_fluids)
APM_LOG_SETTINGS(self, 'apm_power_compat_bob', apm_power_compat_bob)
APM_LOG_SETTINGS(self, 'apm_power_compat_bob_overhaul_machine_frames', apm_power_compat_bob_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel', apm_power_compat_angel)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel_overhaul_machine_frames', apm_power_compat_angel_overhaul_machine_frames)
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

-- bio_industries -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.Bio_Industries and apm_power_compat_bio_industries then
    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_tree_seeds')
    local item_icon_b = apm.lib.utils.icon.get.from_fluid('water')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {8,8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_seed_1', icons)

    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_tree_seeds')
    local item_icon_b = apm.lib.utils.icon.get.from_item('apm_generic_ash')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {8,8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_seed_2', icons)

    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_tree_seeds')
    local item_icon_b = apm.lib.utils.icon.get.from_item('fertiliser')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {8,8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_seed_3', icons)

    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_tree_seeds')
    local item_icon_b = apm.lib.utils.icon.get.from_item('bi-adv-fertiliser')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {8,8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_seed_4', icons)

    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_resin')
    local item_icon_b = apm.lib.utils.icon.get.from_item('bi-woodpulp')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {8,8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_resin_pulp', icons)

    local item_icon_a = apm.lib.utils.icon.get.from_item('apm_wood_briquette')
    local item_icon_b = apm.lib.utils.icon.get.from_item('bi-woodpulp')
    item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-8,-8})
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('bi_recipe_wood_fuel_brick', icons)
end

-- Angel ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.angelsrefining and apm_power_compat_angel then
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_dry_mud_sifting_iron'], 2, '__angelsrefining__/graphics/icons/angels-ore1.png')
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_dry_mud_sifting_copper'], 2, '__angelsrefining__/graphics/icons/angels-ore3.png')
end

if mods.angelssmelting and apm_power_compat_angel then
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_steel_0'], 1, '__angelssmelting__/graphics/icons/plate-steel.png')
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_steel_1'], 1, '__angelssmelting__/graphics/icons/plate-steel.png')
end

if mods.angelspetrochem and apm_power_compat_angel then
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_1'], 2, '__angelspetrochem__/graphics/icons/solid-coke.png')
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_1'], 1, nil)
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_2'], 2, '__angelspetrochem__/graphics/icons/solid-coke.png')
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_2'], 1, nil)
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_3'], 2, '__angelspetrochem__/graphics/icons/solid-coke.png')
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_3'], 1, nil)
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_4'], 2, '__angelspetrochem__/graphics/icons/solid-coke.png')
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_4'], 1, nil)
    apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_5'], 2, '__angelspetrochem__/graphics/icons/solid-coke.png')
	apm.lib.utils.icon.layer.replace(data.raw.recipe['apm_pyrolysis_coke_5'], 1, nil)
end
