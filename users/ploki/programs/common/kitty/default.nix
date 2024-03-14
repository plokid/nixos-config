{ config, pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;
      shellIntegration = {
        mode = "enable no-cursor";
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      settings = {
        # Performance
        repaint_delay = "6";
        input_delay = "1";
        sync_to_monitor = "no";

        # Font settings
        # font_family = "FiraCode Nerd Font Mono";
        # bold_font = "auto";
        # italic_font = "auto";
        # bold_italic_font = "auto";
        # font_size = "15";
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
        update_check_interval = "0";
      };
      keybindings = { };
    };
  };
}
