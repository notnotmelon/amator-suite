require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/pellets.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_oxide_pellet_u238"
recipe.category = 'chemistry'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2.5

local fluid = data.raw.fluid['apm_nuclear_hexafluoride_002']
recipe.crafting_machine_tint = {
      primary   = fluid.base_color,
      secondary = fluid.base_color,
      tertiary  = fluid.base_color,
    }
    recipe.normal.ingredients = {
        {type="fluid", name=fluid.name, amount=5},
        apm.lib.utils.builder.recipe.item.simple('APM_WATER', 2.5)
    }
recipe.normal.results = {
        {type='item', name='apm_oxide_pellet_u238', amount=1}
    }
recipe.normal.main_product = 'apm_oxide_pellet_u238'
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
recipe.name = "apm_oxide_pellet_u235"
recipe.category = 'chemistry'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2.5

local fluid = data.raw.fluid['apm_nuclear_hexafluoride_047']
recipe.crafting_machine_tint = {
      primary   = fluid.base_color,
      secondary = fluid.base_color,
      tertiary  = fluid.base_color,
    }
    recipe.normal.ingredients = {
        {type="fluid", name=fluid.name, amount=5},
        apm.lib.utils.builder.recipe.item.simple('APM_WATER', 2.5)
    }
recipe.normal.results = {
        {type='item', name='apm_oxide_pellet_u235', amount=1}
    }
recipe.normal.main_product = 'apm_oxide_pellet_u235'
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
