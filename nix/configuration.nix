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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

