require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/greenhouse.lua'

APM_LOG_HEADER(self)

local smoke_burner = {}
--local smoke_position = {-0.77, -1.95}
local smoke_position = {-0.70, -2.15}
smoke_burner[1] = {}
smoke_burner[1].name = "apm_dark_smoke"
smoke_burner[1].deviation = {0.1, 0.1}
smoke_burner[1].frequency = 3.6
smoke_burner[1].position = nil
smoke_burner[1].north_position = smoke_position
smoke_burner[1].south_position = smoke_position
smoke_burner[1].east_position = smoke_position
smoke_burner[1].west_position = smoke_position
smoke_burner[1].starting_vertical_speed = 0.08
smoke_burner[1].starting_frame_deviation = 60
smoke_burner[1].slow_down_factor = 1

local smoke_steam = table.deepcopy(smoke_burner)
smoke_steam[1].name = "light-smoke"
smoke_steam[1].frequency = 1.8
smoke_steam[1].starting_vertical_speed = 0.08

local greenhouse = {}
greenhouse.type = "assembling-machine"
greenhouse.name = "apm_greenhouse_0"
greenhouse.icons = {
    apm.lib.icons.dynamics.machine.t0,
    apm.lib.icons.dynamics.lable_gh
}
--greenhouse.icon_size = 32
greenhouse.flags = {"placeable-neutral", "placeable-player", "player-creation"}
greenhouse.minable = {mining_time = 0.1, result = "apm_greenhouse_0"}
greenhouse.crafting_categories = {"apm_greenhouse"}
greenhouse.crafting_speed = 1
greenhouse.fast_replaceable_group = "apm_greenhouse"
greenhouse.next_upgrade = 'apm_greenhouse_1'
greenhouse.max_health = 150
greenhouse.corpse = "big-remnants"
greenhouse.dying_explosion = "medium-explosion"
greenhouse.resistances = {{type = "fire", percent = 90}}
greenhouse.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
greenhouse.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
--greenhouse.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
greenhouse.open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 }
greenhouse.close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
greenhouse.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
greenhouse.working_sound = {}
greenhouse.working_sound.sound = {{filename = "__apm_resource_pack__/sounds/ambient/greenhouse.ogg", volume = 0.8}}
greenhouse.working_sound.apparent_volume = 1.5
greenhouse.energy_usage = apm.power.constants.energy_usage.greenhouse_0
greenhouse.module_specification = apm.power.constants.modules.greenhouse.specification_0
greenhouse.allowed_effects = apm.power.constants.modules.greenhouse.allowed_effects_0
greenhouse.energy_source = {}
greenhouse.energy_source.type = "burner"
greenhouse.energy_source.fuel_categories = {'chemical','apm_refined_chemical'}
greenhouse.energy_source.effectivity = 1
greenhouse.energy_source.fuel_inventory_size = 1
greenhouse.energy_source.burnt_inventory_size = 1
greenhouse.energy_source.emissions_per_minute = apm.power.constants.emissions.gh_0
greenhouse.energy_source.smoke = smoke_burner
greenhouse.animation = {}
greenhouse.animation.layers = {}
greenhouse.animation.layers[1] = {}
greenhouse.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/greenhouse/greenhouse_0.png"
greenhouse.animation.layers[1].priority="high"
greenhouse.animation.layers[1].width = 160
greenhouse.animation.layers[1].height = 128
greenhouse.animation.layers[1].frame_count = 1
greenhouse.animation.layers[1].line_length = 1
greenhouse.animation.layers[1].shift = {0.4375, -0.28125}
greenhouse.animation.layers[1].animation_speed = 0.5333334
greenhouse.animation.layers[1].hr_version = {}
greenhouse.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/greenhouse/hr_greenhouse_0.png"
greenhouse.animation.layers[1].hr_version.priority="high"
greenhouse.animation.layers[1].hr_version.width = 320
greenhouse.animation.layers[1].hr_version.height = 256
greenhouse.animation.layers[1].hr_version.frame_count = 1
greenhouse.animation.layers[1].hr_version.line_length = 1
greenhouse.animation.layers[1].hr_version.shift = {0.4375, -0.28125}
greenhouse.animation.layers[1].hr_version.scale = 0.5
greenhouse.animation.layers[1].hr_version.animation_speed = 0.5333334
greenhouse.animation.layers[2] = {}
greenhouse.animation.layers[2].filename = "__apm_resource_pack__/graphics/entities/greenhouse/greenhouse_shadow.png"
greenhouse.animation.layers[2].priority="high"
greenhouse.animation.layers[2].draw_as_shadow = true
greenhouse.animation.layers[2].width = 160
greenhouse.animation.layers[2].height = 128
greenhouse.animation.layers[2].frame_count = 1
greenhouse.animation.layers[2].line_length = 1
greenhouse.animation.layers[2].shift = {0.4375, -0.28125}
greenhouse.animation.layers[2].animation_speed = 0.5333334
greenhouse.animation.layers[2].hr_version = {}
greenhouse.animation.layers[2].hr_version.filename = "__apm_resource_pack__/graphics/entities/greenhouse/hr_greenhouse_shadow.png"
greenhouse.animation.layers[2].hr_version.priority="high"
greenhouse.animation.layers[2].hr_version.draw_as_shadow = true
greenhouse.animation.layers[2].hr_version.width = 320
greenhouse.animation.layers[2].hr_version.height = 256
greenhouse.animation.layers[2].hr_version.frame_count = 1
greenhouse.animation.layers[2].hr_version.line_length = 1
greenhouse.animation.layers[2].hr_version.shift = {0.4375, -0.28125}
greenhouse.animation.layers[2].hr_version.scale = 0.5
greenhouse.animation.layers[2].hr_version.animation_speed = 0.5333334
greenhouse.fluid_boxes = {}
greenhouse.fluid_boxes[1] = {}
greenhouse.fluid_boxes[1].production_type = "input"
greenhouse.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler1pipepictures()
greenhouse.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
greenhouse.fluid_boxes[1].base_area = 1
greenhouse.fluid_boxes[1].base_level = -1
greenhouse.fluid_boxes[1].pipe_connections = {{ type="input", position = {2, 0} }}
greenhouse.fluid_boxes[1].secondary_draw_orders = { north = -1 }
greenhouse.fluid_boxes.off_when_no_fluid_recipe = true
data:extend({greenhouse})

local greenhouse = table.deepcopy(greenhouse)
greenhouse.type = "assembling-machine"
greenhouse.name = "apm_greenhouse_1"
greenhouse.icons = {
    apm.lib.icons.dynamics.machine.t1,
    apm.lib.icons.dynamics.lable_gh
}
greenhouse.localised_description = {"entity-description.apm_greenhouse"}
greenhouse.minable = {mining_time = 0.1, result = "apm_greenhouse_1"}
greenhouse.crafting_categories = {"apm_greenhouse"}
greenhouse.crafting_speed = 1.25
greenhouse.next_upgrade = nil
greenhouse.max_health = 250
greenhouse.energy_usage = apm.power.constants.energy_usage.greenhouse_1
greenhouse.module_specification = apm.power.constants.modules.greenhouse.specification_1
greenhouse.allowed_effects = apm.power.constants.modules.greenhouse.allowed_effects_1
greenhouse.energy_source = {}
greenhouse.energy_source.type = "fluid"
greenhouse.energy_source.fluid_box = {}
greenhouse.energy_source.fluid_box.production_type = "input"
greenhouse.energy_source.fluid_box.pipe_picture = apm.lib.utils.pipecovers.assembler2pipepictures()
greenhouse.energy_source.fluid_box.pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
greenhouse.energy_source.fluid_box.base_area = 1
greenhouse.energy_source.fluid_box.base_level = -1
greenhouse.energy_source.fluid_box.pipe_connections = {{ type="input", position = {0, -2} }}
greenhouse.energy_source.fluid_box.secondary_draw_orders = { north = -1 }
greenhouse.energy_source.fluid_box.filter = "steam"
greenhouse.energy_source.minimum_temperature = 100.0
greenhouse.energy_source.maximum_temperature = 1000.0
greenhouse.energy_source.burns_fluid = false
greenhouse.energy_source.scale_fluid_usage = true
greenhouse.energy_source.emissions_per_minute = apm.power.constants.emissions.gh_1
greenhouse.energy_source.smoke = smoke_steam
greenhouse.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/greenhouse/greenhouse_1.png"
greenhouse.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/greenhouse/hr_greenhouse_1.png"
greenhouse.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler2pipepictures()
greenhouse.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
data:extend({greenhouse})

local greenhouse = table.deepcopy(greenhouse)
greenhouse.type = "assembling-machine"
greenhouse.name = "apm_greenhouse_2"
greenhouse.icons = {
    apm.lib.icons.dynamics.machine.t2,
    apm.lib.icons.dynamics.lable_gh
}
greenhouse.minable = {mining_time = 0.1, result = "apm_greenhouse_2"}
greenhouse.crafting_categories = {"apm_greenhouse"}
greenhouse.crafting_speed = 1.5
greenhouse.next_upgrade = nil
greenhouse.max_health = 250
greenhouse.energy_usage = apm.power.constants.energy_usage.greenhouse_2
greenhouse.module_specification = apm.power.constants.modules.greenhouse.specification_2
greenhouse.allowed_effects = apm.power.constants.modules.greenhouse.allowed_effects_2
greenhouse.energy_source = {}
greenhouse.energy_source.type = 'electric'
greenhouse.energy_source.usage_priority = "secondary-input"
greenhouse.energy_source.drain = apm.power.constants.engery_drain.electric
greenhouse.energy_source.emissions_per_minute = apm.power.constants.emissions.gh_2
greenhouse.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/greenhouse/greenhouse_2.png"
greenhouse.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/greenhouse/hr_greenhouse_2.png"
greenhouse.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
greenhouse.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
data:extend({greenhouse})
