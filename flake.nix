{
  description = "NixOS server IaC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agenix, ... }@inputs: {
    nixosConfigurations = {
      oracle-server1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/oracle-server1/hardware-configuration.nix
          ./hosts/oracle-server1/configuration.nix
          agenix.nixosModules.default
        ];
      };

      mexican-pearl18408 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/mexican-pearl18408/hardware-configuration.nix
          ./hosts/mexican-pearl18408/configuration.nix
        ];
      };
    };
  };
}
