require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/entities/overwrite.lua'

APM_LOG_HEADER(self)

apm.lib.utils.assembler.centrifuge.overhaul('centrifuge', 1)
apm.lib.utils.reactor.overhaul('nuclear-reactor', 1)
