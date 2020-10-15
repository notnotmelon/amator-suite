require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/equipment_grids.lua'

APM_LOG_HEADER(self)

local grid = {}
grid.type = "equipment-grid"
grid.name = "apm_equipment_grid_starter"
grid.locked = true
grid.width = 5
grid.height = 2
grid.equipment_categories = {'apm_starter_equipment'}
data:extend({grid})