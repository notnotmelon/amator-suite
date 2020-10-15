require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/lib/functions.lua'

APM_LOG_HEADER(self)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.nuclear.icons.get_apm_hexafluoride_enrichment(enrichment)
    local icons = {}
    table.insert(icons, {icon = apm.lib.icons.path.chemical_flame_1, icon_size=64, tint={r=0.0, g=0.741, b=0.0}})
    table.insert(icons, {icon = apm.lib.icons.path.chemical_flame_2, icon_size=64, tint={r=0.0, g=0.741, b=0.0}})
    table.insert(icons, {icon = apm.lib.icons.path.chemical_flame_3, icon_size=64, tint={r=0.286, g=0.0, b=0.878}})
    table.insert(icons, {icon = apm.lib.icons.path.chemical_flame_4, icon_size=64, tint={r=0.0, g=0.741, b=0.0}})
    table.insert(icons, {icon = apm.nuclear.icons.path.uranium_hexafluoride, icon_size=64})
    table.insert(icons, {icon = apm.nuclear.icons.path.enrichment_tier .. string.format("%03d",enrichment) .. '.png', icon_size=64})
    return icons
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.nuclear.nuclear_vehicle(vehicle_name)
    local vehicle

    if apm.lib.utils.car.exist(vehicle_name) then
        vehicle = data.raw.car[vehicle_name]
    elseif apm.lib.utils.locomotive.exist(vehicle_name) then
        vehicle = data.raw.locomotive[vehicle_name]
    else
        return
    end

    vehicle.localised_description = {"entity-description.apm_nuclear_vehicle"}
    vehicle.burner.fuel_inventory_size = 1
    vehicle.burner.burnt_inventory_size = vehicle.burner.fuel_inventory_size
    vehicle.burner.fuel_categories = {'apm_nuclear_uranium'}
    vehicle.burner.emissions_per_minute = nil
    vehicle.effectivity = 0.99
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.nuclear.generate_angel_coolant_recipes()
    local recipes = {}

    for _, recipe in pairs(data.raw.recipe) do
        if recipe.category == 'apm_nuclear_cooling_0' then
            table.insert(recipes, recipe)
        end
    end

    for _, recipe in pairs(recipes) do
        local new_recipe = table.deepcopy(recipe)
        new_recipe.name = recipe.name .. "_with_coolant"
        new_recipe.localised_name = {"recipe-name." ..tostring(recipe.name)}
        new_recipe.normal.energy_required = recipe.normal.energy_required / 2
        data:extend({new_recipe})

        apm.lib.utils.icon.add_tier_lable(recipe.name, 1)
        apm.lib.utils.icon.add_tier_lable(new_recipe.name, 2)

        apm.lib.utils.recipe.ingredient.mod(new_recipe.name, 'water', 0)
        apm.lib.utils.recipe.ingredient.mod(new_recipe.name, 'liquid-coolant', 500)
        apm.lib.utils.recipe.result.mod(new_recipe.name, 'apm_hot_water', 0)
        apm.lib.utils.recipe.result.mod(new_recipe.name, 'liquid-coolant-used', 500)
        apm.lib.utils.recipe.result.mod(new_recipe.name, 'apm_radioactive_wastewater', 0)
        apm.lib.utils.recipe.result.mod_temperature(new_recipe.name, 'liquid-coolant-used', nil, 300)

        local technology_name = apm.lib.utils.technology.find.technology_by_recipe(recipe.name)
        if technology_name then
            apm.lib.utils.technology.force.recipe_for_unlock(technology_name, new_recipe.name)
        else
            apm.lib.utils.recipe.enable(new_recipe.name)
        end

        APM_LOG_INFO(self, 'generate_angel_coolant_recipes()', 'recipe variant with angels coolant for: "' ..tostring(recipe.name))
    end
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.nuclear.update_fission_equipment(equipment_name, tier)
    if not data.raw['generator-equipment'][equipment_name] then return end

    local localised_name = {"equipment-name.apm_fission_reactor", "MK"..tostring(tier)}
    if not tier or tier <= 0 then
        localised_name = {"equipment-name.apm_fission_reactor", ""}
    end

    local equipment = data.raw['generator-equipment'][equipment_name]
    equipment.localised_name = localised_name
    equipment.energy_source = {}
    equipment.energy_source.type = "electric"
    equipment.energy_source.usage_priority = "secondary-output"
    equipment.burner = {}
    equipment.burner.emissions_per_minute = 0
    equipment.burner.fuel_categories = {'apm_nuclear_shielded_cell'}
    equipment.burner.fuel_inventory_size = 1
    equipment.burner.burnt_inventory_size = 1
    equipment.burner.type = "burner"
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function apm.nuclear.update_infinite_technologies()
    APM_LOG_INFO(self, 'update_infinite_technologies()', '-- start ----------------------------------------------------------------------')
    for _, technology in pairs(data.raw.technology) do
        if technology.max_level and type(technology.max_level) == 'string' and technology.max_level == 'infinite' then
            if not apm.lib.utils.technology.prerequisite.has.science_pack(technology.name, 'apm_nuclear_science_pack') then
                apm.lib.utils.technology.add.prerequisites(technology.name, 'apm_nuclear_science_pack')
            end
            apm.lib.utils.technology.add.science_pack(technology.name, 'apm_nuclear_science_pack', 1)
        end
    end
    APM_LOG_INFO(self, 'update_infinite_technologies()', '-- end ------------------------------------------------------------------------')
end
