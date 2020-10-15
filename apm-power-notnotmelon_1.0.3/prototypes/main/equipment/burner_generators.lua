require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/burner_generators.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_equipment_burner_generator_basic'
item.icons = {
    apm.power.icons.item_burner_generator_basic
}
item.stack_size = 20
--item.group = "apm_other"
item.subgroup = "equipment"
item.order = "a[energy-source]-b[apm-a]"
item.placed_as_equipment_result = "apm_equipment_burner_generator_basic"
data:extend({item})

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_equipment_burner_generator_advanced'
item.icons = {
    apm.power.icons.item_burner_generator_advanced
}
item.stack_size = 20
--item.group = "apm_other"
item.subgroup = "equipment"
item.order = "a[energy-source]-b[apm-b]"
item.placed_as_equipment_result = "apm_equipment_burner_generator_advanced"
data:extend({item})

-- Equipment ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local equipment = {}
equipment.type = "generator-equipment"
equipment.name = "apm_equipment_burner_generator_basic"
equipment.sprite = {}
equipment.sprite.filename = apm.power.icons.equipment_burner_generator_basic.icon
equipment.sprite.width = apm.power.icons.equipment_burner_generator_basic.icon_size
equipment.sprite.height = apm.power.icons.equipment_burner_generator_basic.icon_size
equipment.sprite.priority = "medium"
equipment.shape = {}
equipment.shape.width = 2
equipment.shape.height = 2
equipment.shape.type = "full"
equipment.energy_source = {}
equipment.energy_source.type = "electric"
equipment.energy_source.usage_priority = "secondary-output"
equipment.power = "200kW"
equipment.categories = {'apm_starter_equipment', "armor"}
equipment.burner = {}
equipment.burner.fuel_categories = {'chemical', 'apm_refined_chemical'}
equipment.burner.fuel_inventory_size = 1
equipment.burner.burnt_inventory_size = 1
equipment.burner.emissions_per_minute = apm.power.constants.emissions.equipment_burner_generator_basic
equipment.burner.type = "burner"
data:extend({equipment})

-- Equipment ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local equipment = {}
equipment.type = "generator-equipment"
equipment.name = "apm_equipment_burner_generator_advanced"
equipment.sprite = {}
equipment.sprite.filename = apm.power.icons.equipment_burner_generator_advanced.icon
equipment.sprite.width = apm.power.icons.equipment_burner_generator_advanced.icon_size
equipment.sprite.height = apm.power.icons.equipment_burner_generator_advanced.icon_size
equipment.sprite.priority = "medium"
equipment.shape = {}
equipment.shape.width = 3
equipment.shape.height = 3
equipment.shape.type = "full"
equipment.energy_source = {}
equipment.energy_source.type = "electric"
equipment.energy_source.usage_priority = "secondary-output"
equipment.power = "400kW"
equipment.categories = {"armor"}
equipment.burner = {}
equipment.burner.fuel_categories = {'apm_refined_chemical'}
equipment.burner.fuel_inventory_size = 1
equipment.burner.burnt_inventory_size = 1
equipment.burner.emissions_per_minute = apm.power.constants.emissions.equipment_burner_generator_advanced
equipment.burner.type = "burner"
data:extend({equipment})