require 'util'
require('lib.log')

local self = 'lib.utils.technology'

if not apm.lib.utils.technology.find then apm.lib.utils.technology.find = {} end
if not apm.lib.utils.technology.add then apm.lib.utils.technology.add = {} end
if not apm.lib.utils.technology.mod then apm.lib.utils.technology.mod = {} end
if not apm.lib.utils.technology.remove then apm.lib.utils.technology.remove = {} end
if not apm.lib.utils.technology.get then apm.lib.utils.technology.get = {} end
if not apm.lib.utils.technology.has then apm.lib.utils.technology.has = {} end
if not apm.lib.utils.technology.prerequisite then apm.lib.utils.technology.prerequisite = {} end
if not apm.lib.utils.technology.prerequisite.has then apm.lib.utils.technology.prerequisite.has = {} end
if not apm.lib.utils.technology.set then apm.lib.utils.technology.set = {} end
if not apm.lib.utils.technology.force then apm.lib.utils.technology.force = {} end
if not apm.lib.utils.technology.overwrite then apm.lib.utils.technology.overwrite = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.exist(technology_name)
    if data.raw.technology[technology_name] then
        return true
    end
    APM_LOG_WARN(self, 'exist()', 'Warning: technology with name: "' .. tostring(technology_name) .. '" dosent exist.')
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.has.prerequisites(technology_name, prerequisites_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]

    if technology.prerequisites then
        for _, prerequisite in pairs(technology.prerequisites) do
            if prerequisite == prerequisites_name then
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
function apm.lib.utils.technology.get.prerequisites(technology_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    
    local technology = data.raw.technology[technology_name]
    if technology.prerequisites then
        return technology.prerequisites
    end
    return {}
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.has.science_pack(technology_name, science_pack_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]

    if not technology.unit then return false end
    if not technology.unit.ingredients then return false end

    for _, ingredient in pairs(technology.unit.ingredients) do
        if ingredient[1] == science_pack_name then
            return true
        end
    end

    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.prerequisite.has.science_pack(technology_name, science_pack_name)
    local prerequisites = apm.lib.utils.technology.get.prerequisites(technology_name)
    for _, prerequisite in pairs(prerequisites) do
        if apm.lib.utils.technology.has.science_pack(prerequisite, science_pack_name) then
            return true
        end
    end
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.find.technology_by_recipe(recipe_name)
    for technology_name, _ in pairs(data.raw.technology) do
        if apm.lib.utils.technology.check_if_recipe_is_in_unlock(technology_name, recipe_name) then
            return technology_name
        end
    end
    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.new(mod_name, technology, t_prerequisites, t_recipes, t_research_packs, i_research_count, i_research_time)
    new = {}
    new.type = 'technology'
    new.name = technology
    new.icon = '__apm_resource_pack__/graphics/technologies/' .. technology .. '.png'
    new.icon_size = 128
    new.effects = {}
    if t_recipes ~= nil then
        for _, name in pairs(t_recipes) do
            table.insert(new.effects, {type = 'unlock-recipe', recipe = name})
        end
    end
    new.prerequisites = t_prerequisites
    new.unit = {}
    new.unit.count = i_research_count
    new.unit.ingredients = t_research_packs
    new.unit.time = i_research_time
    new.order = 'a-a-a'
    data:extend({new})

    APM_LOG_INFO(self, 'new()', 'create new technology: "' .. tostring(new.name) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.mod.unit_time(technology_name, time)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    technology.unit.time = time
    APM_LOG_INFO(self, 'mod.unit_time()', 'for: "' .. tostring(technology_name) .. '" set unit_time to: "' .. tostring(time) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.mod.unit_count(technology_name, count)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    technology.unit.count = count
    APM_LOG_INFO(self, 'mod.unit_count()', 'for: "' .. tostring(technology_name) .. '" set unit_count to: "' .. tostring(order) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.mod.order(technology_name, order)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    technology.order = order
    APM_LOG_INFO(self, 'mod.order()', 'for: "' .. tostring(technology_name) .. '" set order: "' .. tostring(order) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.mod.icon(technology_name, icon)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    technology.icon = icon
    APM_LOG_INFO(self, 'mod.icon()', 'for: "' .. tostring(technology_name) .. '" set icon: "' .. tostring(icon) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.add.science_pack(technology_name, science_pack, science_amount)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    if not science_amount then
        science_amount = 1
    end

    if apm.lib.utils.technology.has.science_pack(technology_name, science_pack) then
        APM_LOG_WARN(self, 'add.science_pack()', 'technology: "' .. tostring(technology_name) .. '" allready has science_pack: "' .. tostring(science_pack) .. '"')
        return
    end

    local technology = data.raw.technology[technology_name]
    table.insert(technology.unit.ingredients, {science_pack, science_amount})
    APM_LOG_INFO(self, 'add.science_pack()', 'science_pack: "' .. tostring(science_pack) .. '" added to: "' .. tostring(technology_name) .. '" with amount: "' .. tostring(science_amount) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.check_if_recipe_is_in_unlock(technology_name, recipe_name)
    if not apm.lib.utils.technology.exist(technology_name) then return false end
    if not apm.lib.utils.recipe.exist(recipe_name) then return false end

    local technology = data.raw.technology[technology_name]
    if technology.effects then
        for _, entry in pairs(technology.effects) do
            if entry.type == 'unlock-recipe' and entry.recipe == recipe_name then
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
function apm.lib.utils.technology.add.recipe_for_unlock(technology_name, recipe_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    if not apm.lib.utils.recipe.exist(recipe_name) then return end

    local technology = data.raw.technology[technology_name]
    
    if apm.lib.utils.technology.check_if_recipe_is_in_unlock(technology_name, recipe_name) then
        APM_LOG_WARN(self, 'add.recipe_for_unlock()', 'recipe: "' .. tostring(recipe_name) .. '" is allready in effects for unlock in "' .. tostring(technology_name) .. '"')
        return
    end

    if technology and technology.effects then
        table.insert(technology.effects, {type = 'unlock-recipe', recipe = recipe_name})
        APM_LOG_INFO(self, 'add.recipe_for_unlock()', 'added recipe: "' .. tostring(recipe_name) .. '" to "' .. tostring(technology_name) .. '" for unlock')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.add.prerequisites(technology_name, prerequisites_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    if not apm.lib.utils.technology.exist(prerequisites_name) then return end

    local technology = data.raw.technology[technology_name]
    
    if technology.prerequisites == nil then
        technology.prerequisites = {}
    end
    
    if not apm.lib.utils.technology.has.prerequisites(technology_name, prerequisites_name) then
        table.insert(technology.prerequisites, prerequisites_name)
        APM_LOG_INFO(self, 'add.prerequisites()', 'added: "' .. tostring(prerequisites_name) .. '" to "' .. tostring(technology_name) .. '"')
    else
        APM_LOG_WARN(self, 'add.prerequisites()', '"' .. tostring(technology_name) .. '" allready has "' .. tostring(prerequisites_name) .. '" as prerequisites')
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.remove.recipe_from_unlock(technology_name, recipe_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    if not apm.lib.utils.recipe.exist(recipe_name) then return end

    local technology = data.raw.technology[technology_name]

    if not apm.lib.utils.technology.check_if_recipe_is_in_unlock(technology_name, recipe_name) then
        APM_LOG_WARN(self, 'remove.recipe_from_unlock()', 'recipe: "' .. tostring(recipe_name) .. '" is not in effects for unlock at: "' .. tostring(technology_name) .. '"')
        return
    end
        
    if technology and technology.effects then
        for k, r in pairs(technology.effects) do
            if r.recipe == recipe_name then
                table.remove(technology.effects, k)
                APM_LOG_INFO(self, 'remove.recipe_from_unlock()', 'removed recipe: "' .. tostring(recipe_name) .. '" in "' .. tostring(technology_name) .. '" for unlock')
                return
            end
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.remove.science_pack(technology_name, science_pack)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    for k, i in pairs(technology.unit.ingredients) do
        if i[1] == science_pack then
            table.remove(technology.unit.ingredients, k)
            return
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.remove.prerequisites(technology_name, prerequisites_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    if not apm.lib.utils.technology.exist(prerequisites_name) then return end

    local technology = data.raw.technology[technology_name]
    if not technology.prerequisites then return end

    for k, prerequisite in pairs(technology.prerequisites) do
        if prerequisite == prerequisites_name then
            table.remove(technology.prerequisites, k)
            APM_LOG_INFO(self, 'remove.prerequisites()', 'removed prerequisites: "' .. tostring(prerequisites_name) .. '" from technology: "' .. tostring(technology_name) .. '"')
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.disable(technology_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    technology.enabled = false
    APM_LOG_INFO(self, 'disable()', 'set: enabled = false for:"' .. tostring(technology_name) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.delete(technology_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    local technology = data.raw.technology[technology_name]

    APM_LOG_INFO(self, 'delete()', 'technology: "' .. tostring(technology_name) .. '"')
    technology.enabled = false
    --technology.hidden = true

    -- let us find who is linked to this technology and remove the prerequisites
    for technology, _ in pairs(data.raw.technology) do
        if technology ~= technology_name then
            if apm.lib.utils.technology.has.prerequisites(technology, technology_name) then
                apm.lib.utils.technology.remove.prerequisites(technology, technology_name)
            end
        end
    end
end

-- Function -------------------------------------------------------------------
-- recipe_name: string of recipe name
-- tech_name: string of ignored technology
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.remove.recipe_recursive(recipe_name, tech_name)
    if not apm.lib.utils.recipe.exist(recipe_name) then return end
    
    local technologies = data.raw.technology
    for technology_name, _ in pairs(technologies) do
        if technology_name ~= tech_name then
            if technologies[technology_name].effects ~= nil then
                for i, effect in pairs(technologies[technology_name].effects) do
                    if effect.type == 'unlock-recipe' and effect.recipe == recipe_name then
                        table.remove(data.raw.technology[technology_name].effects,i)
                    end
                end
            end
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.add.science_pak_conditional(science_pack_name, cond_science_pack_name)
    for _, technology in pairs(data.raw.technology) do
        if apm.lib.utils.technology.has.science_pack(technology.name, cond_science_pack_name) then
            apm.lib.utils.technology.add.science_pack(technology.name, science_pack_name)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.set.heritage_science_packs_from_prerequisites(technology_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local technology = data.raw.technology[technology_name]
    local collected_science = {}
    local hash = {}

    if not technology.prerequisites then
        APM_LOG_WARN(self, 'set.science_packs_from_prerequisites()', 'prerequisite: "' .. tostring(technology_name.name) .. '"does not have a prerequisites property')
        return
    end

    for _, prerequisite in pairs(technology.prerequisites) do
        local required_technology = data.raw.technology[prerequisite]
        if required_technology then
            if required_technology.unit then
                for _, science in pairs(required_technology.unit.ingredients) do
                    table.insert(collected_science, science[1])
                end
            else
                APM_LOG_WARN(self, 'set.science_packs_from_prerequisites()', 'prerequisite: "' .. tostring(required_technology.name) .. '"does not have an unit property')
            end
        end
    end

    if not collected_science then 
        APM_LOG_WARN(self, 'set.science_packs_from_prerequisites()', 'No inheritance possible for: "' .. tostring(technology_name) .. '"!')
        return 
    end

    for _, science_pack in pairs(collected_science) do
        if not hash[science_pack] then
            if not technology.unit then
                technology.unit = {}
                technology.unit.ingredients = {}
                technology.count = 50
                technology.time = 50
            end
            apm.lib.utils.technology.add.science_pack(technology_name, science_pack, 1)
            hash[science_pack] = true
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.overwrite.localised_name(technology_name, localised_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    local technology = data.raw.technology[technology_name]

    technology.localised_name = localised_name
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.overwrite.localised_description(technology_name, localised_description)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    local technology = data.raw.technology[technology_name]

    technology.localised_description = localised_description
end

-- Function -------------------------------------------------------------------
-- This function forces the unlocking of a recipe with a specific technology. 
-- The recipe is removed from any other technology and deactivated.
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.force.recipe_for_unlock(technology_name, recipe_name)
    if not apm.lib.utils.technology.exist(technology_name) then return end
    if not apm.lib.utils.recipe.exist(recipe_name) then return end

    apm.lib.utils.technology.remove.recipe_recursive(recipe_name, technology_name)
    apm.lib.utils.technology.add.recipe_for_unlock(technology_name, recipe_name)
    apm.lib.utils.recipe.disable(recipe_name)
end

-- Function -------------------------------------------------------------------
-- This function forces the prerequisites of a technologie.
-- prerequisites_names: table{string, string, ...} or string.
-- ----------------------------------------------------------------------------
function apm.lib.utils.technology.force.prerequisites(technology_name, prerequisites_names)
    if not apm.lib.utils.technology.exist(technology_name) then return end

    local prerequisites = apm.lib.utils.technology.get.prerequisites(technology_name)
    for i = #prerequisites, 1, -1 do
        p_tech_name = prerequisites[i]
        apm.lib.utils.technology.remove.prerequisites(technology_name, p_tech_name)
    end

    if prerequisites_names == nil then return end
    if type(prerequisites_names) == 'table' then
        for _, p_tech_name in pairs(prerequisites_names) do
            apm.lib.utils.technology.add.prerequisites(technology_name, p_tech_name)
        end
    elseif type(prerequisites_names) == 'string' then
        apm.lib.utils.technology.add.prerequisites(technology_name, prerequisites_names)
    end
end