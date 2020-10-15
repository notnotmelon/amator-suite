require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/greenhouse.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_tree_seeds"
recipe.category = 'basic-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2.5
recipe.normal.ingredients = {
        {type="item", name="wood", amount=4}
    }
recipe.normal.results = { 
        {type='item', name='apm_tree_seeds', amount=1}
    }
recipe.normal.main_product = 'apm_tree_seeds'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="wood", amount=5}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fertiliser_1')
--local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fertiliser_1"
recipe.category = 'basic-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'ab_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="sulfur", amount=1},
        {type="item", name="apm_wood_pellets", amount=2},
        {type="item", name="apm_wet_mud", amount=5},
        {type="item", name='apm_generic_ash', amount=10}
    }
recipe.normal.results = { 
        {type='item', name='apm_fertiliser_1', amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fertiliser_2')
--local item_icon_b = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fertiliser_2"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'ab_c'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type='item', name='apm_fertiliser_1', amount=1},
        {type='item', name='apm_ammonium_sulfate', amount=5}
    }
recipe.normal.results = { 
        {type='item', name='apm_fertiliser_2', amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type='item', name='apm_fertiliser_1', amount=1},
        {type='item', name='apm_ammonium_sulfate', amount=7}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('wood')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_wood_0"
recipe.category = 'apm_greenhouse'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'ac_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 100
recipe.normal.ingredients = {
        {type="item", name="apm_tree_seeds", amount=2},
        {type="item", name="apm_wet_mud", amount=2},
        {type="fluid", name="water", amount=200}
    }
recipe.normal.results = { 
        {type='item', name='wood', amount=14},
        {type='item', name='wood', amount_min=1, amount_max=6}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('wood')
local item_icon_b = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_wood_1"
recipe.category = 'apm_greenhouse'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'ac_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 250
recipe.normal.ingredients = {
        {type="item", name="apm_tree_seeds", amount=4},
        {type="item", name="apm_fertiliser_1", amount=3},
        {type="fluid", name="water", amount=200}
    }
recipe.normal.results = { 
        {type='item', name='wood', amount=60}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('wood')
local item_icon_b = {apm.lib.icons.dynamics.t3}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_wood_2"
recipe.category = 'apm_greenhouse'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'ac_c'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 175
recipe.normal.ingredients = {
        {type="item", name="apm_tree_seeds", amount=4},
        {type="item", name="apm_fertiliser_2", amount=4},
        {type="fluid", name="water", amount=200}
    }
recipe.normal.results = { 
        {type='item', name='wood', amount=75}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})
