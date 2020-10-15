if apm == nil then apm = {} end
if apm.nuclear == nil then apm.nuclear = {} end

require('lib.definitions')
require('lib.functions')

require('prototypes.main.categories')
require('prototypes.main.fluids')

require('prototypes.main.items.intermediates')
require('prototypes.main.items.entities')
require('prototypes.main.items.hexafluoride')
require('prototypes.main.items.pellets')
require('prototypes.main.items.uranium')
require('prototypes.main.items.mox')
require('prototypes.main.items.thorium')
require('prototypes.main.items.neptunium')
require('prototypes.main.items.waste')
require('prototypes.main.items.ore')
require('prototypes.main.items.purex')
require('prototypes.main.items.shielded_nuclear_fuel')
require('prototypes.main.items.science')

require('prototypes.main.equipment.rtg')
--require('prototypes.main.equipment.fission_reactor')
--require('prototypes.main.equipment.fussion_reactor')

require('prototypes.main.descriptions')

require('prototypes.main.entities.thorium')
require('prototypes.main.entities.overwrite')
require('prototypes.main.entities.breeder_reactor')
require('prototypes.main.entities.cooling_pond')
require('prototypes.main.entities.hybrid_cooling_tower')

require('prototypes.main.recipes.intermediates')
require('prototypes.main.recipes.entities')
require('prototypes.main.recipes.hexafluoride')
require('prototypes.main.recipes.pellets')
require('prototypes.main.recipes.uranium')
require('prototypes.main.recipes.mox')
require('prototypes.main.recipes.thorium')
require('prototypes.main.recipes.neptunium')
require('prototypes.main.recipes.waste')
require('prototypes.main.recipes.cooling')
require('prototypes.main.recipes.purex')
require('prototypes.main.recipes.shielded_nuclear_fuel')
require('prototypes.main.recipes.science')

require('prototypes.main.technologies')
