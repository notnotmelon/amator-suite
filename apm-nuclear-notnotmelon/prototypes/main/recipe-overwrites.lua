require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipe-overwrites.lua'

APM_LOG_HEADER(self)

apm.lib.utils.recipe.ingredient.mod('uranium-rounds-magazine', 'uranium-238', 0)
apm.lib.utils.recipe.ingredient.mod('uranium-rounds-magazine', 'apm_depleted_uranium_ingots', 5, 7)

apm.lib.utils.recipe.ingredient.mod('uranium-cannon-shell', 'uranium-238', 0)
apm.lib.utils.recipe.ingredient.mod('uranium-cannon-shell', 'apm_depleted_uranium_ingots', 5, 7)

apm.lib.utils.recipe.ingredient.mod('explosive-uranium-cannon-shell', 'uranium-238', 0)
apm.lib.utils.recipe.ingredient.mod('explosive-uranium-cannon-shell', 'apm_depleted_uranium_ingots', 5, 7)

apm.lib.utils.recipe.ingredient.mod('nuclear-fuel', 'uranium-235', 0)
apm.lib.utils.recipe.ingredient.mod('nuclear-fuel', 'rocket-fuel', 0)
apm.lib.utils.recipe.ingredient.mod('nuclear-fuel', 'apm_oxide_pellet_pu239', 2)
apm.lib.utils.recipe.ingredient.mod('nuclear-fuel', 'rocket-fuel', 10)
apm.lib.utils.recipe.result.mod('nuclear-fuel', 'nuclear-fuel', 10)

apm.lib.utils.recipe.ingredient.mod('atomic-bomb', 'uranium-235', 0)
apm.lib.utils.recipe.ingredient.mod('atomic-bomb', 'apm_oxide_pellet_pu239', 15, 30)

apm.lib.utils.recipe.ingredient.mod('fusion-reactor-equipment', 'apm_depleted_uranium_ingots', 5, 10)
--apm.lib.utils.recipe.ingredient.mod('fusion-reactor-equipment', 'water', 5, 50)

apm.lib.utils.recipe.ingredient.mod('satellite', 'apm_rtg_radioisotope_thermoelectric_generator', 25, 40)

apm.lib.utils.recipe.remove('nuclear-fuel-reprocessing')
apm.lib.utils.recipe.remove('uranium-fuel-cell')
apm.lib.utils.recipe.remove('uranium-processing')
apm.lib.utils.recipe.remove('kovarex-enrichment-process')