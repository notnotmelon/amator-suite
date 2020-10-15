require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/pumps.lua'

APM_LOG_HEADER(self)

local smoke_burner = {}
smoke_burner[1] = {}
smoke_burner[1].name = "apm_dark_smoke"
smoke_burner[1].deviation = {0.1, 0.1}
smoke_burner[1].frequency = 4
smoke_burner[1].position = nil
smoke_burner[1].north_position = {0.0, 0.0}
smoke_burner[1].south_position = {0.0, -1.0}
smoke_burner[1].east_position = {-0.8, -0.55}
smoke_burner[1].west_position = {0.8, -0.55}
smoke_burner[1].starting_vertical_speed = 0.08
smoke_burner[1].starting_frame_deviation = 60
smoke_burner[1].slow_down_factor = 1

local item_icon_a = apm.lib.utils.icon.get.from_item('pump')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local pump = table.deepcopy(data.raw.pump['pump'])
pump.name = 'apm_pump_0'
pump.icons = icons
--pump.icon_size = 32
pump.flags = {"placeable-neutral", "placeable-player", "player-creation"}
pump.minable = {mining_time = 0.2, result = "apm_pump_0"}
pump.energy_usage = apm.power.constants.energy_usage.burner
pump.energy_source = {}
pump.energy_source.type = "burner"
pump.energy_source.fuel_categories = {'chemical','apm_refined_chemical'}
pump.energy_source.effectivity = 1
pump.energy_source.fuel_inventory_size = 1
pump.energy_source.burnt_inventory_size = 1
pump.energy_source.emissions_per_minute = 2.5
pump.energy_source.smoke = smoke_burner
pump.pumping_speed = 10
--pump.animations.north.filename = '__apm_resource_pack__/graphics/entities/pumps/pump_north_0.png'
pump.animations.north.hr_version.filename = '__apm_resource_pack__/graphics/entities/pumps/hr_pump_north_0.png'
--pump.animations.east.filename = '__apm_resource_pack__/graphics/entities/pumps/pump_east_0.png'
pump.animations.east.hr_version.filename = '__apm_resource_pack__/graphics/entities/pumps/hr_pump_east_0.png'
--pump.animations.south.filename = '__apm_resource_pack__/graphics/entities/pumps/pump_south_0.png'
pump.animations.south.hr_version.filename = '__apm_resource_pack__/graphics/entities/pumps/hr_pump_south_0.png'
--pump.animations.west.filename = '__apm_resource_pack__/graphics/entities/pumps/pump_west_0.png'
pump.animations.west.hr_version.filename = '__apm_resource_pack__/graphics/entities/pumps/hr_pump_west_0.png'
data:extend({pump})
