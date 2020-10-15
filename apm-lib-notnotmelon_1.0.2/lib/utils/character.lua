require 'util'
require('lib.log')

local self = 'lib.utils.character'

if not apm.lib.utils.character.crafting_category then apm.lib.utils.character.crafting_category = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.character.crafting_category.add(name, crafting_category)
	for k, _ in pairs(data.raw) do log(k) end
    if data.raw.character[name] ~= nil then
        table.insert(data.raw.character[name].crafting_categories, crafting_category)
    end
    APM_LOG_INFO(self, 'crafting_category.add()', 'added crafting category: "' .. tostring(crafting_category) .. '" to player.')
end
