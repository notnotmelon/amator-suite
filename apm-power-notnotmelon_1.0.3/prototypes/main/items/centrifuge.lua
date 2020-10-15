require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/centrifuge.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_wet_mud'
item.icons = {
     apm.power.icons.mud_wet
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_fluid"
item.order = 'ad_b'
data:extend({item})
