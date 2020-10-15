require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/thorium.lua'

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
recipe.type = 'recipe'
recipe.name = 'apm_oxide_pellet_th232'
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
  primary   = {r=0.541, g=0.337, b=0.170, a = 0.000},
  secondary = {r=0.541, g=0.337, b=0.170, a = 0.000},
  tertiary  = {r=0.541, g=0.337, b=0.170, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 15
recipe.normal.ingredients = {
                apm.lib.utils.builder.recipe.item.simple('APM_THORIUM', 10),
                apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
                apm.lib.utils.builder.recipe.item.simple('APM_WATER', 5)
            }
recipe.normal.results = {            
                {type='item', name='apm_oxide_pellet_th232', amount=1},
                apm.lib.utils.builder.recipe.item.simple('APM_THORIUM_SLAG', 2)
            }
recipe.normal.main_product = 'apm_oxide_pellet_th232'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
recipe.expensive.ingredients = {
                apm.lib.utils.builder.recipe.item.simple('APM_THORIUM', 15),
                apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
                apm.lib.utils.builder.recipe.item.simple('APM_WATER', 5)
            }
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_fuel_rod_thorium'
recipe.category = 'crafting-with-fluid'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
                {type="item", name="apm_fuel_rod_container", amount=1},
                {type="item", name="apm_oxide_pellet_th232", amount=apm.nuclear.constants.amount_of_oxide_pellets-1},
                {type="item", name="apm_oxide_pellet_pu239", amount=1}
            }
recipe.normal.results = { 
                {type='item', name='apm_fuel_rod_thorium', amount=1}
            }
recipe.normal.main_product = 'apm_fuel_rod_thorium'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fuel_rod_thorium_active')
--local item_icon_b = {apm.lib.icons.dynamics.cooling}
local item_icon_b = {apm.lib.icons.dynamics.temp_down}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_fuel_cell_thorium_cooling'
recipe.icons = icons
recipe.category = 'apm_nuclear_cooling_0'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_used_fuel_cold"
recipe.order = 'ad_a'
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 320
recipe.normal.ingredients = {
                {type="item", name='apm_fuel_rod_thorium_active', amount=6},
                {type="fluid", name='water', amount=1000, maximum_temperature=20}
            }
recipe.normal.results = {
                {type='item', name='apm_fuel_rod_thorium_cooled', amount=6, show_details_in_recipe_tooltip=false},
                {type="fluid", name='apm_hot_water', amount=950},
                {type="fluid", name='apm_radioactive_wastewater', amount=50, temperature=90}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_fuel_rod_thorium_cooled')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_fuel_cell_thorium_recovery_stage_a'
recipe.icons = icons
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_recycling_stage_a"
recipe.order = 'ad_a'
local fluid = data.raw.fluid['apm_purex_solution_thorium']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color,
}
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 13.5
recipe.normal.ingredients = {
                apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
                {type="item", name='apm_fuel_rod_thorium_cooled', amount=1}
            }
recipe.normal.results = {
                {type='item', name='apm_fuel_rod_container_worn', amount=1, show_details_in_recipe_tooltip=false},
                {type="fluid", name=fluid.name, amount=100}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = get_raw_fluid_icons('apm_purex_solution_thorium')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_fuel_cell_thorium_recovery_stage_b'
recipe.icons = icons
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_recycling_stage_b"
recipe.order = 'ad_a'
local fluid = data.raw.fluid['apm_purex_solution_thorium']
recipe.crafting_machine_tint = {
  primary   = fluid.flow_color,
  secondary = fluid.flow_color,
  tertiary  = fluid.flow_color,
}
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 15
recipe.normal.ingredients = {
                {type="fluid", name='apm_tbp_30', amount=apm.nuclear.constants.amount_of_tbp_30},
                {type="fluid", name=fluid.name, amount=100},
                {type="item", name='apm_waste_container', amount=1}
            }
recipe.normal.results = {
                {type='item', name='apm_oxide_pellet_u235', amount=1, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_oxide_pellet_u238', amount=6, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_oxide_pellet_np237', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_neptunium/3, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_oxide_pellet_pu239', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_plutonium/3, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_radioactive_waste', amount=1, show_details_in_recipe_tooltip=false},
                {type="fluid", name='apm_radioactive_wastewater', amount=apm.nuclear.constants.amount_of_rocow }
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_thorium"
recipe.category = 'crafting-with-fluid'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
                {type="item", name="apm_breeder_container", amount=1},
                {type="item", name="apm_oxide_pellet_th232", amount=9},
                {type="item", name="apm_oxide_pellet_pu239", amount=1}
            }
recipe.normal.results = { 
                {type='item', name='apm_breeder_thorium', amount=1}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.main_product = 'apm_breeder_thorium'
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_thorium_loaded"
recipe.category = 'crafting-with-fluid'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
                {type="item", name="apm_breeder_thorium", amount=1},
                {type="item", name="apm_fuel_rod_mox", amount=1}
            }
recipe.normal.results = { 
                {type='item', name='apm_breeder_thorium_loaded', amount=1}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.main_product = 'apm_breeder_thorium_loaded'
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
--[[
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_thorium_active')
local item_icon_b = {apm.lib.icons.dynamics.radioactive}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_thorium_breeding"
recipe.icons = icons
recipe.category = 'apm_nuclear_breeding'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_thorium"
recipe.order = 'ac_a'
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 80
recipe.normal.ingredients = {
                {type="item", name="apm_breeder_thorium_loaded", amount=1}
            }
recipe.normal.results = { 
                {type='item', name='apm_breeder_thorium_active', amount=1, show_details_in_recipe_tooltip=false}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.main_product=''
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})
]]--

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_thorium_active')
--local item_icon_b = {apm.lib.icons.dynamics.cooling}
local item_icon_b = {apm.lib.icons.dynamics.temp_down}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_breeder_thorium_cooling'
recipe.icons = icons
recipe.category = 'apm_nuclear_cooling_0'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_thorium"
recipe.order = 'ad_a'
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 380.0
recipe.normal.ingredients = {
                {type="item", name='apm_breeder_thorium_active', amount=6},
                {type="fluid", name='water', amount=1000, maximum_temperature=20}
            }
recipe.normal.results = {
                {type='item', name='apm_breeder_thorium_cooled', amount=6, show_details_in_recipe_tooltip=false},
                {type="fluid", name='apm_hot_water', amount=950},
                {type="fluid", name='apm_radioactive_wastewater', amount=50, temperature=90}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------{
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_breeder_thorium_unloading"
recipe.category = 'advanced-crafting'

recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_thorium"
recipe.order = 'ae_a'
recipe.icons = {
        apm.nuclear.icons.breeder_thorium_unloading
    }
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
                {type="item", name="apm_breeder_thorium_cooled", amount=1}
            }
recipe.normal.results = { 
                {type='item', name='apm_breeder_thorium_seperated', amount=1, show_details_in_recipe_tooltip=false},
                {type="item", name="apm_fuel_rod_mox_cooled", amount=1, show_details_in_recipe_tooltip=false}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.main_product = 'apm_breeder_thorium_seperated'
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_item('apm_breeder_thorium_seperated')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_breeder_thorium_seperation_process_a'
recipe.icons = icons
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_thorium"
recipe.order = 'af_a'
local fluid = data.raw.fluid['apm_purex_solution_thorium_breeder']
recipe.crafting_machine_tint = {
  primary   = fluid.base_color,
  secondary = fluid.base_color,
  tertiary  = fluid.base_color,
}
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 3.5
recipe.normal.ingredients = {
                apm.lib.utils.builder.recipe.item.simple('APM_NUCLEAR_ACID', 5),
                {type="item", name='apm_breeder_thorium_seperated', amount=1}
            }
recipe.normal.results = {
                {type='item', name='apm_breeder_container_worn', amount=1, show_details_in_recipe_tooltip=false},
                {type="fluid", name=fluid.name, amount=100}
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = get_raw_fluid_icons('apm_purex_solution_thorium_breeder')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
local recipe = {}
recipe.type = 'recipe'
recipe.name = 'apm_breeder_thorium_seperation_process_b'
recipe.icons = icons
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_breeding_thorium"
recipe.order = 'af_b'
local fluid = data.raw.fluid['apm_purex_solution_thorium_breeder']
recipe.crafting_machine_tint = {
  primary   = fluid.flow_color,
  secondary = fluid.flow_color,
  tertiary  = fluid.flow_color,
}
recipe.normal = {}
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
                {type="fluid", name='apm_tbp_30', amount=apm.nuclear.constants.amount_of_tbp_30},
                {type="fluid", name=fluid.name, amount=100},
                {type="item", name='apm_waste_container', amount=1}
            }
recipe.normal.results = {
                {type='item', name='apm_oxide_pellet_u238', amount=5, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_oxide_pellet_np237', amount=4, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_oxide_pellet_pu239', amount_min=1, amount_max=1, probability=apm.nuclear.constants.probability_plutonium/2, show_details_in_recipe_tooltip=false},
                {type='item', name='apm_radioactive_waste', amount=1, show_details_in_recipe_tooltip=false},
                {type="fluid", name='apm_radioactive_wastewater', amount=apm.nuclear.constants.amount_of_rocow }
            }
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.expensive = table.deepcopy(recipe.normal)
data:extend({recipe})
