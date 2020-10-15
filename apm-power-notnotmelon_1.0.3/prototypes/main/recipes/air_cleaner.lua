require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/air_cleaner.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_filter_charcoal"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1
recipe.normal.ingredients = {
        {type="item", name="steel-plate", amount=1},
        {type="item", name="apm_charcoal_brick", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_filter_charcoal', amount=3}
    }
recipe.normal.main_product = 'apm_filter_charcoal'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.5
recipe.expensive.ingredients = {
        {type="item", name="steel-plate", amount=2},
        {type="item", name="apm_charcoal_brick", amount=1}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_filter_charcoal_used_recycling"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_tools"
recipe.order = 'ab_b'
recipe.icons = {
        apm.power.icons.filter_charcoal_used,
        apm.lib.icons.dynamics.recycling
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="fluid", name="water", amount=30},
        {type="item", name="apm_filter_charcoal_used", amount=3},
        {type="item", name="apm_charcoal_brick", amount=1}
    }
recipe.normal.results = { 
        {type="item", name="apm_filter_charcoal", amount=2, catalyst_amount=2},
        {type="item", name="apm_filter_charcoal", amount_min=1, amount_max=1, probability=0.95, catalyst_amount=1},
        {type="fluid", name="apm_coal_saturated_wastewater", amount=30, catalyst_amount=30}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 2.5
recipe.expensive.ingredients = {
        {type="fluid", name="water", amount=30},
        {type="item", name="apm_filter_charcoal_used", amount=3},
        {type="item", name="apm_charcoal_brick", amount=2}
    }
recipe.expensive.results = {
        {type="item", name="apm_filter_charcoal", amount=2, catalyst_amount=2},
        {type="item", name="apm_filter_charcoal", amount_min=1, amount_max=1, probability=0.90, catalyst_amount=1},
        {type="fluid", name="apm_coal_saturated_wastewater", amount=30, catalyst_amount=30}
    }

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_air_cleaning_1"
recipe.category = 'apm_air_cleaner'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_fluid"
recipe.order = 'ca_a'
recipe.icons = {
        apm.lib.icons.dynamics.air,
        apm.lib.icons.dynamics.t1
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 25
recipe.normal.ingredients = {
        {type="item", name="apm_filter_charcoal", amount=1}
    }
recipe.normal.results = { 
        {type="item", name="apm_filter_charcoal_used", amount=1, catalyst_amount=1},
        {type="fluid", name="apm_dirt_water", amount=25}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 20

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_air_cleaning_2"
recipe.category = 'apm_air_cleaner'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_fluid"
recipe.order = 'ca_b'
recipe.icons = {
        apm.lib.icons.dynamics.air,
        apm.lib.icons.dynamics.t2
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 25
recipe.normal.ingredients = {
        {type="item", name="apm_filter_charcoal", amount=1},
        {type="fluid", name="sulfuric-acid", amount=30}
    }
recipe.normal.results = { 
        {type="item", name="apm_filter_charcoal_used", amount=1, catalyst_amount=1},
        {type="item", name="apm_ammonium_sulfate", amount=15},
        {type="fluid", name="apm_dirt_water", amount=25}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 20
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type="item", name="apm_filter_charcoal_used", amount=1, catalyst_amount=1},
        {type="item", name="apm_ammonium_sulfate", amount=10},
        {type="fluid", name="apm_dirt_water", amount=25}
    }

data:extend({recipe})
