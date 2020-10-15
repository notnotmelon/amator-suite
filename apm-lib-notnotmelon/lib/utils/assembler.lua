require 'util'
require('lib.log')

local self = 'lib.utils.assembler'

if apm.lib.utils.assembler.add == nil then apm.lib.utils.assembler.add = {} end
if apm.lib.utils.assembler.mod == nil then apm.lib.utils.assembler.mod = {} end
if apm.lib.utils.assembler.mod.category == nil then apm.lib.utils.assembler.mod.category = {} end
if apm.lib.utils.assembler.burner == nil then apm.lib.utils.assembler.burner = {} end
if apm.lib.utils.assembler.centrifuge == nil then apm.lib.utils.assembler.centrifuge = {} end
if apm.lib.utils.assembler.get == nil then apm.lib.utils.assembler.get = {} end
if apm.lib.utils.assembler.set == nil then apm.lib.utils.assembler.set = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.exist(assembler_name)
	if data.raw['assembling-machine'][assembler_name] then 
		return true
	end
	APM_LOG_WARN(self, 'exist()', 'assembler with name: "' .. tostring(assembler_name) .. '" dosent exist.')
	return false
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.get.fuel_categories(assembler_name)
    if not apm.lib.utils.assembler.exist(assembler_name) then return nil end

    local assembler = data.raw['assembling-machine'][assembler_name]
    if not assembler.energy_source then return nil end

    if assembler.energy_source.type == 'burner' then
        if assembler.energy_source.fuel_category then
            return {{name=assembler.energy_source.fuel_category, type='fuel-category'}}
        elseif assembler.energy_source.fuel_categories then
            local rc = {}
            for _, fc in pairs(assembler.energy_source.fuel_categories) do
                table.insert(rc, {name=fc, type='fuel-category'})
            end
            return rc
        end

    elseif assembler.energy_source.type == 'fluid' then
        if assembler.energy_source.fluid_box.filter ~= nil then
            if assembler.energy_source.fluid_box.filter == 'steam' then
                return nil
            end
            return {{name=assembler.energy_source.fluid_box.filter, type='fluid'}}
        end
    end

    if assembler.energy_source.type == 'burner' then
        APM_LOG_INFO(self, 'get.fuel_categories()', 'set default "burner" for: ' .. tostring(assembler_name))
        return {{name='chemical', type='fuel-category'}} -- default
    elseif assembler.energy_source.type == 'fluid' then
        APM_LOG_INFO(self,'get.fuel_categories()', 'set default "fluid" for: ' .. tostring(assembler_name))
        return {{name='apm_petrol', type='fuel-category'}} -- default
    end

    return nil
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.update_description(assembler_name)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end
    local assembler = data.raw['assembling-machine'][assembler_name]

    if not assembler.energy_source then return end

    local fuel_categories = apm.lib.utils.assembler.get.fuel_categories(assembler_name)
    if fuel_categories ~= nil then
        apm.lib.utils.description.entities.setup(assembler, fuel_categories)
        --apm.lib.utils.description.entities.add_fuel_types(assembler, fuel_categories)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.mod.category.add(assembler_name, category)
	if not apm.lib.utils.assembler.exist(assembler_name) then return end

	local assembler = data.raw['assembling-machine'][assembler_name]
	apm.lib.utils.entity.add.crafting_category(assembler, category)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.mod.crafting_speed(assembler_name, value)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end

    local assembler = data.raw['assembling-machine'][assembler_name]
    assembler.crafting_speed = value
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.mod.module_specification(assembler_name, value, allowed_effects)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end

    local default_allowed_effects = {"consumption", "speed", "productivity", "pollution"}

    local assembler = data.raw['assembling-machine'][assembler_name]

    assembler.module_specification = {module_slots = value}

    if not assembler.allowed_effects and not allowed_effects then
        assembler.allowed_effects = default_allowed_effects
    elseif allowed_effects then
        assembler.allowed_effects = allowed_effects
    end
    APM_LOG_INFO(self, 'mod.module_specification()', 'changed module_specification for: "' ..tostring(assembler_name).. '"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.add.fluid_connections(assembler_name, level)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end

    local assembler = data.raw['assembling-machine'][assembler_name]
    local pipe_picture

    if level == 1 then
        pipe_picture = apm.lib.utils.pipecovers.assembler1pipepictures()
    elseif level == 2 then
        pipe_picture = assembler2pipepictures()
    elseif level == 3 then
        pipe_picture = assembler3pipepictures()
    elseif level == 4 then
        pipe_picture = apm.lib.utils.pipecovers.assembler4pipepictures()
    else
        return
    end

    assembler.fluid_boxes = {}
    assembler.fluid_boxes[1] = {}
    assembler.fluid_boxes[1].production_type = "input"
    assembler.fluid_boxes[1].pipe_picture = pipe_picture
    assembler.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
    assembler.fluid_boxes[1].base_area = 1
    assembler.fluid_boxes[1].base_level = -1
    assembler.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, 2} }}
    assembler.fluid_boxes[1].secondary_draw_orders = { north = -1 }
    assembler.fluid_boxes[2] = {}
    assembler.fluid_boxes[2].production_type = "output"
    assembler.fluid_boxes[2].pipe_picture = pipe_picture
    assembler.fluid_boxes[2].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
    assembler.fluid_boxes[2].base_area = 1
    assembler.fluid_boxes[2].base_level = 1
    assembler.fluid_boxes[2].pipe_connections = {{ type="output", position = {0, -2} }}
    assembler.fluid_boxes[2].secondary_draw_orders = { north = -1 }
    assembler.fluid_boxes.off_when_no_fluid_recipe = true
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.burner.add_fuel_category(assembler_name, category)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end

    local assembler = data.raw['assembling-machine'][assembler_name]
    apm.lib.utils.entity.add.fuel_category(assembler, category)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.burner.overhaul(assembler_name, only_refined)
	if not apm.lib.utils.assembler.exist(assembler_name) then return end

	local assembler = data.raw['assembling-machine'][assembler_name]
	if assembler.energy_source.type == 'burner' then
		assembler.energy_source.burnt_inventory_size = 1
		--assembler.energy_source.fuel_category = nil
		if only_refined then
            apm.lib.utils.entity.set.fuel_category(assembler, 'apm_refined_chemical')
		else
            apm.lib.utils.entity.set.fuel_category(assembler, {'chemical', 'apm_refined_chemical'})
		end
		APM_LOG_INFO(self,'burner.overhaul()', 'assembler with name: "' .. tostring(assembler_name) .. '" changed')
		return
	end
	APM_LOG_WARN(self,'burner.overhaul()', 'assembler with name: "' .. tostring(assembler_name) .. '" has not energy_source.type = "burner"')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.centrifuge.overhaul(centrifuge_name, level)
	if not apm.lib.utils.assembler.exist(centrifuge_name) then return end

	local centrifuge = data.raw['assembling-machine'][centrifuge_name]
    centrifuge.flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"}
	centrifuge.fluid_boxes = {}
	centrifuge.fluid_boxes[1] = {}
	centrifuge.fluid_boxes[1].production_type = "input"
	--centrifuge.fluid_boxes[1].pipe_picture = apm.lib.utils.pipecovers.assembler2pipepictures()
	--centrifuge.fluid_boxes[1].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
	centrifuge.fluid_boxes[1].base_area = 0.1
	centrifuge.fluid_boxes[1].base_level = -1
	centrifuge.fluid_boxes[1].pipe_connections = {{ type="input", position = {0, -2} }}
	centrifuge.fluid_boxes[1].secondary_draw_orders = { north = -1 }
	centrifuge.fluid_boxes[2] = {}
	centrifuge.fluid_boxes[2].production_type = "output"
	centrifuge.fluid_boxes[2].pipe_picture = apm.lib.utils.pipecovers.assembler2pipepictures()
	centrifuge.fluid_boxes[2].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
	centrifuge.fluid_boxes[2].base_area = 0.1
	centrifuge.fluid_boxes[2].base_level = 1
	centrifuge.fluid_boxes[2].pipe_connections = {{ type="output", position = {-1, 2} }}
	centrifuge.fluid_boxes[2].secondary_draw_orders = { north = -1 }
	centrifuge.fluid_boxes[3] = {}
	centrifuge.fluid_boxes[3].production_type = "output"
	centrifuge.fluid_boxes[3].pipe_picture = apm.lib.utils.pipecovers.assembler2pipepictures()
	centrifuge.fluid_boxes[3].pipe_covers = apm.lib.utils.pipecovers.pipecoverspictures()
	centrifuge.fluid_boxes[3].base_area = 0.1
	centrifuge.fluid_boxes[3].base_level = 1
	centrifuge.fluid_boxes[3].pipe_connections = {{ type="output", position = {1, 2} }}
	centrifuge.fluid_boxes[3].secondary_draw_orders = { north = -1 }
	centrifuge.fast_replaceable_group = "centrifuge"
	centrifuge.allowed_effects = {"consumption", "speed", "pollution"}
	-- centrifuge.always_draw_idle_animation = false
	-- move all layer to animation, otherwise the pipe_picture will overlap
	if centrifuge.idle_animation then
		--local new = {}
		--for _, layer in pairs(centrifuge.idle_animation.layers) do
		--	table.insert(new, layer)
		--end
		--for _, layer in pairs(centrifuge.animation.layers) do
		--	table.insert(new, layer)
		--end
		--centrifuge.animation.layers = table.deepcopy(new)
		--centrifuge.idle_animation = nil
	end
	APM_LOG_INFO(self, 'centrifuge.overhaul()', 'centrifuge with name: "' .. tostring(centrifuge_name) .. '" changed')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.assembler.set.hidden(assembler_name)
    if not apm.lib.utils.assembler.exist(assembler_name) then return end
    local assembler = data.raw['assembling-machine'][assembler_name]
    apm.lib.utils.entity.add.flag(assembler, 'hidden')
end