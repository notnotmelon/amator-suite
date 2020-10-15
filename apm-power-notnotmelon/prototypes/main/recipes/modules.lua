require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/modules.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_particle_filter_1"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="iron-plate", amount=5},
        {type="item", name="apm_charcoal", amount=4},
        {type="item", name="apm_rubber", amount=2},
        {type="item", name="apm_mechanical_relay", amount=5}
    }
recipe.normal.results = { 
        {type='item', name='apm_particle_filter_1', amount=1}
    }
recipe.normal.main_product = 'apm_particle_filter_1'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="iron-plate", amount=8},
        {type="item", name="apm_charcoal", amount=6},
        {type="item", name="apm_rubber", amount=4},
        {type="item", name="apm_mechanical_relay", amount=8}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_particle_filter_2"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 7.5
recipe.normal.ingredients = {
        {type="item", name="apm_particle_filter_1", amount=1},
        {type="item", name="apm_filter_charcoal", amount=2},
        {type="item", name="apm_steam_relay", amount=5},
        {type="fluid", name="water", amount=50}
    }
recipe.normal.results = { 
        {type='item', name='apm_particle_filter_2', amount=1},
        {type="fluid", name="apm_coal_saturated_wastewater", amount=50}
    }
recipe.normal.main_product = 'apm_particle_filter_2'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_particle_filter_1", amount=1},
        {type="item", name="apm_filter_charcoal", amount=3},
        {type="item", name="apm_steam_relay", amount=10},
        {type="fluid", name="water", amount=50}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_particle_filter_3"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 10
recipe.normal.ingredients = {
        {type="item", name="apm_particle_filter_2", amount=1},
        {type="item", name="copper-plate", amount=5},
        {type="item", name="electronic-circuit", amount=5},
        {type="fluid", name="sulfuric-acid", amount=10}
    }
recipe.normal.results = { 
        {type='item', name='apm_particle_filter_3', amount=1}
    }
recipe.normal.main_product = 'apm_particle_filter_3'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_particle_filter_2", amount=1},
        {type="item", name="copper-plate", amount=10},
        {type="item", name="electronic-circuit", amount=10},
        {type="fluid", name="sulfuric-acid", amount=20}
    }
--recipe.expensive.results = {}

data:extend({recipe})
