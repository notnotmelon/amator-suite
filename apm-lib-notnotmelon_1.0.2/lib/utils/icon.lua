require 'util'
require('lib.log')

local self = 'lib.utils.icon'

if not apm.lib.utils.icons then apm.lib.utils.icons = {} end
if not apm.lib.utils.icon.get then apm.lib.utils.icon.get = {} end
if not apm.lib.utils.icon.set then apm.lib.utils.icon.set = {} end
if not apm.lib.utils.icon.dynamics then apm.lib.utils.icon.dynamics = {} end
if not apm.lib.utils.icon.static then apm.lib.utils.icon.static = {} end
if not apm.lib.utils.icon.signal then apm.lib.utils.icon.signal = {} end
if not apm.lib.utils.icon.layer then apm.lib.utils.icon.layer = {} end
if not apm.lib.utils.icon.path then apm.lib.utils.icon.path = {} end
if not apm.lib.utils.icon.generate then apm.lib.utils.icon.generate = {} end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_icon_size(object)
    local size = 32

    if object.icon_size then
        size = object.icon_size
    elseif object.size then
        size = object.size
    end

    return size
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_icon_mipmaps(object)
    local mipmaps = 0
    if object.icon_mipmaps then
        mipmaps = object.icon_mipmaps
    end
    return mipmaps
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_icon(object_name, type_name)
    local prototype_list = {}

    if type_name == 'item' or type_name == 'item-with-entity-data' or type_name == 'fluid' then
        prototype_list = {'item', 'item-with-entity-data', 'fluid'}
    elseif type_name == 'recipe' then
        prototype_list = {'recipe'}
    elseif type_name == 'tool' then
        prototype_list = {'tool'}
    end

    for _, prototype in pairs(prototype_list) do
        local object = data.raw[prototype][object_name]
        if object then
            if object.icon then
                local icon_size = get_icon_size(object)
				local icon_mipmaps = get_icon_mipmaps(object)
                return {{icon=object.icon, icon_size=icon_size, icon_mipmaps=icon_mipmaps}}
            end
            if object.icons then
                return table.deepcopy(object.icons)
            end
        end
    end
   -- something is wrong here but we need to return something
   return {apm.lib.icons.dummy}
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.get.from_item(object_name)
    return get_icon(object_name, 'item')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.get.from_fluid(object_name)
	return get_icon(object_name, 'fluid')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.get.from_recipe(object_name)
    return get_icon(object_name, 'recipe')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.get.from_tool(object_name)
    return get_icon(object_name, 'tool')
end

-- Function -------------------------------------------------------------------
--
-- t_icon: a icons table -> {icon=...}
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.mod(t_icon, scale, shift, base_size)
    if base_size == nil then
        base_size = 32
    end
	local new_icon = table.deepcopy(t_icon)
	if scale then
        local icon_size = get_icon_size(new_icon)
        new_icon.scale = scale*(base_size/icon_size)
	end
	if shift then
		if new_icon.shift then
			new_icon.shift = {new_icon.shift[1] + shift[1], new_icon.shift[2] + shift[2]}
		else
			new_icon.shift = shift
		end
	end
	return new_icon
end

-- Function -------------------------------------------------------------------
--
-- t_icons: a table of icons tables -> {{icon=...},...}
-- ----------------------------------------------------------------------------
function apm.lib.utils.icons.mod(t_icons, scale, shift)
	local icons = {}
	for _, icon in pairs(t_icons) do
		local new_icon = apm.lib.utils.icon.mod(icon, scale, shift)
		table.insert(icons, new_icon)
	end
	return icons
end

-- Function -------------------------------------------------------------------
-- 
-- icon_tables: a table of icon tables -> {{{icon=...},...}, {{icon=...},...}}
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.merge(icon_tables)
	local icons = {}
	for _, t_icon in pairs(icon_tables) do
		if type(t_icon) == 'table' then
			for _, icon in pairs(t_icon) do
				table.insert(icons, icon)
			end
		else
			table.insert(icons, t_icon)
		end
	end
	return icons
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.generate.chemical(tint_1, tint_2, tint_3, tint_4, symbol, scale, shift)
	local icons = {}
    if tint_2 == nil then
        tint_2 = table.deepcopy(tint_1)
    end
    
    table.insert(icons,{icon = apm.lib.icons.path.chemical_flame_1, tint=tint_1, icon_size=64, scale=scale, shift=shift})
	table.insert(icons,{icon = apm.lib.icons.path.chemical_flame_2, tint=tint_2, icon_size=64, scale=scale, shift=shift})
	table.insert(icons,{icon = apm.lib.icons.path.chemical_flame_3, tint=tint_3, icon_size=64, scale=scale, shift=shift})
    table.insert(icons,{icon = apm.lib.icons.path.chemical_flame_4, tint=tint_4, icon_size=64, scale=scale, shift=shift})
	
    if symbol then
		symbol.scale=scale
		symbol.shift=shift
		table.insert(icons, symbol)
	end
	return icons
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.generate.fluid(tint_1, tint_2, symbol, background_tint, background_alpha)
	local icons = {}

    if background_alpha == nil then
        background_alpha = 0.65
    end

    local bg_tint = tint_2
    if background_tint ~= nil then
        bg_tint = background_tint
    end
    bg_tint.a = background_alpha

    table.insert(icons,{icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_fluid_drop_background.png', tint=bg_tint, icon_size=64})
	table.insert(icons,{icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_fluid_drop_inner.png', tint=tint_2, icon_size=64})
	table.insert(icons,{icon = '__apm_resource_pack__/graphics/icons/dynamics/apm_fluid_drop_body.png', tint=tint_1, icon_size=64})
	if symbol then
		table.insert(icons, symbol)
	end
	return icons
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.layer.insert(base_dn, layer, icon_path, icon_size, scale, shift, tint)
	if not base_dn then return end
	if not base_dn.icons then return end
	-- todo:
	-- shifting icons at position behind target-layer, insert new one
	APM_LOG_ERR(self, 'layer.insert', 'Debug: DUMMY used! No fuctions here, its a placeholder!')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.replace(icon_path_old, icon_path_new, icon_size, scale, shift, tint)
	local type_list = {'item', 'recipe'}
	for _, obj_type in pairs(type_list) do
		for _, obj in pairs(data.raw[obj_type]) do
			if obj.icon then
				if obj.icon == icon_path_old then
					obj.icon = icon_path_new
				end
			end
			if obj.icons then
				for _, layer in pairs(obj.icons) do
					if layer.icon == icon_path_old then
						layer.icon = icon_path_new
						layer.icon_size = icon_size
						layer.scale = scale
						layer.shift = shift
						layer.tint = tint
					end
				end
			end
		end
	end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.layer.replace(base_dn, layer, icon_path, icon_size, scale, shift, tint)
    if not base_dn then return end
        if not base_dn.icons then return end

        if not icon_size then icon_size = 32 end

        for k, _ in pairs(base_dn.icons) do
        if k == layer then
            if icon_path == nil then
                table.remove(base_dn.icons, k)
            else
                base_dn.icons[k] = {icon=icon_path, icon_size=icon_size, scale=scale, shift=shift, tint=tint}
                APM_LOG_INFO(self, 'layer.replace()', 'in: "' .. tostring(base_dn.name) .. '" type: "' .. tostring(base_dn.type) .. '" on layer: "' .. tostring(layer) .. '" new icon: "' .. tostring(icon_path) .. '" with size: "'.. tostring(icon_size) .. '" with scale: "'.. tostring(scale) .. '" with shift: "'.. tostring(shift) .. '" with tint: "'.. tostring(tint) .. '"')
            end
        return
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function get_tier_icon(level)
	if level == 1 then return apm.lib.icons.dynamics.t1
	elseif level == 2 then return apm.lib.icons.dynamics.t2
	elseif level == 3 then return apm.lib.icons.dynamics.t3
	elseif level == 4 then return apm.lib.icons.dynamics.t4
	elseif level == 5 then return apm.lib.icons.dynamics.t5
	else return nil
	end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.add_tier_lable(name, level)
	local prototypes = {'item', 'item-with-entity-data', 'fluid', 'recipe', 'assembling-machine',
						'boiler', 'logistic-robot', 'construction-robot', 'inserter', 'lab', 'locomotive',
						'mining-drill', 'module', 'reactor', 'ammo-turret', 'car', 'generator'}
	for _, prototype in pairs(prototypes) do
		local item = data.raw[prototype][name]
		if item ~= nil then
			if item.icon then
				item.icons = {{icon=item.icon}, get_tier_icon(level)}
				item.icon = nil
			end
			if item.icons then
				table.insert(item.icons, get_tier_icon(level))
			end
		end
	end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.lib.utils.icon.set.icons(object, t_icons)
    object.icon = nil
	object.icons = t_icons
    APM_LOG_INFO(self, 'set.icons()', 'icons set for type: "' .. tostring(object.type) .. '" name: "' .. tostring(object.name) .. '"')
end