local term = require('wezterm')
local act = term.action
local act_cb = term.action_callback

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
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 },
}

local github2 = term.color.get_builtin_schemes()['Github']
github2.ansi[4] = '#ffa500'
config.color_scheme = 'Github2'
config.color_schemes = { ['Github2'] = github2 }

config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  {
    key = 'a',
    mods = 'LEADER',
    action = act.SendKey({ key = 'a', mods = 'CTRL' })
  },
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
  {
    key = 'Enter',
    mods = 'ALT',
    action = act.SendKey({ key = 'Enter', mods = 'ALT' })
  },
  {
    key = 'Enter',
    mods = 'LEADER|ALT',
    action = 'ToggleFullScreen'
  },
  {
    key = 'Enter',
    mods = 'LEADER',
    action = act_cb(function(win, _)
      local id = tostring(win:window_id())
      local dim = win:get_dimensions()
      if dim.is_full_screen then return end

      local state = term.GLOBAL.toggle_window_state or {}
      state[id] = state[id] or {
        toggled = false,
        w = dim.pixel_width,
        h = dim.pixel_height,
      }
      local new_w, new_h
      if state[id].toggled then
        new_w, new_h = state[id].w, state[id].h
      else
        new_w, new_h = 1200, 850
      end
      state[id].toggled = not state[id].toggled
      term.GLOBAL.toggle_window_state = state
      win:set_inner_size(new_w, new_h)
    end)
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
