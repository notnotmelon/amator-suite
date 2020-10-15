require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/shielded_nuclear_fuel.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_shielded_nuclear_fuel_cell'
item.icons = {
    apm.nuclear.icons.shielded_nuclear_fuel_cell
}
item.stack_size = 10
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'af_a'
item.fuel_category = 'apm_nuclear_shielded_cell'
item.burnt_result = "apm_shielded_nuclear_fuel_cell_used"
item.fuel_value = apm.nuclear.constants.fuel_value.shielded_nuclear_fuel
item.fuel_glow_color = apm.nuclear.color.fuel_glow.shielded_nuclear_fuel
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_shielded_nuclear_fuel_cell_used'
item.icons = {
    apm.nuclear.icons.shielded_nuclear_fuel_cell_used
}
item.stack_size = 10
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'af_b'
data:extend({item})