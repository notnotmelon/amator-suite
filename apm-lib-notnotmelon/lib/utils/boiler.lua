require 'util'
require('lib.log')

local self = 'lib.utils.boiler'

if not apm.lib.utils.boiler.mod then apm.lib.utils.boiler.mod = {} end
if not apm.lib.utils.boiler.set then apm.lib.utils.boiler.set = {} end
if not apm.lib.utils.boiler.get then apm.lib.utils.boiler.get = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.exist(boiler_name)
	if data.raw.boiler[boiler_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'boiler with name: "' .. tostring(boiler_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.get.fuel_categories(boiler_name)
    if not apm.lib.utils.boiler.exist(boiler_name) then return nil end

    local boiler = data.raw['boiler'][boiler_name]
    if not boiler.energy_source then return nil end

    if boiler.energy_source.type == 'burner' then
        if boiler.energy_source.fuel_category then
            return {{name=boiler.energy_source.fuel_category, type='fuel-category'}}
        elseif boiler.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(boiler.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif boiler.energy_source.type == 'fluid' then
        if boiler.energy_source.fluid_box.filter ~= nil then
            return {{name=boiler.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if boiler.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(boiler_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif boiler.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(boiler_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.update_description(boiler_name)
	if not apm.lib.utils.boiler.exist(boiler_name) then return end
	local boiler = data.raw['boiler'][boiler_name]

    if not boiler.energy_source then return end
    local fuel_categories = apm.lib.utils.boiler.get.fuel_categories(boiler_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(boiler, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(boiler, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.set.next_upgrade(boiler_name, next_upgrade)
    if not apm.lib.utils.boiler.exist(boiler_name) then return end
    local boiler = data.raw.boiler[boiler_name]
    apm.lib.utils.entity.set.next_upgrade(boiler, next_upgrade)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.overhaul(boiler_name, level)
	if not apm.lib.utils.boiler.exist(boiler_name) then return end

    apm.lib.utils.icon.add_tier_lable(boiler_name, level)

	local boiler = data.raw.boiler[boiler_name]
	local base_energy_consumption = 1800000
	local base_target_temperature = 120
	local base_effectivity = 0.8
	local base_emissions_per_minute = 25

	local new_energy_source_effectivity = base_effectivity+((level-1)*0.03)
	local new_target_temperature = base_target_temperature+((level-1)*150)
	local new_energy_consumption = base_energy_consumption*level
	local new_emissions_per_minute = base_emissions_per_minute-((level-1)*2.5)

	if boiler.energy_source.type == 'burner' then
        boiler.fast_replaceable_group = 'boiler'
		boiler.target_temperature = new_target_temperature
		boiler.energy_consumption = new_energy_consumption .. 'W'
		boiler.energy_source.effectivity = new_energy_source_effectivity
		boiler.energy_source.fuel_inventory_size = 1
		boiler.energy_source.burnt_inventory_size = 1
		boiler.energy_source.fuel_category = nil
		boiler.energy_source.fuel_categories = {'apm_refined_chemical'}
		boiler.energy_source.emissions_per_minute = new_emissions_per_minute
        --apm.lib.utils.entity.add.fuel_category(boiler, 'apm_refined_chemical')
        --apm.lib.utils.entity.del.fuel_category(boiler, 'chemical')
        APM_LOG_INFO(self, 'overhaul()', 'boiler with name: "' .. tostring(boiler_name) .. '" changed')
		return
	end
	APM_LOG_WARN(self, 'overhaul()', 'boiler with name: "' .. tostring(boiler_name) .. '" has not energy_source.type = "burner"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.boiler.set.hidden(boiler_name)
    if not apm.lib.utils.boiler.exist(boiler_name) then return end
    local boiler = data.raw.boiler[boiler_name]
    apm.lib.utils.entity.add.flag(boiler, 'hidden')
end