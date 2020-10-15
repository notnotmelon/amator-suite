require 'util'
require('lib.log')

local self = 'lib.utils.generator'

if apm.lib.utils.generator.mod == nil then apm.lib.utils.generator.mod = {} end
if apm.lib.utils.generator.set == nil then apm.lib.utils.generator.set = {} end
if apm.lib.utils.generator.get == nil then apm.lib.utils.generator.get = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.exist(generator_name)
	if data.raw.generator[generator_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'generator with name: "' .. tostring(generator_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.get.fuel_categories(generator_name)
    if not apm.lib.utils.generator.exist(generator_name) then return nil end

    local generator = data.raw['generator'][generator_name]
    if not generator.burner and not generator.fluid_box then return nil end

    if generator.burner then
        if generator.burner.fuel_category then
            return {{name=generator.burner.fuel_category, type='fuel-category'}}
        elseif generator.burner.fuel_categories then
            local rc = {}
            for _, fc in pairs(generator.burner.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif generator.fluid_box then
        if generator.fluid_box.filter ~= nil then
            if generator.fluid_box.filter == 'steam' then
                return nil
            end
            return {{name=generator.fluid_box.filter, type='fluid'}}
        end
    end

    if generator.burner then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(generator_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif generator.fluid_box then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(generator_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.update_description(generator_name)
    if not apm.lib.utils.generator.exist(generator_name) then return end
    local generator = data.raw['generator'][generator_name]

    local fuel_categories = apm.lib.utils.generator.get.fuel_categories(generator_name)
    if fuel_categories ~= nil then
    	apm.lib.utils.description.entities.setup(generator, fuel_categories)
    	--apm.lib.utils.description.entities.add_fuel_types(generator, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.set.next_upgrade(generator_name, next_upgrade)
    if not apm.lib.utils.generator.exist(generator_name) then return end
    local generator = data.raw.generator[generator_name]
    apm.lib.utils.entity.set.next_upgrade(generator, next_upgrade)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.overhaul(generator_name, level)
	if not apm.lib.utils.generator.exist(generator_name) then return end

    apm.lib.utils.icon.add_tier_lable(generator_name, level)

	local generator = data.raw.generator[generator_name]
	local base_maximum_temperature = 120
	local base_fluid_usage_per_tick = 0.5
	local base_effectivity = 0.9

	local new_maximum_temperature = base_maximum_temperature+((level-1)*150)
	local new_fluid_usage_per_tick = base_fluid_usage_per_tick-((level-1)*0.025)
	local new_effectivity = base_effectivity+((level-1)*0.01)

	generator.maximum_temperature = new_maximum_temperature
	generator.fluid_usage_per_tick = new_fluid_usage_per_tick
	generator.effectivity = new_effectivity
	APM_LOG_INFO(self, 'overhaul()', 'generator with name: "' .. tostring(generator_name) .. '" changed')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.generator.set.hidden(generator_name)
    if not apm.lib.utils.generator.exist(generator_name) then return end
    local generator = data.raw.generator[generator_name]
    apm.lib.utils.entity.add.flag(generator, 'hidden')
end