require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/entities/furnaces.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_puddling_furnace_0"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="stone-furnace", amount=3},
        {type="item", name="apm_machine_frame_basic", amount=10},
        {type="item", name="stone-brick", amount=25}
    }
recipe.normal.results = {
        {type='item', name='apm_puddling_furnace_0', amount=1}
    }
recipe.normal.main_product = 'apm_puddling_furnace_0'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="stone-furnace", amount=3},
        {type="item", name="apm_machine_frame_basic", amount=20},
        {type="item", name="stone-brick", amount=50}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steelworks_0"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_puddling_furnace_0", amount=1},
        {type="item", name="electronic-circuit", amount=25},
        {type="item", name="copper-plate", amount=30},
        {type="item", name="apm_machine_frame_advanced", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_steelworks_0', amount=1},
        {type='item', name='apm_machine_frame_basic_used', amount=10}
    }
recipe.normal.main_product = 'apm_steelworks_0'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_puddling_furnace_0", amount=1},
        {type="item", name="electronic-circuit", amount=35},
        {type="item", name="copper-plate", amount=60},
        {type="item", name="apm_machine_frame_advanced", amount=20}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steelworks_1"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_steelworks_0", amount=1},
        apm.lib.utils.builder.recipe.item.simple('APM_CIRCUIT_T5', 10),
        {type="item", name="low-density-structure", amount=20},
        {type="item", name="apm_machine_frame_advanced", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_steelworks_1', amount=1},
        {type='item', name='apm_machine_frame_advanced_used', amount=10}
    }
recipe.normal.main_product = 'apm_steelworks_1'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_steelworks_0", amount=1},
        apm.lib.utils.builder.recipe.item.simple('APM_CIRCUIT_T5', 15),
        {type="item", name="low-density-structure", amount=30},
        {type="item", name="apm_machine_frame_advanced", amount=15}
    }
--recipe.expensive.results = {}
data:extend({recipe})