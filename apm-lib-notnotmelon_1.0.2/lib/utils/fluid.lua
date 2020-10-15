require 'util'
require('lib.log')

local self = 'lib.utils.fluid'

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fluid.exist(fluid_name)
    if data.raw.fluid[fluid_name] then 
        return true
    end
    APM_LOG_WARN(self, 'exist()', 'fluid with name: "' .. tostring(fluid_name) .. '" dosent exist.')
    return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fluid.remove(fluid_name)
    if not apm.lib.utils.fluid.exist(fluid_name) then return end

    local fluid = data.raw.fluid[fluid_name]
    --fluid.flags = {'hidden', 'hide-from-bonus-gui', 'hide-from-fuel-tooltip'}
    fluid.hidden = true
    APM_LOG_INFO(self, 'remove()', 'fluid with name: "' .. tostring(fluid_name) .. '" set flag "hidden".')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.fluid.delete_hard(fluid_name)
    if not apm.lib.utils.fluid.exist(fluid_name) then return end
    data.raw.fluid[fluid_name] = nil
    APM_LOG_INFO(self, 'delete_hard()', 'fluid with name: "' .. tostring(fluid_name) .. '" deleted hard (set to nil)')
end