{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.nix-minecraft.nixosModules.minecraft-servers
    ];


 # Enable the OpenSSH daemon.
  services = {
     openssh = {
        enable = true;
        settings = {
           PermitRootLogin = "yes";
           PasswordAuthentication = true;
           X11Forwarding = true;
        };
     };
     minecraft-servers = {
       enable = true;
       eula = true;
       servers = {
         nix-server = {
           enable = true;
           package = pkgs.fabricServers.fabric-1_21_8.override { loaderVersion = "0.16.14"; };
           serverProperties = {
             server-port = 25565;
             difficulty = 1;
             gamemode = 0;
             max-players = 69;
             motd = "NixOS Minecraft Server!";
             white-list = false;
             enable-rcon = true;
             "rcon.password" = "foss";
             "rcon.port" = 25569;
           };
           symlinks = {
             "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
                FabricAPI = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/X2hTodix/fabric-api-0.129.0%2B1.21.8>
                  sha512 = "471babff84b36bd0f5051051bc192a97136ba733df6a49f222cb67a231d857eb4b1c5ec8dea605e14>
                };
                Lithium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/pDfTqezk/lithium-fabric-0.18.0%2Bmc1>
                  sha512 = "6c69950760f48ef88f0c5871e61029b59af03ab5ed9b002b6a470d7adfdf26f0b875dcd360b664e89>
                };
                C2ME = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/VSNURh3q/versions/72AAuacG/c2me-fabric-mc1.21.8-0.3.5%>
                  sha512 = "0e0eb16af6302d35d3b7a04735130606947d604af59623f975bfe43507a2b07b65e4ebf5dc31516a8>
                };
             });
           };
         };
       };
     };
  };

    nix = {
     settings = {
        experimental-features = [
           "nix-command"
           "flakes"
        ];
        auto-optimise-store = true;
     };
  };
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

}
