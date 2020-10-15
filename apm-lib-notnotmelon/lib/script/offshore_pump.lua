local offshore_pump_script = {}

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function setup_burner(entity)
    local direction = entity.direction
    local position = entity.position
    local surface = entity.surface
    local force = entity.force

    surface.create_entity{name="apm_offshore_pump_burner", position=position, direction=direction, force=force,
                          fast_replace=true, spill=false, raise_built=true, create_build_effect_smoke=false,
                          raise_built=true}
    entity.destroy({raised_destroy=true})
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function setup_electric(entity)
    local direction = entity.direction
    local position = entity.position
    local surface = entity.surface
    local force = entity.force

    surface.create_entity{name="apm_offshore_pump_electric", position=position, direction=direction, force=force,
                          fast_replace=true, spill=false, raise_built=true, create_build_effect_smoke=false,
                          raise_built=true}
    entity.destroy({raised_destroy=true})
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function rescan()
    log('-- rescan for offshore pumps --------------------------------------------------')

    local count_burner = 0
    local count_electric = 0

    for _, surface in pairs(game.surfaces) do
        local offshore_pumps = surface.find_entities_filtered{ type='offshore-pump'}
        for _, entity in pairs(offshore_pumps) do
            if entity.name == 'apm_offshore_pump_1' then
                setup_electric(entity)
                count_electric = count_electric +1
            elseif entity.name == 'offshore-pump' or entity.name == 'apm_offshore_pump_1' then
                setup_burner(entity)
                count_burner = count_burner +1
            end
        end
    end
    log('converted to burner offshore pump: ' .. tostring(count_burner))
    log('converted to electric offshore pump: ' ..tostring(count_electric))
    log('-- ----------------------------------------------------------------------------')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function offshore_pump_script.on_build(entity)
    if not entity then return end
    if not entity.valid then return end
    if not entity.type == 'offshore-pump' then return end

    if entity.name == 'apm_offshore_pump_0' then
        setup_burner(entity)
    elseif entity.name == 'apm_offshore_pump_1' then
        setup_electric(entity)
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function offshore_pump_script.on_init()
    rescan()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function offshore_pump_script.on_update()
    rescan()
end

-- Remote Interface ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- /c remote.call('apm_offshore_pumps', 'rescan')
remote.add_interface("apm_offshore_pumps",{
    rescan = function() return rescan() end
    })

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return offshore_pump_script