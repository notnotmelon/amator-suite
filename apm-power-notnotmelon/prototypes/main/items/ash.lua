require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/ash.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_generic_ash'
item.icons = {
    apm.power.icons.generic_ash
}
item.stack_size = 2000
item.group = "apm_power"
item.subgroup = "apm_power_ash"
item.order = 'aa_a'
data:extend({item})
