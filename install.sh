#!/usr/bin/env bash

newline() {
  printf "\n"
}

setup_homebrew() {
  echo "Installing homebrew... 🍺"
  newline

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  newline
  /bin/bash -c "$(echo; echo 'eval \"$(/opt/homebrew/bin/brew shellenv)\"') >> /Users/samneely/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"

  newline
  echo "homebrew installed, bundling... 🍻"
  newline

  brew bundle
}

install_ohmyzsh() {
  echo "Setting up oh-my-zsh... 🐚"
  newline

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  newline
  echo "Done setting up oh-my-zsh... ✅"
}

symlink_dotfiles() {
  echo "Symlinking dotfiles... 🖨️"
  newline

  if [ -d ~/.config ]; then
    echo "~/.config directory exists... 👍🏻"
  else
    echo "~/.config directory not found, creating it... 🗂️"
    mkdir ~/.config
  fi
  newline

  ln -sfv ~/dotfiles/asdfrc ~/.asdfrc
  ln -sfv ~/dotfiles/aliases ~/.aliases
  ln -sfv ~/dotfiles/bashrc ~/.bashrc
  ln -sfv ~/dotfiles/bash_profile ~/.bash_profile
  ln -sfv ~/dotfiles/Brewfile ~/Brewfile
  ln -sfv ~/dotfiles/bat_config ~/.config/bat/config
  ln -sfv ~/dotfiles/hub ~/.config/hub
  ln -sfv ~/dotfiles/ghostty_config ~/.config/ghostty/config
  ln -sfv ~/dotfiles/rspec ~/.rspec
  ln -sfv ~/dotfiles/rubocop.yml ~/.rubocop.yml
  ln -sfv ~/dotfiles/tool-versions ~/.tool-versions

  ln -sfv ~/dotfiles/git/.git* ~/
  ln -sfv ~/dotfiles/zsh/.z* ~/

  newline
  echo "Done symlinking dotfiles... ✅"
}

setup_neovim() {
  if [ -d ~/neovim-config ]; then
    echo "~/neovim-config directory exists..."
  else
    echo "~/neovim-config directory not found, cloning it... 🐙"
    git clone git@github.com:samneely/neovim-config.git ~/neovim-config
  fi
  newline

  echo "Symlinking neovim configuration... 🗃️"
  ln -sfv ~/neovim-config ~/.config/nvim

  newline
  echo "Done setting up neovim... 👨🏻‍💻"
}

symlink_dotfiles
setup_homebrew
setup_neovim
install_ohmyzsh
