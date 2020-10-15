require('util')
require('lib.log')

local self = 'apm_lib/prototypes/categories.lua'

APM_LOG_HEADER(self)

-- Subgroups ------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.category.create.subgroup('signals', 'apm_signals', 'za_a')

-- Other ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
apm.lib.utils.category.create.group('apm_other', '__apm_resource_pack__/graphics/categories/apm_other.png', 'z-zz')