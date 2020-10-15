require 'util'
require('lib.log')

local self = 'lib.utils.lab'

if apm.lib.utils.lab.add == nil then apm.lib.utils.lab.add = {} end
if apm.lib.utils.lab.set == nil then apm.lib.utils.lab.set = {} end
if apm.lib.utils.lab.get == nil then apm.lib.utils.lab.get = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.exist(lab_name)
	if data.raw.lab[lab_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'lab with name: "' .. tostring(lab_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.get.fuel_categories(lab_name)
    if not apm.lib.utils.lab.exist(lab_name) then return nil end

    local lab = data.raw['lab'][lab_name]
    if not lab.energy_source then return nil end

    if lab.energy_source.type == 'burner' then
        if lab.energy_source.fuel_category then
            return {{name=lab.energy_source.fuel_category, type='fuel-category'}}
        elseif lab.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(lab.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif lab.energy_source.type == 'fluid' then
        if lab.energy_source.fluid_box.filter ~= nil then
            if lab.energy_source.fluid_box.filter == 'steam' then
                return nil
            end
            return {{name=lab.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if lab.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "burner" for: ' .. tostring(lab_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif lab.energy_source.type == 'fluid' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "fluid" for: ' .. tostring(lab_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.update_description(lab_name)
    if not apm.lib.utils.lab.exist(lab_name) then return end
    local lab = data.raw['lab'][lab_name]

    if not lab.energy_source then return nil end
    local fuel_categories = apm.lib.utils.lab.get.fuel_categories(lab_name)

    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(lab, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(lab, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.overhaul(lab_name)
	if not apm.lib.utils.lab.exist(lab_name) then return end

	local lab = data.raw.lab[lab_name]
	lab.fast_replaceable_group = "lab"

    local inputs = table.deepcopy(lab.inputs)
    lab.inputs = {}

	apm.lib.utils.lab.add.science_pack(lab_name, "apm_industrial_science_pack")
	apm.lib.utils.lab.add.science_pack(lab_name, "apm_steam_science_pack")

    for _, science_pack in pairs(inputs) do
        apm.lib.utils.lab.add.science_pack(lab_name, science_pack)
    end

	APM_LOG_INFO(self, 'overhaul()', 'lab with name: "' .. tostring(lab_name) .. '" changed.')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function check_for_science_packs(lab, science_pack)
	for s in pairs(lab.inputs) do
		if s == science_pack then
			return true
		end
	end
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.add.science_pack(lab_name, science_pack)
	if not apm.lib.utils.lab.exist(lab_name) then return end
	
	local lab = data.raw.lab[lab_name]
	if not check_for_science_packs(lab, science_pack) then
		table.insert(lab.inputs, science_pack)
		APM_LOG_INFO(self, 'add.science_pack()', 'added: "' .. tostring(science_pack) .. '"  to "' .. tostring(lab_name) .. '"')
		return
	end
	APM_LOG_WARN(self, 'add.science_pack()', 'cant add: "' .. tostring(science_pack) .. '"  to "' .. tostring(lab_name) .. '" is allready there.')
end

-- Function -------------------------------------------------------------------
-- deprecated
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.lab.inputs(lab_name, t_science_packs)
	APM_LOG_ERR(self, 'inputs()', 'is marked deprecated please use .set.inputs() or .add.science_pack()')
	apm.lib.utils.lab.set.inputs(lab_name, t_science_packs)
end