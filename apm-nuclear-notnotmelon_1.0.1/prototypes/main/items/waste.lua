require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/waste.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_radioactive_waste'
item.icons = {
    apm.nuclear.icons.waste_radioactive
}
item.stack_size = 2000
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_waste_products"
item.order = 'ac_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
