require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/science.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'tool'
item.name = 'apm_nuclear_science_pack'
item.localised_description = {"item-description.science-pack"}
item.icons = {
    apm.nuclear.icons.sciencepack
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_science"
item.order = 'aa_a'
item.durability = 1
item.durability_description_key = "description.science-pack-remaining-amount-key"
item.durability_description_value = "description.science-pack-remaining-amount-value"
data:extend({item})
