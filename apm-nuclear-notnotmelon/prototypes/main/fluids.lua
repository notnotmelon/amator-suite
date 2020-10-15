require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/fluids.lua'

APM_LOG_HEADER(self)

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local function CreateHexafluoride(i)
    local enrichment = 2+((i-1)*5)
    local base_color = {r=0.0, g=0.3+(i*0.035), b=0.3+(i*0.035)}
    local flow_color = {r=0.0, g=0.85, b=0.85}
    
    fluid = {}
    fluid.type = 'fluid'
    fluid.name = 'apm_nuclear_hexafluoride_' .. string.format("%03d",enrichment)
    fluid.localised_name = {"fluid-name.apm_nuclear_hexafluoride", tostring(enrichment/10)}
    fluid.icons = apm.nuclear.icons.get_apm_hexafluoride_enrichment(enrichment)
    fluid.icon_size = 32
    fluid.base_color = base_color
    fluid.flow_color = flow_color
    fluid.default_temperature = 57.5
    fluid.gas_temperature = 56.5
    fluid.max_temperature = 57.5
    fluid.heat_capacity = "0.1KJ"
    fluid.pressure_to_speed_ratio = 0.4
    fluid.flow_to_energy_ratio = 0.59
    fluid.group = "apm_nuclear"
    fluid.subgroup = "apm_nuclear_hexafluoride"
    fluid.order = 'aa_['.. string.format("%03d",enrichment) ..']'
    fluid.auto_barrel = false
    data:extend({fluid})
end

-- Function -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
function CreateNitricAcidFuelSolution(suffix, tint_1, tint_2, subgroup, order)
    --local enrichment = i*5 + 27
    local fluid = {}
    fluid.type = 'fluid'
    fluid.name = 'apm_purex_solution_' .. tostring(suffix)
    fluid.icons = apm.lib.utils.icon.generate.fluid(tint_1, tint_2, apm.lib.icons.dynamics.radioactive)
    fluid.group = "apm_nuclear"
    fluid.subgroup = subgroup
    fluid.order = order
    fluid.icon_size = 32
    fluid.base_color = tint_1
    fluid.flow_color = tint_2
    fluid.default_temperature = 25
    fluid.max_temperature = 25
    fluid.heat_capacity = "0.1KJ"
    fluid.pressure_to_speed_ratio = 0.4
    fluid.flow_to_energy_ratio = 0.59
    data:extend({fluid})
end

-- Action ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
for i = 1,10 do
    CreateHexafluoride(i)
end

CreateNitricAcidFuelSolution('uranium', {r=0.004, g=0.444, b=0.004}, {r=0.018, g=0.486, b=0.018}, 'apm_nuclear_recycling_stage_a', 'aa_a')
CreateNitricAcidFuelSolution('mox', {r=0.861, g=0.756, b=0.051}, {r=0.961, g=0.856, b=0.051}, 'apm_nuclear_recycling_stage_a', 'ab_a')
CreateNitricAcidFuelSolution('thorium', {r=0.549, g=0.318, b=0.133}, {r=0.648, g=0.384, b=0.175}, 'apm_nuclear_recycling_stage_a', 'ad_a')
CreateNitricAcidFuelSolution('neptunium', {r=0.861, g=0.247, b=0.051}, {r=0.961, g=0.327, b=0.051}, 'apm_nuclear_recycling_stage_a', 'ae_a')
CreateNitricAcidFuelSolution('breeder_uranium', {r=0.155, g=0.693, b=0.762}, {r=0.4, g=0.863, b=0.973}, 'apm_nuclear_recycling_stage_a', 'ba_a')
CreateNitricAcidFuelSolution('thorium_breeder', {r=0.632, g=0.480, b=0.098}, {r=0.725, g=0.499, b=0.126}, 'apm_nuclear_recycling_stage_a', 'bb_a')

-- Uniques --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------

data:extend(
{
	{
		type = "fluid",
		name = "apm_bromine",
		default_temperature = 25,
        gas_temperature = 58.5,
        max_temperature = 59.5,
		heat_capacity = "0.2KJ",
        base_color = {r=0.616, g=0.114, b=0.047},
        flow_color = {r=0.916, g=0.414, b=0.347},
        icons = apm.lib.utils.icon.generate.chemical({r=0.616, g=0.114, b=0.047}, nil, {r=0.616, g=0.114, b=0.047}, {r=0.616, g=0.114, b=0.047}, apm.nuclear.icons.bromine),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_chemistry",
        order = 'ab_b',
	},
	{
		type = "fluid",
		name = "apm_bromine_trifluoride",
		default_temperature = 25,
        gas_temperature = 0,
        max_temperature = 25,
		heat_capacity = "0.2KJ",
        base_color = {r=0.615, g=0.765, b=0.027},
        flow_color = {r=0.616, g=0.114, b=0.047},
		icons = apm.lib.utils.icon.generate.chemical({r=0.615, g=0.765, b=0.027}, nil, {r=0.616, g=0.114, b=0.047}, {r=0.615, g=0.765, b=0.027}, apm.nuclear.icons.bromine_trifluoride),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_chemistry",
        order = 'ab_c',
	},
    {
        type = "fluid",
        name = "apm_phosphoroxychlorid",
        default_temperature = 25,
        max_temperature = 25,
        heat_capacity = "0.2KJ",
        base_color = {r=0.150, g=0.600, b=0.000},
        flow_color = {r=0.900, g=0.000, b=0.000},
        icons = apm.lib.utils.icon.generate.chemical({r=0.150, g=0.800, b=0.000}, nil, {r=0.9, g=0.5, b=0.0}, {r=0.900, g=0.000, b=0.000}, apm.nuclear.icons.phosphoroxychlorid),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_chemistry",
        order = 'ad_f',
    },
    {
        type = "fluid",
        name = "apm_trimethyl_phosphate",
        default_temperature = 25,
        gas_temperature = 197.0,
        max_temperature = 200,
        heat_capacity = "0.2KJ",
        base_color = {r=0.730, g=0.800, b=0.800},
        flow_color = {r=0.900, g=1.000, b=1.000},
        icons = apm.lib.utils.icon.generate.chemical({r=0.9, g=0.9, b=0.9}, {r=0.2, g=0.2, b=0.2}, {r=0.9, g=0.5, b=0.0}, {r=0.900, g=0.000, b=0.000}, apm.nuclear.icons.trimethyl_phosphate),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_chemistry",
        order = 'ae_a',
    },
    {
        type = "fluid",
        name = "apm_tbp_30",
        default_temperature = 25,
        gas_temperature = 293.5,
        max_temperature = 300,
        heat_capacity = "0.2KJ",
        base_color = {r=0.730, g=0.800, b=0.600},
        flow_color = {r=0.800, g=0.700, b=0.600},
        icons = apm.lib.utils.icon.generate.fluid({r=0.730, g=0.800, b=0.600}, {r=0.800, g=0.700, b=0.600}),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_chemistry",
        order = 'af_a',
    },
    {
        type = "fluid",
        name = "apm_hot_water",
        default_temperature = 90,
        gas_temperature = 99.5,
        max_temperature = 100,
        heat_capacity = "0.2KJ",
        base_color = {r=0.000, g=0.340, b=0.600},
        flow_color = {r=0.700, g=0.700, b=0.700},
        --icons = apm.lib.utils.icon.generate.fluid({r=0.169, g=0.568, b=0.595}, {r=0.700, g=0.700, b=0.700}, nil, {r=0.950, g=0.514, b=0.263}),
        icons = apm.lib.utils.icon.generate.fluid({r=0.169, g=0.568, b=0.595}, {r=0.700, g=0.700, b=0.700}, nil, {r=0.950, g=0.314, b=0.163}),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_waste_products",
        order = 'za_a'
    },
    {
        type = "fluid",
        name = "apm_radioactive_wastewater",
        default_temperature = 15,
        gas_temperature = 99.5,
        max_temperature = 100,
        heat_capacity = "0.2KJ",
        base_color = {r=0.5, g=1.0, b=0.0},
        flow_color = {r=0.7, g=1.0, b=0.0},
        icons = apm.lib.utils.icon.generate.fluid({r=0.62, g=0.81, b=0.0}, {r=0.65, g=0.89, b=0.0}, apm.lib.icons.dynamics.radioactive),
        icon_size = 32,
        group = "apm_nuclear",
        subgroup = "apm_nuclear_waste_products",
        order = 'zb_a'
    },
})
