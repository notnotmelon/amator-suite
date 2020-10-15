require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/technologies-overwrite.lua'

APM_LOG_HEADER(self)

--atomic-bomb
apm.lib.utils.technology.remove.prerequisites('atomic-bomb', 'kovarex-enrichment-process')
apm.lib.utils.technology.add.prerequisites('atomic-bomb', 'apm_nuclear_science_pack')
apm.lib.utils.technology.add.prerequisites('atomic-bomb', 'nuclear-fuel-reprocessing')
apm.lib.utils.technology.add.science_pack('atomic-bomb', 'apm_nuclear_science_pack', 1)

--uranium-processing
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_fluorite_ore')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_yellowcake')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_potassium_bromide')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_bromine')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_bromine_trifluoride')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_waste_container')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_radioactive_wastewater_recyling')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_007')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_012')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_017')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_022')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_027')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_032')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_037')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_042')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_hexafluoride_047')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_oxide_pellet_u238')
apm.lib.utils.technology.add.recipe_for_unlock('uranium-processing', 'apm_oxide_pellet_u235')

--nucular power
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-power', 'apm_fuel_rod_container')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-power', 'apm_fuel_rod_uranium')

--nuclear-fuel-reprocessing
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_cooling_pond_0')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_hybrid_cooling_tower_0')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_container_maintenance')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_uranium_cooling')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_uranium_recovery_stage_a')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_mox')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_mox_cooling')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_mox_recovery_stage_a')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'hot_water_cooling')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'steam_condensing')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_nuclear_ash')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_phosphorus')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_trimethyl_phosphate')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_tbp_30')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_uranium_recovery_stage_b')
apm.lib.utils.technology.add.recipe_for_unlock('nuclear-fuel-reprocessing', 'apm_fuel_rod_mox_recovery_stage_b')
apm.lib.utils.technology.remove.science_pack('nuclear-fuel-reprocessing', 'production-science-pack', 1)
apm.lib.utils.technology.remove.prerequisites('nuclear-fuel-reprocessing', 'production-science-pack')
apm.lib.utils.technology.add.prerequisites('nuclear-fuel-reprocessing', 'apm_nuclear_science_pack')
apm.lib.utils.technology.add.science_pack('nuclear-fuel-reprocessing', 'apm_nuclear_science_pack', 1)
apm.lib.utils.technology.mod.unit_count('nuclear-fuel-reprocessing', 150)

-- fusion-reactor-equipment
--apm.lib.utils.technology.add.prerequisites('fusion-reactor-equipment', 'apm_nuclear_rtg')
apm.lib.utils.technology.add.prerequisites('fusion-reactor-equipment', 'apm_nuclear_science_pack')
apm.lib.utils.technology.add.science_pack('fusion-reactor-equipment', 'apm_nuclear_science_pack', 1)
apm.lib.utils.technology.add.recipe_for_unlock('fusion-reactor-equipment', 'apm_shielded_nuclear_fuel_cell')
apm.lib.utils.technology.add.recipe_for_unlock('fusion-reactor-equipment', 'apm_shielded_nuclear_fuel_cell_reprocessing')

-- space-science-pack
--apm.lib.utils.technology.add.prerequisites('space-science-pack', 'apm_nuclear_science_pack')
apm.lib.utils.technology.add.prerequisites('space-science-pack', 'apm_nuclear_rtg')
apm.lib.utils.technology.add.science_pack('space-science-pack', 'apm_nuclear_science_pack', 1)

--kovarex-enrichment-process
apm.lib.utils.technology.disable('kovarex-enrichment-process')

-- uranium-ammo
--apm.lib.utils.technology.add.prerequisites('uranium-ammo', 'apm_depleted_uranium')
apm.lib.utils.technology.add.prerequisites('uranium-ammo', 'apm_nuclear_science_pack')
apm.lib.utils.technology.add.science_pack('uranium-ammo', 'apm_nuclear_science_pack', 1)
