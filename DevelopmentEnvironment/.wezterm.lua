-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local mux = wezterm.mux

-- position and size
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or { width = 85, height = 50 })
	window:gui_window():set_position(300, 100)
	window:set_inner_size(800, 1020)
end)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Batman"
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
-- タブを使用しない
config.show_tabs_in_tab_bar = false

-- 新規にウィンドウを開いたときのサイズを設定する
-- 高さ
-- config.initial_rows = 32
-- 幅
-- config.initial_cols = 70
-- config.window_decorations = "NONE"

-- フォントのサイズを設定する
config.font_size = 30

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

config.window_decorations = "NONE"

-- デフォルトカーソルスタイル
config.default_cursor_style = "SteadyBlock"
-- config.default_cursor_style = "BlinkingBlock"
-- config.default_cursor_style = "SteadyUnderline"
-- config.default_cursor_style = "BlinkingUnderline"
-- config.default_cursor_style = "SteadyBar"
-- config.default_cursor_style = "BlinkingBar"
-- config.animation_fps = 1
-- config.cursor_blink_ease_in = "Constant"
-- config.cursor_blink_ease_out = "Constant"

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux

-- ショートカットキー設定
-- フルスクリーンモードを切り替える。 -> Alt + Enterで切り替えが可能

-- and finally, return the configuration to wezterm
return config
