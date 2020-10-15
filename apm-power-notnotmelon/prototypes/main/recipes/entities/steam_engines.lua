require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/entities/steam_engines.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steam_engine_2"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="steam-engine", amount=1},
        {type="item", name="apm_gearing", amount=10},
        {type="item", name="apm_steam_engine", amount=6},
        {type="item", name="apm_electromagnet", amount=12},
        {type="item", name="steel-plate", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_steam_engine_2', amount=1}
    }
recipe.normal.main_product = 'apm_steam_engine_2'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})