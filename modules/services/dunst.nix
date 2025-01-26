{ delib, host, pkgs, ... }:
delib.module {
  name = "services.dunst";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled.services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = {
        follow = "mouse";

        width = 300;
        height = "(0, 300)";
        origin = "top-right";
        offset = "(15, 49)";
        scale = 0;
        notification_limit = 0;

        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 0;
        progress_bar_corners = "all";

        icon_corners = "all";
        indicate_hidden = "yes";
        transparency = 5;
        seperator_height = 2;
        padding = 6;
        horizontal_padding = 6;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#8EC07C";
        gap_size = 0;
        seperator_color = "frame";
        sort = "no";
        font = "Iosevka Term 11";
        line_height = 3;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "center";
        vertical_alignment = "center";
        show_age_threchhold = -1;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = true;
        show_indicators = "no";

        # Icons
        enable_recursive_icon_lookup = true;
        icon_theme = "Adwaita";
        icon_position = "off";
        min_icon_size = 32;
        max_icon_size = 32;

        #History
        sticky_history = "yes";
        history_length = 15;

        # Misc
        always_run_script = true;

        corner_raduis = 0;
        corners = "all";
        ignore_dbusclose = false;

        # Wayland
        force_xwayland = false;

        # Mouse
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      urgency_low = {
        frame_color = "#3B7C87";
        foreground = "#3B7C87";
        background = "#191311";
        timeout = 4;
      };

      urgency_normal = {
        frame_color = "#5B8234";
        foreground = "#5B8234";
        background = "#191311";
        timeout = 6;
        override_pause_level = 30;
      };

      urgency_critical = {
        frame_color = "#B7472A";
        foreground = "#B7472A";
        background = "#191311";
        timeout = 8;
        override_pause_level = 60;
      };
    };
  };
}
