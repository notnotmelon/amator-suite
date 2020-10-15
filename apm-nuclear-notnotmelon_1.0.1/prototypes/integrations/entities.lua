require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/entities.lua'

APM_LOG_HEADER(self)

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)

-- apm ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.apm_power then
    if not mods.ScienceCostTweakerM or not apm_nuclear_compat_sctm then
        apm.lib.utils.lab.add.science_pack('apm_lab_1', 'apm_nuclear_science_pack')
    end
end

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobassembly and apm_nuclear_compat_bob then
    apm.lib.utils.furnace.mod.category.add('electric-furnace-2', 'apm_electric_smelting')
    apm.lib.utils.furnace.mod.category.add('electric-furnace-3', 'apm_electric_smelting')
    apm.lib.utils.assembler.mod.category.add('electric-chemical-mixing-furnace', 'apm_electric_smelting')
    apm.lib.utils.assembler.mod.category.add('electric-chemical-mixing-furnace-1', 'apm_electric_smelting')
    apm.lib.utils.assembler.mod.category.add('electric-mixing-furnace', 'apm_electric_smelting')
    apm.lib.utils.assembler.mod.category.add('chemical-furnace', 'apm_electric_smelting')
end

if mods.bobtech and apm_nuclear_compat_bob then
    apm.lib.utils.lab.add.science_pack('lab-2', 'apm_nuclear_science_pack')
end

-- MFerrari -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['Mining-Space-Industries'] and apm_nuclear_compat_mferrari then
    apm.lib.utils.lab.add.science_pack('msi-worker-lab', 'apm_nuclear_science_pack')
end

-- sctm -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.ScienceCostTweakerM and apm_nuclear_compat_sctm then
    apm.lib.utils.lab.add.science_pack('sct-lab-t3', 'apm_nuclear_science_pack')
    apm.lib.utils.lab.add.science_pack('sct-lab-t4', 'apm_nuclear_science_pack')
end

-- RealisticReactors ----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.RealisticReactors and apm_nuclear_compat_realistic_reactors then
    apm.lib.utils.furnace.mod.category.add('rr-cooling-tower', 'apm_fluid_cooling_0')

    if not apm_nuclear_compat_realistic_reactors_cooling_tower then
        apm.lib.utils.furnace.set.hidden('rr-cooling-tower')
    else
        apm.lib.utils.furnace.set.hidden('apm_hybrid_cooling_tower_0')
    end
end
