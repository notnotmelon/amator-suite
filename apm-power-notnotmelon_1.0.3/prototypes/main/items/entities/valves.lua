require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/valves.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_valve_0'
item.icons = {
    apm.power.icons.valve_0
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'ca_a'
item.place_result = "apm_valve_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_valve_1'
item.icons = {
    apm.power.icons.valve_1
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'cb_a'
item.place_result = "apm_valve_1"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_valve_2'
item.icons = {
    apm.power.icons.valve_2
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'cb_a'
item.place_result = "apm_valve_2"
data:extend({item})