require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/crusher.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_crusher_drums'
item.icons = {
    apm.power.icons.crusher_drums
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ac_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_crusher_drums_used'
item.icons = {
    apm.power.icons.crusher_drums_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ac_b'
data:extend({item})
