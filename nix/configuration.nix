# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  ###############
  # BOOT LOADER #
  ###############

  # Use systemd as boot manager
  boot.loader.systemd-boot.enable = true;

  ##############
  # NETWORKING #
  ##############

  networking.hostName = "tuxnix";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Madrid";

  ##############
  # X11 SERVER #
  ##############
 
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  # Load nvidia driver for Xorg
  services.xserver.videoDrivers = ["nvidia"];

  # Install the Xmonad window manager
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    # theme.package = 
  };

  ###################
  # SYSTEM PACKAGES #
  ###################
	
  environment.systemPackages = with pkgs; [
     # Desktop
     xmobar
     firefox
     neovim
     picom
     lsd
     feh
     alacritty

     # Utilities
     flameshot
     xclip
     xcolor
     git

     # Other (not mandatory)
     lxappearance 
     ranger
     killall
     tree
     wget
     xsettingsd
     unzip

     # Neovim 
     ripgrep
     gcc 
     gnumake
     cargo
     unzip
     nodejs
     python310
     python310Packages.pip
  ];
 
  ##################
  # GENERAL CONFIG #
  ##################
  
  # Allow unfree software (Nvidia)
  nixpkgs.config.allowUnfree = true;

  # Set zsh as default shell
  programs.zsh.enable = true;

  users.users.tux = {
    isNormalUser = true;
    home = "/home/tux";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = true;
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # Nvidia Settings
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  system.stateVersion = "23.11";
}

