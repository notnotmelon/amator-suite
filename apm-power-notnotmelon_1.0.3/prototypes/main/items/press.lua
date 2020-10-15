require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/press.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_press_plates'
item.icons = {
    apm.power.icons.press_plates
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ad_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_press_plates_used'
item.icons = {
    apm.power.icons.press_plates_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_tools"
item.order = 'ad_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
