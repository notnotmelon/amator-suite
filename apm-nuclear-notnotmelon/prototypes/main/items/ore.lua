require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/items/ore.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_fluorite_ore'
--item.icons = {
--    {icon=apm.nuclear.icons.fluorite.filename}
--}
item.icons = {
    apm.nuclear.icons.fluorite
}
item.icon_mipmaps = apm.nuclear.icons.fluorite.icon_mipmaps
item.icon_mipmaps = 4
item.pictures = {
      apm.nuclear.icons.fluorite,
      apm.nuclear.icons.fluorite_1,
      apm.nuclear.icons.fluorite_2,
      apm.nuclear.icons.fluorite_3
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_ore"
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
item.name = 'thorium-ore'
--item.icon = apm.nuclear.icons.thorium_ore.filename
item.icons = {
      apm.nuclear.icons.thorium_ore
}
item.icon_mipmaps = apm.nuclear.icons.thorium_ore.icon_mipmaps
item.pictures = {
      apm.nuclear.icons.thorium_ore,
      apm.nuclear.icons.thorium_ore_1,
      apm.nuclear.icons.thorium_ore_2,
      apm.nuclear.icons.thorium_ore_3
}
item.stack_size = 200
item.group = "apm_nuclear"
item.subgroup = "apm_nuclear_ore"
item.order = 'aa_b'
data:extend({item})
