require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/entities/cooling_pond.lua'

APM_LOG_HEADER(self)

local cooling_pond = {}
cooling_pond.type = "assembling-machine"
cooling_pond.name = "apm_cooling_pond_0"
cooling_pond.icons = {
    apm.nuclear.icons.cooling_pond
}
--cooling_pond.icon_size = 32
cooling_pond.flags = {"placeable-neutral", "placeable-player", "player-creation"}
cooling_pond.minable = {mining_time = 0.2, result = "apm_cooling_pond_0"}
cooling_pond.crafting_categories = {"apm_nuclear_cooling_0"}
cooling_pond.crafting_speed = 1
cooling_pond.result_inventory_size = 1
cooling_pond.source_inventory_size = 1
cooling_pond.fast_replaceable_group = "apm_cooling_pond"
cooling_pond.next_upgrade = nil
cooling_pond.max_health = 250
cooling_pond.corpse = "big-remnants"
cooling_pond.dying_explosion = "medium-explosion"
cooling_pond.resistances = {{type = "fire", percent = 90}}
cooling_pond.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
cooling_pond.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
cooling_pond.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
cooling_pond.open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 }
cooling_pond.close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
cooling_pond.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
cooling_pond.working_sound = {}
cooling_pond.working_sound.sound = {{filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.8},
                                          {filename = "__base__/sound/assembling-machine-t1-2.ogg", volume = 0.8}}
cooling_pond.working_sound.idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 }
cooling_pond.working_sound.apparent_volume = 1.5
cooling_pond.module_specification = {module_slots = 2}
cooling_pond.allowed_effects = {"consumption", "speed", "pollution"}
cooling_pond.energy_usage = "500kW"
cooling_pond.energy_source = {}
cooling_pond.energy_source.type = 'electric'
cooling_pond.energy_source.usage_priority = "secondary-input"
cooling_pond.energy_source.emissions_per_minute = 0.25
cooling_pond.animation = {}
cooling_pond.animation.layers = {}
cooling_pond.animation.layers[1] = {}
cooling_pond.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/cooling_pond/cooling_pond_0.png"
cooling_pond.animation.layers[1].priority="high"
cooling_pond.animation.layers[1].width = 160
cooling_pond.animation.layers[1].height = 128
cooling_pond.animation.layers[1].frame_count = 8
cooling_pond.animation.layers[1].line_length = 8
cooling_pond.animation.layers[1].shift = {0.4375, -0.28125}
cooling_pond.animation.layers[1].animation_speed = 0.53333335
cooling_pond.animation.layers[1].hr_version = {}
cooling_pond.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/cooling_pond/hr_cooling_pond_0.png"
cooling_pond.animation.layers[1].hr_version.priority="high"
cooling_pond.animation.layers[1].hr_version.width = 320
cooling_pond.animation.layers[1].hr_version.height = 256
cooling_pond.animation.layers[1].hr_version.frame_count = 8
cooling_pond.animation.layers[1].hr_version.line_length = 8
cooling_pond.animation.layers[1].hr_version.shift = {0.4375, -0.28125}
cooling_pond.animation.layers[1].hr_version.scale = 0.5
cooling_pond.animation.layers[1].hr_version.animation_speed = 0.53333335
cooling_pond.animation.layers[2] = {}
cooling_pond.animation.layers[2].filename = "__apm_resource_pack__/graphics/entities/cooling_pond/cooling_pond_shadow.png"
cooling_pond.animation.layers[2].priority="high"
cooling_pond.animation.layers[2].draw_as_shadow = true
cooling_pond.animation.layers[2].width = 160
cooling_pond.animation.layers[2].height = 128
cooling_pond.animation.layers[2].frame_count = 8
cooling_pond.animation.layers[2].line_length = 8
cooling_pond.animation.layers[2].shift = {0.4375, -0.28125}
cooling_pond.animation.layers[2].animation_speed = 0.53333335
cooling_pond.animation.layers[2].hr_version = {}
cooling_pond.animation.layers[2].hr_version.filename = "__apm_resource_pack__/graphics/entities/cooling_pond/hr_cooling_pond_shadow.png"
cooling_pond.animation.layers[2].hr_version.priority="high"
cooling_pond.animation.layers[2].hr_version.draw_as_shadow = true
cooling_pond.animation.layers[2].hr_version.width = 320
cooling_pond.animation.layers[2].hr_version.height = 256
cooling_pond.animation.layers[2].hr_version.frame_count = 8
cooling_pond.animation.layers[2].hr_version.line_length = 8
cooling_pond.animation.layers[2].hr_version.shift = {0.4375, -0.28125}
cooling_pond.animation.layers[2].hr_version.scale = 0.5
cooling_pond.animation.layers[2].hr_version.animation_speed = 0.53333335
cooling_pond.idle_animation = {}
cooling_pond.idle_animation.layers = {}
cooling_pond.idle_animation.layers[1] = {}
cooling_pond.idle_animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/cooling_pond/cooling_pond_idle_0.png"
cooling_pond.idle_animation.layers[1].priority="high"
cooling_pond.idle_animation.layers[1].width = 160
cooling_pond.idle_animation.layers[1].height = 128
cooling_pond.idle_animation.layers[1].frame_count = 8
cooling_pond.idle_animation.layers[1].line_length = 8
cooling_pond.idle_animation.layers[1].shift = {0.4375, -0.28125}
cooling_pond.idle_animation.layers[1].animation_speed = 0.53333335
cooling_pond.idle_animation.layers[1].hr_version = {}
cooling_pond.idle_animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/cooling_pond/hr_cooling_pond_idle_0.png"
cooling_pond.idle_animation.layers[1].hr_version.priority="high"
cooling_pond.idle_animation.layers[1].hr_version.width = 320
cooling_pond.idle_animation.layers[1].hr_version.height = 256
cooling_pond.idle_animation.layers[1].hr_version.frame_count = 8
cooling_pond.idle_animation.layers[1].hr_version.line_length = 8
cooling_pond.idle_animation.layers[1].hr_version.shift = {0.4375, -0.28125}
cooling_pond.idle_animation.layers[1].hr_version.scale = 0.5
cooling_pond.idle_animation.layers[1].hr_version.animation_speed = 0.53333335
cooling_pond.idle_animation.layers[2] = cooling_pond.animation.layers[2]
cooling_pond.fluid_boxes = {}
cooling_pond.fluid_boxes[1] = {}
cooling_pond.fluid_boxes[1].production_type = "input"
cooling_pond.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
cooling_pond.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
cooling_pond.fluid_boxes[1].base_area = 1
cooling_pond.fluid_boxes[1].base_level = -1
cooling_pond.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, 2} }}
cooling_pond.fluid_boxes[1].secondary_draw_orders = { north = -1 }
cooling_pond.fluid_boxes[2] = {}
cooling_pond.fluid_boxes[2].production_type = "output"
cooling_pond.fluid_boxes[2].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
cooling_pond.fluid_boxes[2].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
cooling_pond.fluid_boxes[2].base_area = 1
cooling_pond.fluid_boxes[2].base_level = 1
cooling_pond.fluid_boxes[2].pipe_connections = {{ type="output", position = {0, -2} }}
cooling_pond.fluid_boxes[2].secondary_draw_orders = { north = -1 }
cooling_pond.fluid_boxes[3] = {}
cooling_pond.fluid_boxes[3].production_type = "output"
cooling_pond.fluid_boxes[3].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
cooling_pond.fluid_boxes[3].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
cooling_pond.fluid_boxes[3].base_area = 1
cooling_pond.fluid_boxes[3].base_level = 1
cooling_pond.fluid_boxes[3].pipe_connections = {{ type="output", position = {2, 0} }}
cooling_pond.fluid_boxes[3].secondary_draw_orders = { north = -1 }
data:extend({cooling_pond})
