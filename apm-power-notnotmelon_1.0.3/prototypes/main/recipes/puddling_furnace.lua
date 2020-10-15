require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/puddling_furnace.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('steel-plate')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local item_icon_c = {apm.lib.icons.dynamics.smelting}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steel_0"
recipe.category = 'apm_puddling_furnace'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_smelting"
recipe.order = 'ab_b'
recipe.icons = icons
recipe.crafting_machine_tint = {
        primary = {r = 0.720, g = 0.720, b = 0.720, a = 1.000},
        secondary = {r = 0.720, g = 0.720, b = 0.720, a = 1.000},
        tertiary = {r = 0.720, g = 0.720, b = 0.720, a = 1.000},
        quaternary = {r = 0.720, g = 0.720, b = 0.720, a = 1.000},
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 35
recipe.normal.ingredients = {
        {type="item", name="apm_stone_crucible", amount=4},
        {type="item", name="apm_coke_crushed", amount=10},
        {type="item", name="iron-ore", amount=20},
        {type="fluid", name="water", amount=50, fluidbox_index = 1}
    }
recipe.normal.results = { 
        {type='item', name='steel-plate', amount=4}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 70
recipe.expensive.ingredients = {
        {type="item", name="apm_stone_crucible", amount=4},
        {type="item", name="apm_coke_crushed", amount=15},
        {type="item", name="iron-ore", amount=40},
        {type="fluid", name="water", amount=50, fluidbox_index = 1}
    }
--recipe.expensive.results = {}

data:extend({recipe})
