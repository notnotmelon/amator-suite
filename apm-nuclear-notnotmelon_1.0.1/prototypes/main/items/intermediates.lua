require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/intermediates.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fuel_rod_container'
item.icons = {
    apm.nuclear.icons.fuel_container
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
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
item.name = 'apm_fuel_rod_container_worn'
item.icons = {
    apm.nuclear.icons.fuel_container_worn
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'aa_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_breeder_container'
item.icons = {
    apm.nuclear.icons.breeder_container
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
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
item.name = 'apm_breeder_container_worn'
item.icons = {
    apm.nuclear.icons.breeder_container_worn
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'ab_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_waste_container'
item.icons = {
    apm.nuclear.icons.waste_container
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'ac_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_depleted_uranium_metal_mixture'
item.icons = {
    apm.nuclear.icons.depleted_uranium_mix
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
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
item.name = 'apm_depleted_uranium_ingots'
item.icons = {
    apm.nuclear.icons.staballoy
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'ad_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_rtg_radioisotope_thermoelectric_generator'
item.icons = {
    apm.nuclear.icons.rtg
}
item.stack_size = 50
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_products"
item.order = 'ae_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
item.placed_as_equipment_result = "apm_rtg_radioisotope_thermoelectric_generator"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_hexafluoride_sample'
item.icons = {
    apm.nuclear.icons.hexafluoride_sample
}
item.stack_size = 50
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_science"
item.order = 'ab_a'
data:extend({item})
