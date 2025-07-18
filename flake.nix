{
  description = "A simple flake for running a Minecraft server using nix-minecraft";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { self, nixpkgs, nix-minecraft, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        nix-minecraft.nixosModules.minecraft-servers  # Add this line to include the nix-minecraft module
        ./configuration.nix
      ];
    };
  };
}

