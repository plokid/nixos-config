{ config, pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;
      environment = {
        # Performance
        repaint_delay = "6";
        input_delay = "1";
        sync_to_monitor = "no";

        # Font settings
        font_family = "FiraCode Nerd Font Mono";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = "15";
        disable_ligatures = "never";
        # adjust_line_height           =   1

        # Mouse
        copy_on_select = "yes";
        strip_trailing_spaces = "always";

        # Cursor
        cursor_shape = "block";
        cursor_blink_interval = "0";

        # Window layout
        window_border_width = "1 px";
        hide_window_decorations = "yes";

        # Bell
        enable_audio_bell = "no";
        window_alert_on_bell = "yes";
        bell_on_tab = "no";

        # # Tab Bar
        # tab_bar_edge                    bottom
        # tab_bar_style                   powerline
        # tab_powerline_style             angled
        # tab_bar_min_tabs                1
        # tab_bar_align                   left

        # Advance
        shell_integration = "enabled no-cursor";
        update_check_interval = "0";

        ## color schema name: Tokyo Night
        ## license: MIT
        ## author: Folke Lemaitre
        ## upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/kitty_tokyonight_night.conf
        background = "#1a1b26";
        foreground = "#c0caf5";
        selection_background = "#33467C";
        selection_foreground = "#c0caf5";
        url_color = "#73daca";
        cursor = "#c0caf5";

        # Tabs
        active_tab_background = "#7aa2f7";
        active_tab_foreground = "#1f2335";
        inactive_tab_background = "#292e42";
        inactive_tab_foreground = "#545c7e";
        #tab_bar_background = "#15161E";

        # normal
        color0 = "#15161E";
        color1 = "#f7768e";
        color2 = "#9ece6a";
        color3 = "#e0af68";
        color4 = "#7aa2f7";
        color5 = "#bb9af7";
        color6 = "#7dcfff";
        color7 = "#a9b1d6";

        # bright
        color8 = "#414868";
        color9 = "#f7768e";
        color10 = "#9ece6a";
        color11 = "#e0af68";
        color12 = "#7aa2f7";
        color13 = "#bb9af7";
        color14 = "#7dcfff";
        color15 = "#c0caf5";

        # extended colors
        color16 = "#ff9e64";
        color17 = "#db4b4b";
      };
      keybindings = { };
    };
  };
}
