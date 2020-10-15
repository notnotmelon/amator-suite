require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/hexafluoride.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function CreateRecipeCentrifuging(i)
    local enrichment_input = 2+((i)*5)
    local enrichment_output_A = 2+((i-1)*5)
    local enrichment_output_B = 2+((i+1)*5)
    local energy_required = 30

    recipe = {}
    recipe.type = 'recipe'
    recipe.name = 'apm_hexafluoride_' .. string.format("%03d",enrichment_output_B)
    recipe.localised_name = {"recipe-name.apm_hexafluoride", tostring(enrichment_input/10), tostring(enrichment_output_B/10), tostring(enrichment_output_A/10)}
    recipe.icons = apm.nuclear.icons.get_apm_hexafluoride_enrichment(enrichment_output_B)
    recipe.crafting_machine_tint = {
      primary   = {r=0+(8-i)*0.074, g=1, b=0, a = 0.000},
      secondary = {r=0+(8-i)*0.074, g=1, b=0, a = 0.000},
      tertiary  = {r=0+(8-i)*0.074, g=1, b=0, a = 0.000},
    }
    recipe.category = 'centrifuging'
    recipe.group = "apm_nuclear"
    recipe.subgroup = "apm_nuclear_hexafluoride"
    recipe.order = 'aa_[' .. string.format("%03d",enrichment_output_B) .. ']'
    recipe.normal = {}
    recipe.normal.enabled = false
    recipe.normal.energy_required = energy_required
    recipe.normal.ingredients = {
                    {type='fluid', name='apm_nuclear_hexafluoride_' .. string.format("%03d",enrichment_input), amount=100},
                }
    recipe.normal.results = {            
                    {type='fluid', name='apm_nuclear_hexafluoride_' .. string.format("%03d",enrichment_output_A), amount=50},
                    {type='fluid', name='apm_nuclear_hexafluoride_' .. string.format("%03d",enrichment_output_B), amount=50},
                }
    --recipe.normal.requester_paste_multiplier = 1
    recipe.normal.always_show_products = true
    recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
    recipe.expensive = table.deepcopy(recipe.normal)
    data:extend({recipe})
end

-- Action ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
for i = 1,8 do
    CreateRecipeCentrifuging(i)
end

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item_icon_a = apm.lib.utils.icon.get.from_fluid('apm_nuclear_hexafluoride_007')
local item_icon_b = apm.lib.utils.icon.get.from_fluid('apm_yellowcake')
item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.45, {-9,9})
local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})

local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_hexafluoride_007"
recipe.category = 'chemistry'
recipe.group = "apm_nuclear"
recipe.subgroup = "apm_nuclear_chemistry"
recipe.order = 'az_a'
recipe.icons = icons
recipe.crafting_machine_tint = {
    primary   = {r=0.000, g=0.650, b=0.650, a = 0.000},
    secondary = {r=0.000, g=0.650, b=0.650, a = 0.000},
    tertiary  = {r=0.000, g=0.650, b=0.650, a = 0.000}
}

recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="item", name="apm_yellowcake", amount=3},
        {type="fluid", name="steam", amount=50},
        {type="fluid", name="apm_bromine_trifluoride", amount=30}
    }
recipe.normal.results = { 
        {type='fluid', name='apm_nuclear_hexafluoride_007', amount=30},
        {type='fluid', name='apm_radioactive_wastewater', amount=25}
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
recipe.expensive.ingredients = {
        {type="item", name="apm_yellowcake", amount=6},
        {type="fluid", name="steam", amount=50},
        {type="fluid", name="apm_bromine_trifluoride", amount=60}
    }
--recipe.expensive.results = {}
data:extend({recipe})

-- Recipe ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local recipe = {}
recipe.type = "recipe"
recipe.name = "apm_fluorite_ore"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.694, g=0.756, b=0.095, a = 0.000},
    secondary = {r=0.694, g=0.756, b=0.095, a = 0.000},
    tertiary  = {r=0.694, g=0.756, b=0.095, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="fluid", name="sulfuric-acid", amount=50},
        {type="item", name="stone", amount=5}
    }
recipe.normal.results = { 
        apm.lib.utils.builder.recipe.item.simple('APM_FLUORITE', 5)
    }
recipe.normal.main_product = 'APM_FLUORITE'
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
recipe.name = "apm_potassium_bromide"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.867, g=0.651, b=0.620, a = 0.000},
    secondary = {r=0.867, g=0.651, b=0.620, a = 0.000},
    tertiary  = {r=0.867, g=0.651, b=0.620, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 6
recipe.normal.ingredients = {
        apm.lib.utils.builder.recipe.item.simple('APM_SALINE_WATER', 10)
    }
recipe.normal.results = {
        {type='item', name='apm_potassium_bromide', amount=3},
        {type="fluid", name='steam', amount=175, temperature=165}
    }
recipe.normal.main_product = 'apm_potassium_bromide'
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
recipe.name = "apm_bromine"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.637, g=0.000, b=0.000, a = 0.000},
    secondary = {r=0.637, g=0.000, b=0.000, a = 0.000},
    tertiary  = {r=0.637, g=0.000, b=0.000, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="fluid", name="steam", amount=50},
        {type="item", name="apm_potassium_bromide", amount=5}
    }
recipe.normal.results = {
        {type="fluid", name='apm_bromine', amount=50}
    }
recipe.normal.main_product = 'apm_bromine'
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
recipe.name = "apm_bromine_trifluoride"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.615, g=0.765, b=0.027, a = 0.000},
    secondary = {r=0.615, g=0.765, b=0.027, a = 0.000},
    tertiary  = {r=0.615, g=0.765, b=0.027, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 5
recipe.normal.ingredients = {
        {type="fluid", name="apm_bromine", amount=50},
        apm.lib.utils.builder.recipe.item.simple('APM_FLUORITE', 5)
    }
recipe.normal.results = {
        {type="fluid", name='apm_bromine_trifluoride', amount=50}
    }
recipe.normal.main_product = 'apm_bromine_trifluoride'
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
recipe.name = "apm_yellowcake"
recipe.category = 'chemistry'
recipe.crafting_machine_tint = {
    primary   = {r=0.950, g=0.950, b=0.000, a = 0.000},
    secondary = {r=0.950, g=0.950, b=0.000, a = 0.000},
    tertiary  = {r=0.950, g=0.950, b=0.000, a = 0.000},
}
recipe.normal = {}
recipe.normal.enabled = false
recipe.normal.energy_required = 7.5
recipe.normal.ingredients = {
        {type="fluid", name="sulfuric-acid", amount=50},
        {type="item", name="uranium-ore", amount=5}
    }
recipe.normal.results = { 
        {type='item', name='apm_yellowcake', amount=5},
        {type="fluid", name='apm_radioactive_wastewater', amount=50}
    }
recipe.normal.main_product = 'apm_yellowcake'
recipe.normal.requester_paste_multiplier = 4
recipe.normal.always_show_products = true
recipe.normal.always_show_made_in = apm_nuclear_always_show_made_in
--recipe.normal.allow_decomposition = false
--recipe.normal.allow_as_intermediate = false
--recipe.normal.allow_intermediates = false
recipe.expensive = table.deepcopy(recipe.normal)
--recipe.expensive.energy_required = 4
recipe.expensive.ingredients = {
        {type="fluid", name="sulfuric-acid", amount=50},
        {type="item", name="uranium-ore", amount=10}
    }
--recipe.expensive.results = {}
data:extend({recipe})
