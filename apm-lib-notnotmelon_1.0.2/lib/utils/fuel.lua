require 'util'
require('lib.log')

local self = 'lib.utils.fuel'

if apm.lib.utils.fuel.category == nil then apm.lib.utils.fuel.category = {} end
if apm.lib.utils.fuel.add == nil then apm.lib.utils.fuel.add = {} end
if apm.lib.utils.fuel.set == nil then apm.lib.utils.fuel.set = {} end
if apm.lib.utils.fuel.exlude_list == nil then apm.lib.utils.fuel.exlude_list = {} end
if apm.lib.utils.fuel.entity == nil then apm.lib.utils.fuel.entity = {} end
if apm.lib.utils.fuel.entity.add == nil then apm.lib.utils.fuel.entity.add = {} end
if apm.lib.utils.fuel.entities == nil then apm.lib.utils.fuel.entities = {} end
if apm.lib.utils.fuel.entities.add == nil then apm.lib.utils.fuel.entities.add = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.add.to_exlude_list(entity_name)
    apm.lib.utils.fuel.exlude_list[entity_name] = true
    APM_LOG_INFO(self, 'add.to_exlude_list()', 'add entity: "' .. tostring(entity_name) .. '" to fuel overhoule exlude_list')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.get_base_fuel_value()
    local fuel_value = 2.5

    if settings.startup['apm_power_coal_value_01779'] then
        fuel_value = settings.startup['apm_power_coal_value_01779'].value -- value is MJ
        APM_LOG_INFO(self, 'get_base_fuel_value()', 'from settings: ' .. tostring(fuel_value))
    end

    if apm.power.overwrites.data_stage.coal_fuel_value then
        fuel_value = apm.power.overwrites.data_stage.coal_fuel_value
        APM_LOG_INFO(self, 'get_base_fuel_value()', 'interface overwrite: ' .. tostring(fuel_value))
    end

    return tostring(fuel_value * 1000000) .. 'J'
end

-- Function -------------------------------------------------------------------
-- the coal fuel value is the base for all other callculations
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.overwrite_coal_fuel_value()
	if not apm.lib.utils.item.exist('coal') then
		APM_LOG_WARN(self, 'overwrite_coal_fuel_value()', 'there is no ITEM: coal')
		return 
	end

	local item = data.raw.item['coal']
	local fuel_value = apm.lib.utils.fuel.get_base_fuel_value()
    APM_LOG_INFO(self, 'overwrite_coal_fuel_value()', 'set coal fuel value to: ' .. tostring(fuel_value))
	item.fuel_value = fuel_value
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.get_coal_fuel_value()
    if not apm.lib.utils.item.exist('coal') then
        return apm.lib.utils.fuel.get_base_fuel_value()
    end

    -- get fuel value of coal
    local item = data.raw.item['coal']
    local fuel_value = apm.lib.utils.string.convert_to_number(item.fuel_value)
    return fuel_value
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.overwrite_emissions_multiplier(item_name, emissions_multiplier)
    if not apm.lib.utils.item.exist(item_name) then return end
    local item = data.raw.item[item_name]
    item.fuel_emissions_multiplier = emissions_multiplier
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.overhaul(level, item_name, multiplicator, burnt_result, fuel_category)
    if not apm.lib.utils.item.exist(item_name) then return end
    
    if burnt_result then
        if not apm.lib.utils.item.exist(burnt_result) then return end
    end

    local item = data.raw.item[item_name]
    local base_value = apm.lib.utils.fuel.get_coal_fuel_value()
    local base_emissions_value = 1.4
    local base_acceleration_multiplier = 0.8
    local base_top_speed_multiplier = 0.8

    local new_value = tostring(apm.lib.utils.math.round(base_value*multiplicator, 2)) .. 'J'
    local new_emissions_multiplier = apm.lib.utils.math.round(base_emissions_value-(level*0.10),2)
    if new_emissions_multiplier < 0.8 then
        new_emissions_multiplier = 0.8
    end
    local new_acceleration_multiplier = apm.lib.utils.math.round(base_acceleration_multiplier+(0.06*level),2)
    local new_top_speed_multiplier = apm.lib.utils.math.round(base_top_speed_multiplier+(0.06*level),2)
    
    if not fuel_category then
        fuel_category = 'chemical'
    end
    
    item.fuel_value = new_value
    item.fuel_category = fuel_category
    item.fuel_emissions_multiplier = new_emissions_multiplier
    item.fuel_acceleration_multiplier  = new_acceleration_multiplier
    item.fuel_top_speed_multiplier = new_top_speed_multiplier
    item.burnt_result = burnt_result

    APM_LOG_INFO(self, 'overhaul()', 'item/fluid with name: "' .. tostring(item_name) .. '" changed. New fuel value: "' .. tostring(new_value) .. '" with burnt_result: "' .. tostring(burnt_result) .. '" with category: "' .. tostring(fuel_category) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fuel.category.create(category_name)
    local recipe_category = {}
    recipe_category.type = "fuel-category"
    recipe_category.name = category_name
    data:extend({recipe_category})
    APM_LOG_INFO(self, 'category.create()', 'created category with name: "' .. tostring(category_name) .. '"')
end
