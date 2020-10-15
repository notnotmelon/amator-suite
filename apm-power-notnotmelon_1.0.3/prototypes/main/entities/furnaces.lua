require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/furnaces.lua'

APM_LOG_HEADER(self)

-- Smoke ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local smoke_puddling_furnace = {}
local smoke_puddling_furnace_position_a = {0, -0.55}
local smoke_puddling_furnace_position_b = {0, -1.15}
local smoke_puddling_furnace_position_c = {0, -1.75}
smoke_puddling_furnace[1] = {}
smoke_puddling_furnace[1].name = "apm_dark_light_smoke"
smoke_puddling_furnace[1].deviation = {0.1, 0.1}
smoke_puddling_furnace[1].frequency = 4
smoke_puddling_furnace[1].north_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].south_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].east_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].west_position = smoke_puddling_furnace_position_a
smoke_puddling_furnace[1].starting_vertical_speed = 0.08
smoke_puddling_furnace[1].starting_frame_deviation = 60
smoke_puddling_furnace[1].slow_down_factor = 1
smoke_puddling_furnace[2] = {}
smoke_puddling_furnace[2].name = "apm_dark_light_smoke"
smoke_puddling_furnace[2].deviation = {0.1, 0.1}
smoke_puddling_furnace[2].frequency = 3.4
smoke_puddling_furnace[2].north_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].south_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].east_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].west_position = smoke_puddling_furnace_position_b
smoke_puddling_furnace[2].starting_vertical_speed = 0.08
smoke_puddling_furnace[2].starting_frame_deviation = 60
smoke_puddling_furnace[2].slow_down_factor = 1
smoke_puddling_furnace[3] = {}
smoke_puddling_furnace[3].name = "apm_dark_light_smoke"
smoke_puddling_furnace[3].deviation = {0.1, 0.1}
smoke_puddling_furnace[3].frequency = 2.8
smoke_puddling_furnace[3].north_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].south_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].east_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].west_position = smoke_puddling_furnace_position_c
smoke_puddling_furnace[3].starting_vertical_speed = 0.08
smoke_puddling_furnace[3].starting_frame_deviation = 60
smoke_puddling_furnace[3].slow_down_factor = 1

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local puddling_furnace = {}
puddling_furnace.type = "assembling-machine"
puddling_furnace.name = "apm_puddling_furnace_0"
puddling_furnace.icons = {
    apm.lib.icons.dynamics.machine.t0,
    apm.lib.icons.dynamics.lable_pf
}
--puddling_furnace.icon_size = 32
puddling_furnace.flags = {"placeable-neutral", "placeable-player", "player-creation"}
puddling_furnace.minable = {mining_time = 0.2, result = "apm_puddling_furnace_0"}
puddling_furnace.crafting_categories = {"apm_puddling_furnace"}
puddling_furnace.crafting_speed = 1
puddling_furnace.fast_replaceable_group = "apm_steelworks"
puddling_furnace.next_upgrade = "apm_steelworks_0"
puddling_furnace.max_health = 250
puddling_furnace.corpse = "big-remnants"
puddling_furnace.dying_explosion = "medium-explosion"
puddling_furnace.resistances = {{type = "fire", percent = 90}}
puddling_furnace.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
puddling_furnace.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
puddling_furnace.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
puddling_furnace.open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 }
puddling_furnace.close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
puddling_furnace.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
puddling_furnace.working_sound = {}
puddling_furnace.working_sound.sound = {{filename = "__base__/sound/electric-furnace.ogg"}}
puddling_furnace.energy_usage = apm.power.constants.energy_usage.puddling_furnace_0
puddling_furnace.module_specification = apm.power.constants.modules.specification_0
puddling_furnace.allowed_effects = apm.power.constants.modules.allowed_effects_0
puddling_furnace.energy_source = {}
puddling_furnace.energy_source.type = "burner"
puddling_furnace.energy_source.fuel_categories = {'apm_refined_chemical'}
puddling_furnace.energy_source.effectivity = 1
puddling_furnace.energy_source.fuel_inventory_size = 1
puddling_furnace.energy_source.burnt_inventory_size = 1
puddling_furnace.energy_source.emissions_per_minute = apm.power.constants.emissions.cp_0
puddling_furnace.energy_source.smoke = smoke_puddling_furnace
puddling_furnace.animation = {}
puddling_furnace.animation.layers = {}
puddling_furnace.animation.layers[1] = {}
puddling_furnace.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/puddling_furnace_0.png"
puddling_furnace.animation.layers[1].priority="high"
puddling_furnace.animation.layers[1].width = 160
puddling_furnace.animation.layers[1].height = 128
puddling_furnace.animation.layers[1].frame_count = 16
puddling_furnace.animation.layers[1].line_length = 8
puddling_furnace.animation.layers[1].shift = {0.4375, -0.28125}
puddling_furnace.animation.layers[1].animation_speed = 0.26666667
puddling_furnace.animation.layers[1].hr_version = {}
puddling_furnace.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/hr_puddling_furnace_0.png"
puddling_furnace.animation.layers[1].hr_version.priority="high"
puddling_furnace.animation.layers[1].hr_version.width = 320
puddling_furnace.animation.layers[1].hr_version.height = 256
puddling_furnace.animation.layers[1].hr_version.frame_count = 16
puddling_furnace.animation.layers[1].hr_version.line_length = 8
puddling_furnace.animation.layers[1].hr_version.shift = {0.4375, -0.28125}
puddling_furnace.animation.layers[1].hr_version.scale = 0.5
puddling_furnace.animation.layers[1].hr_version.animation_speed = 0.26666667
puddling_furnace.animation.layers[2] = {}
puddling_furnace.animation.layers[2].filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/puddling_furnace_shadow.png"
puddling_furnace.animation.layers[2].priority="high"
puddling_furnace.animation.layers[2].draw_as_shadow = true
puddling_furnace.animation.layers[2].width = 160
puddling_furnace.animation.layers[2].height = 128
puddling_furnace.animation.layers[2].frame_count = 16
puddling_furnace.animation.layers[2].line_length = 8
puddling_furnace.animation.layers[2].shift = {0.4375, -0.28125}
puddling_furnace.animation.layers[2].animation_speed = 0.26666667
puddling_furnace.animation.layers[2].hr_version = {}
puddling_furnace.animation.layers[2].hr_version.filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/hr_puddling_furnace_shadow.png"
puddling_furnace.animation.layers[2].hr_version.priority="high"
puddling_furnace.animation.layers[2].hr_version.draw_as_shadow = true
puddling_furnace.animation.layers[2].hr_version.width = 320
puddling_furnace.animation.layers[2].hr_version.height = 256
puddling_furnace.animation.layers[2].hr_version.frame_count = 16
puddling_furnace.animation.layers[2].hr_version.line_length = 8
puddling_furnace.animation.layers[2].hr_version.shift = {0.4375, -0.28125}
puddling_furnace.animation.layers[2].hr_version.scale = 0.5
puddling_furnace.animation.layers[2].hr_version.animation_speed = 0.26666667
puddling_furnace.idle_animation = {}
puddling_furnace.idle_animation.layers = {}
puddling_furnace.idle_animation.layers[1] = {}
puddling_furnace.idle_animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/puddling_furnace_idle_0.png"
puddling_furnace.idle_animation.layers[1].priority="high"
puddling_furnace.idle_animation.layers[1].width = 160
puddling_furnace.idle_animation.layers[1].height = 128
puddling_furnace.idle_animation.layers[1].frame_count = 16
puddling_furnace.idle_animation.layers[1].line_length = 8
puddling_furnace.idle_animation.layers[1].shift = {0.4375, -0.28125}
puddling_furnace.idle_animation.layers[1].animation_speed = 0.26666667
puddling_furnace.idle_animation.layers[1].hr_version = {}
puddling_furnace.idle_animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/puddling_furnace/hr_puddling_furnace_idle_0.png"
puddling_furnace.idle_animation.layers[1].hr_version.priority="high"
puddling_furnace.idle_animation.layers[1].hr_version.width = 320
puddling_furnace.idle_animation.layers[1].hr_version.height = 256
puddling_furnace.idle_animation.layers[1].hr_version.frame_count = 16
puddling_furnace.idle_animation.layers[1].hr_version.line_length = 8
puddling_furnace.idle_animation.layers[1].hr_version.shift = {0.4375, -0.28125}
puddling_furnace.idle_animation.layers[1].hr_version.scale = 0.5
puddling_furnace.idle_animation.layers[1].hr_version.animation_speed = 0.26666667
puddling_furnace.idle_animation.layers[2] = puddling_furnace.animation.layers[2]
puddling_furnace.fluid_boxes = {}
puddling_furnace.fluid_boxes[1] = {}
puddling_furnace.fluid_boxes[1].production_type = "input"
puddling_furnace.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler1pipepictures()
puddling_furnace.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
puddling_furnace.fluid_boxes[1].base_area = 1
puddling_furnace.fluid_boxes[1].base_level = -1
puddling_furnace.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, 2} }}
puddling_furnace.fluid_boxes[1].secondary_draw_orders = { north = -1 }
puddling_furnace.fluid_boxes.off_when_no_fluid_recipe = true
data:extend({puddling_furnace})

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local steelworks = {}
steelworks.type = "assembling-machine"
steelworks.name = "apm_steelworks_0"
steelworks.icons = {
    apm.lib.icons.dynamics.machine.t2,
    apm.lib.icons.dynamics.lable_sw
}
--steelworks.icon_size = 32
steelworks.flags = {"placeable-neutral", "placeable-player", "player-creation"}
steelworks.minable = {mining_time = 0.2, result = "apm_steelworks_0"}
steelworks.crafting_categories = {"apm_steelworks"}
steelworks.crafting_speed = 2
steelworks.fast_replaceable_group = "apm_steelworks"
steelworks.next_upgrade = 'apm_steelworks_1'
steelworks.max_health = 250
steelworks.corpse = "big-remnants"
steelworks.dying_explosion = "medium-explosion"
steelworks.resistances = {{type = "fire", percent = 90}}
steelworks.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
steelworks.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
steelworks.light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.5, b = 0.0}}
steelworks.open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 }
steelworks.close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
steelworks.vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
steelworks.working_sound = {}
steelworks.working_sound.sound = {{filename = "__base__/sound/furnace.ogg"}}
steelworks.energy_usage = apm.power.constants.energy_usage.steelworks_0
steelworks.module_specification = apm.power.constants.modules.specification_2
steelworks.allowed_effects = apm.power.constants.modules.allowed_effects_2
steelworks.energy_source = {}
steelworks.energy_source.type = "electric"
steelworks.energy_source.usage_priority = "secondary-input"
steelworks.energy_source.drain = apm.power.constants.engery_drain.steelworks_0
steelworks.energy_source.emissions_per_minute = apm.power.constants.emissions.cp_2
steelworks.animation = {}
steelworks.animation.layers = {}
steelworks.animation.layers[1] = {}
steelworks.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/steelworks/steelworks_0.png"
steelworks.animation.layers[1].priority="high"
steelworks.animation.layers[1].width = 160
steelworks.animation.layers[1].height = 128
steelworks.animation.layers[1].frame_count = 16
steelworks.animation.layers[1].line_length = 8
steelworks.animation.layers[1].shift = {0.4375, -0.28125}
steelworks.animation.layers[1].animation_speed = 0.53333334
steelworks.animation.layers[1].hr_version = {}
steelworks.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/steelworks/hr_steelworks_0.png"
steelworks.animation.layers[1].hr_version.priority="high"
steelworks.animation.layers[1].hr_version.width = 320
steelworks.animation.layers[1].hr_version.height = 256
steelworks.animation.layers[1].hr_version.frame_count = 16
steelworks.animation.layers[1].hr_version.line_length = 8
steelworks.animation.layers[1].hr_version.shift = {0.4375, -0.28125}
steelworks.animation.layers[1].hr_version.scale = 0.5
steelworks.animation.layers[1].hr_version.animation_speed = 0.53333334
steelworks.animation.layers[2] = {}
steelworks.animation.layers[2].filename = "__apm_resource_pack__/graphics/entities/steelworks/steelworks_shadow.png"
steelworks.animation.layers[2].priority="high"
steelworks.animation.layers[2].draw_as_shadow = true
steelworks.animation.layers[2].width = 160
steelworks.animation.layers[2].height = 128
steelworks.animation.layers[2].frame_count = 16
steelworks.animation.layers[2].line_length = 8
steelworks.animation.layers[2].shift = {0.4375, -0.28125}
steelworks.animation.layers[2].animation_speed = 0.53333334
steelworks.animation.layers[2].hr_version = {}
steelworks.animation.layers[2].hr_version.filename = "__apm_resource_pack__/graphics/entities/steelworks/hr_steelworks_shadow.png"
steelworks.animation.layers[2].hr_version.priority="high"
steelworks.animation.layers[2].hr_version.draw_as_shadow = true
steelworks.animation.layers[2].hr_version.width = 320
steelworks.animation.layers[2].hr_version.height = 256
steelworks.animation.layers[2].hr_version.frame_count = 16
steelworks.animation.layers[2].hr_version.line_length = 8
steelworks.animation.layers[2].hr_version.shift = {0.4375, -0.28125}
steelworks.animation.layers[2].hr_version.scale = 0.5
steelworks.animation.layers[2].hr_version.animation_speed = 0.53333334
steelworks.idle_animation = {}
steelworks.idle_animation.layers = {}
steelworks.idle_animation.layers[1] = {}
steelworks.idle_animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/steelworks/steelworks_idle_0.png"
steelworks.idle_animation.layers[1].priority="high"
steelworks.idle_animation.layers[1].width = 160
steelworks.idle_animation.layers[1].height = 128
steelworks.idle_animation.layers[1].frame_count = 16
steelworks.idle_animation.layers[1].line_length = 8
steelworks.idle_animation.layers[1].shift = {0.4375, -0.28125}
steelworks.idle_animation.layers[1].animation_speed = 0.53333334
steelworks.idle_animation.layers[1].hr_version = {}
steelworks.idle_animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/steelworks/hr_steelworks_idle_0.png"
steelworks.idle_animation.layers[1].hr_version.priority="high"
steelworks.idle_animation.layers[1].hr_version.width = 320
steelworks.idle_animation.layers[1].hr_version.height = 256
steelworks.idle_animation.layers[1].hr_version.frame_count = 16
steelworks.idle_animation.layers[1].hr_version.line_length = 8
steelworks.idle_animation.layers[1].hr_version.shift = {0.4375, -0.28125}
steelworks.idle_animation.layers[1].hr_version.scale = 0.5
steelworks.idle_animation.layers[1].hr_version.animation_speed = 0.53333334
steelworks.idle_animation.layers[2] = steelworks.animation.layers[2]
steelworks.working_visualisations = {}
steelworks.working_visualisations[1] = {}
steelworks.working_visualisations[1].apply_recipe_tint = "tertiary"
steelworks.working_visualisations[1].fadeout = true
steelworks.working_visualisations[1].constant_speed = true
steelworks.working_visualisations[1].north_position = util.by_pixel_hr(-12, -142)
steelworks.working_visualisations[1].east_position = util.by_pixel_hr(-12, -142)
steelworks.working_visualisations[1].south_position = util.by_pixel_hr(-12, -142)
steelworks.working_visualisations[1].west_position = util.by_pixel_hr(-30, -167)
steelworks.working_visualisations[1].render_layer = "wires"
steelworks.working_visualisations[1].animation = {}
steelworks.working_visualisations[1].animation.filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png"
steelworks.working_visualisations[1].animation.frame_count = 47
steelworks.working_visualisations[1].animation.line_length = 16
steelworks.working_visualisations[1].animation.width = 46
steelworks.working_visualisations[1].animation.height = 94
steelworks.working_visualisations[1].animation.animation_speed = 0.5
steelworks.working_visualisations[1].animation.shift = util.by_pixel(-2, -40)
steelworks.working_visualisations[1].animation.hr_version = {}
steelworks.working_visualisations[1].animation.hr_version.filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png"
steelworks.working_visualisations[1].animation.hr_version.frame_count = 47
steelworks.working_visualisations[1].animation.hr_version.line_length = 16
steelworks.working_visualisations[1].animation.hr_version.width = 90
steelworks.working_visualisations[1].animation.hr_version.height = 188
steelworks.working_visualisations[1].animation.hr_version.animation_speed = 0.5
steelworks.working_visualisations[1].animation.hr_version.shift = util.by_pixel(-2, -40)
steelworks.working_visualisations[1].animation.hr_version.scale = 0.5
steelworks.fluid_boxes = {}
steelworks.fluid_boxes[1] = {}
steelworks.fluid_boxes[1].production_type = "input"
steelworks.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
steelworks.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
steelworks.fluid_boxes[1].base_area = 1
steelworks.fluid_boxes[1].base_level = -1
steelworks.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, -2} }}
steelworks.fluid_boxes[1].secondary_draw_orders = { north = -1 }
steelworks.fluid_boxes[2] = {}
steelworks.fluid_boxes[2].production_type = "output"
steelworks.fluid_boxes[2].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
steelworks.fluid_boxes[2].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
steelworks.fluid_boxes[2].base_area = 1
steelworks.fluid_boxes[2].base_level = 1
steelworks.fluid_boxes[2].pipe_connections = {{ type="output", position = {-2, 0} }}
steelworks.fluid_boxes[2].secondary_draw_orders = { north = -1 }
steelworks.fluid_boxes[3] = {}
steelworks.fluid_boxes[3].production_type = "output"
steelworks.fluid_boxes[3].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
steelworks.fluid_boxes[3].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
steelworks.fluid_boxes[3].base_area = 1
steelworks.fluid_boxes[3].base_level = 1
steelworks.fluid_boxes[3].pipe_connections = {{ type="output", position = {2, 0} }}
steelworks.fluid_boxes[3].secondary_draw_orders = { north = -1 }
steelworks.fluid_boxes[4] = {}
steelworks.fluid_boxes[4].production_type = "input"
steelworks.fluid_boxes[4].pipe_picture = apm.lib.utils.pipecovers.assembler3pipepictures()
steelworks.fluid_boxes[4].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
steelworks.fluid_boxes[4].base_area = 1
steelworks.fluid_boxes[4].base_level = -1
steelworks.fluid_boxes[4].pipe_connections = {{ type="input", position = {0, 2} }}
steelworks.fluid_boxes[4].secondary_draw_orders = { north = -1 }
steelworks.fluid_boxes.off_when_no_fluid_recipe = true
data:extend({steelworks})

-- Entity ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
steelworks = table.deepcopy(steelworks)
steelworks.name = "apm_steelworks_1"
steelworks.icons = {
    apm.lib.icons.dynamics.machine.t3,
    apm.lib.icons.dynamics.lable_sw
}
steelworks.minable = {mining_time = 0.2, result = "apm_steelworks_1"}
steelworks.next_upgrade = nil
steelworks.max_health = 350
steelworks.energy_usage = apm.power.constants.energy_usage.steelworks_1
steelworks.module_specification = apm.power.constants.modules.specification_3
steelworks.allowed_effects = apm.power.constants.modules.allowed_effects_3
steelworks.energy_source.drain = apm.power.constants.engery_drain.steelworks_1
steelworks.energy_source.emissions_per_minute = apm.power.constants.emissions.cp_3
steelworks.crafting_speed = 3
steelworks.animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/steelworks/steelworks_1.png"
steelworks.animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/steelworks/hr_steelworks_1.png"
steelworks.idle_animation.layers[1].filename = "__apm_resource_pack__/graphics/entities/steelworks/steelworks_idle_1.png"
steelworks.idle_animation.layers[1].hr_version.filename = "__apm_resource_pack__/graphics/entities/steelworks/hr_steelworks_idle_1.png"
steelworks.animation.layers[1].animation_speed = 0.33333334
steelworks.animation.layers[1].hr_version.animation_speed = 0.33333334
steelworks.animation.layers[2].animation_speed = 0.33333334
steelworks.animation.layers[2].hr_version.animation_speed = 0.33333334
steelworks.idle_animation.layers[1].animation_speed = 0.33333334
steelworks.idle_animation.layers[1].hr_version.animation_speed = 0.33333334
steelworks.idle_animation.layers[2].animation_speed = 0.33333334
steelworks.idle_animation.layers[2].hr_version.animation_speed = 0.33333334
steelworks.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler4pipepictures()
steelworks.fluid_boxes[2].pipe_picture = apm.lib.utils.pipecovers.assembler4pipepictures()
steelworks.fluid_boxes[3].pipe_picture = apm.lib.utils.pipecovers.assembler4pipepictures()
steelworks.fluid_boxes[4].pipe_picture = apm.lib.utils.pipecovers.assembler4pipepictures()
data:extend({steelworks})