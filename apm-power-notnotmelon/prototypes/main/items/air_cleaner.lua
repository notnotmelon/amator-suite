require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/air_cleaner.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_filter_charcoal'
item.icons = {
    apm.power.icons.filter_charcoal
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ab_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_filter_charcoal_used'
item.icons = {
    apm.power.icons.filter_charcoal_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ab_b'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_ammonium_sulfate'
item.icons = {
    apm.power.icons.ammonium_sulfate
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_greenhouse"
item.order = 'ab_c'
data:extend({item})
