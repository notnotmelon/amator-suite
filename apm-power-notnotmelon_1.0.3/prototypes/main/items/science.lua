require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/science.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'tool'
item.name = 'apm_industrial_science_pack'
item.localised_description = {"item-description.science-pack"}
item.icons = {
    apm.power.icons.sciencepack_1
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_science"
item.order = 'aa_a'
item.durability = 1
item.durability_description_key = "description.science-pack-remaining-amount-key"
item.durability_description_value = "description.science-pack-remaining-amount-value"
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'tool'
item.name = 'apm_steam_science_pack'
item.localised_description = {"item-description.science-pack"}
item.icons = {
    apm.power.icons.sciencepack_2
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_science"
item.order = 'ab_a'
item.durability = 1
item.durability_description_key = "description.science-pack-remaining-amount-key"
item.durability_description_value = "description.science-pack-remaining-amount-value"
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})