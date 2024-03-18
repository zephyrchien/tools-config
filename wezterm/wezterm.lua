local term = require('wezterm')
local act = term.action

local config = {
  use_ime = true,
  use_dead_keys = false,
  tab_bar_max_width = 64,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  warn_about_missing_glyphs = false,
  term = 'wezterm',
  font = term.font({
    family = 'Fira Code',
    weight = 'Medium',
    harfbuzz_features = {
      'calt=0', 'clig=0', 'liga=0',
      'cv11', 'ss03', 'ss05', 'ss09'
    }
  }),
  font_size = 16,
  color_scheme = 'Github',
  default_cursor_style = 'SteadyBar',
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 }
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
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' })
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' })
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
