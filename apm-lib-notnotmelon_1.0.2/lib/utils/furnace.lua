require 'util'
require('lib.log')

local self = 'lib.utils.furnace'

if apm.lib.utils.furnace.mod == nil then apm.lib.utils.furnace.mod = {} end
if apm.lib.utils.furnace.mod.category == nil then apm.lib.utils.furnace.mod.category = {} end
if apm.lib.utils.furnace.get == nil then apm.lib.utils.furnace.get = {} end
if apm.lib.utils.furnace.set == nil then apm.lib.utils.furnace.set = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.exist(furnace_name)
	if data.raw.furnace[furnace_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'furnace with name: "' .. tostring(furnace_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.mod.category.add(furnace_name, category)
    if not apm.lib.utils.furnace.exist(furnace_name) then return end

    local furnace = data.raw['furnace'][furnace_name]
    apm.lib.utils.entity.add.crafting_category(furnace, category)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.get.fuel_categories(furnace_name)
    if not apm.lib.utils.furnace.exist(furnace_name) then return nil end

    local furnace = data.raw['furnace'][furnace_name]
    if not furnace.energy_source then return nil end

    if furnace.energy_source.type == 'burner' then
        if furnace.energy_source.fuel_category then
            return {{name=furnace.energy_source.fuel_category, type='fuel-category'}}
        elseif furnace.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(furnace.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end
        
    elseif furnace.energy_source.type == 'fluid' then
        if furnace.energy_source.fluid_box.filter ~= nil then
            return {{name=furnace.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if furnace.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(furnace_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif furnace.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(furnace_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.update_description(furnace_name)
    if not apm.lib.utils.furnace.exist(furnace_name) then return end
    local furnace = data.raw['furnace'][furnace_name]

    if not furnace.energy_source then return end
    local fuel_categories = apm.lib.utils.furnace.get.fuel_categories(furnace_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(furnace, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(furnace, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.overhaul(furnace_name, level, only_refined)
	if not apm.lib.utils.furnace.exist(furnace_name) then return end

	local furnace = data.raw.furnace[furnace_name]
	if furnace.energy_source.type == 'burner' then
		furnace.energy_source.burnt_inventory_size = 1
		furnace.energy_source.fuel_category = nil
		if only_refined then
            apm.lib.utils.entity.set.fuel_category(furnace, 'apm_refined_chemical')
		else
            apm.lib.utils.entity.set.fuel_category(furnace, {'chemical', 'apm_refined_chemical'})
		end
		APM_LOG_INFO(self, 'overhaul()', 'furnace with name: "' .. tostring(furnace_name) .. '" changed')
		return
	end
	APM_LOG_WARN(self, 'overhaul()', 'furnace with name: "' .. tostring(furnace_name) .. '" dosent have energy_source.type == "burner"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.furnace.set.hidden(furnace_name)
    if not apm.lib.utils.furnace.exist(furnace_name) then return end
    local furnace = data.raw.furnace[furnace_name]
    apm.lib.utils.entity.add.flag(furnace, 'hidden')
end
