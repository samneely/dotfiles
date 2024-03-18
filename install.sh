#!/usr/bin/env bash

symlink_dotfiles() {
  echo "Symlinking dotfiles... 🖨️"
  echo "\n"

  ln -sfv ~/dotfiles/asdfrc ~/.asdfrc
  ln -sfv ~/dotfiles/aliases ~/.aliases
  ln -sfv ~/dotfiles/bashrc ~/.bashrc
  ln -sfv ~/dotfiles/bash_profile ~/.bash_profile
  ln -sfv ~/dotfiles/hub ~/.config/hub
  ln -sfv ~/dotfiles/rspec ~/.rspec
  ln -sfv ~/dotfiles/rubocop.yml ~/.rubocop.yml

  ln -sfv ~/dotfiles/git/.git* ~/
  cp -Rsfv ~/dotfiles/nvim/.config/nvim ~/.config/nvim
  cp -Rsfv ~/dotfiles/zsh/.z* ~/

  echo "\n"
  echo "Done symlinking dotfiles... ✅"
}

setup_neovim() {
  echo "Installing neovim package manager... 📦"
  echo "\n"

  echo "Cloning packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

  echo "Running :PackerSync in neovim..."
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  echo "\n"
  echo "Done setting up neovim... 👨🏻‍💻"
}

symlink_dotfiles
setup_neovim
