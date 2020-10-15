require 'util'
require('lib.log')

local self = 'lib.utils.entity'

if apm.lib.utils.entity.has == nil then apm.lib.utils.entity.has = {} end
if apm.lib.utils.entity.get == nil then apm.lib.utils.entity.get = {} end
if apm.lib.utils.entity.add == nil then apm.lib.utils.entity.add = {} end
if apm.lib.utils.entity.del == nil then apm.lib.utils.entity.del = {} end
if apm.lib.utils.entity.set == nil then apm.lib.utils.entity.set = {} end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.has.fuel_category(entity, category)
    if entity.burner then
        if entity.burner.fuel_category and entity.burner.fuel_category == category then return true end
        if entity.burner.fuel_categories then
            for i = 1, #entity.burner.fuel_categories do
                if entity.burner.fuel_categories[i] == category then return true end
            end
        end
        if entity.burner.fuel_category == nil and entity.burner.fuel_categories == nil and category == 'chemical' then
            return true
        end
    elseif entity.energy_source and entity.energy_source.type == 'burner' then
        if entity.energy_source.fuel_category and entity.energy_source.fuel_category == category then return true end
        if entity.energy_source.fuel_categories then
            for i = 1, #entity.energy_source.fuel_categories do
                if entity.energy_source.fuel_categories[i] == category then return true end
            end
        end
        if entity.energy_source.fuel_category == nil and entity.energy_source.fuel_categories == nil and category == 'chemical' then
            return true
        end
    else
        APM_LOG_WARN(self, 'has.fuel_categories()', 'entity: "' ..tostring(entity.name).. '" does not have a fuel_category')
    end
    return false
end

-- Function -------------------------------------------------------------------
--
-- return table or nil
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.get.fuel_categories(entity)
    if entity.burner then
        if not entity.burner.fuel_category and not entity.burner.fuel_categories then
            return {'chemical'}
        end
        if entity.burner.fuel_category then
            return {entity.burner.fuel_category}
        end
        if entity.burner.fuel_categories then
            return {entity.burner.fuel_categories}
        end
    elseif entity.energy_source and entity.energy_source.type == 'burner' then
        if not entity.energy_source.fuel_category and not entity.energy_source.fuel_categories then
            return {'chemical'}
        end
        if entity.energy_source.fuel_category then
            return {entity.energy_source.fuel_category}
        end
        if entity.energy_source.fuel_categories then
            return {entity.energy_source.fuel_categories}
        end
    else
        APM_LOG_WARN(self, 'get.fuel_categories()', 'entity: "' ..tostring(entity.name).. '" does not have a fuel_category')
    end
    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.add.fuel_category(entity, category)
    if apm.lib.utils.entity.has.fuel_category(entity, category) then return end

    if entity.burner then
        if not entity.burner.fuel_category and not entity.burner.fuel_categories then
            entity.burner.fuel_categories = {'chemical'}
        end
        if entity.burner.fuel_category then
            entity.burner.fuel_categories = {}
            table.insert(entity.burner.fuel_categories, entity.burner.fuel_category)
            entity.burner.fuel_category = nil
        end
        if entity.burner.fuel_categories then
            table.insert(entity.burner.fuel_categories, category)
            APM_LOG_INFO(self, 'add.fuel_category()', 'added: "' ..tostring(category).. '" to entity: "' ..tostring(entity.name).. '"')
        end
    elseif entity.energy_source and entity.energy_source.type == 'burner' then
        if not entity.energy_source.fuel_category and not entity.energy_source.fuel_categories then
            entity.energy_source.fuel_categories = {'chemical'}
        end
        if entity.energy_source.fuel_category then
            entity.energy_source.fuel_categories = {}
            table.insert(entity.energy_source.fuel_categories, entity.energy_source.fuel_category)
            entity.energy_source.fuel_category = nil
        end
        if entity.energy_source.fuel_categories then
            table.insert(entity.energy_source.fuel_categories, category)
            APM_LOG_INFO(self, 'add.fuel_category()', 'added: "' ..tostring(category).. '" to entity: "' ..tostring(entity.name).. '"')
        end
    else
        APM_LOG_WARN(self, 'add.fuel_category()', 'entity: "' ..tostring(entity.name).. '" does not have a burner energy source')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.del.fuel_category(entity, category)
    if not apm.lib.utils.entity.has.fuel_category(entity, category) then return end

    local fc = apm.lib.utils.entity.get.fuel_categories(entity)
    if type(fc) == 'table' then
        for k, v in pairs(fc) do
            if v == category then
                table.remove(fc, k)
            end
        end
    else
        fc = {}
    end

    if entity.burner then
        if not entity.burner.fuel_category and not entity.burner.fuel_categories then
            entity.burner.fuel_categories = fc
        end
        if entity.burner.fuel_category then
            entity.burner.fuel_categories = {}
            entity.burner.fuel_category = nil
        end
        if entity.burner.fuel_categories then
            entity.burner.fuel_categories = fc
            APM_LOG_INFO(self, 'del.fuel_category()', 'deleted: "' ..tostring(category).. '" from entity: "' ..tostring(entity.name).. '"')
        end
    elseif entity.energy_source and entity.energy_source.type == 'burner' then
        if not entity.energy_source.fuel_category and not entity.energy_source.fuel_categories then
            entity.energy_source.fuel_categories = fc
        end
        if entity.energy_source.fuel_category then
            entity.energy_source.fuel_categories = {}
            entity.energy_source.fuel_category = nil
        end
        if entity.energy_source.fuel_categories then
            entity.energy_source.fuel_categories = fc
            APM_LOG_INFO(self, 'add.fuel_category()', 'deleted: "' ..tostring(category).. '" from entity: "' ..tostring(entity.name).. '"')
        end
    else
        APM_LOG_WARN(self, 'add.fuel_category()', 'entity: "' ..tostring(entity.name).. '" does not have a burner energy source')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_if_an_entity_exists(next_upgrade)
    local prototypes = {'assembling-machine', 'boiler', 'inserter', 'lab', 'locomotive', 'mining-drill',
                        'reactor', 'ammo-turret', 'car', 'generator'}
    for _, prototype in pairs(prototypes) do
        local entity = data.raw[prototype][next_upgrade]
        if entity and entity.name == next_upgrade then
            return true
        end
    end
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.set.next_upgrade(entity, next_upgrade)
    if check_if_an_entity_exists(next_upgrade) then
        entity.next_upgrade = next_upgrade
        APM_LOG_INFO(self, 'next_upgrade()', 'for entity: "' ..tostring(entity.name).. '" set to entity: "' ..tostring(next_upgrade).. '"')
        return
    end
    entity.next_upgrade = nil
    APM_LOG_WARN(self, 'next_upgrade()', 'for entity: "' ..tostring(entity.name).. '" but entity: "' ..tostring(next_upgrade).. '" does not exist, set to "nil"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.set.fuel_category(entity, categories)
    if entity.burner then
        if entity.burner.fuel_category then entity.burner.fuel_category = nil end
        entity.burner.fuel_categories = {}
    elseif entity.energy_source and entity.energy_source.type == 'burner' then
        if entity.energy_source.fuel_category then entity.energy_source.fuel_category = nil end
        entity.energy_source.fuel_categories = {}
    else
        APM_LOG_WARN(self, 'set.fuel_category()', 'entity: "' ..tostring(entity.name).. '" its energy_source type does not have a fuel_category')
        return
    end

    if type(categories) == 'table' then
        for i=1, #categories do
            apm.lib.utils.entity.add.fuel_category(entity, categories[i])
        end
    elseif type(categories) == 'string' then
        apm.lib.utils.entity.add.fuel_category(entity, categories)
    end

    APM_LOG_WARN(self, 'set.fuel_category()', 'set fuel_categories for : "' .. tostring(entity.name) .. '"')
    APM_LOG_WARN(self, 'set.fuel_category()', 'Note: please be carfuel with this function, it can break compatibillity with other mods!')
    APM_LOG_WARN(self, 'set.fuel_category()', '---------------------------------')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.has.crafting_category(entity, category)
    if not entity.crafting_categories then return false end

    for c in pairs(entity.crafting_categories) do
        if c == category then
            return true
        end
    end

    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.add.crafting_category(entity, category)
    if not apm.lib.utils.entity.has.crafting_category(entity, category) then
        table.insert(entity.crafting_categories, category)
        APM_LOG_INFO(self, 'add.crafting_category()', 'added: "' .. tostring(category) .. '" to "' .. tostring(entity.name) .. '"')
    else
        APM_LOG_WARN(self, 'add.crafting_category()', 'entity: "' .. tostring(entity.name) .. '" allready has crafting_categories: "' .. tostring(category) .. '"')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.entity.has.flag(entity, flag)
    if type(entity.flags) == 'table' then
        for i = 0, #entity.flags do
            if entity.flags[i] == flag then
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
function apm.lib.utils.entity.add.flag(entity, flag)
    if type(entity.flags) == 'table' then
        if not apm.lib.utils.entity.has.flag(entity, flag) then
            table.insert(entity.flags, flag)
            APM_LOG_INFO(self, 'add.flag()', 'added: "' .. tostring(flag) .. '" to "' .. tostring(entity.name) .. '"')
        else
            APM_LOG_WARN(self, 'add.flag()', 'entity: "' .. tostring(entity.name) .. '" allready has flag: "' .. tostring(flag) .. '"')
        end
    else
        entity.flags = {flag}
        APM_LOG_INFO(self, 'add.flag()', 'added: "' .. tostring(flag) .. '" to "' .. tostring(entity.name) .. '"')
    end
end
