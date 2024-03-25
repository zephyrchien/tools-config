local term = require('wezterm')
local act = term.action

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
  color_scheme = 'Github',
  default_cursor_style = 'SteadyBar',
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 },
}

config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  {
    key = 'z',
    mods = 'LEADER',
    action = act.TogglePaneZoomState
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Down',
      size = { Percent = 20 },
    },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 30 },
    },
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Up')
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Down')
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Left')
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Right')
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({ 'Up', 1 })
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({ 'Down', 1 })
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({ 'Left', 1 })
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize({ 'Right', 1 })
  },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'NONE',
    action = 'Nop'
  }
}

return config
