-- Remote Function ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function inserter_clear_ash()
    for _, surface in pairs(game.surfaces) do
        local inserters = surface.find_entities_filtered({type='inserter'})

        for _, inserter in pairs(inserters) do
            local burnt_result_inventory = inserter.get_burnt_result_inventory()
            if burnt_result_inventory ~= nil then
                burnt_result_inventory.clear()
            end
        end

        local msg = {"apm_interfaces_inserter_clear_ash", tostring(surface.name)}
        surface.print(msg)
    end
    return
end

-- Remote Function ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function inserter_add_fuel()
    for _, surface in pairs(game.surfaces) do
        local inserters = surface.find_entities_filtered({type='inserter'})

        for _, inserter in pairs(inserters) do
            local fuel_inventory = inserter.get_fuel_inventory()
            if fuel_inventory ~= nil then
                fuel_inventory.clear()
                fuel_inventory.insert{name = 'coal', count = 200}
            end
        end

        local msg = {"apm_interfaces_inserter_add_fuel", tostring(surface.name)}
        surface.print(msg)
    end
    return
end

-- Remote Interface ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
-- /c remote.call('apm_control', 'inserter_clear_ash')
-- /c remote.call('apm_control', 'inserter_add_fuel')
remote.add_interface("apm_control",{
    inserter_clear_ash = function() return inserter_clear_ash() end,
    inserter_add_fuel = function() return inserter_add_fuel() end
    })
