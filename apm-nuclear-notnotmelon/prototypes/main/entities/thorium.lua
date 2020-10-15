require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/entities/thorium.lua'

APM_LOG_HEADER(self)

local resource_autoplace = require("resource-autoplace");

local autoplace_control = {}
autoplace_control.type = "autoplace-control"
autoplace_control.name = 'thorium-ore'
autoplace_control.richness = true
autoplace_control.order = "e"
autoplace_control.category = "resource"
data:extend({autoplace_control})

local resource = {}
resource.type = "resource"
resource.name = "thorium-ore"
--resource.icons = {
--    {icon=apm.nuclear.icons.thorium_ore.filename}
--}
resource.icons = {
    apm.nuclear.icons.thorium_ore
}
--resource.icon_size = apm.nuclear.icons.thorium_ore.size
resource.icon_mipmaps = apm.nuclear.icons.thorium_ore.icon_mipmaps
resource.flags = {"placeable-neutral"}
resource.order="a-b-f"
resource.tree_removal_probability = 0.7
resource.tree_removal_max_distance = 32 * 32
resource.minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      result = (not data.is_demo) and "thorium-ore" or nil,
      fluid_amount = 10,
      required_fluid = "sulfuric-acid"
    }
resource.collision_box = {{-0.1, -0.1}, {0.1, 0.1}}
resource.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
resource.autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "thorium-ore",
      order = "e",
      base_density = 0.9,
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 4,
      regular_rq_factor_multiplier = 1
    }
resource.stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50}
resource.stages = {}
resource.stages.sheet = {}
resource.stages.sheet.filename = "__apm_resource_pack__/graphics/entities/thorium_ore/thorium_ore.png"
resource.stages.sheet.priority = "extra-high"
resource.stages.sheet.width = 64
resource.stages.sheet.height = 64
resource.stages.sheet.frame_count = 8
resource.stages.sheet.variation_count = 8
resource.stages.sheet.hr_version = {}
resource.stages.sheet.hr_version.filename = "__apm_resource_pack__/graphics/entities/thorium_ore/hr_thorium_ore.png"
resource.stages.sheet.hr_version.priority = "extra-high"
resource.stages.sheet.hr_version.width = 128
resource.stages.sheet.hr_version.height = 128
resource.stages.sheet.hr_version.frame_count = 8
resource.stages.sheet.hr_version.variation_count = 8
resource.stages.sheet.hr_version.scale = 0.5
resource.stages_effect = {}
resource.stages_effect.sheet = {}
resource.stages_effect.sheet.filename = "__apm_resource_pack__/graphics/entities/thorium_ore/thorium_ore_glow.png"
resource.stages_effect.sheet.priority = "extra-high"
resource.stages_effect.sheet.width = 64
resource.stages_effect.sheet.height = 64
resource.stages_effect.sheet.frame_count = 8
resource.stages_effect.sheet.variation_count = 8
resource.stages_effect.sheet.blend_mode = "additive"
resource.stages_effect.sheet.flags = {"light"}
resource.stages_effect.sheet.hr_version = {}
resource.stages_effect.sheet.hr_version.filename = "__apm_resource_pack__/graphics/entities/thorium_ore/hr_thorium_ore_glow.png"
resource.stages_effect.sheet.hr_version.priority = "extra-high"
resource.stages_effect.sheet.hr_version.width = 128
resource.stages_effect.sheet.hr_version.height = 128
resource.stages_effect.sheet.hr_version.frame_count = 8
resource.stages_effect.sheet.hr_version.variation_count = 8
resource.stages_effect.sheet.hr_version.scale = 0.5
resource.stages_effect.sheet.hr_version.blend_mode = "additive"
resource.stages_effect.sheet.hr_version.flags = {"light"}
resource.effect_animation_period = 5
resource.effect_animation_period_deviation = 1
resource.effect_darkness_multiplier = 3.6
resource.min_effect_alpha = 0.2
resource.max_effect_alpha = 0.3
resource.map_color = {0.310, 0.176, 0.110}
data:extend({resource})
