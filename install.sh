#!/usr/bin/env bash

install_ohmyzsh() {
  echo "Setting up oh-my-zsh... 🐚"
  printf "\n"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  printf "\n"
  echo "Done setting up oh-my-zsh... ✅"
}

install_hub() {
  echo "Installing hub... 🐙"
  printf "\n"

  sudo apt-get install hub

  printf "\n"
  echo "Done hub... ✅"
}

change_gitconfig_for_spin() {
  echo "Changing gitconfig for spin... 🌀"
  printf "\n"

  git config --global user.email "sam.neely@shopify.com"

  printf "\n"
  echo "Done changing gitconfig... ✅"
}

symlink_dotfiles() {
  echo "Symlinking dotfiles... 🖨️"
  printf "\n"

  ln -sfv ~/dotfiles/asdfrc ~/.asdfrc
  ln -sfv ~/dotfiles/aliases ~/.aliases
  ln -sfv ~/dotfiles/bashrc ~/.bashrc
  ln -sfv ~/dotfiles/bash_profile ~/.bash_profile
  ln -sfv ~/dotfiles/hub ~/.config/hub
  ln -sfv ~/dotfiles/rspec ~/.rspec
  ln -sfv ~/dotfiles/rubocop.yml ~/.rubocop.yml

  ln -sfv ~/dotfiles/git/.git* ~/
  ln -sfv ~/dotfiles/zsh/.z* ~/

  printf "\n"
  echo "Done symlinking dotfiles... ✅"
}

setup_neovim() {
  echo "Installing neovim package manager... 📦"
  printf "\n"

  echo "Cloning packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  cp -Rsfv ~/dotfiles/nvim/.config/nvim ~/.config/nvim

  echo "Running :PackerSync in neovim..."
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  printf "\n"
  echo "Done setting up neovim... 👨🏻‍💻"
}

symlink_dotfiles
setup_neovim

if [ $SPIN ]; then
  install_hub
  change_gitconfig_for_spin
else
  install_ohmyzsh
fi
