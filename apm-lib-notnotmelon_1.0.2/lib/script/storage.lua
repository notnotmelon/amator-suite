local storage_script = {}

-- Requires Defines------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local core = require('lib.script.core')

-- Definitions ----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local apm_lib_storage_spit_out = settings.global['apm_lib_storage_spit_out'].value
local apm_lib_storage_spit_out_mark_deconstruct = settings.global['apm_lib_storage_spit_out_mark_deconstruct'].value
local apm_lib_storage_spit_out_iterations = settings.global['apm_lib_storage_spit_out_iterations'].value

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_config()
    apm_lib_storage_spit_out = settings.global['apm_lib_storage_spit_out'].value
    apm_lib_storage_spit_out_mark_deconstruct = settings.global['apm_lib_storage_spit_out_mark_deconstruct'].value
	apm_lib_storage_spit_out_iterations = settings.global['apm_lib_storage_spit_out_iterations'].value
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function storage_script.on_init()
    get_config()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function storage_script.on_load()
    get_config()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function storage_script.on_update()
    get_config()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_force(entity)
    local force
    if apm_lib_storage_spit_out_mark_deconstruct then
        force = entity.force
    end
    return force
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function container(entity, cause)
	if entity.valid ~= true then return end
	if entity.type ~= 'container' then return end

	local inventory = entity.get_inventory(defines.inventory.chest)
	
	if inventory == nil then return end
	if inventory.is_empty() then return end

	local content = inventory.get_contents()
	local surface = entity.surface.name
	local position = entity.position
    local entity_force = get_force(entity) -- will return nil if apm_lib_storage_spit_out_mark_deconstruct == false

    local increment_counter = 0
	for item, count in pairs(content) do
		game.surfaces[surface].spill_item_stack(position, {name=item, count=count}, false, entity_force)

        increment_counter = increment_counter + 1
        if increment_counter >= apm_lib_storage_spit_out_iterations then -- this sould prevent too much lag on modded storages. (48: steel-chest / default)
            break
        end
	end

	if cause ~= nil then
		if cause.type == 'character' or cause.type == 'player' then
			local force = cause.player.force
			local player_name = cause.player.name
            local msg = {'apm_msg_storage_died', player_name}
			core.send_msg_to_force(force, msg)
		end
	end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function tank(entity, cause)
	if entity.valid ~= true then return end
	if entity.type ~= 'storage-tank' then return end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function storage_script.died(event)
	if not apm_lib_storage_spit_out then return end
    local entity = event.entity
    local cause = event.cause

	container(entity, cause)
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function storage_script.pre_mined(event)
    local entity = event.entity
    local cause = event.cause
    
	tank(entity, cause)
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return storage_script