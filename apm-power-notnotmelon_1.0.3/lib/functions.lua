require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/lib/functions.lua'

APM_LOG_HEADER(self)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.power.machine_frame_addition(recipe_name, level_in, level_out, amount_in, amount_out, ov)
    if not apm.lib.utils.setting.get.starup('apm_power_overhaul_machine_frames') and not ov then return end

    local frame_in = {
        [1] = 'apm_machine_frame_basic',
        [2] = 'apm_machine_frame_steam',
        [3] = 'apm_machine_frame_advanced'
    }
    local frame_out = {
        [1] = 'apm_machine_frame_basic_used',
        [2] = 'apm_machine_frame_steam_used',
        [3] = 'apm_machine_frame_advanced_used'
    }

    apm.lib.utils.recipe.ingredient.mod(recipe_name, frame_in[level_in], amount_in, amount_in+2)
    if amount_out then
        apm.lib.utils.recipe.result.mod(recipe_name, frame_out[level_out], amount_out)
    end
end