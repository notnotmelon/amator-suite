-- startup --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
data:extend({
    {type = "string-setting", name = "apm_lib_log_level", setting_type = "startup", allow_blank  = false, allowed_values = {'0: Error', '1: Warning', '2: Info'}, default_value = '0: Error', order='aa_a'}
})

-- runtime-global -------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local setting = {type = "bool-setting", name = "apm_lib_inserter_functions", setting_type = "runtime-global", default_value = true, order='aa_a'}
if mods.apm_power then
    setting.default_value = true
    log('Info: settings.lua: apm_lib_inserter_functions.default_value is: true')
else
    setting.default_value = false
    log('Info: settings.lua: apm_lib_inserter_functions.default_value is: false')
end
data:extend({setting})

data:extend({
    {type = "int-setting", name = "apm_lib_inserter_iterations_01759", setting_type = "runtime-global", minimum_value = 0, maximum_value = 100, default_value = 15, order='aa_b'},
    {type = "string-setting", name = "apm_lib_inserter_valid_targets", setting_type = "runtime-global", default_value = 'assembling-machine, furnace, lab, mining-drill, boiler, pump', order='aa_c'},
    {type = "bool-setting", name = "apm_lib_storage_spit_out", setting_type = "runtime-global", default_value = true, order='ab_a'},
    {type = "bool-setting", name = "apm_lib_storage_spit_out_mark_deconstruct", setting_type = "runtime-global", default_value = true, order='ab_b'},
    {type = "int-setting", name = "apm_lib_storage_spit_out_iterations", setting_type = "runtime-global", minimum_value = 1, default_value = 48, order='ab_c'},
    {type = "bool-setting", name = "apm_lib_radiation_dmg", setting_type = "runtime-global", default_value = true, order='ac_a'},
    {type = "double-setting", name = "apm_lib_radiation_dmg_multiplier", setting_type = "runtime-global", minimum_value = 0.1, default_value = 1.0, order='ac_b'},
})

-- runtime-per-user -----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
data:extend({
    {type = "bool-setting", name = "apm_lib_burner_equipment_alerts_sound", setting_type = "runtime-per-user", default_value = true, order='aa_a'},
})