# Awesome Dotties

## Desktop Dependencies

- AwesomeWM
  - picom
  - nm-applet
  - protonvpn-cli

## Setup

```bash
./setup
```

This script will:

- Install Vundle for vim plugins, then run :PluginInstall
- Install pacman package dependencies
- Install oh-my-zsh if it's not already installed
- Stow all config files

Script might need to be ran multiple times because of the oh-my-zsh installer
