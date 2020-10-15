require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/recipe-categories.lua'

APM_LOG_HEADER(self)

local apm_power_overhaul_machine_frames = settings.startup["apm_power_overhaul_machine_frames"].value
local apm_power_steam_assembler_craftin_with_fluids = settings.startup["apm_power_steam_assembler_craftin_with_fluids"].value
local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value

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
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

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

-- apm ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.apm_recycling then
    apm.lib.utils.recipe.category.change('apm_filter_charcoal_used_recycling', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_machine_frame_basic_maintenance', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_machine_frame_steam_maintenance', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_machine_frame_advanced_maintenance', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_crusher_drums_used_repair', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_press_plates_used_grind', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_saw_blade_iron_maintenance', 'apm_recycling_1')
    apm.lib.utils.recipe.category.change('apm_saw_blade_steel_maintenance', 'apm_recycling_1')
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['aai-industry'] and apm_power_compat_earendel then
    apm.lib.utils.recipe.category.change('sand-from-stone', 'apm_crusher')
    if apm_power_always_show_made_in then
        apm.lib.utils.recipe.set.always_show_made_in('sand-from-stone', true)
    end
    apm.lib.utils.recipe.set.always_show_products('sand-from-stone', true)
end

-- bio_industries -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.Bio_Industries and apm_power_compat_bio_industries then
	apm.lib.utils.recipe.category.overwrite_all('biofarm-mod-crushing', 'apm_crusher')
    apm.lib.utils.recipe.category.change('bi_recipe_woodpulp', 'apm_crusher')
    if apm_power_always_show_made_in then
        apm.lib.utils.recipe.set.always_show_made_in('bi_recipe_woodpulp', true)
    end
    apm.lib.utils.recipe.set.always_show_products('bi_recipe_woodpulp', true)
end

if mods.Bio_Industries and apm_power_compat_bio_industries then
    apm.lib.utils.recipe.category.overwrite_all('biofarm-mod-crushing', 'apm_crusher')
    if apm_power_always_show_made_in then
        apm.lib.utils.recipe.set.always_show_made_in('biofarm-mod-crushing', true)
    end
    apm.lib.utils.recipe.set.always_show_products('biofarm-mod-crushing', true)
end

-- angel ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.angelsrefining and apm_power_compat_angel then
    apm.lib.utils.assembler.mod.category.add('apm_crusher_machine_0', 'ore-sorting-t1')
    apm.lib.utils.assembler.mod.category.add('apm_crusher_machine_1', 'ore-sorting-t1')
    apm.lib.utils.assembler.mod.category.add('apm_crusher_machine_2', 'ore-sorting-t1')

    apm.lib.utils.assembler.mod.category.add('burner-ore-crusher', 'apm_crusher')
    apm.lib.utils.assembler.mod.category.add('ore-crusher', 'apm_crusher')
    apm.lib.utils.assembler.mod.category.add('ore-crusher', 'apm_crusher_3')
    apm.lib.utils.assembler.mod.category.add('ore-crusher-2', 'apm_crusher')
    apm.lib.utils.assembler.mod.category.add('ore-crusher-2', 'apm_crusher_3')
    apm.lib.utils.assembler.mod.category.add('ore-crusher-3', 'apm_crusher')
    apm.lib.utils.assembler.mod.category.add('ore-crusher-3', 'apm_crusher_3')
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['space-exploration'] and apm_power_compat_earendel then
    apm.lib.utils.recipe.category.change('sand-from-stone', 'apm_crusher')
    if apm_power_always_show_made_in then
        apm.lib.utils.recipe.set.always_show_made_in('sand-from-stone', true)
    end
    apm.lib.utils.recipe.set.always_show_products('sand-from-stone', true)
end