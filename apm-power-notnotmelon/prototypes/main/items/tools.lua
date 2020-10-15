require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/tools.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_saw_blade_iron'
item.icons = {
    apm.power.icons.saw_blade_iron
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ae_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_saw_blade_iron_used'
item.icons = {
    apm.power.icons.saw_blade_iron_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ae_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_saw_blade_steel'
item.icons = {
    apm.power.icons.saw_blade_steel
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'af_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_saw_blade_steel_used'
item.icons = {
    apm.power.icons.saw_blade_steel_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'af_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
