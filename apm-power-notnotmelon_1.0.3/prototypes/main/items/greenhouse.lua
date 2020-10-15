require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/greenhouse.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_tree_seeds'
item.icons = {
    apm.power.icons.tree_seeds
}
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_greenhouse"
item.order = 'ab_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fertiliser_1'
item.icons = {
    apm.power.icons.fertiliser_1
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_greenhouse"
item.order = 'ab_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fertiliser_2'
item.icons = {
    apm.power.icons.fertiliser_2
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_greenhouse"
item.order = 'ab_c'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
