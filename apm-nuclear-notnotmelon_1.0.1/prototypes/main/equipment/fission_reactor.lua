require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/equipment/fission_reactor.lua'

APM_LOG_HEADER(self)

local reactor = {}
reactor.type = "generator-equipment"
reactor.name = "apm_fission_reactor"
reactor.take_result = 'fusion-reactor-equipment'
reactor.sprite = {}
reactor.sprite.filename = '__base__/graphics/equipment/fusion-reactor-equipment.png'
reactor.sprite.width = 128
reactor.sprite.height = 128
reactor.sprite.priority = "medium"
reactor.shape = {}
reactor.shape.width = 4
reactor.shape.height = 4
reactor.shape.type = "full"
reactor.energy_source = {}
reactor.energy_source.type = "electric"
reactor.energy_source.usage_priority = "secondary-output"
reactor.power = "750kW"
reactor.categories = {"armor"}
reactor.burner = {}
reactor.burner.emissions_per_minute = 0
reactor.burner.fuel_categories = {'apm_nuclear_shielded_cell'}
reactor.burner.fuel_inventory_size = 1
reactor.burner.burnt_inventory_size = 1
reactor.burner.type = "burner"
data:extend({reactor})
