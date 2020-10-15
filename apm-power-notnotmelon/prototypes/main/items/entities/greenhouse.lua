require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/greenhouse.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_greenhouse_0'
item.icons = {
    apm.lib.icons.dynamics.machine.t0,
    apm.lib.icons.dynamics.lable_gh
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_1"
item.order = 'aa_a'
item.place_result = "apm_greenhouse_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_greenhouse_1'
item.icons = {
    apm.lib.icons.dynamics.machine.t1,
    apm.lib.icons.dynamics.lable_gh
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_3"
item.order = 'aa_a'
item.place_result = "apm_greenhouse_1"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_greenhouse_2'
item.icons = {
    apm.lib.icons.dynamics.machine.t2,
    apm.lib.icons.dynamics.lable_gh
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_4"
item.order = 'aa_a'
item.place_result = "apm_greenhouse_2"
data:extend({item})