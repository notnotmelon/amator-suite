require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/equipments.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_equipment_burner_generator_basic"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3.5
recipe.normal.ingredients = {
        apm.lib.utils.builder.recipe.item.simple('APM_CIRCUIT_T4', 5),
        {type="item", name="electric-engine-unit", amount=5},
        {type="item", name="copper-plate", amount=10},
        {type="item", name="steel-plate", amount=5}
    }
recipe.normal.results = {
        {type='item', name='apm_equipment_burner_generator_basic', amount=1}
    }
recipe.normal.main_product = 'apm_equipment_burner_generator_basic'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_equipment_burner_generator_advanced"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 3.5
recipe.normal.ingredients = {
        {type="item", name="apm_equipment_burner_generator_basic", amount=1},
        apm.lib.utils.builder.recipe.item.simple('APM_CIRCUIT_T5', 5),
        apm.lib.utils.builder.recipe.item.simple('APM_GEAR_T4', 5),
        {type="item", name="steel-plate", amount=10}
}
recipe.normal.results = {
        {type='item', name='apm_equipment_burner_generator_advanced', amount=1}
    }
recipe.normal.main_product = 'apm_equipment_burner_generator_advanced'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})