require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/recipes.lua'

APM_LOG_HEADER(self)

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value
local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- apm ------------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.apm_power then
    apm.lib.utils.recipe.remove('apm_nuclear_ash')
    apm.lib.utils.recipe.ingredient.replace('apm_phosphorus', 'apm_nuclear_ash', 'apm_generic_ash')
end

if mods.apm_recycling then
    apm.lib.utils.recipe.category.change('apm_fuel_rod_container_maintenance', 'apm_recycling_2')
    apm.lib.utils.recipe.category.change('apm_breeder_container_worn_maintenance', 'apm_recycling_2')
end

-- bio_industries -------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.Bio_Industries and apm_nuclear_compat_bio_industries then
    if not mods.apm_power then
        apm.lib.utils.recipe.remove('apm_nuclear_ash')
        apm.lib.utils.recipe.ingredient.replace('apm_phosphorus', 'apm_nuclear_ash', 'bi-ash')
    end
end

-- Earendel -------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods['space-exploration'] and apm_nuclear_compat_earendel then
    apm.lib.utils.recipe.ingredient.replace('se-rtg-equipment', 'uranium-fuel-cell', 'apm_rtg_radioisotope_thermoelectric_generator')
    apm.lib.utils.recipe.ingredient.mod('se-rtg-equipment', 'apm_rtg_radioisotope_thermoelectric_generator', 5, 10)
    apm.lib.utils.recipe.ingredient.mod('satellite', 'apm_rtg_radioisotope_thermoelectric_generator', 0)
end

-- bob ------------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.bobplates and apm_nuclear_compat_bob then
    apm.lib.utils.recipe.ingredient.mod('apm_fuel_rod_container', 'glass', 5, 10)
    apm.lib.utils.recipe.ingredient.replace('apm_waste_container', 'iron-plate', 'lead-plate')
    apm.lib.utils.recipe.ingredient.mod('apm_fuel_rod_container', 'lead-plate', 5, 10)
    apm.lib.utils.recipe.ingredient.mod('satellite', 'silver-zinc-battery', 0)
    apm.lib.utils.recipe.remove('plutonium-fuel-cell')
end

if mods.bobplates and not mods.angelspetrochem and apm_nuclear_compat_bob then
    apm.lib.utils.recipe.ingredient.replace('apm_bromine', 'steam', 'chlorine')
end

if mods.bobwarfare and apm_nuclear_compat_bob then
    apm.lib.utils.recipe.ingredient.mod('uranium-rounds-magazine', 'apm_depleted_uranium_ingots', 0)
    apm.lib.utils.recipe.ingredient.mod('uranium-bullet-projectile', 'uranium-238', 0)
    apm.lib.utils.recipe.ingredient.mod('uranium-bullet-projectile', 'apm_depleted_uranium_ingots', 1, 2)    
    apm.lib.utils.recipe.ingredient.replace('shotgun-uranium-shell', 'uranium-238', 'apm_depleted_uranium_ingots')
    apm.lib.utils.recipe.ingredient.mod('shotgun-uranium-shell', 'apm_depleted_uranium_ingots', 5, 7)
end

-- angel ----------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.angelspetrochem and apm_nuclear_compat_angel then
    apm.lib.utils.recipe.ingredient.replace('apm_bromine', 'steam', 'gas-chlorine')
end

if mods.angelspetrochem and mods.angelsrefining and apm_nuclear_compat_angel then
    apm.lib.utils.recipe.result.mod('apm_bromine_trifluoride', 'water-greenyellow-waste', 10)
    apm.lib.utils.recipe.result.mod('apm_used_fuel_cell_recovery_stage_b_042', 'water-red-waste', 50)
    apm.lib.utils.recipe.result.mod('apm_fuel_rod_uranium_recovery_stage_b', 'water-red-waste', 50)
    apm.lib.utils.recipe.result.mod('apm_fuel_rod_mox_recovery_stage_b', 'water-red-waste', 50)
    apm.lib.utils.recipe.result.mod('apm_breeder_uranium_seperation_process_b', 'water-red-waste', 50)
    apm.lib.utils.recipe.result.mod('apm_oxide_pellet_u238', 'water-greenyellow-waste', 25)
    apm.lib.utils.recipe.result.mod('apm_oxide_pellet_u235', 'water-greenyellow-waste', 25)
    if mods.bobplates or mods.apm_starfall then
        apm.lib.utils.recipe.result.mod('apm_oxide_pellet_th232', 'water-greenyellow-waste', 25)
        apm.lib.utils.recipe.result.mod('apm_fuel_cell_thorium_recovery_stage_b', 'water-red-waste', 50)
        apm.lib.utils.recipe.result.mod('apm_breeder_thorium_seperation_process_b', 'water-red-waste', 50)
    end
    apm.lib.utils.recipe.ingredient.mod('apm_phosphorpentachlorid', 'gas-chlorine', 100)

    apm.lib.utils.recipe.ingredient.mod('apm_phosphoroxychlorid', 'gas-sulfur-dioxide', 50)
    apm.lib.utils.recipe.ingredient.mod('apm_phosphoroxychlorid', 'water-purified', 85)
    apm.lib.utils.recipe.result.mod('apm_phosphoroxychlorid', 'water-yellow-waste', 85)

    apm.lib.utils.recipe.ingredient.replace('apm_trimethyl_phosphate', 'petroleum-gas', 'gas-methanol')
    apm.lib.utils.recipe.ingredient.replace('apm_trimethyl_phosphate', 'gas-methane', 'gas-methanol')
    apm.lib.utils.recipe.ingredient.mod('apm_trimethyl_phosphate', 'gas-methanol', 150)
    apm.lib.utils.recipe.ingredient.mod('apm_trimethyl_phosphate', 'water-purified', 100)
    apm.lib.utils.recipe.ingredient.replace('apm_trimethyl_phosphate', 'apm_phosphorus', 'apm_phosphoroxychlorid')
    apm.lib.utils.recipe.result.mod('apm_trimethyl_phosphate', 'water-green-waste', 100)

    apm.lib.utils.recipe.ingredient.mod('apm_trimethyl_phosphate', 'apm_phosphoroxychlorid', 50)
end

if mods.angelsrefining and apm_nuclear_compat_angel then
    apm.lib.utils.recipe.ingredient.replace('apm_potassium_bromide_filltration', 'water', 'water-saline')
    apm.lib.utils.recipe.category.change('apm_radioactive_wastewater_recyling', 'water-treatment')
    apm.lib.utils.recipe.result.replace('apm_radioactive_wastewater_recyling', 'water', 'water-purified')
end

if mods.angelssmelting and apm_nuclear_compat_angel then
    if not mods.apm_power then
        apm.lib.utils.recipe.result.mod('coolant-cool-steam', 'water-purified', 45)
		apm.lib.utils.recipe.result.mod('coolant-cool-100', 'steam', 100)
		apm.lib.utils.recipe.result.mod('coolant-cool-200', 'steam', 100)
		apm.lib.utils.recipe.result.mod('coolant-cool-300', 'steam', 100)
    end

    apm.nuclear.generate_angel_coolant_recipes()
end

if mods.angelssmelting and mods.angelspetrochem and mods.bobplates and apm_nuclear_compat_angel then
    apm.lib.utils.recipe.remove('apm_fluorite_ore')
    apm.lib.utils.recipe.category.change('apm_depleted_uranium_metal_mixture', 'powder-mixing')
    apm.lib.utils.recipe.ingredient.replace('apm_depleted_uranium_metal_mixture', 'iron-plate', 'processed-iron', 2)
    --apm.lib.utils.recipe.category.change('apm_depleted_uranium_ingots', 'induction-smelting')
    --TODO Create molten metal for this...
end

-- RealisticReactors ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.RealisticReactors and apm_nuclear_compat_realistic_reactors then
    apm.lib.utils.recipe.remove('apm_nuclear_breeder')
    apm.lib.utils.recipe.remove('steam-cooling')

    local item_icon_a = apm.lib.utils.icon.get.from_fluid('water')
    local item_icon_b = {apm.lib.icons.dynamics.temp_down}
    local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.category.change('water-cooling', 'apm_fluid_cooling_0')
    apm.lib.utils.recipe.overwrite.group('water-cooling', 'apm_nuclear', 'apm_nuclear_cooling_tower', 'ab_b')
    apm.lib.utils.recipe.set.hidden('water-cooling', false)
    apm.lib.utils.recipe.energy_required.mod('water-cooling', 3.5)
    apm.lib.utils.recipe.ingredient.mod('water-cooling', 'water', 500)
    apm.lib.utils.recipe.result.mod('water-cooling', 'water', 475)
    apm.lib.utils.recipe.set.icons('water-cooling', icons)
    apm.lib.utils.recipe.set.always_show_products('water-cooling', true)
    if apm_nuclear_always_show_made_in then
        apm.lib.utils.recipe.set.always_show_made_in('water-cooling', true)
    end

    apm.lib.utils.recipe.overwrite.group('steam_condensing', 'apm_nuclear', 'apm_nuclear_cooling_tower', 'ab_c')
    apm.lib.utils.furnace.mod.category.add('rr-cooling-tower', 'apm_fluid_cooling_0')

    if not apm_nuclear_compat_realistic_reactors_cooling_tower then
        apm.lib.utils.recipe.remove('rr-cooling-tower')
    else
        apm.lib.utils.recipe.remove('apm_hybrid_cooling_tower_0')
    end
end
