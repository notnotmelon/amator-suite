require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_nuclear/prototypes/main/recipes/entities.lua'

APM_LOG_HEADER(self)

local apm_nuclear_always_show_made_in = settings.startup["apm_nuclear_always_show_made_in"].value
APM_LOG_SETTINGS(self, 'apm_nuclear_always_show_made_in', apm_nuclear_always_show_made_in)

-- Uniques --------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
data:extend(
{
    {
        type = "recipe",
        name = "apm_cooling_pond_0",
        normal = {
            enabled = false,
            energy_required = 2,
            ingredients = {
                {type="item", name="processing-unit", amount=10},
                {type="item", name="pipe", amount=10},
                {type="item", name="steel-plate", amount=15},
                {type="item", name="copper-plate", amount=30}
            },
            results = { 
                {type='item', name='apm_cooling_pond_0', amount=1},
            },
            main_product = 'apm_cooling_pond_0',
            requester_paste_multiplier = 4,
            always_show_products = true,
            always_show_made_in = apm_nuclear_always_show_made_in
        },
        expensive = {
            enabled = false,
            energy_required = 2,
            ingredients = {
                {type="item", name="processing-unit", amount=10},
                {type="item", name="pipe", amount=20},
                {type="item", name="steel-plate", amount=15},
                {type="item", name="copper-plate", amount=30}
            },
            results = { 
                {type='item', name='apm_cooling_pond_0', amount=1},
            },
            main_product = 'apm_cooling_pond_0',
            requester_paste_multiplier = 4,
            always_show_products = true,
            always_show_made_in = apm_nuclear_always_show_made_in
        }
    },
    {
        type = "recipe",
        name = "apm_hybrid_cooling_tower_0",
        normal = {
            enabled = false,
            energy_required = 2,
            ingredients = {
                {type="item", name="pipe", amount=20},
                {type="item", name="iron-plate", amount=20},
                {type="item", name="steel-plate", amount=10},
                {type="item", name="copper-plate", amount=30}
            },
            results = { 
                {type='item', name='apm_hybrid_cooling_tower_0', amount=1},
            },
            main_product = 'apm_hybrid_cooling_tower_0',
            requester_paste_multiplier = 4,
            always_show_products = true,
            always_show_made_in = apm_nuclear_always_show_made_in
        },
        expensive = {
            enabled = false,
            energy_required = 2,
            ingredients = {
                {type="item", name="pipe", amount=20},
                {type="item", name="iron-plate", amount=20},
                {type="item", name="steel-plate", amount=10},
                {type="item", name="copper-plate", amount=30}
            },
            results = { 
                {type='item', name='apm_hybrid_cooling_tower_0', amount=1},
            },
            main_product = 'apm_hybrid_cooling_tower_0',
            requester_paste_multiplier = 4,
            always_show_products = true,
            always_show_made_in = apm_nuclear_always_show_made_in
        }
    },
    {
        type = "recipe",
        name = "apm_nuclear_breeder",
        normal = {
            enabled = false,
            energy_required = 10,
            ingredients = {
                {type="item", name="nuclear-reactor", amount=1},
                {type="item", name="productivity-module-3", amount=20},
                {type="item", name="steel-plate", amount=500},
                {type="item", name="concrete", amount=500},
            },
            results = { 
                {type="item", name="apm_nuclear_breeder", amount=1},
            },
            main_product = 'apm_nuclear_breeder',
            requester_paste_multiplier = 4,
            always_show_products = true
        },
        expensive = {
            enabled = false,
            energy_required = 10,
            ingredients = {
                {type="item", name="nuclear-reactor", amount=1},
                {type="item", name="productivity-module-3", amount=30},
                {type="item", name="steel-plate", amount=750},
                {type="item", name="concrete", amount=500},
            },
            results = { 
                {type="item", name="apm_nuclear_breeder", amount=1},
            },
            main_product = 'apm_nuclear_breeder',
            requester_paste_multiplier = 4,
            always_show_products = true
        }
    },
})
