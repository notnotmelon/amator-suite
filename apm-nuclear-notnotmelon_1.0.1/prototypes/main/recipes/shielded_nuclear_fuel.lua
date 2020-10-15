require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/shielded_nuclear_fuel.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_shielded_nuclear_fuel_cell"
recipe.category = 'crafting-with-fluid'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="steel-plate", amount=2},
        {type="item", name="copper-plate", amount=2},
        {type="item", name="apm_fuel_rod_container", amount=1},
        {type="item", name='apm_oxide_pellet_u235', amount=1}
    }
recipe.normal.results = {
        {type='item', name='apm_shielded_nuclear_fuel_cell', amount=1}
    }
recipe.normal.main_product = 'apm_shielded_nuclear_fuel_cell'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_shielded_nuclear_fuel_cell_used')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_shielded_nuclear_fuel_cell_reprocessing"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_products"
recipe.order = 'af_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name='apm_shielded_nuclear_fuel_cell_used', amount=5},
        {type="item", name='apm_oxide_pellet_u235', amount=2},
        {type="item", name='apm_waste_container', amount=1},
        apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
        {type="fluid", name='apm_tbp_30', amount=100}
    }
recipe.normal.results = {
        {type="item", name='apm_oxide_pellet_np237', amount=1, show_details_in_recipe_tooltip=false},
        {type="item", name='apm_oxide_pellet_pu239', amount=1, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_radioactive_waste', amount=1, show_details_in_recipe_tooltip=false},
        {type="item", name='apm_shielded_nuclear_fuel_cell', amount=4},
        {type='item', name='apm_shielded_nuclear_fuel_cell', amount_min=1, amount_max=1, probability=0.9, show_details_in_recipe_tooltip=false},
        {type="fluid", name='apm_radioactive_wastewater', amount=50}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})
