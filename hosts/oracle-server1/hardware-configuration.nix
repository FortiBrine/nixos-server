{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "ahci" "virtio_net" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 2048;
    }
  ];
  boot.kernel.sysctl."vm.swappiness" = 10;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

