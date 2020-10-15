require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/integrations/updates.lua'

APM_LOG_HEADER(self)

local apm_power_overhaul_machine_frames = settings.startup["apm_power_overhaul_machine_frames"].value
local apm_power_steam_assembler_craftin_with_fluids = settings.startup["apm_power_steam_assembler_craftin_with_fluids"].value
local apm_power_compat_bob = settings.startup["apm_power_compat_bob"].value
local apm_power_compat_bob_overhaul_machine_frames = settings.startup["apm_power_compat_bob_overhaul_machine_frames"].value
local apm_power_compat_angel = settings.startup["apm_power_compat_angel"].value
local apm_power_compat_angel_overhaul_machine_frames = settings.startup["apm_power_compat_angel_overhaul_machine_frames"].value
local apm_power_compat_sctm = settings.startup["apm_power_compat_sctm"].value
local apm_power_compat_sct_overhaul_machine_frames = settings.startup["apm_power_compat_sct_overhaul_machine_frames"].value
local apm_power_compat_earendel = settings.startup["apm_power_compat_earendel"].value
local apm_power_compat_bio_industries = settings.startup["apm_power_compat_bio_industries"].value
local apm_power_compat_expensivelandfillrecipe = settings.startup["apm_power_compat_expensivelandfillrecipe"].value
local apm_power_compat_kingarthur = settings.startup["apm_power_compat_kingarthur"].value
local apm_power_compat_mferrari = settings.startup["apm_power_compat_mferrari"].value
local apm_power_compat_linver = settings.startup["apm_power_compat_linver"].value
local apm_power_compat_realistic_reactors = settings.startup["apm_power_compat_realistic_reactors"].value
local apm_power_compat_reverse_factory = settings.startup["apm_power_compat_reverse_factory"].value
local apm_power_compat_suicidalkid = settings.startup["apm_power_compat_suicidalkid"].value
local apm_power_compat_kumpu = settings.startup["apm_power_compat_kumpu"].value

APM_LOG_SETTINGS(self, 'apm_power_overhaul_machine_frames', apm_power_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_steam_assembler_craftin_with_fluids', apm_power_steam_assembler_craftin_with_fluids)
APM_LOG_SETTINGS(self, 'apm_power_compat_bob', apm_power_compat_bob)
APM_LOG_SETTINGS(self, 'apm_power_compat_bob_overhaul_machine_frames', apm_power_compat_bob_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel', apm_power_compat_angel)
APM_LOG_SETTINGS(self, 'apm_power_compat_angel_overhaul_machine_frames', apm_power_compat_angel_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_sctm', apm_power_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_power_compat_sct_overhaul_machine_frames', apm_power_compat_sct_overhaul_machine_frames)
APM_LOG_SETTINGS(self, 'apm_power_compat_earendel', apm_power_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_power_compat_bio_industries', apm_power_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_power_compat_expensivelandfillrecipe', apm_power_compat_expensivelandfillrecipe)
APM_LOG_SETTINGS(self, 'apm_power_compat_kingarthur', apm_power_compat_kingarthur)
APM_LOG_SETTINGS(self, 'apm_power_compat_mferrari', apm_power_compat_mferrari)
APM_LOG_SETTINGS(self, 'apm_power_compat_linver', apm_power_compat_linver)
APM_LOG_SETTINGS(self, 'apm_power_compat_realistic_reactors', apm_power_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_power_compat_reverse_factory', apm_power_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_power_compat_suicidalkid', apm_power_compat_suicidalkid)
APM_LOG_SETTINGS(self, 'apm_power_compat_kumpu', apm_power_compat_kumpu)

-- apm ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.apm_recycling then
    apm.lib.utils.recycling.scrap.add({recipe='apm_steam_relay', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_steam_relay', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_mechanical_relay', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_mechanical_relay', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_gearing', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_electromagnet', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_electromagnet', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_filter_charcoal', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_sieve_iron', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_sieve_copper', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_press_plates', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_crusher_drums', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_saw_blade_iron', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_saw_blade_steel', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_pistions', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_machine_frame_basic', metal='iron'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_machine_frame_basic', metal='copper'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_machine_frame_steam', metal='steel'})
    apm.lib.utils.recycling.scrap.add({recipe='apm_machine_frame_advanced', metal='steel'})

    --[[
    if (mods.boblogistics and apm_power_compat_bob) or (mods.angelspetrochem and apm_power_compat_angel) then
        if not mods.angelspetrochem then
            apm.lib.utils.recycling.scrap.add(recipe='bob-valve', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='bob-topup-valve', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='bob-overflow-valve', metal='iron')
        elseif mods.angelspetrochem then
            apm.lib.utils.recycling.scrap.add(recipe='valve-check', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='valve-overflow', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='valve-return', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='valve-underflow', metal='iron')
            apm.lib.utils.recycling.scrap.add(recipe='valve-converter', metal='iron')
        end
    end
    ]]--

end

-- Reverse Factory ------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['reverse-factory'] and apm_power_compat_reverse_factory then

    local function exclude(recipe_name)
        if rf and rf.norecycle_items then  
            table.insert(rf.norecycle_items, recipe_name)
            log('Info: add recipe: "' ..tostring(recipe_name).. '" to rf.norecycle_items')
        end
    end

    exclude('apm_filter_charcoal_used_recycling')
    exclude('apm_coal_ash_washing')
    exclude('apm_coal_ash_production')
    exclude('apm_seawater_centrifuging')
    exclude('apm_dirty_water_purification')
    exclude('apm_coal_saturated_wastewater_seperation')
    exclude('apm_crusher_drums_used_repair')
    exclude('apm_sea_water_from_void_1')
    exclude('apm_sea_water_from_void_2')
    exclude('apm_coal_crushed_1')
    exclude('apm_coal_crushed_2')
    exclude('apm_coal_crushed_3')
    exclude('apm_coal_briquette_pressed_1')
    exclude('apm_coal_briquette_pressed_2')
    exclude('apm_coal_briquette_pressed_3')
    exclude('apm_pyrolysis_coke_1')
    exclude('apm_pyrolysis_coke_2')
    exclude('apm_pyrolysis_coke_3')
    exclude('apm_pyrolysis_coke_4')
    exclude('apm_pyrolysis_coke_5')
    exclude('apm_coke_crushed')
    exclude('apm_coke_brick')
    exclude('apm_wood_pellets_1')
    exclude('apm_wood_pellets_2')
    exclude('apm_wood_briquette_1')
    exclude('apm_wood_briquette_2')
    exclude('apm_pyrolysis_charcoal_1')
    exclude('apm_pyrolysis_charcoal_2')
    exclude('apm_pyrolysis_charcoal_3')
    exclude('apm_pyrolysis_charcoal_4')
    exclude('apm_charcoal_brick')
    exclude('apm_wood_0')
    exclude('apm_wood_1')
    exclude('apm_wood_2')
    exclude('apm_press_plates_used_grind')
    exclude('apm_steel_0')
    exclude('apm_steel_1')
    exclude('steel-plate')
    exclude('apm_industrial_science_pack_0')
    exclude('apm_industrial_science_pack_1')
    exclude('apm_dry_mud')
    exclude('apm_dry_mud_sifting_iron')
    exclude('apm_dry_mud_sifting_copper')
    exclude('apm_raw_crucible_0')
    exclude('apm_raw_crucible_1')
    exclude('apm_stone_crucible')
    exclude('apm_saw_blade_iron_maintenance')
    exclude('apm_saw_blade_steel_maintenance')
    exclude('apm_stone_brick_raw')
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['aai-industry'] and apm_power_compat_earendel then
	-- overwrite fuel categorys on all car if they have a burner and uses 'checmical' as fuel category
	--apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('car', 'apm_refined_chemical', {'apm_refined_chemical', 'apm_vehicle_only'})
	apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('car', 'chemical', {'chemical', 'apm_refined_chemical', 'apm_vehicle_only'})
	-- overwrite fuel categorys on all locomotive if they have a burner and uses 'checmical' as fuel category
	apm.lib.utils.entities.set.fuel_categoriy_to_all_with_condition('locomotive', 'chemical', {'chemical', 'apm_refined_chemical', 'apm_vehicle_only', 'apm_rocket'})
	--
	apm.lib.utils.car.add.fuel_category('tank', 'apm_vehicle_only')
end

if mods['aai-vehicles-hauler'] and apm_power_compat_earendel then
	apm.lib.utils.car.set.fuel_category('vehicle-hauler', {'chemical', 'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-hauler', 'apm_vehicle_only')
	end
end

if mods['aai-vehicles-miner'] and apm_power_compat_earendel then
	apm.lib.utils.car.overhaul('vehicle-miner')
	apm.lib.utils.car.set.fuel_category('vehicle-miner', 'chemical')
	apm.lib.utils.car.set.fuel_category('vehicle-miner-mk2', {'apm_refined_chemical'})
	if not mods.apm_energy_addon then
		apm.lib.utils.car.set.fuel_category('vehicle-miner-mk3', {'apm_refined_chemical'})
		apm.lib.utils.car.set.fuel_category('vehicle-miner-mk4', {'apm_refined_chemical'})
	end
	apm.lib.utils.car.set.fuel_category('vehicle-miner-mk5', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-miner-mk2', 'apm_vehicle_only')
		if not mods.apm_energy_addon then
			apm.lib.utils.car.add.fuel_category('vehicle-miner-mk3', 'apm_vehicle_only')
			apm.lib.utils.car.add.fuel_category('vehicle-miner-mk4', 'apm_vehicle_only')
		end
		apm.lib.utils.car.add.fuel_category('vehicle-miner-mk5', 'apm_vehicle_only')
	end
	-- the vehicle-miner need a effectivity of 2 to work correct
    apm.lib.utils.car.effectivity('vehicle-miner', 2)
    apm.lib.utils.car.effectivity('vehicle-miner-mk2', 2)
	apm.lib.utils.car.effectivity('vehicle-miner-mk3', 2)
	apm.lib.utils.car.effectivity('vehicle-miner-mk4', 2)
	apm.lib.utils.car.effectivity('vehicle-miner-mk5', 2)
end

if mods['aai-vehicles-warden'] and apm_power_compat_earendel then
	apm.lib.utils.car.set.fuel_category('vehicle-warden', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-warden', 'apm_vehicle_only')
	end
	apm.lib.utils.car.effectivity('vehicle-warden', 2)
end

if mods['aai-vehicles-chaingunner'] and apm_power_compat_earendel then
	apm.lib.utils.car.set.fuel_category('vehicle-chaingunner', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-chaingunner', 'apm_vehicle_only')
	end
end

if mods['aai-vehicles-flame-tank'] and apm_power_compat_earendel then
	apm.lib.utils.car.set.fuel_category('vehicle-flame-tank', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-flame-tank', 'apm_vehicle_only')
	end
end

if mods['aai-vehicles-flame-tumbler'] and apm_power_compat_earendel then
	apm.lib.utils.car.set.fuel_category('vehicle-flame-tumbler', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('vehicle-flame-tumbler', 'apm_vehicle_only')
	end
end

if mods['aai-vehicles-laser-tank'] and apm_power_compat_earendel then
	if not mods.apm_energy_addon then
		apm.lib.utils.car.set.fuel_category('vehicle-laser-tank', {'apm_refined_chemical'})
		if mods['aai-industry'] then
			apm.lib.utils.car.add.fuel_category('vehicle-laser-tank', 'apm_vehicle_only')
		end
	end
end

-- Aircraft --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['Aircraft'] and apm_power_compat_suicidalkid then
	apm.lib.utils.car.set.fuel_category('gunship', {'apm_refined_chemical', 'apm_rocket'})
	apm.lib.utils.car.set.fuel_category('cargo-plane', {'apm_refined_chemical', 'apm_rocket'})
	apm.lib.utils.car.set.fuel_category('jet', {'apm_refined_chemical', 'apm_rocket'})
	apm.lib.utils.car.set.fuel_category('flying-fortress', {'apm_refined_chemical', 'apm_rocket'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('gunship', 'apm_vehicle_only')
		apm.lib.utils.car.add.fuel_category('cargo-plane', 'apm_vehicle_only')
		apm.lib.utils.car.add.fuel_category('jet', 'apm_vehicle_only')
		apm.lib.utils.car.add.fuel_category('flying-fortress', 'apm_vehicle_only')
	end
end

-- Helicopters -----------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['Helicopters'] and apm_power_compat_kumpu then
	apm.lib.utils.car.set.fuel_category('heli-placement-entity-_-', {'apm_refined_chemical', 'apm_rocket'})
	apm.lib.utils.car.set.fuel_category('heli-entity-_-', {'apm_refined_chemical', 'apm_rocket'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('heli-placement-entity-_-', 'apm_vehicle_only')
		apm.lib.utils.car.add.fuel_category('heli-entity-_-', 'apm_vehicle_only')
	end
end

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobvehicleequipment and apm_power_compat_bob then
	apm.lib.utils.car.set.fuel_category('bob-tank-2', {'apm_refined_chemical'})
	apm.lib.utils.car.set.fuel_category('bob-tank-3', {'apm_refined_chemical'})
	if mods['aai-industry'] then
		apm.lib.utils.car.add.fuel_category('bob-tank-2', 'apm_vehicle_only')
		apm.lib.utils.car.add.fuel_category('bob-tank-3', 'apm_vehicle_only')
	end
end