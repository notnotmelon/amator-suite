require('util')
require('lib.log')

local self = 'apm_lib/prototypes/sounds/equipment.lua'

APM_LOG_HEADER(self)

-- Sound ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local sound = {}
sound.type = "sound"
sound.name = "alert_burner_equipment"
sound.variations = {}
sound.variations[1] = {}
sound.variations[1].filename = "__apm-lib-notnotmelon__/sounds/alerts/no_fuel.ogg"
sound.variations[1].volume = 0.5
data:extend({sound})