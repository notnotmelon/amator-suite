require 'util'
require('lib.log')

local self = 'lib.utils.resource'

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.resource.exist(resource_name)
	if data.raw.resource[resource_name] then
        return true
    end
    APM_LOG_WARN(self, 'exist()', 'resource with name: "' .. tostring(name) .. '" dosent exist.')
    return false
end