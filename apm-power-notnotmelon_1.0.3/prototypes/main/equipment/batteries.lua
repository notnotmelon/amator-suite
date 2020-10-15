require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/batteries.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_equipment_battery_tiny'
item.flags = {'hidden', 'hide-from-bonus-gui'}
item.icons = {
    apm.power.icons.equipment_battery_tiny
}
item.stack_size = 20
item.group = "apm_other"
item.subgroup = "apm_starter_armor"
item.order = "aa_c"
item.placed_as_equipment_result = "apm_equipment_battery_tiny"
data:extend({item})

-- Equipment ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local equipment = {}
equipment.type = "battery-equipment"
equipment.name = "apm_equipment_battery_tiny"
equipment.flags = {'hidden', 'hide-from-bonus-gui'}
equipment.sprite = {}
equipment.sprite.filename = apm.power.icons.equipment_battery_tiny.icon
equipment.sprite.width = apm.power.icons.equipment_battery_tiny.icon_size
equipment.sprite.height = apm.power.icons.equipment_battery_tiny.icon_size
equipment.sprite.priority = "medium"
equipment.shape = {}
equipment.shape.width = 1
equipment.shape.height = 1
equipment.shape.type = "full"
equipment.energy_source = {}
equipment.energy_source.type = "electric"
equipment.energy_source.buffer_capacity = "2.5MJ"
equipment.energy_source.usage_priority = "tertiary"
equipment.categories = {"apm_starter_equipment"}
data:extend({equipment})