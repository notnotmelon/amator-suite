require('lib.log')

local self = 'apm_lib/prototypes/inerster_final_fixes.lua'

APM_LOG_HEADER(self)

-- allow burner leech ---------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
for _, inserter in pairs(data.raw.inserter) do
    if inserter.energy_source.type == "burner" then
        inserter.allow_burner_leech = true
    end
end