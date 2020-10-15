require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/thorium.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_thorium'
item.icons = {
    apm.nuclear.icons.fuel_container_thorium
}
item.fuel_category = "apm_nuclear_thorium"
item.burnt_result = "apm_fuel_rod_thorium_active"
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_fuel"
item.order = 'ad_a[thorium]'
item.fuel_value = apm.nuclear.constants.fuel_value.fuel_rod.thorium
item.fuel_glow_color = apm.nuclear.color.fuel_glow.fuel_rod.thorium
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_thorium_active'
item.icons = {
    apm.nuclear.icons.fuel_container_thorium_active
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel"
item.order = 'ad_a[thorium]'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_thorium_cooled'
item.icons = {
    apm.nuclear.icons.fuel_container_thorium_cooled
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_used_fuel_cold"
item.order = 'ad_a[thorium]'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = "item"
item.name = "apm_breeder_thorium"
item.icons = {
    apm.nuclear.icons.breeder_container_thorium
}
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_thorium"
item.order = 'aa_a'
item.stack_size = 200
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = "item"
item.name = "apm_breeder_thorium_loaded"
item.icons = {
    apm.nuclear.icons.breeder_container_thorium_loaded
}
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_thorium"
item.fuel_category = 'apm_nuclear_breeder'
item.burnt_result = "apm_breeder_thorium_active"
item.fuel_value = apm.nuclear.constants.fuel_value.breeder.thorium
item.fuel_glow_color = apm.nuclear.color.fuel_glow.breeder.thorium
item.order = 'ab_a'
item.stack_size = 200
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = "item"
item.name = "apm_breeder_thorium_active"
item.icons = {
    apm.nuclear.icons.breeder_container_thorium_active
}
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_thorium"
item.order = 'ac_a'
item.stack_size = 200
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = "item"
item.name = "apm_breeder_thorium_cooled"
item.icons = {
    apm.nuclear.icons.breeder_container_thorium_cooled
}
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_thorium"
item.order = 'bd_a'
item.stack_size = 200
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = "item"
item.name = "apm_breeder_thorium_seperated"
item.icons = {
    apm.nuclear.icons.breeder_container_thorium_seperated
}
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_breeding_thorium"
item.order = 'bd_a'
item.stack_size = 200
data:extend({item})