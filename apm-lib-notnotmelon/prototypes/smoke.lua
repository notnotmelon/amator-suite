require('util')
require('lib.log')

local self = 'apm_lib/prototypes/smoke.lua'

APM_LOG_HEADER(self)

local trivial_smoke = function(opts)
  return
  {
    type = "trivial-smoke",
    name = opts.name,
    duration = opts.duration or 600,
    fade_in_duration = opts.fade_in_duration or 0,
    fade_away_duration = opts.fade_away_duration or ((opts.duration or 600) - (opts.fade_in_duration or 0)),
    spread_duration = opts.spread_duration or 600,
    start_scale = opts.start_scale or 0.20,
    end_scale = opts.end_scale or 1.0,
    color = opts.color,
    cyclic = true,
    affected_by_wind = opts.affected_by_wind or true,
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    }
  }
end

data:extend({
    trivial_smoke{name = "apm_dark_smoke", color = {r = 0.32, g = 0.32, b = 0.32, a = 0.4}, duration=1000},
    trivial_smoke{name = "apm_dark_light_smoke", color = {r = 0.32, g = 0.32, b = 0.32, a = 0.3}, duration=800}
})