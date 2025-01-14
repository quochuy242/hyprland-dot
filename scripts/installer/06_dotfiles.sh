#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for dotfiles section"
print_info "\nStarting dotfiles setup"
print_info "\nEverything is recommend to INSTALL"

# Install packages
run_command "yes | yay -S zsh oh-my-zsh-git --answerdiff None --answerclean None --removemake" "Install zsh and oh-my-zsh" "yes"
run_command "yes | yay -S tmux --answerdiff None --answerclean None --removemake" "Install tmux" "yes"
run_command "yes | yay -S yazi --answerdiff None --answerclean None --removemake" "Install yazi" "yes"
run_command "yes | yay -S kitty alacritty ghostty --answerdiff None --answerclean None --removemake" "Install terminal applications (kitty, alacritty, ghostty)" "yes"
run_command "pacman -Sy fzf fd eza tealdeer zoxide bat fastfetch neofetch btop htop starship atuin vim neovim --noconfirm" "Install necessary cli tools" "yes"

# Setup by stow
run_command "mkdir -p $HOME/Clone/ && git clone https://github.com/quochuy242/dotfiles.git $HOME/Clone/ && cd $HOME/Clone/dotfiles/ && sudo sh setup.sh" "Applying my dotfiles" "yes"

