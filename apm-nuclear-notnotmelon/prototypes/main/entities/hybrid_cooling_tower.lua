require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/entities/hybrid_cooling_tower.lua'

APM_LOG_HEADER(self)

local hybrid_cooling_tower = {}
hybrid_cooling_tower.type = "furnace"
hybrid_cooling_tower.name = "apm_hybrid_cooling_tower_0"
hybrid_cooling_tower.icons = {
    apm.nuclear.icons.hybrid_cooling_tower
}
--hybrid_cooling_tower.icon_size = 32
hybrid_cooling_tower.flags = {"placeable-neutral", "placeable-player", "player-creation"}
hybrid_cooling_tower.minable = {mining_time = 0.2, result = "apm_hybrid_cooling_tower_0"}
hybrid_cooling_tower.crafting_categories = {"apm_fluid_cooling_0"}
hybrid_cooling_tower.crafting_speed = 1
hybrid_cooling_tower.source_inventory_size = 0
hybrid_cooling_tower.result_inventory_size = 0
hybrid_cooling_tower.fast_replaceable_group = "apm_hybrid_cooling_tower"
hybrid_cooling_tower.next_upgrade = nil
hybrid_cooling_tower.max_health = 250
hybrid_cooling_tower.corpse = "big-remnants"
hybrid_cooling_tower.dying_explosion = "medium-explosion"
hybrid_cooling_tower.resistances = {{type = "fire", percent = 90}}
hybrid_cooling_tower.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
hybrid_cooling_tower.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
hybrid_cooling_tower.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
hybrid_cooling_tower.open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 }
hybrid_cooling_tower.close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
hybrid_cooling_tower.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
hybrid_cooling_tower.working_sound = {}
hybrid_cooling_tower.working_sound.sound = {}
hybrid_cooling_tower.working_sound.sound.filename = "__apm_resource_pack__/sounds/entities/hybrid_cooling_tower.ogg"
hybrid_cooling_tower.working_sound.sound.volume = 0.8
hybrid_cooling_tower.working_sound.idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 }
hybrid_cooling_tower.working_sound.apparent_volume = 1.5
hybrid_cooling_tower.module_specification = nil
hybrid_cooling_tower.allowed_effects = nil
hybrid_cooling_tower.energy_usage = "300kW"
hybrid_cooling_tower.energy_source = {}
hybrid_cooling_tower.energy_source.type = 'electric'
hybrid_cooling_tower.energy_source.usage_priority = "secondary-input"
hybrid_cooling_tower.energy_source.emissions_per_minute = 0.25
hybrid_cooling_tower.animation = {}
hybrid_cooling_tower.animation.layers = {}
hybrid_cooling_tower.animation.layers[1] = {}
hybrid_cooling_tower.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/hybrid_cooling_tower/hybrid_cooling_tower_0.png"
hybrid_cooling_tower.animation.layers[1].priority="high"
hybrid_cooling_tower.animation.layers[1].width = 160
hybrid_cooling_tower.animation.layers[1].height = 128
hybrid_cooling_tower.animation.layers[1].frame_count = 1
hybrid_cooling_tower.animation.layers[1].line_length = 1
hybrid_cooling_tower.animation.layers[1].shift = {0.4375, -0.28125}
hybrid_cooling_tower.animation.layers[1].animation_speed = 0.53333335
hybrid_cooling_tower.animation.layers[1].hr_version = {}
hybrid_cooling_tower.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/hybrid_cooling_tower/hr_hybrid_cooling_tower_0.png"
hybrid_cooling_tower.animation.layers[1].hr_version.priority="high"
hybrid_cooling_tower.animation.layers[1].hr_version.width = 320
hybrid_cooling_tower.animation.layers[1].hr_version.height = 256
hybrid_cooling_tower.animation.layers[1].hr_version.frame_count = 1
hybrid_cooling_tower.animation.layers[1].hr_version.line_length = 1
hybrid_cooling_tower.animation.layers[1].hr_version.shift = {0.4375, -0.28125}
hybrid_cooling_tower.animation.layers[1].hr_version.scale = 0.5
hybrid_cooling_tower.animation.layers[1].hr_version.animation_speed = 0.53333335
hybrid_cooling_tower.animation.layers[2] = {}
hybrid_cooling_tower.animation.layers[2].filename = "__apm_resource_pack__/graphics/entities/hybrid_cooling_tower/hybrid_cooling_tower_shadow.png"
hybrid_cooling_tower.animation.layers[2].priority="high"
hybrid_cooling_tower.animation.layers[2].draw_as_shadow = true
hybrid_cooling_tower.animation.layers[2].width = 160
hybrid_cooling_tower.animation.layers[2].height = 128
hybrid_cooling_tower.animation.layers[2].frame_count = 1
hybrid_cooling_tower.animation.layers[2].line_length = 1
hybrid_cooling_tower.animation.layers[2].shift = {0.4375, -0.28125}
hybrid_cooling_tower.animation.layers[2].animation_speed = 0.53333335
hybrid_cooling_tower.animation.layers[2].hr_version = {}
hybrid_cooling_tower.animation.layers[2].hr_version.filename = "__apm_resource_pack__/graphics/entities/hybrid_cooling_tower/hr_hybrid_cooling_tower_shadow.png"
hybrid_cooling_tower.animation.layers[2].hr_version.priority="high"
hybrid_cooling_tower.animation.layers[2].hr_version.draw_as_shadow = true
hybrid_cooling_tower.animation.layers[2].hr_version.width = 320
hybrid_cooling_tower.animation.layers[2].hr_version.height = 256
hybrid_cooling_tower.animation.layers[2].hr_version.frame_count = 1
hybrid_cooling_tower.animation.layers[2].hr_version.line_length = 1
hybrid_cooling_tower.animation.layers[2].hr_version.shift = {0.4375, -0.28125}
hybrid_cooling_tower.animation.layers[2].hr_version.scale = 0.5
hybrid_cooling_tower.animation.layers[2].hr_version.animation_speed = 0.53333335
hybrid_cooling_tower.working_visualisations = {}
hybrid_cooling_tower.working_visualisations[1] = {}
hybrid_cooling_tower.working_visualisations[1].apply_recipe_tint = "tertiary"
hybrid_cooling_tower.working_visualisations[1].fadeout = true
hybrid_cooling_tower.working_visualisations[1].constant_speed = true
hybrid_cooling_tower.working_visualisations[1].north_position = util.by_pixel_hr(-38, -120)
hybrid_cooling_tower.working_visualisations[1].east_position = util.by_pixel_hr(-38, -120)
hybrid_cooling_tower.working_visualisations[1].south_position = util.by_pixel_hr(-38, -120)
hybrid_cooling_tower.working_visualisations[1].west_position = util.by_pixel_hr(-38, -120)
hybrid_cooling_tower.working_visualisations[1].render_layer = "wires"
hybrid_cooling_tower.working_visualisations[1].animation = {}
hybrid_cooling_tower.working_visualisations[1].animation.filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[1].animation.frame_count = 47
hybrid_cooling_tower.working_visualisations[1].animation.line_length = 16
hybrid_cooling_tower.working_visualisations[1].animation.width = 46
hybrid_cooling_tower.working_visualisations[1].animation.height = 94
hybrid_cooling_tower.working_visualisations[1].animation.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[1].animation.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[1].animation.hr_version = {}
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.frame_count = 47
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.line_length = 16
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.width = 90
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.height = 188
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[1].animation.hr_version.scale = 0.5
hybrid_cooling_tower.working_visualisations[2] = {}
hybrid_cooling_tower.working_visualisations[2].apply_recipe_tint = "tertiary"
hybrid_cooling_tower.working_visualisations[2].fadeout = true
hybrid_cooling_tower.working_visualisations[2].constant_speed = true
hybrid_cooling_tower.working_visualisations[2].north_position = util.by_pixel_hr(-1, -120)
hybrid_cooling_tower.working_visualisations[2].east_position = util.by_pixel_hr(-1, -120)
hybrid_cooling_tower.working_visualisations[2].south_position = util.by_pixel_hr(-1, -120)
hybrid_cooling_tower.working_visualisations[2].west_position = util.by_pixel_hr(-1, -120)
hybrid_cooling_tower.working_visualisations[2].render_layer = "wires"
hybrid_cooling_tower.working_visualisations[2].animation = {}
hybrid_cooling_tower.working_visualisations[2].animation.filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[2].animation.frame_count = 47
hybrid_cooling_tower.working_visualisations[2].animation.line_length = 16
hybrid_cooling_tower.working_visualisations[2].animation.width = 46
hybrid_cooling_tower.working_visualisations[2].animation.height = 94
hybrid_cooling_tower.working_visualisations[2].animation.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[2].animation.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[2].animation.hr_version = {}
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.frame_count = 47
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.line_length = 16
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.width = 90
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.height = 188
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[2].animation.hr_version.scale = 0.5
hybrid_cooling_tower.working_visualisations[3] = {}
hybrid_cooling_tower.working_visualisations[3].apply_recipe_tint = "tertiary"
hybrid_cooling_tower.working_visualisations[3].fadeout = true
hybrid_cooling_tower.working_visualisations[3].constant_speed = true
hybrid_cooling_tower.working_visualisations[3].north_position = util.by_pixel_hr(37, -120)
hybrid_cooling_tower.working_visualisations[3].east_position = util.by_pixel_hr(37, -120)
hybrid_cooling_tower.working_visualisations[3].south_position = util.by_pixel_hr(37, -120)
hybrid_cooling_tower.working_visualisations[3].west_position = util.by_pixel_hr(37, -120)
hybrid_cooling_tower.working_visualisations[3].render_layer = "wires"
hybrid_cooling_tower.working_visualisations[3].animation = {}
hybrid_cooling_tower.working_visualisations[3].animation.filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[3].animation.frame_count = 47
hybrid_cooling_tower.working_visualisations[3].animation.line_length = 16
hybrid_cooling_tower.working_visualisations[3].animation.width = 46
hybrid_cooling_tower.working_visualisations[3].animation.height = 94
hybrid_cooling_tower.working_visualisations[3].animation.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[3].animation.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[3].animation.hr_version = {}
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png"
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.frame_count = 47
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.line_length = 16
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.width = 90
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.height = 188
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.animation_speed = 0.5
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.shift = util.by_pixel(-2, -40)
hybrid_cooling_tower.working_visualisations[3].animation.hr_version.scale = 0.5
hybrid_cooling_tower.fluid_boxes = {}
hybrid_cooling_tower.fluid_boxes[1] = {}
hybrid_cooling_tower.fluid_boxes[1].production_type = "input"
hybrid_cooling_tower.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
hybrid_cooling_tower.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
hybrid_cooling_tower.fluid_boxes[1].base_area = 10
hybrid_cooling_tower.fluid_boxes[1].base_level = -1
hybrid_cooling_tower.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, 2} }}
hybrid_cooling_tower.fluid_boxes[1].secondary_draw_orders = { north = -1 }
hybrid_cooling_tower.fluid_boxes[2] = {}
hybrid_cooling_tower.fluid_boxes[2].production_type = "output"
hybrid_cooling_tower.fluid_boxes[2].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
hybrid_cooling_tower.fluid_boxes[2].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
hybrid_cooling_tower.fluid_boxes[2].base_area = 10
hybrid_cooling_tower.fluid_boxes[2].base_level = 1
hybrid_cooling_tower.fluid_boxes[2].pipe_connections = {{ type="output", position = {0, -2} }}
hybrid_cooling_tower.fluid_boxes[2].secondary_draw_orders = { north = -1 }
data:extend({hybrid_cooling_tower})
