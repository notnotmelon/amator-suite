require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/modules.lua'

APM_LOG_HEADER(self)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function ParticleFilter(i)
    local bonus = 0.075 * i * -1
    
    local item = {}
    item.type = "module"
    item.name = "apm_particle_filter_" .. i
    item.category = "pollution-clean"
    item.localised_name = {"item-name.apm_particle_filter", tostring(i)}
    item.localised_description = {"item-description.apm_particle_filter"}
    item.icons = {
        {icon=apm.power.icons.path.particle_filter_module .. tostring(i) .. '.png', icon_size=64}
    }
    item.tier = i
    item.group = "apm_power"
    item.subgroup = "apm_power_modules"
    item.order = 'aa_a[' .. i .. ']'
    item.stack_size = 100
    item.default_request_amount = 10
    item.effect = {pollution = {bonus = bonus}}
    data:extend({item})
end

-- Action ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
for i = 1,3 do
    ParticleFilter(i)
end