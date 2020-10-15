require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/tiles.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_asphalt')
local item_icon_c = apm.lib.utils.icon.get.from_item('apm_generic_ash')
item_icon_c = apm.lib.utils.icons.mod(item_icon_c, 0.5, {-8, -8})
local icons = apm.lib.utils.icon.merge({item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_asphalt_1"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_ash"
recipe.order = 'bb_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name='apm_generic_ash', amount=30},
        {type="fluid", name="apm_creosote", amount=25}
    }
recipe.normal.results = { 
        {type='item', name='apm_asphalt', amount=2}
    }
recipe.normal.main_product = ''
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
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_asphalt')
local item_icon_c = apm.lib.utils.icon.get.from_item('apm_crushed_stone')
item_icon_c = apm.lib.utils.icons.mod(item_icon_c, 0.5, {-8, -8})
local icons = apm.lib.utils.icon.merge({item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_asphalt_2"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_ash"
recipe.order = 'bb_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name="apm_crushed_stone", amount=16},
        {type="fluid", name="apm_creosote", amount=25}
    }
recipe.normal.results = { 
        {type='item', name='apm_asphalt', amount=2}
    }
recipe.normal.main_product = ''
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
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_asphalt')
local item_icon_c = apm.lib.utils.icon.get.from_item('apm_generic_ash')
item_icon_c = apm.lib.utils.icons.mod(item_icon_c, 0.5, {-8, -8})
local icons = apm.lib.utils.icon.merge({item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_asphalt_3"
recipe.category = 'chemistry'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_ash"
recipe.order = 'bb_c'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name='apm_generic_ash', amount=30},
        {type="fluid", name="crude-oil", amount=10},
        {type="fluid", name="heavy-oil", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_asphalt', amount=2}
    }
recipe.normal.main_product = ''
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
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_asphalt')
local item_icon_c = apm.lib.utils.icon.get.from_item('apm_crushed_stone')
item_icon_c = apm.lib.utils.icons.mod(item_icon_c, 0.5, {-8, -8})
local icons = apm.lib.utils.icon.merge({item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_asphalt_4"
recipe.category = 'chemistry'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_ash"
recipe.order = 'bb_d'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4.5
recipe.normal.ingredients = {
        {type="item", name="apm_crushed_stone", amount=16},
        {type="fluid", name="crude-oil", amount=10},
        {type="fluid", name="heavy-oil", amount=10}
    }
recipe.normal.results = {
        {type='item', name='apm_asphalt', amount=2}
    }
recipe.normal.main_product = ''
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