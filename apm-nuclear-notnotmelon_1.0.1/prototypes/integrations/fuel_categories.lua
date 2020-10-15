require ('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/integrations/fuel_categories.lua'

APM_LOG_HEADER(self)

local apm_nuclear_compat_bob = settings.startup["apm_nuclear_compat_bob"].value
local apm_nuclear_compat_angel = settings.startup["apm_nuclear_compat_angel"].value
local apm_nuclear_compat_earendel = settings.startup["apm_nuclear_compat_earendel"].value
local apm_nuclear_compat_bio_industries = settings.startup["apm_nuclear_compat_bio_industries"].value
local apm_nuclear_compat_sctm = settings.startup["apm_nuclear_compat_sctm"].value
local apm_nuclear_compat_realistic_reactors = settings.startup["apm_nuclear_compat_realistic_reactors"].value
local apm_nuclear_compat_realistic_reactors_cooling_tower = settings.startup["apm_nuclear_compat_realistic_reactors_cooling_tower"].value
local apm_nuclear_compat_reverse_factory = settings.startup["apm_nuclear_compat_reverse_factory"].value
local apm_nuclear_compat_mferrari = settings.startup["apm_nuclear_compat_mferrari"].value

APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bob', apm_nuclear_compat_bob)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_angel', apm_nuclear_compat_angel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_earendel', apm_nuclear_compat_earendel)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_bio_industries', apm_nuclear_compat_bio_industries)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_sctm', apm_nuclear_compat_sctm)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors', apm_nuclear_compat_realistic_reactors)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_realistic_reactors_cooling_tower', apm_nuclear_compat_realistic_reactors_cooling_tower)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_reverse_factory', apm_nuclear_compat_reverse_factory)
APM_LOG_SETTINGS(self, 'apm_nuclear_compat_mferrari', apm_nuclear_compat_mferrari)

-- bob ------------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.bobpower and mods.bobplates and apm_nuclear_compat_bob then
    apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor-2', {'apm_nuclear_uranium', 'apm_nuclear_mox', 'apm_nuclear_neptunium', 'apm_nuclear_thorium'})
    apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor-3', {'apm_nuclear_uranium', 'apm_nuclear_mox', 'apm_nuclear_neptunium', 'apm_nuclear_thorium'})

    if apm.lib.utils.item.exist('deuterium') then
        apm.lib.utils.reactor.add.fuel_category('nuclear-reactor', 'apm_nuclear_deuterium')
        apm.lib.utils.reactor.add.fuel_category('nuclear-reactor-2', 'apm_nuclear_deuterium')
        apm.lib.utils.reactor.add.fuel_category('nuclear-reactor-3', 'apm_nuclear_deuterium')
    end

    if apm.lib.utils.setting.get.starup('bobmods-power-nuclear') then
        if apm.lib.utils.item.exist('thorium-ore') then
            apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor', {'apm_nuclear_uranium', 'apm_nuclear_mox', 'apm_nuclear_neptunium'})
            apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor-2', {'apm_nuclear_thorium'})
            apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor-3', {'apm_nuclear_thorium'})
        end
        if apm.lib.utils.item.exist('deuterium') then
            apm.lib.utils.reactor.set.fuel_categories('nuclear-reactor-3', {'apm_nuclear_deuterium'})
        end
    end
end

-- Earendel -------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods['space-exploration'] and apm_nuclear_compat_earendel then
    apm.lib.utils.reactor.set.fuel_categories('se-antimatter-reactor', {'antimatter'})
end

-- RealisticReactors ----------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
if mods.RealisticReactors and apm_nuclear_compat_realistic_reactors then
    apm.lib.utils.reactor.set.fuel_categories('realistic-reactor-breeder', {'apm_nuclear_breeder'})
    --[[
    Without the following iteration an error will occur:
        151.679 Error MainLoop.cpp:1195: Exception at tick 5828: The mod RealisticReactors caused a non-recoverable error.
        Please report this error to the mod author.

        Error while running event RealisticReactors::on_tick (ID 0)
        LuaItemStack API call when LuaItemStack was invalid for read.
        stack traceback:
        __RealisticReactors__/control.lua:984: in function <__RealisticReactors__/control.lua:750>
        stack traceback:
        [C]: in function '__index'
        __RealisticReactors__/control.lua:984: in function <__RealisticReactors__/control.lua:750>
    ]]--
    local function insert_categories(reactor, categories)
        reactor.energy_source.fuel_categories = {} -- empty this first
        for _, cat in pairs(categories) do
            if data.raw["fuel-category"][cat] then
                table.insert(reactor.energy_source.fuel_categories,cat)
            end
        end
    end

    local apm_cats = {'apm_nuclear_uranium', 'apm_nuclear_mox', 'apm_nuclear_neptunium', 'apm_nuclear_thorium', 'apm_nuclear_deuterium', 'apm_nuclear_breeder'}
    for i=1, 250 do
        insert_categories(data.raw.reactor["realistic-reactor-"..i], apm_cats)
    end
end
