require('util')
require('lib.log')

local self = 'apm_lib/prototypes/custom-inputs.lua'

APM_LOG_HEADER(self)

local apm_equipment_manager = {}
apm_equipment_manager.type = "custom-input"
apm_equipment_manager.name = "apm_input_equipment_manager"
apm_equipment_manager.key_sequence = "ALT + W"
data:extend({apm_equipment_manager})
