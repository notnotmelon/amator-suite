require 'util'
require('lib.log')

local self = 'lib.utils.locomotive'

if apm.lib.utils.locomotive.add == nil then apm.lib.utils.locomotive.add = {} end
if apm.lib.utils.locomotive.get == nil then apm.lib.utils.locomotive.get = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.exist(locomotive_name)
	if data.raw.locomotive[locomotive_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.get.fuel_categories(locomotive_name)
    if not apm.lib.utils.locomotive.exist(locomotive_name) then return nil end

    local locomotive = data.raw['locomotive'][locomotive_name]
    if not locomotive.burner then return nil end

    if locomotive.burner.fuel_category then
        return {{name=locomotive.burner.fuel_category, type='fuel-category'}}
    elseif locomotive.burner.fuel_categories then
        local rc = {}
        for _, fc in pairs(locomotive.burner.fuel_categories) do
            table.insert(rc, {name=fc, type='fuel-category'})
        end
        return rc
    end

	if locomotive.energy_source then
	    if locomotive.energy_source.type == 'burner' then
	        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "burner" for: ' .. tostring(locomotive_name))
	        return {{name='chemical', type='fuel-category'}} -- default
	    elseif locomotive.energy_source.type == 'fluid' then
			APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "fluid" for: ' .. tostring(locomotive_name))
	        return {{name='apm_petrol', type='fuel-category'}} -- default
	    end
	end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.update_description(locomotive_name)
	if not apm.lib.utils.locomotive.exist(locomotive_name) then return end
	local locomotive = data.raw['locomotive'][locomotive_name]

    if not locomotive.burner then return end
    local fuel_categories = apm.lib.utils.locomotive.get.fuel_categories(locomotive_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(locomotive, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(locomotive, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_if_fuel_category_is_present(locomotive, category)
	if locomotive.burner.fuel_categories then
		for fc in pairs(locomotive.burner.fuel_categories) do
			if fc == category then
				return true
			end
		end
	end
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.add.fuel_category(locomotive_name, fuel_category)
	if not apm.lib.utils.locomotive.exist(locomotive_name) then return end
	
	local locomotive = data.raw.locomotive[locomotive_name]
	if locomotive.burner then
		if not check_if_fuel_category_is_present(locomotive, fuel_category) then
			table.insert(locomotive.burner.fuel_categories, fuel_category)
			APM_LOG_INFO(self, 'add.fuel_category()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" added: "' .. tostring(fuel_category) .. '" as fuel_category')
		else
			APM_LOG_WARN(self, 'add.fuel_category()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" allready has "' .. tostring(fuel_category) .. '" as fuel_category')
		end
	else
		APM_LOG_WARN(self, 'add.fuel_category()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" has no property: burner..')
	end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.overhaul(locomotive_name)
	if not apm.lib.utils.locomotive.exist(locomotive_name) then return end

	local locomotive = data.raw.locomotive[locomotive_name]
	local base_emissions_per_minute = 4

	if not locomotive.burner then 
		APM_LOG_WARN(self, 'overhaul()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" has no property: burner.')
		return 
	end

	locomotive.burner.burnt_inventory_size = locomotive.burner.fuel_inventory_size
	locomotive.burner.emissions_per_minute = base_emissions_per_minute
	locomotive.effectivity = 0.42

	APM_LOG_INFO(self, 'overhaul()', 'locomotive with name: "' .. tostring(locomotive_name) .. '" changed.')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.locomotive.overhaul_all()
    for locomotive, _ in pairs(data.raw.locomotive) do
        apm.lib.utils.locomotive.overhaul(locomotive)
    end
end