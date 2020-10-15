require 'util'
require('lib.log')

local self = 'lib.utils.car'

if not apm.lib.utils.car.get then apm.lib.utils.car.get = {} end
if not apm.lib.utils.car.add then apm.lib.utils.car.add = {} end
if not apm.lib.utils.car.set then apm.lib.utils.car.set = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.exist(car_name)
	if data.raw.car[car_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'car with name: "' .. tostring(car_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.get.fuel_categories(car_name)
    if not apm.lib.utils.car.exist(car_name) then return nil end

    local car = data.raw['car'][car_name]
    if not car.burner then return nil end

    if car.burner.fuel_category then
        return {{name=car.burner.fuel_category, type='fuel-category'}}
    elseif car.burner.fuel_categories then
        local rc = {}
        for _, fc in pairs(car.burner.fuel_categories) do
            table.insert(rc, {name=fc, type='fuel-category'})
        end
        return rc
    end

    if car.energy_source then
        if car.energy_source.type == 'burner' then
            APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(car_name))
            return {{name='chemical', type='fuel-category'}} -- default
        elseif car.energy_source.type == 'fluid' then
            APM_LOG_WARN(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(car_name))
            return {{name='apm_petrol', type='fuel-category'}} -- default
        end
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.update_description(car_name)
	if not apm.lib.utils.car.exist(car_name) then return end
	local car = data.raw['car'][car_name]

    if not car.burner then return end
    local fuel_categories = apm.lib.utils.car.get.fuel_categories(car_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(car, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(car, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.overhaul(car_name)
	if not apm.lib.utils.car.exist(car_name) then return end

	local car = data.raw.car[car_name]
	local base_emissions_per_minute = 2

	if not car.burner then 
		APM_LOG_WARN(self, 'overhaul()', 'car with name: "' .. tostring(car_name) .. '" has no property: burner')
		return 
	end

    if apm.lib.utils.entity.has.fuel_category(car, 'apm_electrical') then return end

	car.burner.burnt_inventory_size = car.burner.fuel_inventory_size
	car.burner.emissions_per_minute = base_emissions_per_minute
	--car.effectivity = 0.42
    --todo: car.effectivity needs more tests in the future or should I drop this?
    
	APM_LOG_INFO(self, 'overhaul()', 'car with name: "' .. tostring(car_name) .. '" changed...')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.effectivity(car_name, value)
	if not apm.lib.utils.car.exist(car_name) then return end

	local car = data.raw.car[car_name]
    car.effectivity = value
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.overhaul_all()
    for car, _ in pairs(data.raw.car) do
        apm.lib.utils.car.overhaul(car)
    end
end
-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.add.fuel_category(car_name, category)
    if not apm.lib.utils.car.exist(car_name) then return end

    local car = data.raw.car[car_name]
    apm.lib.utils.entity.add.fuel_category(car, category)
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.car.set.fuel_category(car_name, categories)
    if not apm.lib.utils.car.exist(car_name) then return end

    local car = data.raw.car[car_name]
    apm.lib.utils.entity.set.fuel_category(car, categories)
end
