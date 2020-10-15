require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/recipes/intermediates.lua'

APM_LOG_HEADER(self)

local apm_power_always_show_made_in = settings.startup["apm_power_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_power_always_show_made_in', apm_power_always_show_made_in)

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_electromagnet"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.25
recipe.normal.ingredients = {
        {type="item", name="copper-cable", amount=3},
        {type="item", name="iron-plate", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_electromagnet', amount=2}
    }
recipe.normal.main_product = 'apm_electromagnet'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="copper-cable", amount=5},
        {type="item", name="iron-plate", amount=1}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_resin')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_resin_1"
recipe.category = 'apm_crusher'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'aa_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="wood", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_wood_pellets', amount=1, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_resin', amount=2}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_wood_pellets', amount=1, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_resin', amount=1}
    }

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_resin')
local item_icon_b = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_resin_2"
recipe.category = 'apm_crusher_2'
recipe.group = "apm_power"
recipe.subgroup = "apm_greenhouse"
recipe.order = 'aa_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="wood", amount=1},
        {type="item", name="apm_crusher_drums", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_wood_pellets', amount=1, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_resin', amount=4},
        {type='item', name='apm_crusher_drums_used', amount=1, catalyst_amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
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
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_rubber')
local item_icon_b = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_rubber_1"
recipe.category = 'smelting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'aa_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2.5
recipe.normal.ingredients = {
        {type="item", name="apm_resin", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_rubber', amount=1}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_resin", amount=2}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_rubber')
local item_icon_b = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_rubber_2"
recipe.category = 'apm_coking'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'aa_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_resin", amount=3},
        {type="item", name="sulfur", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_rubber', amount=5}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
recipe.expensive.ingredients = {
        {type="item", name="apm_resin", amount=5},
        {type="item", name="sulfur", amount=2}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_gearing"
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 1
recipe.normal.ingredients = {
        {type="item", name="iron-gear-wheel", amount=3},
        {type="item", name="iron-stick", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_gearing', amount=1}
    }
recipe.normal.main_product = 'apm_gearing'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 2
recipe.expensive.ingredients = {
        {type="item", name="iron-gear-wheel", amount=4},
        {type="item", name="iron-stick", amount=1}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_wood_board')
local item_icon_b = apm.lib.utils.icon.get.from_item('wood')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-6, 0})
local item_icon_c = {apm.lib.icons.dynamics.t1}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_wood_board_1"
--recipe.category = ''
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ac_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 3
recipe.normal.ingredients = {
        {type="item", name="wood", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_wood_board', amount=2}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_wood_board', amount=1}
    }

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_wood_board')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_wood_pellets')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-6, 0})
local item_icon_c = {apm.lib.icons.dynamics.t2}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_wood_board_2"
recipe.category = 'apm_press'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ac_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="apm_wood_pellets", amount=4}
    }
recipe.normal.results = { 
        {type='item', name='apm_wood_board', amount=4}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 8
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_wood_board', amount=3}
    }

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_mechanical_relay"
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 1.25
recipe.normal.ingredients = {
        {type="item", name="apm_wood_board", amount=1},
        {type="item", name="iron-plate", amount=1},
        {type="item", name="copper-plate", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_mechanical_relay', amount=1}
    }
recipe.normal.main_product = 'apm_mechanical_relay'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
recipe.expensive.ingredients = {
        {type="item", name="apm_wood_board", amount=1},
        {type="item", name="iron-plate", amount=2},
        {type="item", name="copper-plate", amount=1}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steam_relay"
recipe.category = 'basic-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_wood_board", amount=1},
        {type="item", name="copper-plate", amount=2},
        {type="item", name="iron-stick", amount=3}
    }
recipe.normal.results = { 
        {type='item', name='apm_steam_relay', amount=1}
    }
recipe.normal.main_product = 'apm_steam_relay'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
recipe.expensive.ingredients = {
        {type="item", name="apm_wood_board", amount=1},
        {type="item", name="copper-plate", amount=3},
        {type="item", name="iron-stick", amount=4}
    }
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_sealing_rings"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="apm_rubber", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_sealing_rings', amount=5}
    }
recipe.normal.main_product = 'apm_sealing_rings'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
recipe.expensive.results = { 
        {type='item', name='apm_sealing_rings', amount=3}
    }

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_crushed_stone"
recipe.category = "apm_crusher"
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="stone", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_crushed_stone', amount=4}
    }
recipe.normal.main_product = 'apm_crushed_stone'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_stone_brick_raw')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_crushed_stone')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-9,-9})
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_stone_brick_raw_with_crushed"
recipe.category = "apm_press"
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ak_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="apm_crushed_stone", amount=4},
        {type="fluid", name="water", amount=40}
    }
recipe.normal.results = { 
        {type='item', name='apm_stone_brick_raw', amount=1}
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
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_stone_brick_raw')
local item_icon_b = apm.lib.utils.icon.get.from_item('apm_wet_mud')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {-9,-9})
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_stone_brick_raw_with_wed_mud"
recipe.category = 'apm_press'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ak_b'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="apm_wet_mud", amount=2},
        {type="item", name="apm_crushed_stone", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_stone_brick_raw', amount=1},
        {type='fluid', name='apm_dirt_water', amount=10, catalyst_amount=10}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_pistions"
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="iron-plate", amount=1},
        {type="item", name="iron-stick", amount=3}
    }
recipe.normal.results = { 
        {type='item', name='apm_pistions', amount=1}
    }
recipe.normal.main_product = 'apm_pistions'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_simple_engine"
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_mechanical_relay", amount=1},
        {type="item", name="apm_pistions", amount=1},
        {type="item", name="apm_gearing", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_simple_engine', amount=1}
    }
recipe.normal.main_product = 'apm_simple_engine'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_steam_engine"
recipe.category = 'basic-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 2
recipe.normal.ingredients = {
        {type="item", name="apm_simple_engine", amount=1},
        {type="item", name="apm_steam_relay", amount=3},
        {type="item", name="apm_gearing", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_steam_engine', amount=1}
    }
recipe.normal.main_product = 'apm_steam_engine'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_basic"
recipe.normal = {}
recipe.normal.enabled = true
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_mechanical_relay", amount=2},
        {type="item", name="iron-plate", amount=1},
        {type="item", name="copper-plate", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_basic', amount=2}
    }
recipe.normal.main_product = 'apm_machine_frame_basic'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_steam"
--recipe.category = 'basic-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_machine_frame_basic", amount=2},
        {type="item", name="apm_steam_relay", amount=2},
        {type="item", name="steel-plate", amount=2},
        {type="item", name="pipe", amount=2}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_steam', amount=1}
    }
recipe.normal.main_product = 'apm_machine_frame_steam'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_advanced"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 1.5
recipe.normal.ingredients = {
        {type="item", name="apm_machine_frame_basic", amount=3},
        apm.lib.utils.builder.recipe.item.simple('APM_CIRCUIT_T2', 3),
        {type="item", name="steel-plate", amount=3},
        {type="item", name="pipe", amount=3}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_advanced', amount=1}
    }
recipe.normal.main_product = 'apm_machine_frame_advanced'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

recipe.expensive.energy_required = 1.75
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_machine_frame_basic_used')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_basic_maintenance"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ab_f'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_machine_frame_basic_used", amount=5},
        {type="item", name="iron-plate", amount=3},
        {type="item", name="copper-plate", amount=3},
        {type="fluid", name="water", amount=30}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_basic', amount=4},
        {type="item", name="apm_machine_frame_basic", amount_min=1, amount_max=1, probability=0.5, catalyst_amount=1},
        {type="fluid", name="apm_dirt_water", amount=30, catalyst_amount=30}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_machine_frame_steam_used')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_steam_maintenance"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ab_h'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_machine_frame_steam_used", amount=5},
        {type="item", name="steel-plate", amount=2},
        {type="item", name="copper-plate", amount=5},
        {type="fluid", name="water", amount=30}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_steam', amount=4},
        {type="item", name="apm_machine_frame_steam", amount_min=1, amount_max=1, probability=0.5, catalyst_amount=1},
        {type="fluid", name="apm_dirt_water", amount=30, catalyst_amount=30}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_machine_frame_advanced_used')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_machine_frame_advanced_maintenance"
recipe.category = 'advanced-crafting'
recipe.group = "apm_power"
recipe.subgroup = "apm_power_intermediates"
recipe.order = 'ab_j'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 4
recipe.normal.ingredients = {
        {type="item", name="apm_machine_frame_advanced_used", amount=5},
        {type="item", name="steel-plate", amount=5},
        {type="item", name="copper-plate", amount=2},
        {type="fluid", name="water", amount=30}
    }
recipe.normal.results = { 
        {type='item', name='apm_machine_frame_advanced', amount=4},
        {type="item", name="apm_machine_frame_advanced", amount_min=1, amount_max=1, probability=0.5, catalyst_amount=1},
        {type="fluid", name="apm_dirt_water", amount=30, catalyst_amount=30}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_power_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)

--recipe.expensive.energy_required =
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}

data:extend({recipe})
