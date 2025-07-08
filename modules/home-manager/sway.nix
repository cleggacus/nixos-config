{ config, pkgs, ... }:

let
  wallpaper = ../../wallpapers/wallpaper.jpg;
  live_wallpaper = ../../wallpapers/wallpaper.gif;

  swayfx-flake = builtins.getFlake "github:WillPower3309/swayfx";
  swayfx-pkg = swayfx-flake.packages.${pkgs.system}.default;

  python_script = builtins.toPath ./sway.py;
in {
  imports = [
    ./waybar.nix
    ./wofi.nix
    ./kitty.nix
    ./mako.nix
  ];


  nixpkgs.overlays = [
    (final: prev: {
      swayfx = swayfx-pkg;
    })
  ];

  home.packages = with pkgs; [
    mpvpaper
    (python3.withPackages (ps: with ps; [ i3ipc ]))
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    systemd.enable = true;
    extraConfig = ''
      blur enable
      blur_radius 3
      corner_radius 10
      shadows enable
      shadows_on_csd enable
      shadow_blur_radius 15
      shadow_color #0000008F
      shadow_offset 5 5
      focus_follows_mouse no
    '';
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "wofi --normal-window";
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      gaps = {
        inner = 20;
      };
      colors = {
        focused = {
          border = "#FF79C6";
          background = "#285577";
          text = "#f8f8f2";
          indicator = "#FF79C6";
          childBorder = "#FF79C6";
        };
        focusedInactive = {
          border = "#282a3600";
          background = "#282a3600";
          text = "#f8f8f2";
          indicator = "#282a3600";
          childBorder = "#282a3600";
        };
        unfocused = {
          border = "#282a3600";
          background = "#282a3600";
          text = "#f8f8f2";
          indicator = "#282a3600";
          childBorder = "#282a3600";
        };
        urgent = {
          border = "#282a3600";
          background = "#282a3600";
          text = "#f8f8f2";
          indicator = "#282a3600";
          childBorder = "#282a3600";
        };
        placeholder = {
          border = "#282a3600";
          background = "#282a3600";
          text = "#f8f8f2";
          indicator = "#282a3600";
          childBorder = "#282a3600";
        };
      };
      bars = [
        {
          command = "waybar";
          position = "top";
        }
      ];
      floating = {
        border = 0;
	titlebar = false;
      };
      window = {
        border = 0;
	titlebar = false;
        commands = [
          {
            command = "move up 120px";
            criteria = {
              app_id = "wofi";
            };
          }
          {
            command = "floating enable, resize set width 400 px height 225px, sticky on, dim_inactive 0.0";
            criteria = {
              title = "Picture-in-Picture";
            };
          }
          {
            command = "floating enable, resize set width 400 px height 225px, sticky on, dim_inactive 0.0";
            criteria = {
              title = "Picture-in-picture";
            };
          }
        ];
      };
      startup = [
        { command = ''python3 ${python_script} &''; always = true; }
        { command = "nm-applet"; always = true; }
	{ command = ''pkill mpvpaper; mpvpaper ALL -i ${live_wallpaper} -o "--no-audio --loop-file --panscan=1.0" &''; always = true;  }
      ];
      output = {
        eDP-1 = {
          bg = "${wallpaper} fill";
 	  scale = "1.15";
        };
        DP-1 = {
          bg = "${wallpaper} fill";
 	  scale = "1";
        };
        DP-2 = {
          bg = "${wallpaper} fill";
 	  scale = "1";
        };
        HDMI-A-1 = {
          bg = "${wallpaper} fill";
 	  scale = "1";
        };
      };
      keybindings = {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";

        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+f" = "fullscreen";
        "${modifier}+Shift+v" = "splith";
        "${modifier}+v" = "splitv";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+r" = "mode resize";
      };


      # modes = {
      #   resize = {
      #     "${left}"  = "resize shrink width ${resizeStep}";
      #     "${down}"  = "resize grow height ${resizeStep}";
      #     "${up}"    = "resize shrink height ${resizeStep}";
      #     "${right}" = "resize grow width ${resizeStep}";
      #     "Return"   = "mode default";
      #     "Escape"   = "mode default";
      #   };
      # };
    };
  };
}
