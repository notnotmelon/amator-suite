-- Locals ---------------------------------------------------------------------
--
--
-------------------------------------------------------------------------------
local fuel_value_exclude_list = {['PyCoalTBaA'] = true}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function is_mod_on_exclude_list()
    for mod_name, _ in pairs(mods) do
        if fuel_value_exclude_list[mod_name] then
            return true
        end
    end
    return false
end

-- dynamic startup settings ---------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if not is_mod_on_exclude_list() then
    data:extend({
        {type = "double-setting", name = "apm_power_coal_value_01779", setting_type = "startup", minimum_value = 0.1, maximum_value = 50, default_value = 3.2, order='aa_a'}
    })
else
    log('Info: settings.lua: setting for fuel values disabled, because of the present of a mod on the "fuel_value_exclude_list"')
end

-- startup settings -----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
data:extend({
  {type = "bool-setting", name = "apm_power_overhaul_machine_frames", setting_type = "startup", default_value = true, order='ab_a'},
  {type = "bool-setting", name = "apm_power_steam_assembler_craftin_with_fluids", setting_type = "startup", default_value = false, order='ac_a'},
  {type = "bool-setting", name = "apm_power_always_show_made_in", setting_type = "startup", default_value = true, order='ad_a'},
  {type = "bool-setting", name = "apm_power_inherit_industrial_science", setting_type = "startup", default_value = true, order='ae_a'},
  {type = "bool-setting", name = "apm_power_inherit_steam_science", setting_type = "startup", default_value = true, order='ae_b'},

  {type = "bool-setting", name = "apm_power_compat_bob", setting_type = "startup", default_value = false, order='pa_a'},
  {type = "bool-setting", name = "apm_power_compat_bob_overhaul_machine_frames", setting_type = "startup", default_value = false, order='pa_b'},
  {type = "bool-setting", name = "apm_power_compat_angel", setting_type = "startup", default_value = false, order='pb_a'},
  {type = "bool-setting", name = "apm_power_compat_angel_overhaul_machine_frames", setting_type = "startup", default_value = false, order='pb_b'},
  {type = "bool-setting", name = "apm_power_compat_angel_overwrite_crystal_saw_blades", setting_type = "startup", default_value = false, order='pb_c'},
  {type = "bool-setting", name = "apm_power_compat_sctm", setting_type = "startup", default_value = false, order='pc_a'},
  {type = "bool-setting", name = "apm_power_compat_sct_overhaul_machine_frames", setting_type = "startup", default_value = false, order='pc_b'},
  {type = "bool-setting", name = "apm_power_compat_earendel", setting_type = "startup", default_value = false, order='pd_a'},
  {type = "bool-setting", name = "apm_power_compat_bio_industries", setting_type = "startup", default_value = false, order='pe_a'},
  {type = "bool-setting", name = "apm_power_compat_expensivelandfillrecipe", setting_type = "startup", default_value = false, order='pf_a'},
  {type = "bool-setting", name = "apm_power_compat_kingarthur", setting_type = "startup", default_value = false, order='pg_a'},
  {type = "bool-setting", name = "apm_power_compat_mferrari", setting_type = "startup", default_value = false, order='ph_a'},
  {type = "bool-setting", name = "apm_power_compat_linver", setting_type = "startup", default_value = false, order='pi_a'},
  {type = "bool-setting", name = "apm_power_compat_realistic_reactors", setting_type = "startup", default_value = false, order='pj_a'},
  {type = "bool-setting", name = "apm_power_compat_reverse_factory", setting_type = "startup", default_value = false, order='pk_a'},
  {type = "bool-setting", name = "apm_power_compat_suicidalkid", setting_type = "startup", default_value = false, order='pl_a'},
  {type = "bool-setting", name = "apm_power_compat_kumpu", setting_type = "startup", default_value = false, order='pm_a'},
  {type = "bool-setting", name = "apm_power_compat_arcitos", setting_type = "startup", default_value = false, order='pn_a'},
})

-- runtime-global settings ----------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
data:extend({
    {type = "bool-setting", name = "apm_power_starter_armor", setting_type = "runtime-global", default_value = true, order='aa_a'},
})