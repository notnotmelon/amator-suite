require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/icon-overwrites.lua'

APM_LOG_HEADER(self)

local apm_nuclear_inherit_nuclear_science_to_infinite_tech = settings.startup["apm_nuclear_inherit_nuclear_science_to_infinite_tech"].value

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_inherit_nuclear_science_to_infinite_tech', apm_nuclear_inherit_nuclear_science_to_infinite_tech)

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)

-- angel ----------------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------------------
if mods.angelsrefining and apm_nuclear_compat_angel then
	local item_icon_a = {apm.nuclear.icons.angel_sort_icon}
	local item_icon_b = apm.lib.utils.icon.get.from_item('thorium-ore')
	item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.5, {10, 10})
	local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b})
    apm.lib.utils.recipe.set.icons('angelsore-crystal-mix6-processing', icons)

	local item_icon_a = {apm.nuclear.icons.angel_slag_processing_blank}
	local item_icon_b = apm.lib.utils.icon.get.from_item('uranium-ore')
	item_icon_b = apm.lib.utils.icons.mod(item_icon_b, 0.32, {-12, 12})
    local item_icon_c = apm.lib.utils.icon.get.from_item('fluorite-ore')
	item_icon_c = apm.lib.utils.icons.mod(item_icon_c, 0.32, {12, 12})
    local item_icon_d = apm.lib.utils.icon.get.from_item('thorium-ore')
	item_icon_d = apm.lib.utils.icons.mod(item_icon_d, 0.32, {0, 12})
	local icons = apm.lib.utils.icon.merge({item_icon_a, item_icon_b, item_icon_c, item_icon_d})
    apm.lib.utils.recipe.set.icons('slag-processing-9', icons)
end