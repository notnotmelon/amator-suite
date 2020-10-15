require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/press.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_press_plates"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3
recipe.normal.ingredients = {
        {type="item", name="steel-plate", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_press_plates', amount=1}
    }
recipe.normal.main_product = 'apm_press_plates'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="steel-plate", amount=3}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_press_plates_used')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_press_plates_used_grind"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_tools"
recipe.order = 'ad_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3
recipe.normal.ingredients = {
        {type="fluid", name="water", amount=30},
        {type="item", name="apm_press_plates_used", amount=5},
        {type="item", name="apm_crushed_stone", amount=2}
    }
recipe.normal.results = { 
        {type="item", name="apm_press_plates", amount=4, catalyst_amount=4},
        {type="item", name="apm_press_plates", amount_min=1, amount_max=1, probability=0.95, catalyst_amount=1},
        {type="fluid", name="apm_dirt_water", amount=30, catalyst_amount=30}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})
