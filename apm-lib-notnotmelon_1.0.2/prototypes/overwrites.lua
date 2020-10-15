require('util')
require('lib.log')

local self = 'apm_lib/prototypes/overwrites.lua'

APM_LOG_HEADER(self)

apm.lib.utils.item.add.radioactive_description('uranium-fuel-cell', 2)
apm.lib.utils.item.add.radioactive_description('used-up-uranium-fuel-cell', 3)
apm.lib.utils.item.add.radioactive_description('uranium-235', 2)
