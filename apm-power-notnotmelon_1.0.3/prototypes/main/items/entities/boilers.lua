require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/boilers.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_boiler_2'
item.icons = {
    apm.power.icons.boiler,
    apm.lib.icons.dynamics.t2
}
item.icon_mipmaps = apm.power.icons.boiler.icon_mipmaps
item.stack_size = 50
--item.group = ""
item.subgroup = "energy"
item.order = "b[steam-power]-b[apm_boiler_2]"
item.place_result = "apm_boiler_2"
data:extend({item})