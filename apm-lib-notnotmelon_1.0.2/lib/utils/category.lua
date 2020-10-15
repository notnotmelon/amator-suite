require 'util'
require('lib.log')

local self = 'lib.utils.category'

if not apm.lib.utils.category.create then apm.lib.utils.category.create = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.category.create.group(name, icon, order)
    name = tostring(name)
    icon = tostring(icon)
    order = tostring(order)
    local new = {}
    new.type = 'item-group'
    new.name = name
    new.icon = icon
    new.icon_size = 64
    new.order = order
    new.inventory_order = order
    data:extend({new})
    APM_LOG_INFO(self, 'create.group()', 'new category group created: "' .. tostring(name) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.category.create.subgroup(group, subgroup, order)
    group = tostring(group)
    subgroup = tostring(subgroup)
    order = tostring(order)
    local new = {}
    
    if data.raw['item-group'][group] == nil then
        return
    end
    
    new.type = 'item-subgroup'
    new.name = subgroup
    new.group = group
    new.order = order
    data:extend({new})
    APM_LOG_INFO(self, 'create.group()', 'new subgroup created: "' .. tostring(subgroup) .. '" in group: "' .. tostring(group) .. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.category.change(group, subgroup, new_group, new_subgroup)
    local prototypes = {'item', 'fluid', 'recipe', 'tool'}
    for _, prototype in pairs(prototypes) do
        local object = data.raw[prototype][prototype]
        if object ~= nil then
            if object.group == group and object.subgroup == subgroup then
                object.group = new_group
                object.subgroup = new_subgroup
                APM_LOG_INFO(self, 'change()', 'for "' .. tostring(prototype) .. '": "' .. tostring(object.name) .. '": group:"' .. tostring(group) .. '" -> "' .. tostring(new_group) .. '", subgroup:"' .. tostring(subgroup) .. '" -> "' .. tostring(new_subgroup) .. '"')
            end
        end
    end
end
