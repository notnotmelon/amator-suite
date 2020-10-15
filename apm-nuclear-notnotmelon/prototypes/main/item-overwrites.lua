require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/item-overwrites.lua'

APM_LOG_HEADER(self)

apm.lib.utils.item.overwrite.group('centrifuge', 'apm_nuclear', 'apm_nuclear_machines_1', 'aa_a')
apm.lib.utils.item.overwrite.group('heat-pipe', 'apm_nuclear', 'apm_nuclear_machines_1', 'ab_a')
apm.lib.utils.item.overwrite.group('heat-exchanger', 'apm_nuclear', 'apm_nuclear_machines_1', 'ac_a')
apm.lib.utils.item.overwrite.group('steam-turbine', 'apm_nuclear', 'apm_nuclear_machines_1', 'ad_a')
apm.lib.utils.item.overwrite.group('nuclear-reactor', 'apm_nuclear', 'apm_nuclear_machines_2', 'aa_a')