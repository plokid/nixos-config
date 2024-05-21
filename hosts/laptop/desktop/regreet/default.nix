{
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = ./greeter.jpg;
        fit = "Contain";
      };
      GTK = {
        # Whether to use the dark theme
        application_prefer_dark_theme = true;

        # Cursor theme name
        cursor_theme_name = "Adwaita";

        # Font name and size
        font_name = "Cantarell 16";

        # Icon theme name
        icon_theme_name = "Adwaita";

        # GTK theme name
        theme_name = "Adwaita";
      };
      commands = {
        reboot = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };
}
