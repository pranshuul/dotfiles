-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = false

-- For example, changing the color scheme:
config.color_scheme = "One Half Black (Gogh)"
config.font = wezterm.font("Fira Code Retina")
config.font_size = 12

config.warn_about_missing_glyphs = false
config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8

wezterm.on("toggle-colorscheme", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Zenburn" then
		overrides.color_scheme = "One Half Black (Gogh)"
	else
		overrides.color_scheme = "Zenburn"
	end
	window:set_config_overrides(overrides)
end)

-- tmux
-- config.leader = { key = "Control", mods = "ALT", timeout_milliseconds = nil }
-- config.keys = {
-- 	{
-- 		key = "e",
-- 		mods = "LEADER",
-- 		action = wezterm.action.EmitEvent("toggle-colorscheme"),
-- 	},
--
-- 	{
-- 		mods = "LEADER",
-- 		key = "c",
-- 		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "x",
-- 		action = wezterm.action.CloseCurrentPane({ confirm = true }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "b",
-- 		action = wezterm.action.ActivateTabRelative(-1),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "n",
-- 		action = wezterm.action.ActivateTabRelative(1),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "\\",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "-",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "h",
-- 		action = wezterm.action.ActivatePaneDirection("Left"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "j",
-- 		action = wezterm.action.ActivatePaneDirection("Down"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "k",
-- 		action = wezterm.action.ActivatePaneDirection("Up"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "l",
-- 		action = wezterm.action.ActivatePaneDirection("Right"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "u",
-- 		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "p",
-- 		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "i",
-- 		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "o",
-- 		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
-- 	},
-- }
--
-- for i = 0, 9 do
-- 	-- leader + number to activate that tab
-- 	table.insert(config.keys, {
-- 		key = tostring(i),
-- 		mods = "LEADER",
-- 		action = wezterm.action.ActivateTab(i),
-- 	})
-- end
--
-- keymaps
-- config.keys = {
-- 	{
-- 		key = "E",
-- 		mods = "CTRL|SHIFT|ALT",
-- 		action = wezterm.action.EmitEvent("toggle-colorscheme"),
-- 	},
-- 	{
-- 		key = "h",
-- 		mods = "CTRL|SHIFT|ALT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Right",
-- 			size = { Percent = 50 },
-- 		}),
-- 	},
-- 	{
-- 		key = "v",
-- 		mods = "CTRL|SHIFT|ALT",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Down",
-- 			size = { Percent = 50 },
-- 		}),
-- 	},
-- 	{
-- 		key = "U",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.AdjustPaneSize({ "Left", 1 }),
-- 	},
-- 	{
-- 		key = "I",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.AdjustPaneSize({ "Down", 1 }),
-- 	},
-- 	{
-- 		key = "O",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.AdjustPaneSize({ "Up", 1 }),
-- 	},
-- 	{
-- 		key = "P",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.AdjustPaneSize({ "Right", 1 }),
-- 	},
-- 	{ key = "9", mods = "CTRL", action = act.PaneSelect },
-- 	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
-- 	{
-- 		key = "O",
-- 		mods = "CTRL|ALT",
-- 		-- toggling opacity
-- 		action = wezterm.action_callback(function(window, _)
-- 			local overrides = window:get_config_overrides() or {}
-- 			if overrides.window_background_opacity == 1.0 then
-- 				overrides.window_background_opacity = 0.9
-- 			else
-- 				overrides.window_background_opacity = 1.0
-- 			end
-- 			window:set_config_overrides(overrides)
-- 		end),
-- 	},
-- }

-- tab bar
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- and finally, return the configuration to wezterm
return config
