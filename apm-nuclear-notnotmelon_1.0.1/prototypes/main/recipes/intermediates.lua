require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/intermediates.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_container"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="steel-plate", amount=4}
    }
recipe.normal.results = {
        {type='item', name='apm_fuel_rod_container', amount=1}
    }
recipe.normal.main_product = 'apm_fuel_rod_container'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="item", name="steel-plate", amount=8}
    }
--recipe.expensive.results = {}
data:extend({recipe})


-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fuel_rod_container_worn')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_container_maintenance"
recipe.category = 'crafting-with-fluid'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_products"
recipe.order = 'aa_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 10
recipe.normal.ingredients = {
        {type="item", name="apm_fuel_rod_container_worn", amount=5},
        {type="item", name="steel-plate", amount=5},
        {type="fluid", name="water", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_fuel_rod_container', amount=4},
        {type='item', name='apm_fuel_rod_container', amount_min=1, amount_max=1, probability=0.85},
        {type="fluid", name="apm_radioactive_wastewater", amount=50},
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_fuel_rod_container', amount=4},
        {type='item', name='apm_fuel_rod_container', amount_min=1, amount_max=1, probability=0.65},
        {type="fluid", name="apm_radioactive_wastewater", amount=50},
    }
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_container"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="steel-plate", amount=2},
        {type="item", name="copper-plate", amount=5},
        {type="item", name="apm_depleted_uranium_ingots", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_breeder_container', amount=1}
    }
recipe.normal.main_product = 'apm_breeder_container'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="item", name="steel-plate", amount=4},
        {type="item", name="copper-plate", amount=8}
    }
--recipe.expensive.results = {}
data:extend({recipe})


-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_container_worn')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_container_worn_maintenance"
recipe.category = 'crafting-with-fluid'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_products"
recipe.order = 'ab_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 10
recipe.normal.ingredients = {
        {type="item", name="apm_breeder_container_worn", amount=5},
        {type="item", name="copper-plate", amount=5},
        {type="item", name="apm_depleted_uranium_ingots", amount=5},
        {type="fluid", name="water", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_breeder_container', amount=4},
        {type='item', name='apm_breeder_container', amount_min=1, amount_max=1, probability=0.85},
        {type="fluid", name="apm_radioactive_wastewater", amount=50},
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_breeder_container', amount=4},
        {type='item', name='apm_breeder_container', amount_min=1, amount_max=1, probability=0.65},
        {type="fluid", name="apm_radioactive_wastewater", amount=50},
    }
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_waste_container"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="iron-plate", amount=5}
    }
recipe.normal.results = {
        {type='item', name='apm_waste_container', amount=1}
    }
recipe.normal.main_product = 'apm_waste_container'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="item", name="iron-plate", amount=10}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_depleted_uranium_metal_mixture"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.75
recipe.normal.ingredients = {
        {type="item", name="apm_oxide_pellet_u238", amount=2},
        {type="item", name="iron-plate", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_depleted_uranium_metal_mixture', amount=2}
    }
recipe.normal.main_product = 'apm_depleted_uranium_metal_mixture'
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
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_depleted_uranium_ingots"
recipe.category = 'apm_electric_smelting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name="apm_depleted_uranium_metal_mixture", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_depleted_uranium_ingots', amount=2}
    }
recipe.normal.main_product = 'apm_depleted_uranium_ingots'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="item", name="apm_depleted_uranium_metal_mixture", amount=3}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_rtg_radioisotope_thermoelectric_generator"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 12
recipe.normal.ingredients = {
        {type="item", name="iron-plate", amount=10},
        {type="item", name="copper-plate", amount=10},
        {type="item", name="processing-unit", amount=5},
        {type="item", name="apm_depleted_uranium_ingots", amount=10},
        {type="item", name="apm_oxide_pellet_pu239", amount=2}
    }
recipe.normal.results = {
        {type='item', name='apm_rtg_radioisotope_thermoelectric_generator', amount=1}
    }
recipe.normal.main_product = 'apm_rtg_radioisotope_thermoelectric_generator'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="item", name="iron-plate", amount=15},
        {type="item", name="copper-plate", amount=15},
        {type="item", name="processing-unit", amount=10},
        {type="item", name="apm_depleted_uranium_ingots", amount=20},
        {type="item", name="apm_oxide_pellet_pu239", amount=4}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_hexafluoride_sample"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
      primary   = {r=0.574, g=1, b=0, a=0.000},
      secondary = {r=0.474, g=1, b=0, a=0.000},
      tertiary  = {r=0.374, g=1, b=0, a=0.000}
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3.5
recipe.normal.ingredients = {
        {type="item", name="iron-plate", amount=1},
        {type="fluid", name="apm_nuclear_hexafluoride_012", amount=10},
    }
recipe.normal.results = {
        {type='item', name='apm_hexafluoride_sample', amount=1}
    }
recipe.normal.main_product = 'apm_hexafluoride_sample'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})
