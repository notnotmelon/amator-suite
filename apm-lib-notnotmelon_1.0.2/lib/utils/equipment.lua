require 'util'
require('lib.log')

local self = 'lib.utils.equipment'

if not apm.lib.utils.equipment.get then apm.lib.utils.equipment.get = {} end
if not apm.lib.utils.equipment.add then apm.lib.utils.equipment.add = {} end
if not apm.lib.utils.equipment.set then apm.lib.utils.equipment.set = {} end

-- Locals ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local prototypes = {'generator-equipment'}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.equipment.exist(equipment_name)
    for _, prototype in pairs(prototypes) do
        if data.raw[prototype][equipment_name] then
            return true
        end
    end
	APM_LOG_WARN(self, 'exist()', 'equipment with name: "' .. tostring(equipment_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.equipment.get.type(equipment_name)
    for _, prototype in pairs(prototypes) do
        if data.raw[prototype][equipment_name] then
            return prototype
        end
    end
	return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.equipment.get.fuel_categories(equipment_name)
    if not apm.lib.utils.equipment.exist(equipment_name) then return nil end
    local prototype = apm.lib.utils.equipment.get.type(equipment_name)

    local equipment = data.raw[prototype][equipment_name]
    if not equipment.burner then return nil end

    if equipment.burner.fuel_category then
        return {{name=equipment.burner.fuel_category, type='fuel-category'}}
    elseif equipment.burner.fuel_categories then
        local rc = {}
        for _, fc in pairs(equipment.burner.fuel_categories) do
            table.insert(rc, {name=fc, type='fuel-category'})
        end
        return rc
    end

    if equipment.energy_source then
        if equipment.energy_source.type == 'burner' then
            APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(equipment_name))
            return {{name='chemical', type='fuel-category'}} -- default
        elseif equipment.energy_source.type == 'fluid' then
            APM_LOG_WARN(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(equipment_name))
            return {{name='apm_petrol', type='fuel-category'}} -- default
        end
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.equipment.update_description(equipment_name)
	if not apm.lib.utils.equipment.exist(equipment_name) then return end
    local prototype = apm.lib.utils.equipment.get.type(equipment_name)
	local equipment = data.raw[prototype][equipment_name]

    if not equipment.burner then return end
    --equipment.localised_description = {"", {"apm_info_fuel_equipment_manager"}}

    local fuel_categories = apm.lib.utils.equipment.get.fuel_categories(equipment_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(equipment, fuel_categories)
    end
end