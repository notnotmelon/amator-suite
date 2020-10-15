require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/waste.lua'

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
local item_icon_a = get_raw_fluid_icons('apm_radioactive_wastewater')
local item_icon_b = {apm.lib.icons.dynamics.recycling}
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_radioactive_wastewater_recyling"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_recycling_stage_b"
recipe.order = 'ca_a'
recipe.icons = icons
recipe.crafting_machine_tint = {
    primary   = {r=0.500, g=0.950, b=0.000, a = 0.000},
    secondary = {r=0.500, g=0.950, b=0.000, a = 0.000},
    tertiary  = {r=0.500, g=0.950, b=0.000, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 10
recipe.normal.ingredients = {
        {type="item", name="apm_waste_container", amount=1},
        {type="fluid", name="apm_radioactive_wastewater", amount=apm.nuclear.constants.amount_for_rocow_recycling}
    }
recipe.normal.results = { 
        {type="item", name="apm_oxide_pellet_np237", amount=1, show_details_in_recipe_tooltip=false},
        {type="item", name="apm_radioactive_waste", amount=1, show_details_in_recipe_tooltip=false},
        apm.lib.utils.builder.recipe.item.simple('APM_WATER', apm.nuclear.constants.amount_for_rocow_recycling/10 - 10)
    }
recipe.normal.main_product = ''
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
recipe.normal.allow_decomposition = false
recipe.normal.allow_as_intermediate = false
recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
--recipe.expensive.ingredients = {}
--recipe.expensive.results = {}
data:extend({recipe})
