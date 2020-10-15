require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/entities/mining_drills.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_burner_miner_drill_2'
item.icons = {
    apm.power.icons.burner_mining_drill,
    apm.lib.icons.dynamics.t2
}
item.icon_mipmaps = apm.power.icons.burner_mining_drill.icon_mipmaps
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_miner"
item.order = 'aa_b'
item.place_result = "apm_burner_miner_drill_2"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_steam_mining_drill'
item.icons = {
    apm.power.icons.electric_mining_drill,
    apm.lib.icons.dynamics.t1
}
item.icon_mipmaps = apm.power.icons.electric_mining_drill.icon_mipmaps
item.stack_size = 50
item.group = "apm_power"
item.subgroup = "apm_power_machines_miner"
item.order = 'ac_b'
item.place_result = "apm_steam_mining_drill"
data:extend({item})