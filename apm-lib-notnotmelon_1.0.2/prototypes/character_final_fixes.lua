require('util')
require('lib.log')

local self = 'apm_lib/prototypes/character_final_fixes.lua'

APM_LOG_HEADER(self)

if mods.bobclasses then
    apm.lib.utils.character.crafting_category.add('bob-character-miner', 'apm_handcrafting_only')
end
