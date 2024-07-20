local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "NONE | RESIZE"

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night'
  else
    return 'Tomorrow'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

config.keys = {
  {
    key = '3',
    mods = 'ALT',
    action = wezterm.action.SendString('#'),
  },
}

config.set_environment_variables = {
  PATH = '{{binDir}}:/usr/bin:/bin:/usr/sbin:/sbin'
}

config.default_prog = { '{{binDir}}/tmux' }

return config
