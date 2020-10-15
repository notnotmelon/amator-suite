require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/uranium.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_uranium'
item.icons = {
    apm.nuclear.icons.fuel_container_uranium
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_fuel"
item.order = 'aa_a'
item.fuel_category = 'apm_nuclear_uranium'
item.burnt_result = "apm_fuel_rod_uranium_active"
item.fuel_value = apm.nuclear.constants.fuel_value.fuel_rod.uranium
item.fuel_glow_color = apm.nuclear.color.fuel_glow.fuel_rod.uranium
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_uranium_active'
item.icons = {
    apm.nuclear.icons.fuel_container_uranium_active
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel"
item.order = 'aa_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_uranium_cooled'
item.icons = {
    apm.nuclear.icons.fuel_container_uranium_cooled
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel_cold"
item.order = 'aa_a'
data:extend({item})


-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_uranium'
item.icons = {
    apm.nuclear.icons.breeder_container_uranium
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_uranium"
item.order = 'aa_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_uranium_loaded'
item.icons = {
    apm.nuclear.icons.breeder_container_uranium_loaded
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_uranium"
item.fuel_category = 'apm_nuclear_breeder'
item.burnt_result = "apm_breeder_uranium_active"
item.fuel_value = apm.nuclear.constants.fuel_value.breeder.uranium
item.fuel_glow_color = apm.nuclear.color.fuel_glow.breeder.uranium
item.order = 'ab_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_uranium_active'
item.icons = {
    apm.nuclear.icons.breeder_container_uranium_active
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_uranium"
item.order = 'ac_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_uranium_cooled'
item.icons = {
    apm.nuclear.icons.breeder_container_uranium_cooled
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_uranium"
item.order = 'ad_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_uranium_seperated'
item.icons = {
    apm.nuclear.icons.breeder_container_uranium_seperated
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_uranium"
item.order = 'ae_a'
data:extend({item})