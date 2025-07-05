{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];


  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cleggacus = {
    isNormalUser = true;
    description = "cleggacus";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  virtualisation.docker.enable = true;

  home-manager.users.cleggacus = { pkgs, ... }: {
    home.stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };


  environment.systemPackages = with pkgs; [
    mymcplus
    pcsx2
    ollama
    file-roller
# Emulators
    nestopia-ue
    snes9x
    simple64
    dolphin-emu
    desmume
# Helpers
    p7zip
    pavucontrol
    home-manager
    mpvpaper
    gimp
    obs-studio
    linuxPackages.v4l2loopback # uncertain if still needed here..?
    v4l-utils
    openssl
# web & entertainment
    nodejs
    google-chrome
    discord
    betterdiscordctl
# helpers and os
    grim
    slurp
    unzip
    wl-clipboard
    mako
    wofi
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    gtk3
    gtk4
    glib
    gsettings-desktop-schemas
    wlroots
    xwayland
    dracula-theme
# editor & term
    kitty
    neovim
# dev
    rustup
    git
    wget
    curl
    gcc
    gnumake
    cmake
    pkg-config
    autoconf
    automake
    libtool
    docker-compose
    prisma
    prisma-engines
    clang-tools
    qemu
    nasm
    open-watcom-v2

    networkmanagerapplet

    qbittorrent

    openvpn
    protonvpn-gui
    protonvpn-cli

    fzf
    zoom-us
  ];
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.tmux = {
    enable = true;
    clock24 = true;
  };


  environment.variables.GSETTINGS_SCHEMA_DIR = pkgs.glib.passthru.getSchemaPath pkgs.gsettings-desktop-schemas;
  
  environment.variables.PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  environment.variables.PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  environment.variables.PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";

  
  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk 
      xdg-desktop-portal-wlr
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
  };

  programs.waybar.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;

  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    environment = {
      WAYLAND_DISPLAY = "wayland-1";
      DISPLAY = ":0";
    };
    serviceConfig = {
      Type = "simple";
      Execstart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "cleggacus";
      };
      default_session = initial_session;
    };
  };


services.postgresql = {
  enable = true;
  ensureDatabases = [ "automation" ];
  enableTCPIP = true;
  authentication = pkgs.lib.mkOverride 10 ''
    local all all trust
    host  all all 127.0.0.1/32 trust
    host  all all ::1/128 trust
  '';
  initialScript = pkgs.writeText "db-init" ''
    CREATE ROLE cleggacus WITH LOGIN PASSWORD 'whatever';
    GRANT ALL PRIVILEGES ON DATABASE automation TO cleggacus;
    \c automation
    ALTER SCHEMA public OWNER TO cleggacus;
  '';
};


  system.stateVersion = "24.11";
}
