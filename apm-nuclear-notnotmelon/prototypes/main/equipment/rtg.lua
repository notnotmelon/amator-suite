require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/equipment/rtg.lua'

APM_LOG_HEADER(self)

local rtg = {}
rtg.type = "generator-equipment"
rtg.name = "apm_rtg_radioisotope_thermoelectric_generator"
rtg.sprite = {}
rtg.sprite.filename = apm.nuclear.icons.rtg.icon
rtg.sprite.width = apm.nuclear.icons.rtg.icon_size
rtg.sprite.height = apm.nuclear.icons.rtg.icon_size
rtg.sprite.priority = "medium"
rtg.shape = {}
rtg.shape.width = 1
rtg.shape.height = 1
rtg.shape.type = "full"
rtg.energy_source = {}
rtg.energy_source.type = "electric"
rtg.energy_source.usage_priority = "primary-output"
rtg.power = "35kW"
rtg.categories = {"armor"}
data:extend({rtg})
