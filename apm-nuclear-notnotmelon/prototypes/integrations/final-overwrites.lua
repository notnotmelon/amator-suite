require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/final-overwrites.lua'

APM_LOG_HEADER(self)

local apm_nuclear_inherit_nuclear_science_to_infinite_tech = settings.startup["apm_nuclear_inherit_nuclear_science_to_infinite_tech"].value

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_inherit_nuclear_science_to_infinite_tech', apm_nuclear_inherit_nuclear_science_to_infinite_tech)

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)

apm.lib.utils.recipe.ingredient.replace_all('uranium-238', 'apm_oxide_pellet_u238')
apm.lib.utils.recipe.ingredient.replace_all('uranium-235', 'apm_oxide_pellet_u235')
apm.lib.utils.recipe.ingredient.replace_all('uranium-fuel-cell', 'apm_fuel_rod_uranium')

apm.lib.utils.recipe.result.replace_all('uranium-238', 'apm_oxide_pellet_u238')
apm.lib.utils.recipe.result.replace_all('uranium-235', 'apm_oxide_pellet_u235')
apm.lib.utils.recipe.result.replace_all('uranium-fuel-cell', 'apm_fuel_rod_uranium')

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobpower and apm_nuclear_compat_bob then
    apm.lib.utils.recipe.ingredient.replace_all('thorium-232', 'apm_oxide_pellet_th232')
    apm.lib.utils.recipe.result.replace_all('thorium-232', 'apm_oxide_pellet_th232')

    apm.lib.utils.recipe.ingredient.replace_all('plutonium-239', 'apm_oxide_pellet_pu239')
    apm.lib.utils.recipe.result.replace_all('plutonium-239', 'apm_oxide_pellet_pu239')

    apm.lib.utils.recipe.ingredient.replace_all('thorium-fuel-cell', 'apm_fuel_rod_thorium')
    apm.lib.utils.recipe.result.replace_all('thorium-fuel-cell', 'apm_fuel_rod_thorium')

    apm.lib.utils.recipe.ingredient.replace_all('used-up-thorium-fuel-cell', 'apm_fuel_rod_thorium_active')  
    apm.lib.utils.recipe.result.replace_all('used-up-thorium-fuel-cell', 'apm_fuel_rod_thorium_active')  
end

-- entity description updates -------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

-- do not edit the hidden entities for aai-programmable-vehicles
if mods['aai-programmable-vehicles'] and apm_nuclear_compat_earendel then
    local composite_suffix = "-_-"
	for _, vehicle in pairs(data.raw.car) do
		local solid_name = vehicle.name .. composite_suffix.."solid"
		local ghost_name = vehicle.name .. composite_suffix.."ghost"
		apm.lib.utils.description.entities.exclude_list.add(solid_name)
		apm.lib.utils.description.entities.exclude_list.add(ghost_name)
	end
end

apm.lib.utils.description.entities.update()

-- recipes allow productivity modules -----------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.recipe.allow_productivity('apm_fuel_rod_container')
apm.lib.utils.recipe.allow_productivity('apm_waste_container')
apm.lib.utils.recipe.allow_productivity('apm_breeder_container')
apm.lib.utils.recipe.allow_productivity('apm_fluorite_ore')
apm.lib.utils.recipe.allow_productivity('apm_yellowcake')
apm.lib.utils.recipe.allow_productivity('apm_depleted_uranium_metal_mixture')
apm.lib.utils.recipe.allow_productivity('apm_depleted_uranium_ingots')
apm.lib.utils.recipe.allow_productivity('apm_potassium_bromide')
apm.lib.utils.recipe.allow_productivity('apm_bromine')
apm.lib.utils.recipe.allow_productivity('apm_bromine_trifluoride')
apm.lib.utils.recipe.allow_productivity('apm_hexafluoride_sample')
apm.lib.utils.recipe.allow_productivity('apm_nuclear_science_pack')
apm.lib.utils.recipe.allow_productivity('apm_rtg_radioisotope_thermoelectric_generator')

-- update infinite technologies -----------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if apm_nuclear_inherit_nuclear_science_to_infinite_tech then
    apm.nuclear.update_infinite_technologies()
end