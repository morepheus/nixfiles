# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  networking.hostName = "atlasvm";

  # virtualbox
  virtualisation.virtualbox.guest.enable = true;
  boot.initrd.checkJournalingFS = false;
  security.rngd.enable = false;

  # grub
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # enable i3/xfce combo (wm/dm)
  services.xserver = {
    enable = true;
    layout = "de,us";
    xkbOptions = "eurosign:e, grp:alt_caps_toggle";
    displayManager.defaultSession = "none+i3";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        polybarFull
      ];
      configFile = ../dotfiles/i3/config;
    };
  };

  # Sane font defaults
  fonts = {
    #enableFontDir = true;
    #enableGhostscriptFonts = true;
    #fontconfig.cache32Bit = true;
    fonts = with pkgs; [
      siji
      unifont
    ];
  };

}
