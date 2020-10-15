require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/entities.lua'

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
local apm_power_compat_suicidalkid = settings.startup["apm_power_compat_suicidalkid"].value
local apm_power_compat_kumpu = settings.startup["apm_power_compat_kumpu"].value

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
APM_LOG_SETTINGS(self, 'apm_power_compat_suicidalkid', apm_power_compat_suicidalkid)
APM_LOG_SETTINGS(self, 'apm_power_compat_kumpu', apm_power_compat_kumpu)

apm.lib.utils.locomotive.overhaul_all()
apm.lib.utils.car.overhaul_all()

-- apm ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.apm_recycling then
	apm.lib.utils.assembler.burner.overhaul('apm_recycling_machine_0')
end

-- AlternativeSteam -----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.AlternativeSteam then
	apm.lib.utils.reactor.set.fuel_categories('as-chemical-fired-reactor', {'chemical','apm_refined_chemical'})
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['aai-industry'] and apm_power_compat_earendel then
	apm.lib.utils.assembler.set.hidden('burner-assembling-machine')
end

if mods['space-exploration'] and apm_power_compat_earendel then
	apm.lib.utils.lab.add.science_pack('se-space-science-lab', 'apm_industrial_science_pack')
end

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobpower and apm_power_compat_bob then
	if apm.lib.utils.setting.get.starup('bobmods-power-steam') then
		apm.lib.utils.boiler.set.hidden('apm_boiler_2')
		apm.lib.utils.boiler.set.next_upgrade('apm_boiler_2', nil)
		apm.lib.utils.boiler.set.next_upgrade('boiler', 'boiler-2')
		apm.lib.utils.generator.set.hidden('apm_steam_engine_2')
		apm.lib.utils.generator.set.next_upgrade('apm_steam_engine_2', nil)
		apm.lib.utils.generator.set.next_upgrade('steam-engine', 'steam-engine-2')
	end

	-- Boilers
	apm.lib.utils.boiler.overhaul('boiler-2', 2)
	apm.lib.utils.boiler.overhaul('boiler-3', 3)
	apm.lib.utils.boiler.overhaul('boiler-4', 4)
	apm.lib.utils.boiler.overhaul('boiler-5', 5)
	-- Generators
	apm.lib.utils.generator.overhaul('steam-engine-2', 2)
	apm.lib.utils.generator.overhaul('steam-engine-3', 3)
	apm.lib.utils.generator.overhaul('steam-engine-4', 4)
	apm.lib.utils.generator.overhaul('steam-engine-5', 5)
	-- heat reactor
	apm.lib.utils.reactor.set.fuel_categories('burner-reactor', {'chemical','apm_refined_chemical'})
	apm.lib.utils.reactor.set.fuel_categories('burner-reactor-2', {'chemical','apm_refined_chemical'})
	apm.lib.utils.reactor.set.fuel_categories('burner-reactor-3', {'chemical','apm_refined_chemical'})
end

if mods.bobplates and apm_power_compat_bob then
	apm.lib.utils.assembler.burner.overhaul('chemical-boiler')
	apm.lib.utils.assembler.burner.overhaul('chemical-steel-furnace', true)
	apm.lib.utils.assembler.burner.overhaul('mixing-furnace')
	apm.lib.utils.assembler.burner.overhaul('mixing-steel-furnace', true)
end

if mods.bobtech and apm_power_compat_bob then
	apm.lib.utils.lab.overhaul('lab-2')
end

if mods.bobmining and apm_power_compat_bob then
	apm.lib.utils.mining_drill.set.hidden('steam-mining-drill')
end

if mods.bobassembly and apm_power_compat_bob then
	apm.lib.utils.assembler.set.hidden('burner-assembling-machine')
	apm.lib.utils.assembler.set.hidden('steam-assembling-machine')

	apm.lib.utils.assembler.mod.module_specification('assembling-machine-3', 4)
	apm.lib.utils.assembler.mod.module_specification('assembling-machine-4', 5)
	apm.lib.utils.assembler.mod.module_specification('assembling-machine-5', 6)
end

-- angel ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.angelsrefining and apm_power_compat_angel then
	apm.lib.utils.assembler.burner.overhaul('burner-ore-crusher')
	apm.lib.utils.assembler.set.hidden('burner-ore-crusher')
end

if mods.angelssmelting and apm_power_compat_angel then
	apm.lib.utils.assembler.set.hidden('burner-ore-crusher')
	apm.lib.utils.assembler.set.hidden('apm_steelworks_0')
	apm.lib.utils.assembler.set.hidden('apm_steelworks_1')
	
	apm.lib.utils.assembler.burner.overhaul('blast-furnace', true)
	apm.lib.utils.assembler.burner.overhaul('blast-furnace-2', true)
	apm.lib.utils.assembler.burner.overhaul('blast-furnace-3', true)
	apm.lib.utils.assembler.burner.overhaul('blast-furnace-4', true)
end

-- MFerrari -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['Mining-Space-Industries'] and apm_power_compat_mferrari then
	apm.lib.utils.lab.overhaul('msi-worker-lab')
end

-- sctm -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.ScienceCostTweakerM and apm_power_compat_sctm then
	apm.lib.utils.lab.inputs('apm_lab_1', {"apm_industrial_science_pack", "apm_steam_science_pack", "automation-science-pack"})
	apm.lib.utils.lab.overhaul('sct-lab-t1')
	apm.lib.utils.lab.overhaul('sct-lab-t2')
	apm.lib.utils.lab.overhaul('sct-lab-t3')
	apm.lib.utils.lab.overhaul('sct-lab-t4')
end

-- kingarthur -----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.PyCoalTBaA and apm_power_compat_kingarthur then
	if mods['aai-industry'] then
		apm.lib.utils.lab.add.science_pack('apm_lab_0', 'science-pack-0')
		apm.lib.utils.lab.add.science_pack('apm_lab_1', 'science-pack-0')
	end
end

-- RealisticReactors ----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.RealisticReactors and apm_power_compat_realistic_reactors then
	--patch hidden cooling-tower
    apm.lib.utils.furnace.overhaul('rr-cooling-tower-steam', nil, false)
end

-- Valves ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if (mods.boblogistics and apm_power_compat_bob) or (mods.angelspetrochem and apm_power_compat_angel) then
	apm.lib.utils.storage_tank.set.hidden('apm_valve_0')
	apm.lib.utils.storage_tank.set.hidden('apm_valve_1')
	apm.lib.utils.storage_tank.set.hidden('apm_valve_2')
end