require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/entities/pumps.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_burner_miner_drill_2"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="burner-mining-drill", amount=1},
        {type="item", name="apm_simple_engine", amount=2},
        {type="item", name="apm_mechanical_relay", amount=3},
        {type="item", name="steel-plate", amount=3}
    }
recipe.normal.results = {
        {type='item', name='apm_burner_miner_drill_2', amount=1}
    }
recipe.normal.main_product = 'apm_burner_miner_drill_2'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="burner-mining-drill", amount=1},
        {type="item", name="apm_simple_engine", amount=3},
        {type="item", name="apm_mechanical_relay", amount=4},
        {type="item", name="steel-plate", amount=4}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steam_mining_drill"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_burner_miner_drill_2", amount=1},
        {type="item", name="apm_steam_engine", amount=3},
        {type="item", name="apm_gearing", amount=3},
        {type="item", name="steel-plate", amount=3}
    }
recipe.normal.results = {
        {type='item', name='apm_steam_mining_drill', amount=1}
    }
recipe.normal.main_product = 'apm_steam_mining_drill'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_burner_miner_drill_2", amount=1},
        {type="item", name="apm_steam_engine", amount=4},
        {type="item", name="apm_gearing", amount=4},
        {type="item", name="steel-plate", amount=4}
    }
--recipe.expensive.results = {}
data:extend({recipe})