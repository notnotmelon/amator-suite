require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/furnaces.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_puddling_furnace_0'
item.icons = {
    apm.lib.icons.dynamics.machine.t0,
    apm.lib.icons.dynamics.lable_pf
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_1"
item.order = 'ab_a'
item.place_result = "apm_puddling_furnace_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_steelworks_0'
item.icons = {
    apm.lib.icons.dynamics.machine.t2,
    apm.lib.icons.dynamics.lable_sw
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_4"
item.order = 'ag_a'
item.place_result = "apm_steelworks_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_steelworks_1'
item.icons = {
    apm.lib.icons.dynamics.machine.t3,
    apm.lib.icons.dynamics.lable_sw
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_5"
item.order = 'ag_a'
item.place_result = "apm_steelworks_1"
data:extend({item})