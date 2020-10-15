require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/items/tiles.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_asphalt'
item.icons = {
    {icon=apm.power.icons.asphalt.filename, icon_size=apm.power.icons.asphalt.icon_size}
}
item.icon_mipmaps = apm.power.icons.asphalt.icon_mipmaps
item.pictures = {
      apm.power.icons.asphalt,
      apm.power.icons.asphalt_1
}
item.stack_size = 200
item.group = "apm_power"
item.subgroup = "apm_power_ash"
item.order = 'ae_a'
--item.fuel_category = 'chemical'
--item.fuel_value = "1MJ"
item.place_as_tile = {
  result = "apm_asphalt",
  condition_size = 1,
  condition = { "water-tile" }
}
data:extend({item})
