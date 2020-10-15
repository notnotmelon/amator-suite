require 'util'
require('lib.log')

local self = 'lib.utils.reactor'

if apm.lib.utils.reactor.add == nil then apm.lib.utils.reactor.add = {} end
if apm.lib.utils.reactor.set == nil then apm.lib.utils.reactor.set = {} end
if apm.lib.utils.reactor.get == nil then apm.lib.utils.reactor.get = {} end

if apm.lib.utils.reactor.overhaul_exceptions == nil then apm.lib.utils.reactor.overhaul_exceptions = {} end
if apm.lib.utils.reactor.overhaul_exceptions.table == nil then apm.lib.utils.reactor.overhaul_exceptions.table = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.overhaul_exceptions.add(reactor_name)
    apm.lib.utils.reactor.overhaul_exceptions.table[reactor_name] = true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.overhaul_exceptions.remove(reactor_name)
    apm.lib.utils.reactor.overhaul_exceptions.table[reactor_name] = nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.exist(reactor_name)
	if data.raw.reactor[reactor_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'reactor with name: "' .. tostring(reactor_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.get.fuel_categories(reactor_name)
    if not apm.lib.utils.reactor.exist(reactor_name) then return nil end

    local reactor = data.raw['reactor'][reactor_name]
    if not reactor.energy_source then return nil end

    if reactor.energy_source.type == 'burner' then
        if reactor.energy_source.fuel_category then
            return {{name=reactor.energy_source.fuel_category, type='fuel-category'}}
        elseif reactor.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(reactor.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif reactor.energy_source.type == 'fluid' then
        if reactor.energy_source.fluid_box.filter ~= nil then
            return {{name=reactor.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if reactor.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "burner" for: ' .. tostring(reactor_name))
        return {{name='nuclear', type='fuel-category'}} -- default value
    elseif reactor.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'default "fluid" for: ' .. tostring(reactor_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default value
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.update_description(reactor_name)
	if not apm.lib.utils.reactor.exist(reactor_name) then return end
	local reactor = data.raw['reactor'][reactor_name]

    if not reactor.energy_source then return end
    local fuel_categories = apm.lib.utils.reactor.get.fuel_categories(reactor_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(reactor, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(reactor, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.add.fuel_category(reactor_name, fuel_categorie)
	if not apm.lib.utils.reactor.exist(reactor_name) then return end

	local reactor = data.raw.reactor[reactor_name]
    apm.lib.utils.entity.add.fuel_category(reactor, fuel_categorie)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.set.fuel_categories(reactor_name, fuel_categories)
	if not apm.lib.utils.reactor.exist(reactor_name) then return end
	local reactor = data.raw.reactor[reactor_name]
    apm.lib.utils.entity.set.fuel_category(reactor, fuel_categories)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.reactor.overhaul(reactor_name, level)
	if not apm.lib.utils.reactor.exist(reactor_name) then return end
    if apm.lib.utils.reactor.overhaul_exceptions.table[reactor_name] then return end

    local reactor = data.raw.reactor[reactor_name]
    local default_categories = {'apm_nuclear_uranium', 'apm_nuclear_mox', 'apm_nuclear_neptunium', 'apm_nuclear_thorium'}
    apm.lib.utils.entity.set.fuel_category(reactor, default_categories)
end