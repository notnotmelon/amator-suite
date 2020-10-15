require 'util'
require('lib.log')

local self = 'lib.utils.item'

if not apm.lib.utils.item.add then apm.lib.utils.item.add = {} end
if not apm.lib.utils.item.set then apm.lib.utils.item.set = {} end
if not apm.lib.utils.item.has then apm.lib.utils.item.has = {} end
if not apm.lib.utils.item.mod then apm.lib.utils.item.mod = {} end
if not apm.lib.utils.item.replace then apm.lib.utils.item.replace = {} end
if not apm.lib.utils.item.overwrite then apm.lib.utils.item.overwrite = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.dummy()
    return {type='item', name='apm_dummy', amount=1}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.exist(item_name)
    local types_list = {'item', 'fluid'}
    for _, type_name in pairs(types_list) do
        if data.raw[type_name][item_name] then 
            return true
        end
    end
    APM_LOG_WARN(self, 'exist()', 'item/fluid with name: "' .. tostring(item_name) .. '" dosent exist.')
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.create_simple(module, item_name, item_group, item_sub_group, item_order)
    --todo remove this function?
    local item = {}
    item.type = 'item'
    item.name = item_name
    item.icon = '__'.. module .. '__/graphics/icons/' .. item.name .. '.png'
    item.icon_size = 32
    item.group = item_group
    item.subgroup = item_sub_group
    item.order = item_order
    item.stack_size = 50
    data:extend({item})
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.get_type(item_name, prefer_item)
    local types_list = {'item', 'fluid'}
    local result
    local count = 0
    for _, type_name in pairs(types_list) do
        if data.raw[type_name][item_name] then 
            result = type_name
            count = count + 1
        end
    end

    if count == 2 then
        if prefer_item then
            result = 'item'
        else
            result = 'fluid'
        end
        APM_LOG_WARN(self, 'get_type()', 'found item and fluid with same name: "' .. tostring(item_name) .. '", return ' .. tostring(result))
    end

    if result then 
        return result 
    end

    APM_LOG_WARN(self, 'get_type()', 'item/fluid with name: "' .. tostring(item_name) .. '" dosent exist, return nil')
    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.add.radioactive_description(item_name, level)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]
    
    local loc_string = "apm_radioactive_item"
    if level then
        loc_string = "apm_radioactive_item_" .. level
    end

    if item.localised_description then
        table.insert(item.localised_description, {loc_string})
    else
        item.localised_description = {loc_string}
    end

    APM_LOG_INFO(self, 'add.radioactive_description()', 'add radioactive description to item: "' .. tostring(item_name) .. '" with level: "' .. tostring(level) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.set.icons(item_name, icons)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]
    
    apm.lib.utils.icon.set.icons(item, icons)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.is_type(item_name, item_type)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]
    if item.type == item_type then
        return true
    end
    return false
end
-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.mod.stack_size(item_name, value, b_overwrite)
    if not apm.lib.utils.item.exist(item_name) then return end
    if not apm.lib.utils.item.is_type(item_name, 'item') then
        APM_LOG_WARN(self, 'mod.stack_size()', 'item: "' .. tostring(item_name) .. '" has not type="item" (its a fluid?)')
        return
    end

    local item = data.raw.item[item_name]
    if item.stack_size >= value and not b_overwrite then
        APM_LOG_WARN(self, 'mod.stack_size()', 'stack_size for item: "' .. tostring(item_name) .. '" is higer then "' .. tostring(value) .. '" and b_overwrite is not set, no changes')
        return
    end
    item.stack_size = value
    APM_LOG_INFO(self, 'mod.stack_size()', 'for item: "' .. tostring(item_name) .. '" to "' .. tostring(value) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.delete_hard(item_name)
    if not apm.lib.utils.item.exist(item_name) then return end
    data.raw.item[item_name] = nil
    APM_LOG_INFO(self, 'delete_hard()', 'item/fluid with name: "' .. tostring(item_name) .. '" deleted hard (set to nil)')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.remove(item_name)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    item.flags  = {'hidden', 'hide-from-bonus-gui', 'hide-from-fuel-tooltip'}
    APM_LOG_INFO(self, 'remove()', 'item/fluid with name: "' .. tostring(item_name) .. '" set flag "hidden".')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.mod.remove_fuel_value(item_name)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    item.fuel_category = nil
    item.fuel_value = nil
    item.fuel_acceleration_multiplier  = nil
    item.fuel_top_speed_multiplier = nil
    item.fuel_emissions_multiplier = nil
    APM_LOG_INFO(self, 'remove_fuel_value()', 'item/fluid with name: "' .. tostring(item_name) .. '" set fuel related attributes to nil.')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.mod.fuel_category(item_name, fuel_category)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    item.fuel_category = fuel_category
    APM_LOG_INFO(self, 'mod.fuel_category()', 'item/fluid with name: "' .. tostring(item_name) .. '" set fuel category to "' .. tostring(fuel_category) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.has.burnt_result(item_name, burnt_result)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    if item.burnt_result == burnt_result then
        return true
    end
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.replace.burnt_result(item_name, old_burnt_result, new_burnt_result)
    if not apm.lib.utils.item.exist(item_name) then return end

    if apm.lib.utils.item.has.burnt_result(item_name, old_burnt_result) then
        apm.lib.utils.item.mod.burnt_result(item_name, new_burnt_result)
    end
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.replace.burnt_results(old_burnt_result, new_burnt_result)
    for _, item in pairs(data.raw.item) do
        if apm.lib.utils.item.has.burnt_result(item.name, old_burnt_result) then
            apm.lib.utils.item.mod.burnt_result(item.name, new_burnt_result)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.mod.burnt_result(item_name, burnt_result)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    if item.fuel_value then
        item.burnt_result = burnt_result

        local check_category = {['chemical'] = true, ['apm_refined_chemical'] = true, ['apm_petrol'] = true, ['apm_vehicle_only'] = true}
        if check_category[item.fuel_category] then
            if burnt_result then
                item.localised_description = {"", {"apm_info_burnt_result_0"}, "\n", {"apm_info_fuel_tier", {"fuel-category-name." .. tostring(item.fuel_category)}}}
            else
                item.localised_description = {"", {"apm_info_burnt_result_1"}, "\n", {"apm_info_fuel_tier", {"fuel-category-name." .. tostring(item.fuel_category)}}}
            end
        end

        APM_LOG_INFO(self, 'mod.burnt_result()', 'item/fluid with name: "' .. tostring(item_name) .. '" set burnt_result to: ' .. tostring(burnt_result))
        return
    end
    APM_LOG_WARN(self, 'mod.burnt_result()', 'item/fluid with name: "' .. tostring(item_name) .. '" cant set burnt_result, has no fuel_value.')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.overwrite.localised_name(item_name, localised_name)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]

    item.localised_name = localised_name
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.overwrite.localised_description(item_name, localised_description)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]

    item.localised_description = localised_description
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.overwrite.battery(level, item_name, fuel_value, burnt_result)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    local base_acceleration_multiplier = 1.0
    local base_top_speed_multiplier = 1.0
    local new_acceleration_multiplier = apm.lib.utils.math.round(base_acceleration_multiplier+(0.1*level),2)
    local new_top_speed_multiplier = apm.lib.utils.math.round(base_top_speed_multiplier+(0.1*level),2)

    item.fuel_category = 'apm_electrical'
    item.fuel_value = fuel_value
    item.fuel_acceleration_multiplier  = new_acceleration_multiplier
    item.fuel_top_speed_multiplier = new_top_speed_multiplier
    item.burnt_result = burnt_result
    item.fuel_emissions_multiplier = 0

    APM_LOG_INFO(self, 'overwrite.battery()', 'item with name: "' .. tostring(item_name) .. '" changed.')
end

-- Function -------------------------------------------------------------------
-- Todo lookup for 'item-with-entity-data' or make a new function?
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.item.overwrite.group(item_name, group, subgroup, order)
    if not apm.lib.utils.item.exist(item_name) then return end

    local item = data.raw.item[item_name]
    item.group = group
    item.subgroup = subgroup
    item.order = order

    APM_LOG_INFO(self, 'overwrite.group()', 'item with name: "' .. tostring(item_name) .. '" changed.')
end