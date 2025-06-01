# pucciaOS Nix Configuration

[![Made with Nix](https://img.shields.io/badge/Made_with-Nix-blue.svg?style=flat-square&logo=Nix&logoColor=white)](https://nixos.org)

This repository contains my personal Nix configuration for macOS (Darwin), powered by [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager).

## Overview

pucciaOS is a declarative system configuration that provides:

- macOS configuration via nix-darwin
- Home environment management with home-manager
- Homebrew integration via nix-homebrew
- Reproducible and versioned development environment
- Dotfiles management

## Structure

```
nix-config/
├── flake.nix          # Main entry point for the Nix configuration
├── flake.lock         # Pinned dependency versions
├── modules/
│   ├── darwin/        # macOS/Darwin-specific configurations
│   └── home-manager/  # User environment configurations
│       ├── dotfiles/  # Configuration files for various programs
│       └── programs/  # Program-specific configurations
```

## Requirements

- macOS
- [Nix package manager](https://nixos.org/download.html)
- [Flakes enabled](https://nixos.wiki/wiki/Flakes)

## Installation

1. Install Nix:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

2. Enable Flakes:

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

3. Clone this repository:

```bash
git clone https://github.com/mattsays/nix-config.git
cd nix-config
```

4. Build and switch to the configuration:

```bash
nix build .#darwinConfigurations.macos.system
./result/sw/bin/darwin-rebuild switch --flake .
```

## Usage

After installation, you can update your system with:

```bash
darwin-rebuild switch --flake /path/to/nix-config
```

## Features

- Reproducible system configuration
- User environment management
- Integration with Homebrew for macOS applications
- Dotfiles management
- Mac application utilities

## Customization

To customize this configuration for your own use:

1. Fork this repository
2. Edit the `flake.nix` file to change the username and other personal details
3. Modify the modules in `modules/` directory to suit your preferences
4. Add or remove packages and configurations as needed

## Acknowledgments

- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [nix-homebrew](https://github.com/zhaofengli-wip/nix-homebrew)
- [mac-app-util](https://github.com/hraban/mac-app-util)