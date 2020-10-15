require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/updates.lua'

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
if mods.apm_recycling then
    apm.lib.utils.recycling.scrap.add({recipe='apm_fuel_rod_container', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_fuel_rod_container_maintenance', metal='steel'})

    apm.lib.utils.recycling.scrap.add({recipe='apm_breeder_container', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_breeder_container', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_breeder_container_worn_maintenance', metal='copper'})

    apm.lib.utils.recycling.scrap.add({recipe='apm_waste_container', metal='iron'})

    apm.lib.utils.recycling.scrap.add({recipe='apm_rtg_radioisotope_thermoelectric_generator', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_rtg_radioisotope_thermoelectric_generator', metal='copper'})

    if mods.bobplates and mods.bobores then
        apm.lib.utils.recycling.scrap.remove('apm_waste_container')
        apm.lib.utils.recycling.scrap.add({recipe='apm_waste_container', metal='lead'})
    end
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['aai-vehicles-miner'] and apm_nuclear_compat_earendel then
    apm.nuclear.nuclear_vehicle('vehicle-miner-mk5')
end

-- Reverse Factory ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['reverse-factory'] and apm_nuclear_compat_reverse_factory then

    local function exclude(recipe_name)
        if rf and rf.norecycle_items then  
            table.insert(rf.norecycle_items, recipe_name)
            log('Info: add recipe: "' ..tostring(recipe_name).. '" to rf.norecycle_items')
        end
    end

    exclude('hot_water_cooling')
    exclude('apm_hexafluoride_007')
    exclude('apm_hexafluoride_012')
    exclude('apm_hexafluoride_017')
    exclude('apm_hexafluoride_022')
    exclude('apm_hexafluoride_027')
    exclude('apm_hexafluoride_032')
    exclude('apm_hexafluoride_037')
    exclude('apm_hexafluoride_042')
    exclude('apm_hexafluoride_047')
    exclude('apm_oxide_pellet_u238')
    exclude('uranium-238')
    exclude('apm_oxide_pellet_u235')
    exclude('uranium-235')
    exclude('apm_oxide_pellet_th232')
    exclude('apm_fluorite_ore')
    exclude('apm_bromine_trifluoride')
    exclude('apm_bromine')
    exclude('apm_yellowcake')
    exclude('apm_fuel_rod_container_maintenance')
    exclude('apm_breeder_container_worn_maintenance')
    exclude('apm_fuel_rod_mox')
    exclude('apm_fuel_rod_mox_cooling')
    exclude('apm_fuel_rod_mox_recovery_stage_a')
    exclude('apm_fuel_rod_mox_recovery_stage_b')
    exclude('apm_fuel_rod_neptunium')
    exclude('apm_fuel_rod_neptunium_cooling')
    exclude('apm_fuel_cell_neptunium_recovery_stage_a')
    exclude('apm_fuel_cell_neptunium_recovery_stage_b')
    exclude('apm_fuel_rod_thorium')
    exclude('apm_fuel_cell_thorium_cooling')
    exclude('apm_fuel_cell_thorium_recovery_stage_a')
    exclude('apm_fuel_cell_thorium_recovery_stage_b')
    exclude('apm_breeder_thorium')
    exclude('apm_breeder_thorium_cooling')
    exclude('apm_breeder_thorium_unloading')
    exclude('apm_breeder_thorium_seperation_process_a')
    exclude('apm_breeder_thorium_seperation_process_b')
    exclude('apm_fuel_rod_uranium')
    exclude('uranium-fuel-cell')
    exclude('apm_fuel_rod_uranium_cooling')
    exclude('apm_fuel_rod_uranium_recovery_stage_a')
    exclude('apm_fuel_rod_uranium_recovery_stage_b')
    exclude('apm_breeder_uranium')
    exclude('apm_breeder_uranium_cooling')
    exclude('apm_breeder_uranium_unloading')
    exclude('apm_breeder_uranium_seperation_process_a')
    exclude('apm_breeder_uranium_seperation_process_b')
    exclude('apm_radioactive_wastewater_recyling')
end
