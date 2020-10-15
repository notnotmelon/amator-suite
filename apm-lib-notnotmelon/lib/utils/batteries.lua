require 'util'
require('lib.log')

local self = 'lib.utils.batteries'

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.batteries.generate(level, battery_name, fuel_value, overlay, probability, technology_name)
    if not apm.lib.utils.item.exist(battery_name) then return end
    local item_battery = data.raw.item[battery_name]

    local item_icon_a = apm.lib.utils.icon.get.from_item(battery_name)
    local item_icon_b = {overlay}
    local item_icon_c = {apm.lib.icons.dynamics.recycling}


    local battery_fuel_value = apm.lib.utils.string.convert_to_number(fuel_value)
    local energy_charging_station = apm.lib.utils.string.convert_to_number(apm.energy_addon.constants.energy_usage_charging_station)
    local energy_required =  battery_fuel_value * 6 / energy_charging_station

    -- discharged item
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    local item = {}
    item.type = 'item'
    item.name = 'apm_discharged_' .. battery_name
    item.localised_name = {"item-name.apm_discharged", {'item-name.' .. battery_name}}
    item.localised_description = {"item-description.apm_discharged"}
    item.icons = icons
    item.icon_mipmaps = 4
    item.stack_size = item_battery.stack_size
    item.group = item_battery.group
    item.subgroup = item_battery.subgroup
    item.order = item_battery.order .. 'z'
    data:extend({item})

    -- charging recipe
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c})
    local recipe = {}
    recipe.type = "recipe"
    recipe.name = "apm_charging_" ..tostring(battery_name)
    recipe.localised_name = {"recipe-name.apm_charging", {'item-name.' .. battery_name}}
    recipe.category = 'apm_electric_charging'
    recipe.group = item_battery.group
    recipe.subgroup = item_battery.subgroup
    recipe.order = item_battery.order .. 'z'
    recipe.icons = icons
    recipe.normal = {}
    recipe.normal.enabled = false
    recipe.normal.energy_required = energy_required
    recipe.normal.ingredients = {
            {type="item", name=item.name, amount=6}
        }
    recipe.normal.results = { 
            {type='item', name=battery_name, amount=5},
            {type='item', name=battery_name, amount_min=1, amount_max=1, probability=probability, show_details_in_recipe_tooltip=false}
        }
    recipe.normal.main_product = ''
    recipe.normal.requester_paste_multiplier = 4
    recipe.normal.always_show_products = true
    recipe.normal.always_show_made_in = true
    recipe.normal.allow_decomposition = false
    recipe.normal.allow_as_intermediate = false
    recipe.normal.allow_intermediates = false
    recipe.expensive = table.deepcopy(recipe.normal)
    recipe.expensive.results = {
            {type='item', name=battery_name, amount=5},
            {type='item', name=battery_name, amount_min=1, amount_max=1, probability=apm.lib.utils.math.round(probability/3*2, 2), show_details_in_recipe_tooltip=false}
    }
    data:extend({recipe})

    -- add technologie unlock
    apm.lib.utils.technology.add.recipe_for_unlock(technology_name, recipe.name)

    -- overwrite battery
    apm.lib.utils.item.overwrite.battery(level, battery_name, fuel_value, item.name)

    APM_LOG_INFO(self, 'generate()', 'generated item recipes and for: "' ..tostring(battery_name).. '"')
end
