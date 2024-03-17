local term = require('wezterm')

local config = {
  use_ime = true,
  use_dead_keys = false,
  font = term.font('Fira Code', {
    weight = 'Medium',
  }),
  font_size = 16,
  color_scheme = 'Github',
  default_cursor_style = 'SteadyBar',
  hide_tab_bar_if_only_one_tab = true,
}

config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  {
    key = 's',
    mods = 'LEADER',
    action = term.action.SplitVertical({ domain = 'CurrentPaneDomain' })
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = term.action.SplitHorizontal({ domain = 'CurrentPaneDomain' })
  }
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = 'Nop'
  }
}

return config
