{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        margin = "20px 20px 0 20px";
        output = [ "DP-1" "DP-2" "eDP-1" ];
        modules-left = [ "sway/window" "clock" ];
        modules-center = [ "sway/workspaces" "sway/mode" "custom/media" ];
        modules-right = [ "cpu" "pulseaudio" "battery" "tray" ];

        "sway/workspaces" = {
          disable-scroll = true;
          disable-markup = false;
          format = "  {icon}  ";
          persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "9" = [];
            "10" = [];
          };
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "4";
            "9" = "";
            "10" = "";
          };
        };

        "sway/window" = {
          "max-length" = 50;
        };

        "sway/mode" = {
          format = "<span style=\"italic\"><span color=\"#ff79c6\"></span>  {}</span>";
          tooltip = false;
        };

        idle_inhibitor = {
          format = "{icon}";
          "format-icons" = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          "icon-size" = 21;
          spacing = 10;
        };

        clock = {
          interval = 1;
          format = "<span color=\"#ff5555\"></span>  {:%H : %M : %S}";
          "format-alt" = "<span color=\"#bd93f9\"></span>   {:%d / %m / %Y}";
        };

        "clock#time" = {
          interval = 1;
          format = "{:%H:%M:%S}";
          tooltip = false;
        };

        "clock#date" = {
          interval = 10;
          format = "  {:%e %b %Y}";
          "tooltip-format" = "{:%e %B %Y}";
          "on-click" = "~/work/scripts/popup-calendar.sh --popup";
        };

        cpu = {
          format = "<span color=\"#f1fa8c\"></span>  {usage}%  ({load})";
        };

        memory = {
          format = "{}% ";
        };

        battery = {
          interval = 10;
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          "format-icons" = [
            "<span color=\"#ff5555\"></span>"
            "<span color=\"#ffb86c\"></span>"
            "<span color=\"#f1fa8c\"></span>"
            "<span color=\"#50fa7b\"></span>"
            "<span color=\"#50fa7b\"></span>"
          ];
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "⚠";
          interval = 7;
        };

        pulseaudio = {
          format = "<span color=\"#8be9fd\">{icon}</span>  {volume}%";
          "format-muted" = "";
          "format-icons" = {
            headphones = "";
            handsfree = "";
            headset = "";
            default = [ "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: 'Noto Sans', 'Font Awesome 6 Free', 'Font Awesome 6 Brands', Helvetica, Arial, sans-serif;
        font-size: 11pt;
        min-height: 0;
      }
    
      window#waybar {
        background-color: rgba(0, 0, 0, 0);
        color: #ffffff;
      }
    
      window#waybar.hidden {
        opacity: 0.0;
      }
    
      #workspaces {
        background-color: #282a36;
        border-radius: 10px;
        padding: 0 15px;
        margin: 0;
      }
    
      #workspaces button {
        padding: 12px 0;
        background: transparent;
        color: #ffffff;
      }
    
      #workspaces button.focused {
        color: #ff79c6;
      }
    
      #workspaces button.urgent {
        color: #ff5555;
      }
    
      #workspaces button:hover {
        box-shadow: none;
        text-shadow: none;
        border-bottom: 2px solid #ff79c6;
      }
    
      #window {
	border-radius: 10px;
        margin: 0 10px 0 0;
      }
    
      #window, #clock, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor {
        background-color: #282a36;
        padding: 12px 17px;
      }
    
      #clock, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor {
        margin: 0 10px;
        background-color: #282a36;
        color: #ffffff;
	border-radius: 10px;
      }
    
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
    
      #battery.critical:not(.charging) {
        background: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    
      #tray {
        border-radius: 10px;
        margin: 0 0 0 10px;
        padding: 0 15px;
      }
    '';
  };
}
