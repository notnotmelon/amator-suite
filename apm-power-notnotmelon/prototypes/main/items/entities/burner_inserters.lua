require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/burner_inserters.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_burner_filter_inserter'
item.icons = {
    apm.power.icons.burner_filter_inserter
}
item.icon_mipmaps = 4
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'ab_b'
item.place_result = "apm_burner_filter_inserter"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_burner_long_inserter'
item.icons = {
    apm.power.icons.burner_long_inserter
}
item.icon_mipmaps = 4
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_inserter"
item.order = 'ab_c'
item.place_result = "apm_burner_long_inserter"
data:extend({item})