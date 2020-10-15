require('lib.log')

local self = 'apm_lib/lib/definitions.lua'

APM_LOG_HEADER(self)

if apm.lib.icons == nil then apm.lib.icons = {} end
if apm.lib.icons.path == nil then apm.lib.icons.path = {} end
if apm.lib.icons.dynamics == nil then apm.lib.icons.dynamics = {} end
if apm.lib.icons.dynamics.machine == nil then apm.lib.icons.dynamics.machine = {} end
if apm.lib.icons.signal == nil then apm.lib.icons.signal = {} end

-- Icon path ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.icons.path.dummy = '__apm-lib-notnotmelon__/graphics/icons/apm_dummy.png'
apm.lib.icons.path.empty_32 = '__apm_resource_pack__/graphics/icons/dynamics/apm_empty_32.png'
apm.lib.icons.path.empty_64 = '__apm_resource_pack__/graphics/icons/dynamics/apm_empty_64.png'
apm.lib.icons.path.air = '__apm_resource_pack__/graphics/icons/apm_air.png'
apm.lib.icons.path.chemical_flame_1 = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_1.png'
apm.lib.icons.path.chemical_flame_2 = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_2.png'
apm.lib.icons.path.chemical_flame_3 = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_3.png'
apm.lib.icons.path.chemical_flame_4 = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_4.png'
apm.lib.icons.path.recipe_t1 = '__apm_resource_pack__/graphics/icons/dynamics/apm_tier_1.png'
apm.lib.icons.path.recipe_t2 = '__apm_resource_pack__/graphics/icons/dynamics/apm_tier_2.png'
apm.lib.icons.path.recipe_t3 = '__apm_resource_pack__/graphics/icons/dynamics/apm_tier_3.png'
apm.lib.icons.path.recipe_t4 = '__apm_resource_pack__/graphics/icons/dynamics/apm_tier_4.png'
apm.lib.icons.path.recipe_t5 = '__apm_resource_pack__/graphics/icons/dynamics/apm_tier_5.png'
apm.lib.icons.path.smelting = '__apm_resource_pack__/graphics/icons/dynamics/apm_smelting.png'
apm.lib.icons.path.crushed = '__apm_resource_pack__/graphics/icons/dynamics/apm_crushed.png'
apm.lib.icons.path.crushed_bg_w = '__apm_resource_pack__/graphics/icons/dynamics/apm_crushed_bg_w.png'
apm.lib.icons.path.chunk = '__apm_resource_pack__/graphics/icons/dynamics/apm_chunk.png'
apm.lib.icons.path.chunk_bg_w = '__apm_resource_pack__/graphics/icons/dynamics/apm_chunk_bg_w.png'
apm.lib.icons.path.briquette ='__apm_resource_pack__/graphics/icons/dynamics/apm_briquette.png'
apm.lib.icons.path.briquette_bg_w ='__apm_resource_pack__/graphics/icons/dynamics/apm_briquette_bg_w.png'
apm.lib.icons.path.dust = '__apm_resource_pack__/graphics/icons/dynamics/apm_dust.png'
apm.lib.icons.path.heap = '__apm_resource_pack__/graphics/icons/dynamics/apm_heap.png'
apm.lib.icons.path.signal_burnt_result = '__apm-lib-notnotmelon__/graphics/icons/signals/burnt_result.png'
apm.lib.icons.path.signal_radioactive = '__apm-lib-notnotmelon__/graphics/icons/signals/radioactive.png'
apm.lib.icons.path.signal_info = '__apm-lib-notnotmelon__/graphics/icons/signals/info.png'
apm.lib.icons.path.signal_warning = '__apm-lib-notnotmelon__/graphics/icons/signals/warning.png'
apm.lib.icons.path.signal_bullet_point = '__apm-lib-notnotmelon__/graphics/icons/signals/bullet_point.png'
apm.lib.icons.path.cooling = '__apm_resource_pack__/graphics/icons/dynamics/apm_cooling.png'
apm.lib.icons.path.temp_down = '__apm_resource_pack__/graphics/icons/dynamics/apm_temp_down.png'
apm.lib.icons.path.temp_up = '__apm_resource_pack__/graphics/icons/dynamics/apm_temp_up.png'

apm.lib.icons.path.equipment_manager_enabled = '__apm-lib-notnotmelon__/graphics/icons/equipment_manager_enabled.png'
apm.lib.icons.path.equipment_manager_enabled_small = '__apm-lib-notnotmelon__/graphics/icons/equipment_manager_enabled_small.png'
apm.lib.icons.path.equipment_manager_disabled = '__apm-lib-notnotmelon__/graphics/icons/equipment_manager_disabled.png'
apm.lib.icons.path.equipment_manager_disabled_small = '__apm-lib-notnotmelon__/graphics/icons/equipment_manager_disabled_small.png'
-- Icons ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.icons.chunk_bg_w = {icon=apm.lib.icons.path.chunk_bg_w, icon_size=64}
apm.lib.icons.crushed_bg_w = {icon=apm.lib.icons.path.crushed_bg_w, icon_size=64}
apm.lib.icons.briquette_bg_w = {icon=apm.lib.icons.path.briquette_bg_w, icon_size=64}
apm.lib.icons.dummy = {icon=apm.lib.icons.path.dummy, icon_size=32}
apm.lib.icons.dynamics.empty_32 = {icon=apm.lib.icons.path.empty_32, icon_size=32}
apm.lib.icons.dynamics.empty_64 = {icon=apm.lib.icons.path.empty_64, icon_size=64}
apm.lib.icons.dynamics.air = {icon = apm.lib.icons.path.air, icon_size=64}
apm.lib.icons.dynamics.recycling = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_recycling.png', scale = 0.4, shift = {6,-6}, icon_size=64}
apm.lib.icons.dynamics.radioactive = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_radioactive.png', scale = 0.7, shift = {6,-6}, icon_size=32}
apm.lib.icons.dynamics.red_input = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_red_input.png', icon_size=32}
apm.lib.icons.dynamics.red_output = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_red_output.png', icon_size=32}
apm.lib.icons.dynamics.purple_input = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_purple_input.png', icon_size=32}
apm.lib.icons.dynamics.purple_output = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_purple_output.png', icon_size=32}
apm.lib.icons.dynamics.smelting = {icon = apm.lib.icons.path.smelting, icon_size=64, scale = 0.35, shift = {6,-6}}
apm.lib.icons.dynamics.t1 = {icon = apm.lib.icons.path.recipe_t1, icon_size=64}
apm.lib.icons.dynamics.t2 = {icon = apm.lib.icons.path.recipe_t2, icon_size=64}
apm.lib.icons.dynamics.t3 = {icon = apm.lib.icons.path.recipe_t3, icon_size=64}
apm.lib.icons.dynamics.t4 = {icon = apm.lib.icons.path.recipe_t4, icon_size=64}
apm.lib.icons.dynamics.t5 = {icon = apm.lib.icons.path.recipe_t5, icon_size=64}
apm.lib.icons.dynamics.machine.t0 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_base_0.png', icon_size=64}
apm.lib.icons.dynamics.machine.t1 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_base_1.png', icon_size=64}
apm.lib.icons.dynamics.machine.t2 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_base_2.png', icon_size=64}
apm.lib.icons.dynamics.machine.t3 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_base_3.png', icon_size=64}
apm.lib.icons.dynamics.lable_a = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_a.png', icon_size=64}
apm.lib.icons.dynamics.lable_ac = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_ac.png', icon_size=64}
apm.lib.icons.dynamics.lable_c = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_c.png', icon_size=64}
apm.lib.icons.dynamics.lable_ce = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_ce.png', icon_size=64}
apm.lib.icons.dynamics.lable_co = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_co.png', icon_size=64}
apm.lib.icons.dynamics.lable_cp = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_cp.png', icon_size=64}
apm.lib.icons.dynamics.lable_cr = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_cr.png', icon_size=64}
apm.lib.icons.dynamics.lable_gh = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_gh.png', icon_size=64}
apm.lib.icons.dynamics.lable_l = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_l.png', icon_size=64}
apm.lib.icons.dynamics.lable_p = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_p.png', icon_size=64}
apm.lib.icons.dynamics.lable_pf = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_pf.png', icon_size=64}
apm.lib.icons.dynamics.lable_r = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_r.png', icon_size=64}
apm.lib.icons.dynamics.lable_si = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_si.png', icon_size=64}
apm.lib.icons.dynamics.lable_sw = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_sw.png', icon_size=64}
apm.lib.icons.dynamics.lable_lightning = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_machine_lable_lightning.png', icon_size=64}
apm.lib.icons.dynamics.chemical_flame_1 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_1.png', icon_size=64}
apm.lib.icons.dynamics.chemical_flame_2 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_2.png', icon_size=64}
apm.lib.icons.dynamics.chemical_flame_3 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_3.png', icon_size=64}
apm.lib.icons.dynamics.chemical_flame_4 = {icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_chemical_flame_4.png', icon_size=64}
apm.lib.icons.dynamics.cooling = {icon=apm.lib.icons.path.cooling, scale = 0.4, shift = {6,-6}, icon_size=64}
apm.lib.icons.dynamics.temp_down = {icon=apm.lib.icons.path.temp_down, icon_size=64}
apm.lib.icons.dynamics.temp_up = {icon=apm.lib.icons.path.temp_up, icon_size=64}
apm.lib.icons.signal.burnt_result = {icon=apm.lib.icons.path.signal_burnt_result, icon_size=64}
apm.lib.icons.signal.radioactive = {icon=apm.lib.icons.path.signal_radioactive, icon_size=64}
apm.lib.icons.signal.info = {icon=apm.lib.icons.path.signal_info, icon_size=64}
apm.lib.icons.signal.warning = {icon=apm.lib.icons.path.signal_warning, icon_size=64}
apm.lib.icons.signal.bullet_point = {icon=apm.lib.icons.path.signal_bullet_point, icon_size=64}