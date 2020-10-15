require 'util'
require('lib.log')

local self = 'lib.utils.builder'

if not apm.lib.utils.builder.recipe then apm.lib.utils.builder.recipe = {} end
if not apm.lib.utils.builder.recipe.item then apm.lib.utils.builder.recipe.item = {} end
if not apm.lib.utils.builder.recipe.item.alternatives then apm.lib.utils.builder.recipe.item.alternatives = {} end
if not apm.lib.utils.builder.recipe.item.alternatives.table then apm.lib.utils.builder.recipe.item.alternatives.table = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.alternatives.add(name, alternative, weighting, item_multi)
    if weighting == nil then
        weighting = 1
    end
    
    if not apm.lib.utils.builder.recipe.item.alternatives.table[name] then
        apm.lib.utils.builder.recipe.item.alternatives.table[name] = {}
    end
    table.insert(apm.lib.utils.builder.recipe.item.alternatives.table[name], {name=alternative, weighting=weighting, item_multi=item_multi})

    APM_LOG_INFO(self, 'recipe.item.alternatives.add()', 'add alternative: "' .. tostring(alternative) .. '" for item/fluid with name: "' .. tostring(name) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.alternatives.get(name, weight_min, weight_max)
    APM_LOG_INFO(self, 'recipe.item.alternatives.get()', 'search alternatives for name: "' .. tostring(name) .. '"')

    local item_name
    local item_type
    local item_multi
    local weighting = 0

    if weight_min == nil then
        weight_min = 0
    end
    if weight_max == nil then
        weight_max = 10000
    end

    for _, alternatives in pairs(apm.lib.utils.builder.recipe.item.alternatives.table[name]) do
        if apm.lib.utils.item.exist(alternatives.name) then
            if alternatives.weighting > weighting and alternatives.weighting >= weight_min and alternatives.weighting <= weight_max then
                item_name = alternatives.name
                item_type = apm.lib.utils.item.get_type(item_name, true)
                item_multi = alternatives.item_multi
                weighting = alternatives.weighting
            end
        end
    end

    return {name=item_name, type=item_type, item_multi=item_multi}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.name(name, weight_min, weight_max)
    local alternative = apm.lib.utils.builder.recipe.item.alternatives.get(name, weight_min, weight_max)
    return alternative.name
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.type(name, weight_min, weight_max)
    local alternative = apm.lib.utils.builder.recipe.item.alternatives.get(name, weight_min, weight_max)
    return alternative.type
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.simple(name, amount, weight_min, weight_max, fluid_multi)
    return {type='simple', name=name, amount=amount, weight_min=weight_min, weight_max=weight_max, fluid_multi=fluid_multi}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.item.probability(name, amount_min, amount_max, probability, weight_min, weight_max, fluid_multi)
    return {type='probability', name=name, amount_min=amount_min, amount_max=amount_max, probability=probability, weight_min=weight_min, weight_max=weight_max, fluid_multi=fluid_multi}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function simple_definiton(name, amount, weight_min, weight_max, fluid_multi)
    if fluid_multi == nil then fluid_multi = 1 end

    local alternative = apm.lib.utils.builder.recipe.item.alternatives.get(name, weight_min, weight_max)
    if not apm.lib.utils.item.exist(alternative.name) then
        return apm.lib.utils.item.dummy()
    end

    if alternative.type == 'fluid' then
        amount = amount * 10 * fluid_multi
    elseif alternative.item_multi then
        amount = amount * alternative.item_multi
    end
    return {type=alternative.type, name=alternative.name, amount=amount}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function probability_definiton(name, amount_min, amount_max, probability, weight_min, weight_max, fluid_multi)
    if fluid_multi == nil then fluid_multi = 1 end

    local alternative = apm.lib.utils.builder.recipe.item.alternatives.get(name, weight_min, weight_max)
    if not apm.lib.utils.item.exist(alternative.name) then
        return apm.lib.utils.item.dummy()
    end

    if alternative.type == 'fluid' then
        amount_min = amount_min * 10 * fluid_multi
        amount_max = amount_max * 10 * fluid_multi
    elseif alternative.item_multi then
        amount_min = amount_min * alternative.item_multi
        amount_max = amount_max * alternative.item_multi
    end

    return {type=alternative.type, name=alternative.name, amount_min=amount_min, amount_max=amount_max, probability=probability, weight_min=weight_min, weight_max=weight_max, fluid_multi=fluid_multi}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function try_replace(recipe, base, key, entry, parent)
    local idef = apm.lib.utils.item.dummy()

    if entry.type == 'simple' then
        idef = simple_definiton(entry.name, entry.amount, entry.weight_min, entry.weight_max, entry.fluid_multi)
        base[key] = idef
    end
    if entry.type == 'probability' then
        idef = probability_definiton(entry.name, entry.amount_min, entry.amount_max, entry.probability, entry.weight_min, entry.weight_max, entry.fluid_multi)
        base[key] = idef
    end

    if parent and parent.main_product ~= nil then
        if apm.lib.utils.builder.recipe.item.alternatives.table[parent.main_product] ~= nil then
            parent.main_product = idef.name
        end
    end
    APM_LOG_INFO(self, 'try_replace()', 'replace placeholder in: "' .. tostring(recipe.name) .. '": "' .. tostring(entry.name) .. '" -> "' .. tostring(idef.name) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function worker(recipe, base, main_product)
    for key, entry in pairs(base) do
        local placeholder = apm.lib.utils.builder.recipe.item.alternatives.table[entry.name]
        if placeholder ~= nil then
            try_replace(recipe, base, key, entry, main_product)
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function replace_placeholder(recipe)
    if recipe.ingredients then
        worker(recipe, recipe.ingredients)
    end

    if recipe.normal and recipe.normal.ingredients then
        worker(recipe, recipe.normal.ingredients)
    end

    if recipe.expensive and recipe.expensive.ingredients then
        worker(recipe, recipe.expensive.ingredients)
    end

    if recipe.results then
        worker(recipe, recipe.results, recipe)
    end

    if recipe.normal and recipe.normal.results then
        worker(recipe, recipe.normal.results, recipe.normal)
    end

    if recipe.expensive and recipe.expensive.results then
        worker(recipe, recipe.expensive.results, recipe.expensive)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.builder.recipe.update()
    for _, recipe in pairs(data.raw.recipe) do
        replace_placeholder(recipe)
    end
end
