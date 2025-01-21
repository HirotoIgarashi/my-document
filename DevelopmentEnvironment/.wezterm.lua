-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
-- config.color_scheme = "iceberg-light"
-- config.color_scheme = "iceberg-dark"
config.color_scheme = "Espresso"

config.font = wezterm.font("Cica", { weight = "Medium", stretch = "Normal", style = "Normal" })

-- config.font = wezterm.font(
-- 	"Cica", { weight = "Regular", stretch = "Normal", style = "Normal" }
-- )

-- config.font = wezterm.font(
-- 	"Cica", { weight = "Bold", stretch = "Normal", style = "Normal" }
-- )
-- config.font = wezterm.font("Cica")

-- フォントのサイズを設定する
config.font_size = 18

-- 行間の調整
config.line_height = 1.4

-- 背景透過
config.window_background_opacity = 0.7

config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

config.hide_tab_bar_if_only_one_tab = true

-- デフォルトカーソルスタイル
-- config.default_cursor_style = "SteadyBlock"
config.default_cursor_style = "BlinkingBlock"
-- config.animation_fps = 1
-- config.cursor_blink_ease_in = "Constant"
-- config.cursor_blink_ease_out = "Constant"

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux

-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	-- window:gui_window():maximize()
-- 	window:gui_window():toggle_fullscreen()
-- end)
--
-- ショートカットキー設定
-- SHIFT CTRL nでフルスクリーンモードを切り替える
-- Alt + Enterでも切り替えが可能
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
