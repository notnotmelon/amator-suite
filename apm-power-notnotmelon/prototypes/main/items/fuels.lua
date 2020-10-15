require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/fuels.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_coal_crushed'
item.icons = {
    apm.power.icons.coal_crushed
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_coal"
item.order = 'aa_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_coal_briquette'
item.icons = {
    apm.power.icons.coal_brick
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_coal"
item.order = 'ab_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_coke'
item.icons = {
    apm.lib.icons.chunk_bg_w,
    apm.power.icons.coke_chunk
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_coke"
item.order = 'aa_a'
item.fuel_category = 'apm_refined_chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_coke_crushed'
item.icons = {
    apm.lib.icons.crushed_bg_w,
    apm.power.icons.coke_crushed
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_coke"
item.order = 'ab_a'
item.fuel_category = 'apm_refined_chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_coke_brick'
item.icons = {
    apm.lib.icons.briquette_bg_w,
    apm.power.icons.coke_brick
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_coke"
item.order = 'ac_a'
item.fuel_category = 'apm_refined_chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_wood_pellets'
item.icons = {
    apm.power.icons.wood_crushed
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_wood"
item.order = 'ac_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_wood_briquette'
item.icons = {
    apm.power.icons.wood_brick
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_wood"
item.order = 'ad_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_charcoal'
item.icons = {
    apm.power.icons.charcoal_chunk
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_charcoal"
item.order = 'aa_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_charcoal_brick'
item.icons = {
    apm.power.icons.charcoal_brick
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_charcoal"
item.order = 'ab_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})
