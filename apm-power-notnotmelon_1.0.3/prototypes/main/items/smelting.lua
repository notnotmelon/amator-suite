require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/smelting.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_stone_crucible_raw'
item.icons = {
    apm.power.icons.crucible_raw
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_smelting"
item.order = 'aa_c'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_stone_crucible'
item.icons = {
    apm.power.icons.crucible
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_smelting"
item.order = 'aa_c'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})