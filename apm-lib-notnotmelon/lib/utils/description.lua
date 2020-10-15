require 'util'
require('lib.log')

local self = 'lib.utils.description'

if not apm.lib.utils.description.entities then apm.lib.utils.description.entities = {} end
if not apm.lib.utils.description.entities.exclude_list then apm.lib.utils.description.entities.exclude_list = {} end
if not apm.lib.utils.description.entities.exclude_list.table then apm.lib.utils.description.entities.exclude_list.table = {} end
if not apm.lib.utils.description.entities.setup_list then apm.lib.utils.description.entities.setup_list = {} end
if not apm.lib.utils.description.entities.org_localised_description then apm.lib.utils.description.entities.org_localised_description = {} end

if not apm.lib.utils.description.item then apm.lib.utils.description.item = {} end
if not apm.lib.utils.description.item.fuel then apm.lib.utils.description.item.fuel = {} end
if not apm.lib.utils.description.item.nuclear_fuel then apm.lib.utils.description.item.nuclear_fuel = {} end
if not apm.lib.utils.description.item.fuel.setup_list then apm.lib.utils.description.item.fuel.setup_list = {} end
if not apm.lib.utils.description.item.fuel.org_localised_description then apm.lib.utils.description.item.fuel.org_localised_description = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.exclude_list.add(entity_name)
    apm.lib.utils.description.entities.exclude_list.table[entity_name] = true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.exclude_list.remove(entity_name)
    apm.lib.utils.description.entities.exclude_list.table[entity_name] = nil
end

-- Local ----------------------------------------------------------------------
-- 
--
-- ----------------------------------------------------------------------------
local nuclear_fuel_types = {
    ['apm_nuclear_uranium'] = true,
    ['apm_nuclear_mox'] = true,
    ['apm_nuclear_neptunium'] = true,
    ['apm_nuclear_thorium'] = true,
    ['apm_nuclear_deuterium'] = true,
    ['antimatter'] = true
}

-- Function -------------------------------------------------------------------
-- entry_list = {{entry.name=x, entry.type=x},{entry.name=x, entry.type=x}}
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.add_fuel_types(entity, entry_list)
    for _, entry in pairs(entry_list) do
        if entry.type == 'fuel-category' then
            APM_LOG_INFO(self, 'entities.add_fuel_types()', tostring(entity.name) .. " -> " .. tostring(entry.type) .. " : " .. tostring(entry.name))

            table.insert(entity.localised_description, {"apm_info_fuel_type", "\n", {tostring(entry.type) .. "-name." .. tostring(entry.name)}})
            if entry.name == 'apm_electrical' then
                table.insert(entity.localised_description, {"apm_info_fuel_charge", " "})
            elseif entry.name == 'apm_vehicle_only' then
                table.insert(entity.localised_description, {"apm_info_fuel_vehicle", " "})
            elseif entry.name == 'apm_rocket' then
                table.insert(entity.localised_description, {"apm_info_fuel_rocket", " "})
            elseif nuclear_fuel_types[entry.name] then
                table.insert(entity.localised_description, {"apm_info_fuel_nuclear", " "})
            else
                table.insert(entity.localised_description, {"apm_info_fuel_fuel", " "})
            end
        elseif entry.type == 'fluid' then
            table.insert(entity.localised_description, {"apm_info_fuel_type", "\n", {tostring(entry.type) .. "-name." .. tostring(entry.name)}})
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.initial(entity)
    APM_LOG_INFO(self, 'entities.initial()', tostring(entity.name))
    if not apm.lib.utils.description.entities.setup_list[entity.name] then
        if type(entity.localised_description) == 'table' then
            apm.lib.utils.description.entities.org_localised_description[entity.name] = {"", table.deepcopy(entity.localised_description)}
            table.insert(entity.localised_description, "\n")
            table.insert(entity.localised_description, {"apm_info_fuel_types"})
        else
            entity.localised_description = {"", {"apm_info_fuel_types"}}
        end
        apm.lib.utils.description.entities.setup_list[entity.name] = true
    else
        if apm.lib.utils.description.entities.org_localised_description[entity.name] ~= nil then
            entity.localised_description = {"", table.deepcopy(apm.lib.utils.description.entities.org_localised_description[entity.name])}
            table.insert(entity.localised_description, "\n")
            table.insert(entity.localised_description, {"apm_info_fuel_types"})            
        else
            entity.localised_description = {"", {"apm_info_fuel_types"}}
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.setup(entity, entry_list)
    APM_LOG_INFO(self, 'entities.setup()', tostring(entity.name))
    if entry_list == nil  or type(entry_list) ~= 'table' then
        log("Error: apm.lib.utils.description.entities.setup(): attribute: entry_list is nil for entity: " .. tostring(entity.name))
        return
    end

    -- we only need this for two ore more entries...
    if #entry_list > 1 then
        apm.lib.utils.description.entities.initial(entity)
        apm.lib.utils.description.entities.add_fuel_types(entity, entry_list)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.description.entities.update()
    local prototypes = {'assembling-machine', 'furnace', 'inserter', 'lab', 'mining-drill', 'reactor', 'boiler',
                        'generator', 'car', 'locomotive', 'pump', 'generator-equipment'}
    for _, prototype in pairs(prototypes) do
        for entity_name, _ in pairs(data.raw[prototype]) do
            if not apm.lib.utils.description.entities.exclude_list.table[entity_name] then
                if prototype == 'assembling-machine' then
                    apm.lib.utils.assembler.update_description(entity_name)
                elseif prototype == 'furnace' then
                    apm.lib.utils.furnace.update_description(entity_name)
                elseif prototype == 'inserter' then
                    apm.lib.utils.inserter.update_description(entity_name)
                elseif prototype == 'lab' then
                    apm.lib.utils.lab.update_description(entity_name)
                elseif prototype == 'mining-drill' then
                    apm.lib.utils.mining_drill.update_description(entity_name)
                elseif prototype == 'reactor' then
                    apm.lib.utils.reactor.update_description(entity_name)
                elseif prototype == 'boiler' then
                    apm.lib.utils.boiler.update_description(entity_name)
                elseif prototype == 'generator' then
                    apm.lib.utils.generator.update_description(entity_name)
                elseif prototype == 'car' then
                    apm.lib.utils.car.update_description(entity_name)
                elseif prototype == 'locomotive' then
                    apm.lib.utils.locomotive.update_description(entity_name)
                elseif prototype == 'pump' then
                    apm.lib.utils.pump.update_description(entity_name)
                elseif prototype == 'generator-equipment' then
                    apm.lib.utils.equipment.update_description(entity_name)
                end
            end
        end
    end
end
