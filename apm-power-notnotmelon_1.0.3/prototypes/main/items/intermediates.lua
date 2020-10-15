require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/intermediates.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_resin'
item.icons = {
    apm.power.icons.resin
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_greenhouse"
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
item.name = 'apm_rubber'
item.icons = {
    apm.power.icons.rubber
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
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
item.name = 'apm_gearing'
item.icons = {
    apm.power.icons.gearing
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
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
item.name = 'apm_wood_board'
item.icons = {
    apm.power.icons.wood_board
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
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
item.name = 'apm_mechanical_relay'
item.icons = {
    apm.power.icons.mechanical_relay
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
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
item.name = 'apm_steam_relay'
item.icons = {
    apm.power.icons.steam_relay
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ad_b'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_sealing_rings'
item.icons = {
    apm.power.icons.sealing_rings
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'af_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_treated_wood_planks'
item.icons = {
    apm.power.icons.treated_wood_planks
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ag_a'
item.fuel_category = 'chemical'
item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_electromagnet'
item.icons = {
    apm.power.icons.electromagnet
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ah_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_crushed_stone'
item.icons = {
    {icon=apm.power.icons.crushed_stone.filename, icon_size=apm.power.icons.crushed_stone.icon_size, tint=apm.power.icons.crushed_stone.tint}
}
item.icon_mipmaps = apm.power.icons.crushed_stone.icon_mipmaps
item.pictures = {
      apm.power.icons.crushed_stone,
      apm.power.icons.crushed_stone_1,
      apm.power.icons.crushed_stone_2,
      apm.power.icons.crushed_stone_3
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'aj_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_stone_brick_raw'
item.icons = {
    apm.power.icons.stone_brick_raw
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ak_a'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_pistions'
item.icons = {
    apm.power.icons.pistions
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_b'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_simple_engine'
item.icons = {
    apm.power.icons.simple_engine
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_c'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_steam_engine'
item.icons = {
    apm.power.icons.steam_engine_unit
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_d'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_basic'
item.icons = {
    apm.power.icons.machine_frame_basic
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_e'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_basic_used'
item.icons = {
    apm.power.icons.machine_frame_basic_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_f'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_steam'
item.icons = {
    apm.power.icons.machine_frame_steam
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_g'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_steam_used'
item.icons = {
    apm.power.icons.machine_frame_steam_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_h'
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_advanced'
item.icons = {
    apm.power.icons.machine_frame_advanced
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_i'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_machine_frame_advanced_used'
item.icons = {
    apm.power.icons.machine_frame_advanced_used
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_intermediates"
item.order = 'ab_j'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
data:extend({item})
