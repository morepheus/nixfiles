# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/65f36a69-a0b3-4ba0-9a4a-7b2a6963d3da";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/0143148e-708b-4483-acc2-b4e71b5e5c87"; }];

  virtualisation.virtualbox.guest.enable = true;
}
