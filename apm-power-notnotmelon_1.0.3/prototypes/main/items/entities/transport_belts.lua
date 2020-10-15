require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/transport_belts.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_basic_transport_belt'
item.icon = "__base__/graphics/icons/transport-belt.png"
--item.icons = {
--    apm.lib.icons.dynamics.machine.t1,
--    apm.lib.icons.dynamics.lable_si
--}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'aa_a'
item.place_result = "apm_basic_transport_belt"
data:extend({item})