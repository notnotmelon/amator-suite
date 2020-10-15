local initial = {}
local init = require('lib.script.init')

-- Function -------------------------------------------------------------------
-- This function will force a setting to true if apm_power is detected after an mod update as an active mod.
-- Some mods have a problem with this because they expect that only player change settings not scripts.
-- They need to update thier mods to handel this.
-- ----------------------------------------------------------------------------
local function update_inserter_settings()
    if game.active_mods['apm_power'] then
        if settings.global["apm_lib_inserter_functions"].value ~= true then
            settings.global["apm_lib_inserter_functions"] = {value = true}
            log('Info: update_inserter_settings(): apm_inserter_functions: true')
        end
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function initial_apm_mods()
    --init.add_technologie_conditional(unlock_technology, parent_technologies)
    --init.add_technology_conditional_recipe(unlock_technology, parent_recipes)
    --init.add_technology(technology_name)

    -- apm_power
    if game.active_mods['apm_power'] then
        init.add_technology_conditional_recipe('apm_wood_liquefaction', {'apm_refining_wood_1', 'apm_refining_creosote_1', 'apm_refining_coke_oven_gas_1'})
        init.add_technology_conditional_recipe('apm_rubber-1', {'apm_rubber_1', 'apm_resin_1'})
        init.add_technology_conditional_recipe('apm_rubber-2', 'apm_rubber_2')
        init.add_technology('fluid-handling')
        init.add_technology('advanced-material-processing')
        init.add_technology('oil-processing')
        init.add_technology('fuel-processing')
        init.add_technology('angels-oil-processing')
        init.add_technology('angels-coal-processing-2')
        init.add_technology('angels-coal-cracking')
        init.add_technology('logistics-0')
        init.add_technology('logistics')
        init.add_technology('long-inserters-1')
        init.add_technology('basic-automation')
        init.add_technology('automation')
        init.add_technology('electronics')
        init.add_technology('military-2')
        init.add_technology('uranium-processing')
        init.add_technology('sct-automation-science-pack')
        init.add_technology('logistic-science-pack')
        init.add_technology('bio-arboretum-1')
        init.add_technology('bio-arboretum-2')
        init.add_technology('bio-arboretum-3')
        init.add_technology('bio-processing-brown')
    end

    -- apm_nuclear
    if game.active_mods['apm_nuclear'] then
        init.add_technology('uranium-processing')
        init.add_technology('nuclear-power')
        init.add_technology('nuclear-fuel-reprocessing')
        init.add_technology('uranium-ammo')
        init.add_technology('thorium-processing')
        init.add_technology('thorium-fuel-reprocessing')
        init.add_technology('deuterium-processing')
        init.add_technology('deuterium-fuel-reprocessing')
        init.add_technology('bobingabout-enrichment-process')
        init.add_technology('breeder-reactors')
        init.add_technology('fusion-reactor-equipment')
    end

    -- apm_energy_addon
    if game.active_mods['apm_energy_addon'] then
        init.add_technology('battery')
        init.add_technology('battery-2')
        init.add_technology('battery-3')
    end

    -- apm_angel_addon
    if game.active_mods['apm_angel_addon'] then
        init.add_technology('angels-iron-smelting-1')
        init.add_technology('angels-cobalt-steel-smelting-1')
        init.add_technology('angels-brass-smelting-1')
        init.add_technology('angels-titanium-smelting-1')
        init.add_technology('angels-nitinol-smelting-1')
        init.add_technology('angels-tungsten-smelting-1')
        init.add_technology('angels-steel-smelting-1')
    end

    init.run()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function initial.run()
    initial_apm_mods()
    update_inserter_settings()
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
return initial