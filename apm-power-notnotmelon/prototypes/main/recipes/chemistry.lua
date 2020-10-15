require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/chemistry.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_treated_wood_planks')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_saw_blade_iron')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.6, {-6, -3})
local item_icon_c = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_treated_wood_planks_1"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ag_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="wood", amount=5},
        {type="item", name="apm_saw_blade_iron", amount=1},
        {type="fluid", name="apm_creosote", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_treated_wood_planks', amount=10},
        {type="item", name="apm_saw_blade_iron_used", amount=1, catalyst_amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
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
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_treated_wood_planks')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_saw_blade_iron')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.6, {-6, -3})
local item_icon_c = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_treated_wood_planks_1b"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ag_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="wood", amount=5},
        {type="item", name="apm_saw_blade_iron", amount=1},
        {type="fluid", name="heavy-oil", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_treated_wood_planks', amount=10},
        {type="item", name="apm_saw_blade_iron_used", amount=1, catalyst_amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
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
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_treated_wood_planks')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_saw_blade_steel')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.6, {-6, -3})
local item_icon_c = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_treated_wood_planks_2"
recipe.category = 'crafting-with-fluid'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ag_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="wood", amount=5},
        {type="item", name="apm_saw_blade_steel", amount=1},
        {type="fluid", name="apm_creosote", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_treated_wood_planks', amount=15},
        {type="item", name="apm_saw_blade_steel_used", amount=1, catalyst_amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
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
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_treated_wood_planks')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_saw_blade_steel')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.6, {-6, -3})
local item_icon_c = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_treated_wood_planks_2b"
recipe.category = 'crafting-with-fluid'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ag_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="wood", amount=5},
        {type="item", name="apm_saw_blade_steel", amount=1},
        {type="fluid", name="heavy-oil", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_treated_wood_planks', amount=15},
        {type="item", name="apm_saw_blade_steel_used", amount=1, catalyst_amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
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
local recipe_icon = apm.lib.utils.icon.get.from_recipe('basic-oil-processing')
local fluid_icon = apm.lib.utils.icon.get.from_item('wood')
fluid_icon = apm.lib.utils.icons.mod(fluid_icon, 0.6, {-8,-8})
local icons = apm.lib.utils.icon.merge({recipe_icon, fluid_icon})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_refining_wood_1"
recipe.category = 'oil-processing'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_fluid"
recipe.order = 'ba_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name="wood", amount=10},
        {type="fluid", name="steam", amount=50}
    }
recipe.normal.results = {
        {type='fluid', name='apm_creosote', amount=80},
        {type="fluid", name="apm_coke_oven_gas", amount=20}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 5.5
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe_icon = apm.lib.utils.icon.get.from_recipe('basic-oil-processing')
local fluid_icon = apm.lib.utils.icon.get.from_fluid('apm_creosote')
fluid_icon = apm.lib.utils.icons.mod(fluid_icon, 0.6, {-8,-8})
local icons = apm.lib.utils.icon.merge({recipe_icon, fluid_icon})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_refining_creosote_1"
recipe.category = 'oil-processing'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_fluid"
recipe.order = 'ba_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="fluid", name="apm_creosote", amount=100},
        {type="fluid", name="steam", amount=50}
    }
recipe.normal.results = { 
        {type='fluid', name='heavy-oil', amount=25},
        {type="fluid", name="light-oil", amount=20},
        {type="fluid", name="petroleum-gas", amount=15}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 5.5
recipe.expensive.ingredients = {
        {type="fluid", name="apm_creosote", amount=120},
        {type="fluid", name="steam", amount=50}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe_icon = apm.lib.utils.icon.get.from_recipe('basic-oil-processing')
recipe_icon = apm.lib.utils.icons.mod(recipe_icon, 1, {4,0})
local fluid_icon = apm.lib.utils.icon.get.from_fluid('apm_coke_oven_gas')
fluid_icon = apm.lib.utils.icons.mod(fluid_icon, 0.6, {-8,-8})
local icons = apm.lib.utils.icon.merge({recipe_icon, fluid_icon})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_refining_coke_oven_gas_1"
recipe.category = 'chemistry'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_fluid"
recipe.order = 'ba_c'
recipe.icons = icons
recipe.crafting_machine_tint = {
        primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
        secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
        tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000}, -- #e4c597ff
        quaternary = {r = 1.000, g = 0.734, b = 0.290, a = 1.000}, -- #ffbb49ff
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="fluid", name="apm_coke_oven_gas", amount=100}
    }
recipe.normal.results = { 
        {type="fluid", name="petroleum-gas", amount=10}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 5.5
recipe.expensive.ingredients = {
        {type="fluid", name="apm_coke_oven_gas", amount=120}
    }
--recipe.expensive.results = {}

data:extend({recipe})
