require 'util'
require('lib.log')

local self = 'lib.utils.storage_tank'

if apm.lib.utils.storage_tank.set == nil then apm.lib.utils.storage_tank.set = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.storage_tank.exist(storage_tank_name)
	if data.raw['storage-tank'][storage_tank_name] then
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'storage-tank with name: "' .. tostring(storage_tank_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.storage_tank.set.hidden(storage_tank_name)
    if not apm.lib.utils.assembler.exist(storage_tank_name) then return end
    local storage_tank = data.raw['storage-tank'][storage_tank_name]
    apm.lib.utils.entity.add.flag(storage_tank, 'hidden')
end