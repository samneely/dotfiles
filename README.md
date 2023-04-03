# New laptop? Start here!

## Update all of the system software

You know, like, Mac updates.

## Set up iCloud and other Internet Accounts

Sign into your Apple account and choose what to sync using iCloud.
You'll also want to connect any other additional internet accounts (e.g., Google).

## Install Apple Developer Tools

Your Macbook will prompt you to do this automatically if you open the Terminal app and run something like `git`.

## Clone dotfiles to the new computer

Before you can do this, you need to create an SSH key and add it to your GitHub account. You can search the internet for how do to this. After you have set up your SSH key, you can clone the dotfiles to the home directory.

```shell
git clone samneely/dotfiles
```

## Install and configure Homebrew

Install Homebrew following the instructions from their website.
Manually symlink the Brewfile found in dotfiles.

## Install apps managed by Homebrew

Run `brew bundle` and troubleshoot any issues that come up.

## Configure GitHub OAuth for `hub` CLI

You'll need to get an OAuth token set up for `hub` or else the GitHub CLI will prompt you for a username and password every time you want to do something.

OAuth tokens and your username are stored in the `hub` file at `~/.config/hub`.

## Install oh-my-zsh

It's helpful and makes your terminal look pretty. You'll want to install it before symlinking any of your zsh dotfiles or else oh-my-zsh will move all of them to a "pre" oh-my-zsh file and that sucks.

## Use `stow` to copy dotfiles

Symlink dotfiles using `stow`. Run ALL `stow` commands from the dotfiles directory. 

### zsh

It will symlink files like the .zprofile and .zshrc. You might need to delete these files first before you can symlink them.

```shell
$ ~/dotfiles stow -v zsh
```

### git

Use the following cmd to symlink git files.
```shell
$ ~/dotfiles stow -v git
```

Manually symlink `.gitignore`. `stow` ignores this file for some reason.

```shell
$ ~ ln -s ~/dotfiles/git/.gitignore ~/
```

### neovim

Use the following cmd to symlink neovim files. You might need to manually create the `nvim` directory.
```shell
$ ~ mkdir ~/.config/nvim

$ ~/dotfiles stow -v nvim -d nvim/.config -t ~/.config/nvim
```

### The rest

You'll want to manually symlink the rest. These could include:
- .aliases
- .asdfrc
- .rspec
- .rubocop.yml
- hub (link to ~/.config/hub)

Each file should be symlinked to the home directory unless otherwise noted. These could potentially be moved to a `stow` package as a directory in the dotfiles.

## Configure apps installed using Homebrew

You can check out the list of cask apps to configure in the Brewfile.

You'll also need to enable `fzf` for fuzzy finding/searching in the terminal. You can find out how through homebrew.
```shell
$ ~ brew info fzf
```

## Postgres.app

Are you using PostgreSQL? Install Postgres.app to manage psql database servers.

## Remap Caps Lock to Control

You use this all of the time to make it easier to use the ctrl key for vim/neovim.

## Install programming languages

Install the asdf plugins for the programming languages you need to use. After that, install the language versions you need. 

You also need to include nodejs in this list BEFORE setting up neovim because some neovim plugins require it.

## Configure neovim

Open neovim in the terminal under the dotfiles directory.

```shell
$ ~/dotfiles nvim .
```

Install all of the neovim plugins using your neovim plugin manager (e.g., Packer).

## Create the `.tokensrc` file

Some of the tools you use require tokens to use them or to avoid rate limiting from websites like GitHub. Here's an example:
```shell
export HOMEBREW_GITHUB_API_TOKEN=some-random-token
export NPM_TOKEN=some-random-token
```
