require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/overwrites.lua'

APM_LOG_HEADER(self)

-- ----------------------------------------------------------------------------------------------------------
-- This block should make this mod more compatible with other by setting the basic fuel categories for burners
-- apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition(entity_type, conditional_category, t_categories)
-- ----------------------------------------------------------------------------------------------------------
APM_LOG_INFO(self, '', 'BEGIN: basic overwrites of the fuel categories')

for reactor_name, _ in pairs(data.raw.reactor) do
    apm.lib.utils.reactor.overhaul(reactor_name)
end

APM_LOG_INFO(self, '', 'END: basic overwrites of the fuel categories')

-- add electric-smelting category to electric-furnace
apm.lib.utils.furnace.mod.category.add('electric-furnace', 'apm_electric_smelting')

apm.lib.utils.lab.add.science_pack('lab', 'apm_nuclear_science_pack')
