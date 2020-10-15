require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/hexafluoride.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_yellowcake'
item.icons = {
    apm.nuclear.icons.yellowcake
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_chemistry"
item.order = 'aa_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_potassium_bromide'
item.icons = {
    apm.nuclear.icons.potassium_bromide
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_chemistry"
item.order = 'ab_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
