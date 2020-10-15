require('util')
require('lib.log')

local self = 'apm_lib/prototypes/shortcuts.lua'

APM_LOG_HEADER(self)

local apm_equipment_manager = {}
apm_equipment_manager.name = "apm_shortcut_equipment_manager"
apm_equipment_manager.type = "shortcut"
apm_equipment_manager.action = "lua"
apm_equipment_manager.toggleable = true
apm_equipment_manager.associated_control_input = "apm_input_equipment_manager"
apm_equipment_manager.technology_to_unlock = nil

apm_equipment_manager.icon = {}
apm_equipment_manager.icon.filename = apm.lib.icons.path.equipment_manager_enabled
apm_equipment_manager.icon.priority = "extra-high-no-scale"
apm_equipment_manager.icon.size = 32
apm_equipment_manager.icon.scale = 1
apm_equipment_manager.icon.flags = {"gui-icon"}
apm_equipment_manager.small_icon = {}
apm_equipment_manager.small_icon.filename = apm.lib.icons.path.equipment_manager_enabled_small
apm_equipment_manager.small_icon.priority = "extra-high-no-scale"
apm_equipment_manager.small_icon.size = 24
apm_equipment_manager.small_icon.scale = 1
apm_equipment_manager.small_icon.flags = {"gui-icon"}

apm_equipment_manager.disabled_icon = {}
apm_equipment_manager.disabled_icon.filename = apm.lib.icons.path.equipment_manager_disabled
apm_equipment_manager.disabled_icon.priority = "extra-high-no-scale"
apm_equipment_manager.disabled_icon.size = 32
apm_equipment_manager.disabled_icon.scale = 1
apm_equipment_manager.disabled_icon.flags = {"gui-icon"}
apm_equipment_manager.disabled_small_icon = {}
apm_equipment_manager.disabled_small_icon.filename = apm.lib.icons.path.equipment_manager_disabled_small
apm_equipment_manager.disabled_small_icon.priority = "extra-high-no-scale"
apm_equipment_manager.disabled_small_icon.size = 24
apm_equipment_manager.disabled_small_icon.scale = 1
apm_equipment_manager.disabled_small_icon.flags = {"gui-icon"}

data:extend({apm_equipment_manager})
