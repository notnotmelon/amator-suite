require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/entities.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_cooling_pond_0'
item.icons = {
    apm.nuclear.icons.cooling_pond
}
item.stack_size = 10
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_machines_1"
item.order = 'aa_b'
item.place_result = "apm_cooling_pond_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_hybrid_cooling_tower_0'
item.icons = {
    apm.nuclear.icons.hybrid_cooling_tower
}
item.stack_size = 10
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_cooling_tower"
item.order = 'aa_a'
item.place_result = "apm_hybrid_cooling_tower_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_nuclear_breeder'
item.icons = {
    apm.nuclear.icons.breeder_reactor
}
item.stack_size = 5
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_machines_2"
item.order = 'ab_a'
item.place_result = "apm_nuclear_breeder"
data:extend({item})
