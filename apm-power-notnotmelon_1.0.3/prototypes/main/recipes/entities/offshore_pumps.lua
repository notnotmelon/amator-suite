require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/entities/offshore_pumps.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_offshore_pump_0"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="stone-furnace", amount=1},
        {type="item", name="pipe", amount=3},
        {type="item", name="apm_simple_engine", amount=2}
    }
recipe.normal.results = {
        {type='item', name='apm_offshore_pump_0', amount=1}
    }
recipe.normal.main_product = 'apm_offshore_pump_0'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="stone-furnace", amount=1},
        {type="item", name="pipe", amount=5},
        {type="item", name="apm_simple_engine", amount=4}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_offshore_pump_1"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_offshore_pump_0", amount=1},
        {type="item", name="apm_electromagnet", amount=6},
        {type="item", name="apm_simple_engine", amount=2},
        {type="item", name="electronic-circuit", amount=5}
    }
recipe.normal.results = {
        {type='item', name='apm_offshore_pump_1', amount=1}
    }
recipe.normal.main_product = 'apm_offshore_pump_1'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_offshore_pump_0", amount=1},
        {type="item", name="apm_electromagnet", amount=10},
        {type="item", name="apm_simple_engine", amount=4},
        {type="item", name="electronic-circuit", amount=8}
    }
--recipe.expensive.results = {}
data:extend({recipe})