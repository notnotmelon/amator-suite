require('util')
require('__apm-lib-notnotmelon__.lib.log')

local self = 'apm_power/prototypes/main/equipment/robots.lua'

APM_LOG_HEADER(self)

-- Item -----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local item = {}
item.type = 'item'
item.name = 'apm_zx80_construction_robot'
item.flags = {'hidden', 'hide-from-bonus-gui'}
item.icons = {
    apm.power.icons.zx80_construction_robot
}
item.stack_size = 5
item.group = "apm_other"
item.subgroup = "apm_starter_armor"
item.order = "aa_e"
item.place_result = "apm_zx80_construction_robot"
data:extend({item})

-- Robot ----------------------------------------------------------------------
--
--
-- ----------------------------------------------------------------------------
local robot = table.deepcopy(data.raw['construction-robot']['construction-robot'])
robot.name = 'apm_zx80_construction_robot'
robot.minable = {mining_time = 0.1, result = "apm_zx80_construction_robot"}
robot.flags = {'hidden'}
robot.max_payload_size = 1
robot.speed = 0.12
robot.max_energy = "500kJ"
robot.energy_per_tick = "0.04kJ"
robot.speed_multiplier_when_out_of_energy = 0.2
robot.energy_per_move = "4kJ"
robot.min_to_charge = 0.2
robot.max_to_charge = 0.95
data:extend({robot})
