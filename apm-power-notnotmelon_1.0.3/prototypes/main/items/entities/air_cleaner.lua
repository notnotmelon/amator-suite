require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/air_cleaner.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_air_cleaner_machine_0'
item.icons = {
    apm.lib.icons.dynamics.machine.t1,
    apm.lib.icons.dynamics.lable_ac
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_3"
item.order = 'ac_a'
item.place_result = "apm_air_cleaner_machine_0"
data:extend({item})
