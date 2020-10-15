require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/exceptions.lua'

APM_LOG_HEADER(self)

-- ----------------------------------------------------------------------------------------------------------
-- exceptions for updating entity description:
-- ----------------------------------------------------------------------------------------------------------
apm.lib.utils.description.entities.exclude_list.add('apm_nuclear_breeder') -- apm_nuclear
apm.lib.utils.description.entities.exclude_list.add('as-chemical-fired-reactor') -- AlternativeSteam
apm.lib.utils.description.entities.exclude_list.add('se-space-capsule-_-vehicle') -- Space Exploration
apm.lib.utils.description.entities.exclude_list.add('se-antimatter-reactor') -- Space Exploration
apm.lib.utils.description.entities.exclude_list.add('warptorio-reactor') -- Warptorio2
apm.lib.utils.description.entities.exclude_list.add('realistic-reactor-breeder') -- Realistic-Reactors

-- ----------------------------------------------------------------------------------------------------------
-- exceptions for the reactor overhaul:
-- ----------------------------------------------------------------------------------------------------------
apm.lib.utils.reactor.overhaul_exceptions.add('apm_nuclear_breeder')
apm.lib.utils.reactor.overhaul_exceptions.add('burner-reactor') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('burner-reactor-2') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('burner-reactor-3') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('fluid-reactor') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('fluid-reactor-2') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('fluid-reactor-3') -- bobpower
apm.lib.utils.reactor.overhaul_exceptions.add('as-chemical-fired-reactor') -- AlternativeSteam
apm.lib.utils.reactor.overhaul_exceptions.add('se-antimatter-reactor') -- Space Exploration
apm.lib.utils.reactor.overhaul_exceptions.add('warptorio-reactor') -- Warptorio2
apm.lib.utils.reactor.overhaul_exceptions.add('realistic-reactor-breeder') -- Realistic-Reactors
