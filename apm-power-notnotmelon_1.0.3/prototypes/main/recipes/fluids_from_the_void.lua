require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/fluids_from_the_void.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_sea_water_from_void_1"
recipe.category = 'apm_fluids_from_the_void'
recipe.enabled = true
recipe.hidden = true
recipe.energy_required = 1
recipe.ingredients = {}
recipe.results = {{type='fluid', name='apm_sea_water', amount=150}}
recipe.main_product = 'apm_sea_water'
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_sea_water_from_void_2"
recipe.category = 'apm_fluids_from_the_void'
recipe.enabled = true
recipe.hidden = true
recipe.energy_required = 1
recipe.ingredients = {}
recipe.results = {{type='fluid', name='apm_sea_water', amount=400}}
recipe.main_product = 'apm_sea_water'
data:extend({recipe})
