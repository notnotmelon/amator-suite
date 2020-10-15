-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function register_radioactive_items()
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_container_worn', 1)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_container_worn', 1)
    
    remote.call('apm_radiation', 'add_item', 'apm_yellowcake', 1)
    remote.call('apm_radiation', 'add_item', 'apm_oxide_pellet_u235', 2)
    remote.call('apm_radiation', 'add_item', 'apm_oxide_pellet_th232', 1)
    remote.call('apm_radiation', 'add_item', 'apm_oxide_pellet_np237', 1)
    remote.call('apm_radiation', 'add_item', 'apm_oxide_pellet_pu239', 3)

    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_uranium', 1)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_uranium_active', 3)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_uranium_cooled', 2)

    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_mox', 2)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_mox_active', 3)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_mox_cooled', 2)

    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_neptunium', 1)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_neptunium_active', 2)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_neptunium_cooled', 1)

    remote.call('apm_radiation', 'add_item', 'apm_breeder_uranium', 1)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_uranium_loaded', 2)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_uranium_active', 3)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_uranium_cooled', 2)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_uranium_seperated', 2)

    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_thorium', 1)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_thorium_active', 3)
    remote.call('apm_radiation', 'add_item', 'apm_fuel_rod_thorium_cooled', 2)

    remote.call('apm_radiation', 'add_item', 'apm_breeder_thorium', 1)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_thorium_loaded', 2)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_thorium_active', 3)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_thorium_cooled', 2)
    remote.call('apm_radiation', 'add_item', 'apm_breeder_thorium_seperated', 2)

    remote.call('apm_radiation', 'add_item', 'apm_radioactive_waste', 1)
end


-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function register_burner_equipment()
   remote.call('apm_equipment', 'add_burner_equipment', 'fusion-reactor-equipment')
   remote.call('apm_equipment', 'add_burner_equipment', 'fusion-reactor-equipment-2')
   remote.call('apm_equipment', 'add_burner_equipment', 'fusion-reactor-equipment-3')
   remote.call('apm_equipment', 'add_burner_equipment', 'fusion-reactor-equipment-4')
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function on_init()
    register_radioactive_items()
    register_burner_equipment()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function on_load()
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function on_update()
    register_radioactive_items()
    register_burner_equipment()
end

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
script.on_init(on_init)
script.on_load(on_load)
script.on_configuration_changed(on_update)
