require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/steam_engines.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_steam_engine_2'
item.icons = {
    apm.power.icons.steam_engine,
    apm.lib.icons.dynamics.t2
}
item.icon_mipmaps = apm.power.icons.steam_engine.icon_mipmaps
item.stack_size = 10
--item.group = ""
item.subgroup = "energy"
item.order = "b[steam-power]-c[steam-engine]"
item.place_result = "apm_steam_engine_2"
data:extend({item})