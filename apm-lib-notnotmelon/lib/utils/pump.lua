require 'util'
require('lib.log')

local self = 'lib.utils.pump'

if apm.lib.utils.pump.get == nil then apm.lib.utils.pump.get = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.pump.exist(pump_name)
    if data.raw.pump[pump_name] then 
        return true
    end
    APM_LOG_WARN(self, 'exist()', 'pump with name: "' .. tostring(pump_name) .. '" dosent exist.')
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.pump.get.fuel_categories(pump_name)
    if not apm.lib.utils.pump.exist(pump_name) then return nil end

    local pump = data.raw.pump[pump_name]
    if not pump.energy_source then return nil end

    if pump.energy_source.type == 'burner' then
        if pump.energy_source.fuel_category then
            return {{name=pump.energy_source.fuel_category, type='fuel-category'}}
        elseif pump.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(pump.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif pump.energy_source.type == 'fluid' then
        if pump.energy_source.fluid_box.filter ~= nil then
            if pump.energy_source.fluid_box.filter == 'steam' then
                return nil
            end
            return {{name=pump.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if pump.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(pump_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif pump.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(pump_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.pump.update_description(pump_name)
    if not apm.lib.utils.pump.exist(pump_name) then return end
    local pump = data.raw.pump[pump_name]

    if not pump.energy_source then return nil end
    local fuel_categories = apm.lib.utils.pump.get.fuel_categories(pump_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(pump, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(pump, fuel_categories)
    end
end
