require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/offshore_pumps.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('offshore-pump')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local item = {}
item.type = 'item'
item.name = 'apm_offshore_pump_0'
item.icons = icons
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_miner"
item.order = 'ab_a'
item.place_result = "apm_offshore_pump_0"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('offshore-pump')
local item_icon_b = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local item = {}
item.type = 'item'
item.name = 'apm_offshore_pump_1'
item.icons = icons
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_miner"
item.order = 'ab_b'
item.place_result = "apm_offshore_pump_1"
data:extend({item})