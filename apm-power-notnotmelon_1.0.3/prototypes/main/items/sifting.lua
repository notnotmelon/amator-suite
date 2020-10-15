require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/sifting.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_dry_mud'
item.icons = {
    apm.power.icons.mud_dry
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_sifting"
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
item.name = 'apm_sieve_iron'
item.icons = {
    apm.power.icons.sieve_iron,
    apm.power.icons.sieve_handel
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_sifting"
item.order = 'ab_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_sieve_copper'
item.icons = {
    apm.power.icons.sieve_copper,
    apm.power.icons.sieve_handel
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_sifting"
item.order = 'ab_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
