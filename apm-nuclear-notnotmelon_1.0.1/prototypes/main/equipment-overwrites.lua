require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/equipment-overwrites.lua'

APM_LOG_HEADER(self)

local apm_nuclear_fission_reactor_overhaul = settings.startup["apm_nuclear_fission_reactor_overhaul"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_fission_reactor_overhaul', apm_nuclear_fission_reactor_overhaul)

if apm_nuclear_fission_reactor_overhaul then
    apm.lib.utils.item.overwrite.localised_name('fusion-reactor-equipment', {"equipment-name.apm_fission_reactor", ""})
    apm.nuclear.update_fission_equipment('fusion-reactor-equipment')
end