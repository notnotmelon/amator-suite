require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/purex.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_nuclear_ash'
item.icons = {
    apm.nuclear.icons.generic_ash
}
item.stack_size = 2000
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_chemistry"
item.order = 'ad_a'
data:extend({item})


-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_phosphorus'
item.icons = {
    apm.nuclear.icons.phosphorus
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_chemistry"
item.order = 'ad_b'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_phosphorpentachlorid'
item.icons = {
    apm.nuclear.icons.phosphorpentachlorid
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_chemistry"
item.order = 'ad_c'
data:extend({item})
