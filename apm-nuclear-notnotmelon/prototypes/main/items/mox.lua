require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/mox.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_mox'
item.icons = {
    apm.nuclear.icons.fuel_container_mox
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_fuel"
item.order = 'ab_a'
item.fuel_category = 'apm_nuclear_mox'
item.burnt_result = "apm_fuel_rod_mox_active"
item.fuel_value = apm.nuclear.constants.fuel_value.fuel_rod.mox
item.fuel_glow_color = apm.nuclear.color.fuel_glow.fuel_rod.mox
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_mox_active'
item.icons = {
    apm.nuclear.icons.fuel_container_mox_active
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel"
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
item.name = 'apm_fuel_rod_mox_cooled'
item.icons = {
    apm.nuclear.icons.fuel_container_mox_cooled
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel_cold"
item.order = 'ab_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
