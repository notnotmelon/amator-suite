require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/equipment.lua'

APM_LOG_HEADER(self)

local apm_nuclear_fission_reactor_overhaul = settings.startup["apm_nuclear_fission_reactor_overhaul"].value

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_fission_reactor_overhaul', apm_nuclear_fission_reactor_overhaul)

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobvehicleequipment and apm_nuclear_compat_bob then
    local rtg = data.raw['generator-equipment']['apm_rtg_radioisotope_thermoelectric_generator']
    table.insert(rtg.categories, 'vehicle')
end

if mods.bobequipment and apm_nuclear_compat_bob and apm_nuclear_fission_reactor_overhaul then
    apm.lib.utils.item.overwrite.localised_name('fusion-reactor-equipment-2', {"equipment-name.apm_fission_reactor", 'MK2'})
    apm.nuclear.update_fission_equipment('fusion-reactor-equipment-2', 2)

    apm.lib.utils.item.overwrite.localised_name('fusion-reactor-equipment-3', {"equipment-name.apm_fission_reactor", 'MK3'})
    apm.nuclear.update_fission_equipment('fusion-reactor-equipment-3', 3)

    apm.lib.utils.item.overwrite.localised_name('fusion-reactor-equipment-4', {"equipment-name.apm_fission_reactor", 'MK4'})
    apm.nuclear.update_fission_equipment('fusion-reactor-equipment-4', 4)
end