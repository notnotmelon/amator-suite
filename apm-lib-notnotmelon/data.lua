if apm == nil then apm = {} end
if not apm.lib then apm.lib = {} end

require('lib.definitions')
require('lib.utils')

require('prototypes.custom-inputs')
require('prototypes.shortcuts')

require('prototypes.smoke')
require('prototypes.alternatives')
require('prototypes.exceptions')
require('prototypes.recipe-categories')
require('prototypes.fuel-categories')
require('prototypes.module-categories')
require('prototypes.categories')
require('prototypes.signals')
require('prototypes.sounds.radiation')
require('prototypes.sounds.equipment')
require('prototypes.items')
