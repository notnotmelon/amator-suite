require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/science.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_nuclear_science_pack"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 21
recipe.normal.ingredients = {
        {type="item", name="processing-unit", amount=3},
        {type="item", name="apm_oxide_pellet_np237", amount=1},
        {type="item", name="apm_hexafluoride_sample", amount=5},
        {type="item", name="apm_depleted_uranium_ingots", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_nuclear_science_pack', amount=3}
    }
recipe.normal.main_product = 'apm_nuclear_science_pack'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="processing-unit", amount=6},
        {type="item", name="apm_oxide_pellet_np237", amount=2},
        {type="item", name="apm_hexafluoride_sample", amount=5},
        {type="item", name="apm_depleted_uranium_ingots", amount=20}
    }
--recipe.expensive.results = {}

data:extend({recipe})
