require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/purex.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_nuclear_ash"
recipe.category = 'smelting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3.5
recipe.normal.ingredients = {
        {type="item", name='coal', amount=5}
    }
recipe.normal.results = {
        {type='item', name='apm_nuclear_ash', amount=10}
    }
recipe.normal.main_product = 'apm_nuclear_ash'
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
recipe.name = "apm_phosphorus"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.860, g=0.180, b=0.067},
    secondary = {r=0.860, g=0.280, b=0.067},
    tertiary  = {r=0.860, g=0.360, b=0.067},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="fluid", name='steam', amount=50},
        {type="item", name='apm_nuclear_ash', amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_phosphorus', amount=1}
    }
recipe.normal.main_product = 'apm_phosphorus'
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
recipe.name = "apm_phosphorpentachlorid"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.730, g=0.800, b=0.800},
    secondary = {r=0.860, g=0.280, b=0.067},
    tertiary  = {r=0.900, g=1.000, b=1.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type='item', name='apm_phosphorus', amount=2}
    }
recipe.normal.results = {
        {type='item', name='apm_phosphorpentachlorid', amount=2}
    }
recipe.normal.main_product = 'apm_phosphorpentachlorid'
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
recipe.name = "apm_phosphoroxychlorid"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.730, g=0.800, b=0.800},
    secondary = {r=0.860, g=0.280, b=0.067},
    tertiary  = {r=0.900, g=1.000, b=1.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type='item', name='apm_phosphorpentachlorid', amount=5}
    }
recipe.normal.results = {
        {type='fluid', name='apm_phosphoroxychlorid', amount=50}
    }
recipe.normal.main_product = 'apm_phosphoroxychlorid'
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
recipe.name = "apm_trimethyl_phosphate"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.730, g=0.800, b=0.800},
    secondary = {r=0.860, g=0.280, b=0.067},
    tertiary  = {r=0.900, g=1.000, b=1.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="fluid", name='petroleum-gas', amount=50},
        {type="item", name='apm_phosphorus', amount=5}
    }
recipe.normal.results = {
        {type='fluid', name='apm_trimethyl_phosphate', amount=50}
    }
recipe.normal.main_product = 'apm_trimethyl_phosphate'
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
recipe.name = "apm_tbp_30"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.730, g=0.800, b=0.600},
    secondary = {r=0.800, g=0.700, b=0.600},
    tertiary  = {r=0.730, g=0.800, b=0.600},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3
recipe.normal.ingredients = {
        {type="fluid", name='light-oil', amount=70},
        {type="fluid", name='apm_trimethyl_phosphate', amount=30}
    }
recipe.normal.results = {
        {type='fluid', name='apm_tbp_30', amount=100}
    }
recipe.normal.main_product = 'apm_tbp_30'
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
