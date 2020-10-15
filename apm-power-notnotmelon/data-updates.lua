apm.lib.utils.builder.recipe.update()
require('prototypes.main.fuel')
require('prototypes.main.overwrites')
require('prototypes.main.recipes-overwrites')
require('prototypes.main.technologies-overwrites')
require('prototypes.integrations.updates')

if mods.angelsrefining then
	data.raw.recipe.apm_wood_0.normal.results[1].amount = 14
	data.raw.recipe.apm_wood_0.expensive.results[1].amount = 14
	data.raw['assembling-machine']['burner-ore-crusher'].next_upgrade = nil
end