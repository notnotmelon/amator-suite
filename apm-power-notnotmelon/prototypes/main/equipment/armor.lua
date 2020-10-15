require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/armor.lua'

APM_LOG_HEADER(self)

-- Armor ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local armor = {}
armor.type = "armor"
armor.name = "apm_armor_starter"
armor.icons = {
    apm.power.icons.starter_armor
}
--armor.icon_size = apm.power.icons.starter_armor.icon_size
armor.flags = {'hidden', 'hide-from-bonus-gui'}
armor.group = "apm_other"
armor.subgroup = "apm_starter_armor"
armor.order = "aa_a"
armor.resistances = {}
armor.resistances[1] = {}
armor.resistances[1].type = "physical"
armor.resistances[1].decrease = 1
armor.resistances[1].percent = 15
armor.resistances[2] = {}
armor.resistances[2].type = "acid"
armor.resistances[2].decrease = 1
armor.resistances[2].percent = 15
armor.resistances[3] = {}
armor.resistances[3].type = "explosion"
armor.resistances[3].decrease = 1
armor.resistances[3].percent = 15
armor.resistances[4] = {}
armor.resistances[4].type = "fire"
armor.resistances[4].decrease = 1
armor.resistances[4].percent = 15
armor.stack_size = 1
armor.infinite = true
armor.equipment_grid = "apm_equipment_grid_starter"
data:extend({armor})