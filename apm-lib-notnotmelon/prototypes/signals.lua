require('util')
require('lib.log')

local self = 'apm_lib/prototypes/signals.lua'

APM_LOG_HEADER(self)

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_radioactive"
signal.icons = {
    apm.lib.icons.signal.radioactive
}
signal.icon_size = 32
signal.subgroup = "apm_signals"
signal.order = "aa_a"
data:extend({signal})

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_burnt_result"
signal.icons = {
    apm.lib.icons.signal.burnt_result
}
signal.icon_size = 32
signal.subgroup = "apm_signals"
signal.order = "ab_a"
data:extend({signal})

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_info"
signal.icons = {
    apm.lib.icons.signal.info
}
signal.icon_size = 32
signal.subgroup = "apm_signals"
signal.order = "ac_a"
data:extend({signal})

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_warning"
signal.icons = {
    apm.lib.icons.signal.warning
}
signal.icon_size = 32
signal.subgroup = "apm_signals"
signal.order = "ad_a"
data:extend({signal})

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_bullet_point"
signal.icons = {
    apm.lib.icons.signal.bullet_point
}
signal.icon_size = 32
signal.subgroup = "apm_signals"
signal.order = "ae_a"
data:extend({signal})

-- Signal ---------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local signal = {}
signal.type = "virtual-signal"
signal.name = "apm_alert_equipment_burner"
signal.icons = {
    --apm.lib.icons.signal.radioactive
    {icon='__core__/graphics/icons/alerts/fuel-icon-red.png', icon_size=64}
}
signal.icon_size = 64
signal.subgroup = "apm_signals"
signal.order = "af_a"
data:extend({signal})