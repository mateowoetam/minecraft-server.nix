# Minecraft Server NixOS Configuration

This repository contains a NixOS configuration file and flake for setting up a Minecraft server using NixOS. The configuration is designed to be simple and efficient, leveraging the `nix-minecraft` module for easy management of Minecraft server instances.

## Repository Structure

- **`configuration.nix`**: The main NixOS configuration file that defines the server settings and services.
- **`flake.nix`**: A flake file that specifies the inputs and outputs for the NixOS configuration.

## Configuration Overview

### `configuration.nix`

This file includes the necessary imports and configurations for the Minecraft server. Key components include:

- **Imports**: The configuration imports hardware settings and the `nix-minecraft` module to manage Minecraft servers.
  
- **OpenSSH Service**: The OpenSSH daemon is enabled for remote access. Key settings include:
  - Allowing root login.
  - Enabling password authentication.
  - Allowing X11 forwarding.

- **Minecraft Server Configuration**: This section defines the properties of the Minecraft server, including:
  - **Server Port**: The port on which the server will listen for connections (default is 25565).
  - **Difficulty Level**: The difficulty setting for the game (e.g., peaceful, easy, normal, hard).
  - **Game Mode**: The mode in which players will play (e.g., survival, creative).
  - **Maximum Players**: The maximum number of players allowed on the server.
  - **Message of the Day (MOTD)**: A message displayed to players when they join the server.
  - **Whitelist**: A setting to control whether only whitelisted players can join.
  - **RCON Settings**: Remote Control (RCON) settings for managing the server remotely, including the RCON password and port.

- **Mod Management**: The configuration includes symlinks for mods, allowing the server to use specific mods fetched from URLs. This section defines the mods to be used, including their download URLs and checksums for integrity.

- **Nix Settings**: Experimental features for Nix are enabled, and store optimization settings are configured.

### `flake.nix`

This file defines the flake for the Minecraft server setup, specifying the necessary inputs and outputs. Key components include:

- **Inputs**: The flake specifies dependencies, including the Nixpkgs repository and the `nix-minecraft` module.

- **Outputs**: The outputs section defines the NixOS configuration, which includes the `nix-minecraft` module and the main configuration file. This allows for easy deployment of the Minecraft server using the defined settings.

## Getting Started

To set up the Minecraft server using this configuration, follow these steps:

1. Ensure you have NixOS installed on your machine.
2. Clone this repository to your local machine.
3. Navigate to the directory containing the `flake.nix` file.
4. Use the Nix command to build and activate the configuration.

For more information on the `nix-minecraft` module and its features, visit the [nix-minecraft GitHub repository](https://github.com/Infinidoge/nix-minecraft).

For more detailed instructions on using Nix and NixOS, refer to the official [NixOS documentation](https://nixos.org/manual/nixos/stable/).

## License

This project is licensed under the GNU General Public License, Version 3, 29 June 2007. 
