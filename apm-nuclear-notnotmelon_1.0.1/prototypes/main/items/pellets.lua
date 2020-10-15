require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/pellets.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_oxide_pellet_u238'
item.icons = {
    apm.nuclear.icons.oxide_pellet_u238
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_oxide_pellets"
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
item.name = 'apm_oxide_pellet_u235'
item.icons = {
    apm.nuclear.icons.oxide_pellet_u235
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_oxide_pellets"
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
item.name = 'apm_oxide_pellet_th232'
item.icons = {
    apm.nuclear.icons.oxide_pellet_th232
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_oxide_pellets"
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
item.name = 'apm_oxide_pellet_np237'
item.icons = {
    apm.nuclear.icons.oxide_pellet_np237
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_oxide_pellets"
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
item.name = 'apm_oxide_pellet_pu239'
item.icons = {
    apm.nuclear.icons.oxide_pellet_pu239
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_oxide_pellets"
item.order = 'ae_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
