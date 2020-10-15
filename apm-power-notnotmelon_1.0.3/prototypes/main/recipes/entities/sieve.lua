require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/entities/sieve.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_sieve_0"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_steam_engine", amount=2},
        {type="item", name="apm_machine_frame_steam", amount=3},
        {type="item", name="iron-stick", amount=30},
        {type="item", name="stone-brick", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_sieve_0', amount=1}
    }
recipe.normal.main_product = 'apm_sieve_0'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_steam_engine", amount=4},
        {type="item", name="apm_machine_frame_steam", amount=6},
        {type="item", name="iron-stick", amount=60},
        {type="item", name="stone-brick", amount=20}
    }
--recipe.expensive.results = {}
data:extend({recipe})