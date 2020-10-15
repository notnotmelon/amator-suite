require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/neptunium.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_neptunium'
item.icons = {
    apm.nuclear.icons.fuel_container_neptunium
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_fuel"
item.order = 'ae_a'
item.fuel_category = 'apm_nuclear_neptunium'
item.burnt_result = "apm_fuel_rod_neptunium_active"
item.fuel_value = apm.nuclear.constants.fuel_value.fuel_rod.neptunium
item.fuel_glow_color = apm.nuclear.color.fuel_glow.fuel_rod.neptunium
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_neptunium_active'
item.icons = {
    apm.nuclear.icons.fuel_container_neptunium_active
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel"
item.order = 'ae_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_neptunium_cooled'
item.icons = {
    apm.nuclear.icons.fuel_container_neptunium_cooled
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel_cold"
item.order = 'ae_a'
data:extend({item})
