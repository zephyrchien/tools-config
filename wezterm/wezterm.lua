local term = require('wezterm')

-- style --
local config = {
  term = 'wezterm',
  front_end = "WebGpu",
  use_ime = true,
  use_dead_keys = false,
  use_fancy_tab_bar = true,
  tab_max_width = 64,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  cursor_blink_rate = 0,
  status_update_interval = 20000,
  font = term.font_with_fallback({
    {
      family = 'Fira Code',
      weight = 'Medium',
      harfbuzz_features = {
        'calt=0', 'clig=0', 'liga=0',
        'cv11', 'ss03', 'ss05', 'ss09'
      }
    }, 'FiraCode Nerd Font' }),
  font_size = 14,
  default_cursor_style = 'SteadyBar',
  adjust_window_size_when_changing_font_size = false,
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 },
}

local github2 = term.color.get_builtin_schemes()['Github']
github2.ansi[4] = '#ffa500'
config.color_scheme = 'Github2'
config.color_schemes = { ['Github2'] = github2 }

-- disable mouse --
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = 'Nop'
  }
}

-- keybindings --
config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1200
}
config.keys = require('keybinds')

return config
