require 'util'
require('lib.log')

local self = 'lib.utils.inserter'

if apm.lib.utils.inserter.get == nil then apm.lib.utils.inserter.get = {} end
if apm.lib.utils.inserter.burner == nil then apm.lib.utils.inserter.burner = {} end
if apm.lib.utils.inserter.burner.mod == nil then apm.lib.utils.inserter.burner.mod = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.inserter.exist(inserter_name)
	if data.raw.inserter[inserter_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'inserter with name: "' .. tostring(inserter_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.inserter.get.fuel_categories(inserter_name)
    if not apm.lib.utils.inserter.exist(inserter_name) then return nil end

    local inserter = data.raw['inserter'][inserter_name]
    if not inserter.energy_source then return nil end

    if inserter.energy_source.type == 'burner' then
        if inserter.energy_source.fuel_category then
            return {{name=inserter.energy_source.fuel_category, type='fuel-category'}}
        elseif inserter.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(inserter.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif inserter.energy_source.type == 'fluid' then
        if inserter.energy_source.fluid_box.filter ~= nil then
            return {{name=inserter.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if inserter.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "burner" for: ' .. tostring(inserter_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif inserter.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "fluid" for: ' .. tostring(inserter_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end
    
    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.inserter.update_description(inserter_name)
    if not apm.lib.utils.inserter.exist(inserter_name) then return end
    local inserter = data.raw['inserter'][inserter_name]

    if not inserter.energy_source then return end
    local fuel_categories = apm.lib.utils.inserter.get.fuel_categories(inserter_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(inserter, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(inserter, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.inserter.burner.overhaul(inserter_name)
	if not apm.lib.utils.inserter.exist(inserter_name) then return end

	local inserter = data.raw.inserter[inserter_name]

	if inserter.energy_source.type == 'burner' then
		inserter.energy_source.burnt_inventory_size = 1
		inserter.energy_source.fuel_category = nil
		inserter.energy_source.fuel_categories = {'chemical', 'apm_refined_chemical'}
		APM_LOG_INFO(self, 'burner.overhaul()', 'inserter with name: "' .. tostring(inserter_name) .. '"changed')
		return
	end
	APM_LOG_WARN(self, 'burner.overhaul()', 'inserter with name: "' .. tostring(inserter_name) .. '" dosent has energy_source.type == "burner"')
end