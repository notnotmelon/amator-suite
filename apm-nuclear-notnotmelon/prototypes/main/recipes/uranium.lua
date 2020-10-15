require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/uranium.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_raw_fluid_icons(fluid_name)
    local used_fluid = data.raw.fluid[fluid_name]
    local t_icons = {}
    for _, layer in pairs(used_fluid.icons) do
        -- we want remove the icon layer with the radioactive symbol
        if layer.icon ~= apm.lib.icons.dynamics.radioactive.icon then
            table.insert(t_icons, layer)
        end
    end
    return t_icons
end

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_uranium"
recipe.category = 'crafting-with-fluid'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_fuel_rod_container", amount=1},
        {type="item", name='apm_oxide_pellet_u235', amount=apm.nuclear.constants.amount_of_oxide_pellets}
    }
recipe.normal.results = {
        {type='item', name='apm_fuel_rod_uranium', amount=1}
    }
recipe.normal.main_product = 'apm_fuel_rod_uranium'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fuel_rod_uranium_active')
--local item_icon_b = {apm.lib.icons.dynamics.cooling}
local item_icon_b = {apm.lib.icons.dynamics.temp_down}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_uranium_cooling"
recipe.category = 'apm_nuclear_cooling_0'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_used_fuel_cold"
recipe.order = 'aa_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 280
recipe.normal.ingredients = {
        {type="item", name='apm_fuel_rod_uranium_active', amount=6},
        {type="fluid", name='water', amount=1000, maximum_temperature=20}
    }
recipe.normal.results = {
        {type='item', name='apm_fuel_rod_uranium_cooled', amount=6, show_details_in_recipe_tooltip=false},
        {type="fluid", name='apm_hot_water', amount=900},
        {type="fluid", name='apm_radioactive_wastewater', amount=100, temperature=80}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fuel_rod_uranium_cooled')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_uranium_recovery_stage_a"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_recycling_stage_a"
recipe.order = 'aa_a'
recipe.icons = icons

local fluid = data.raw.fluid['apm_purex_solution_uranium']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color
}

recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 13.5
recipe.normal.ingredients = {
        apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
        {type="item", name='apm_fuel_rod_uranium_cooled', amount=1}
    }
recipe.normal.results = {
        {type='item', name='apm_fuel_rod_container_worn', amount=1, show_details_in_recipe_tooltip=false},
        {type="fluid", name=fluid.name, amount=100}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = get_raw_fluid_icons('apm_purex_solution_uranium')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fuel_rod_uranium_recovery_stage_b"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_recycling_stage_b"
recipe.order = 'aa_a'
recipe.icons = icons

local fluid = data.raw.fluid['apm_purex_solution_uranium']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color
}

recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 15
recipe.normal.ingredients = {
        {type="fluid", name='apm_tbp_30', amount=apm.nuclear.constants.amount_of_tbp_30},
        {type="fluid", name=fluid.name, amount=100},
        {type="item", name='apm_waste_container', amount=1}
    }
recipe.normal.results = {
        {type='item', name='apm_oxide_pellet_u238', amount=apm.nuclear.constants.amount_of_oxide_pellets - 3, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_oxide_pellet_np237', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_neptunium, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_oxide_pellet_th232', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_thorium, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_oxide_pellet_pu239', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_plutonium, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_radioactive_waste', amount=1, show_details_in_recipe_tooltip=false},
        {type="fluid", name='apm_radioactive_wastewater', amount=apm.nuclear.constants.amount_of_rocow }
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_breeder_container", amount=1},
        {type="item", name="apm_oxide_pellet_u238", amount=apm.nuclear.constants.amount_of_oxide_pellets-1},
        {type="item", name="apm_oxide_pellet_np237", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_breeder_uranium', amount=1}
    }
recipe.normal.main_product = 'apm_breeder_uranium'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_loaded"
recipe.category = 'advanced-crafting'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_breeder_uranium", amount=1},
        {type="item", name="apm_fuel_rod_mox", amount=1},
    }
recipe.normal.results = { 
        {type='item', name='apm_breeder_uranium_loaded', amount=1}
    }
recipe.normal.main_product = 'apm_breeder_uranium_loaded'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
--[[
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_uranium_active')
local item_icon_b = {apm.lib.icons.dynamics.radioactive}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_breeding"
recipe.category = 'apm_nuclear_breeding'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_uranium"
recipe.order = 'ac_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 80
recipe.normal.ingredients = {
        {type="item", name="apm_breeder_uranium_loaded", amount=1}
    }
recipe.normal.results = {
        {type='item', name='apm_breeder_uranium_active', amount=1, show_details_in_recipe_tooltip=false}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})
]]--
-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_uranium_active')
--local item_icon_b = {apm.lib.icons.dynamics.cooling}
local item_icon_b = {apm.lib.icons.dynamics.temp_down}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_cooling"
recipe.category = 'apm_nuclear_cooling_0'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_uranium"
recipe.order = 'ad_a'
recipe.icons = icons
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 380
recipe.normal.ingredients = {
        {type="item", name='apm_breeder_uranium_active', amount=6},
        {type="fluid", name='water', amount=1000, maximum_temperature=20}
    }
recipe.normal.results = {
        {type='item', name='apm_breeder_uranium_cooled', amount=6, show_details_in_recipe_tooltip=false},
        {type="fluid", name='apm_hot_water', amount=800},
        {type="fluid", name='apm_radioactive_wastewater', amount=200, temperature=80}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_unloading"
recipe.category = 'advanced-crafting'

recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_uranium"
recipe.order = 'ae_a'
recipe.icons = {
        apm.nuclear.icons.breeder_uranium_unloading
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_breeder_uranium_cooled", amount=1}
    }
recipe.normal.results = { 
        {type='item', name='apm_breeder_uranium_seperated', amount=1, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_fuel_rod_mox_cooled', amount=1, show_details_in_recipe_tooltip=false}
    }
recipe.normal.main_product = 'apm_breeder_uranium_seperated'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_uranium_seperated')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_seperation_process_a"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_uranium"
recipe.order = 'af_a'
recipe.icons = icons

local fluid = data.raw.fluid['apm_purex_solution_breeder_uranium']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color
}

recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 13.5
recipe.normal.ingredients = {
        apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
        {type="item", name='apm_breeder_uranium_seperated', amount=1}
    }
recipe.normal.results = {
        {type='item', name='apm_breeder_container_worn', amount=1, show_details_in_recipe_tooltip=false},
        {type="fluid", name=fluid.name, amount=100}
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = get_raw_fluid_icons('apm_purex_solution_breeder_uranium')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_uranium_seperation_process_b"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_uranium"
recipe.order = 'af_b'
recipe.icons = icons

local fluid = data.raw.fluid['apm_purex_solution_breeder_uranium']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color
}

recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 15
recipe.normal.ingredients = {
        {type="fluid", name='apm_tbp_30', amount=apm.nuclear.constants.amount_of_tbp_30},
        {type="fluid", name=fluid.name, amount=100},
        {type="item", name='apm_waste_container', amount=1}
    }
recipe.normal.results = {
        {type="item", name="apm_oxide_pellet_u238", amount=apm.nuclear.constants.amount_of_oxide_pellets-5, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_oxide_pellet_pu239', amount=3, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_oxide_pellet_np237', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_neptunium, show_details_in_recipe_tooltip=false},
        {type='item', name='apm_radioactive_waste', amount=1, show_details_in_recipe_tooltip=false},
        {type="fluid", name='apm_radioactive_wastewater', amount=apm.nuclear.constants.amount_of_rocow }
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})
