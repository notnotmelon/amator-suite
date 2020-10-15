require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/tiles.lua'

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

-- tile resorting -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

apm.lib.utils.tile.set.relation('apm_asphalt', 'stone-path', 0)
apm.lib.utils.tile.set.relation('stone-path', 'apm_asphalt', 1)

if mods.angelssmelting and apm_power_compat_angel then
	apm.lib.utils.tile.set.relation('clay-bricks', 'stone-path', 1)
	apm.lib.utils.tile.set.relation('concrete', 'clay-bricks', 1)
else
    apm.lib.utils.tile.set.relation('concrete', 'stone-path', 1)
end

if mods.PyCoalTBaA and apm_power_compat_kingarthur then
    apm.lib.utils.tile.set.relation('py-asphalt', 'concrete', 1)
    apm.lib.utils.tile.set.relation('py-limestone', 'py-asphalt', 1)
    apm.lib.utils.tile.set.relation('py-coal-tile', 'py-limestone', 1)
    apm.lib.utils.tile.set.relation('py-iron', 'py-coal-tile', 1)
    apm.lib.utils.tile.set.relation('py-steel', 'py-iron', 1)
    apm.lib.utils.tile.set.relation('py-aluminium', 'py-aluminium', 1)
    apm.lib.utils.tile.set.relation('py-iron-oxide', 'py-iron-oxide', 1)
    apm.lib.utils.tile.set.relation('py-nexelit', 'py-iron-oxide', 1)
    apm.lib.utils.tile.set.relation('hazard-concrete-left', 'py-nexelit', 1)
    apm.lib.utils.tile.set.relation('hazard-concrete-right', 'py-nexelit', 1)
else
    apm.lib.utils.tile.set.relation('hazard-concrete-left', 'concrete', 1)
    apm.lib.utils.tile.set.relation('hazard-concrete-right', 'concrete', 1)
end

apm.lib.utils.tile.set.relation('refined-concrete', 'hazard-concrete-right', 1)
apm.lib.utils.tile.set.relation('refined-hazard-concrete-left', 'refined-concrete', 1)
apm.lib.utils.tile.set.relation('refined-hazard-concrete-right', 'refined-concrete', 1)
apm.lib.utils.tile.set.relation('lab-dark-1', 'refined-hazard-concrete-right', 1)
apm.lib.utils.tile.set.relation('lab-dark-2', 'refined-hazard-concrete-right', 1)
apm.lib.utils.tile.set.relation('lab-white', 'refined-hazard-concrete-right', 1)
apm.lib.utils.tile.set.relation('tutorial-grid', 'lab-white', 1)

if mods['space-exploration'] and apm_power_compat_earendel then
	apm.lib.utils.tile.set.relation('se-regolith', 'tutorial-grid', 1)
	apm.lib.utils.tile.set.relation('se-space-platform-scaffold', 'se-regolith', 1)
	apm.lib.utils.tile.set.relation('se-space-platform-plating', 'se-space-platform-scaffold', 1)
	apm.lib.utils.tile.set.relation('se-spaceship-floor', 'se-space-platform-plating', 1)
end

-- kingarthur -----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.PyCoalTBaA and apm_power_compat_kingarthur then
    apm.lib.utils.tile.unification('py-asphalt', 'apm_asphalt')
end