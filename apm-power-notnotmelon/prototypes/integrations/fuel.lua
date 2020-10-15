require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/fuel.lua'

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

-- ------------------------------------------------------
-- apm.lib.utils.fuel.overhaul(item_name, multiplicator)
-- ------------------------------------------------------

-- bio_industries -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.Bio_Industries and apm_power_compat_bio_industries then
	apm.lib.utils.fuel.overhaul(1, 'bi-woodpulp', 0.25, 'apm_generic_ash', 'chemical')
	apm.lib.utils.item.mod.remove_fuel_value('seedling')
	apm.lib.utils.item.mod.remove_fuel_value('bi-big-wooden-pole')
	apm.lib.utils.item.mod.remove_fuel_value('bi-huge-wooden-pole')
	apm.lib.utils.item.mod.remove_fuel_value('bi-wooden-fence')
	apm.lib.utils.item.mod.remove_fuel_value('bi-wood-pipe')
	apm.lib.utils.item.mod.remove_fuel_value('bi-pipe-to-ground-wood')
	apm.lib.utils.item.mod.remove_fuel_value('bi-large-wooden-chest')
	apm.lib.utils.item.mod.remove_fuel_value('bi-huge-wooden-chest')
	apm.lib.utils.item.mod.remove_fuel_value('bi-giga-wooden-chest')
end

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobplates and apm_power_compat_bob then
	apm.lib.utils.fuel.overhaul(5, 'enriched-fuel', 8, nil, 'apm_refined_chemical')
end

-- angel ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.angelspetrochem and apm_power_compat_angel then
	apm.lib.utils.fuel.overhaul(3, 'solid-coke', 3.7, nil, 'apm_refined_chemical')
	apm.lib.utils.fuel.overhaul(5, 'solid-carbon', 2.5, nil, 'apm_refined_chemical')
	apm.lib.utils.fuel.overhaul(6, 'rocket-booster', 4, nil, 'apm_rocket')
end

if mods.angelsbioprocessing and apm_power_compat_angel then
	apm.lib.utils.fuel.overhaul(1, 'cellulose-fiber', 0.125, 'apm_generic_ash')
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['aai-industry'] and apm_power_compat_earendel then
	apm.lib.utils.fuel.overhaul(5, 'vehicle-fuel', 1, nil, 'apm_vehicle_only')
	for _, recipe in pairs(data.raw.recipe) do
    	if string.match(recipe.name, "vehicle%-fuel%-from%-") then
        	apm.lib.utils.recipe.remove(recipe.name)
    	end
	end
	apm.lib.utils.patch.aai.generate_vehicle_fuel()
end

-- kingarthur -----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.PyCoalTBaA and apm_power_compat_kingarthur then
	apm.lib.utils.fuel.overhaul(1, 'raw-coal', 0.85, 'apm_generic_ash', 'chemical')
	apm.lib.utils.fuel.overhaul(2, 'crushed-coal', 0.75, 'apm_generic_ash', 'chemical')
	apm.lib.utils.fuel.overhaul(2, 'coarse-coal', 0.75, 'apm_generic_ash', 'chemical')
	apm.lib.utils.fuel.overhaul(2, 'coal-dust', 0.5, 'apm_generic_ash', 'chemical')
	apm.lib.utils.fuel.overhaul(1, 'raw-fiber', 0.2, 'apm_generic_ash', 'chemical')
	apm.lib.utils.fuel.overhaul(2, 'coal-briquette', 5, 'apm_generic_ash', 'chemical')
end