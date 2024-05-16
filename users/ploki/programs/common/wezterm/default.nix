{ lib, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local launch_menu = {}
      local default_prog = {}
      local set_environment_variables = {}

      -- Using shell
      table.insert(launch_menu, {
      	label = "zsh",
      	args = { "zsh", "-l" },
      })
      default_prog = { "zsh", "-l" }

      -- Title
      function basename(s)
      	return string.gsub(s, "(.*[/\\])(.*)", "%2")
      end

      wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
      	local pane = tab.active_pane

      	local index = ""
      	if #tabs > 1 then
      		index = string.format("%d: ", tab.tab_index + 1)
      	end

      	local process = basename(pane.foreground_process_name)

      	return { {
      		Text = " " .. index .. process .. " ",
      	} }
      end)

      -- Initial startup
      wezterm.on("gui-startup", function(cmd)
      	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
      	window:gui_window():maximize()
      end)

      local config = {
      	check_for_updates = false,
      	switch_to_last_active_tab_when_closing_tab = false,
      	enable_scroll_bar = true,

      	-- Window
      	native_macos_fullscreen_mode = true,
      	adjust_window_size_when_changing_font_size = true,
      	window_background_opacity = 0.9, -- 如果设置为1.0会明显卡顿
      	window_padding = {
      		left = 5,
      		right = 5,
      		top = 5,
      		bottom = 5,
      	},
      	window_background_image_hsb = {
      		brightness = 0.8,
      		hue = 1.0,
      		saturation = 1.0,
      	},
      	window_close_confirmation = "NeverPrompt",

      	-- Font
      	font = wezterm.font_with_fallback({ "JetBrains Mono" }),
      	font_size = 15,

      	-- Tab bar
      	enable_tab_bar = true,
      	hide_tab_bar_if_only_one_tab = true,
      	show_tab_index_in_tab_bar = false,
      	tab_max_width = 25,
      	scrollback_lines = 99999,
      	-- tab_bar_at_bottom = true,
      	-- use_fancy_tab_bar = false,

      	-- Keys
      	disable_default_key_bindings = false,
      	-- Allow using ^ with single key press.
      	use_dead_keys = false,

      	-- 主题
      	color_scheme = "Catppuccin Mocha",
      	colors = {
      		-- 被选中的内容的背景色
      		selection_bg = "#D0AB52",
      	},

      	inactive_pane_hsb = {
      		hue = 1.0,
      		saturation = 1.0,
      		brightness = 1.0,
      	},

      	mouse_bindings = { -- Paste on right-click
      		{
      			event = {
      				Down = {
      					streak = 1,
      					button = "Right",
      				},
      			},
      			mods = "NONE",
      			action = wezterm.action({
      				PasteFrom = "Clipboard",
      			}),
      		}, -- Change the default click behavior so that it only selects
      		-- text and doesn't open hyperlinks
      		{
      			event = {
      				Up = {
      					streak = 1,
      					button = "Left",
      				},
      			},
      			mods = "NONE",
      			action = wezterm.action({
      				CompleteSelection = "PrimarySelection",
      			}),
      		}, -- CTRL-Click open hyperlinks
      		{
      			event = {
      				Up = {
      					streak = 1,
      					button = "Left",
      				},
      			},
      			mods = "CMD",
      			action = "OpenLinkAtMouseCursor",
      		},
      	},

      	default_prog = default_prog,
      	set_environment_variables = set_environment_variables,
      	launch_menu = launch_menu,
      }
      return config
    '';
  };
}
