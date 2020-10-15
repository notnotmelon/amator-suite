require('util')
require('lib.log')

local self = 'apm_lib/prototypes/items.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_dummy'
item.flags  = {'hidden'}
item.icons = {apm.lib.icons.dummy}
item.stack_size = 2000
item.group = "other"
item.subgroup = "other"
item.order = 'aa_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_hidden_fuel'
item.flags  = {'hidden', 'hide-from-fuel-tooltip', 'hide-from-bonus-gui'}
item.icons = {apm.lib.icons.dummy}
item.stack_size = 2000
item.group = "other"
item.subgroup = "other"
item.order = 'aa_b'
item.fuel_category = 'chemical'
item.fuel_value = "1GJ"
data:extend({item})
