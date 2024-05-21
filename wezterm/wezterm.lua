local term = require('wezterm')

-- style --
local config = {
  term = 'wezterm',
  front_end = "WebGpu",
  enable_wayland = true;
  use_ime = true,
  use_dead_keys = false,
  use_fancy_tab_bar = false,
  tab_max_width = 64,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
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
config.disable_default_key_bindings = true
config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1000
}
config.keys = require('keybinds')

-- events --
term.on('format-tab-title', function(tab)
  local idx = tab.tab_index
  local exec = tab.active_pane.foreground_process_name
  local title = string.gsub(exec, '(.*[/\\])(.*)', '%2')
  return {
    { Text = string.format(" %d: %s ", idx + 1, title) }
  }
end)

term.on('format-window-title', function(tab, _, tabs)
  local pane = tab.active_pane

  local zoomed = pane.is_zoomed and '[Z]' or ''
  local index = tab.tab_index + 1
  local dir = pane.current_working_dir.file_path

  return string.format("%s [%d/%d] ~ %s", zoomed, index, #tabs, dir)
end)
return config
