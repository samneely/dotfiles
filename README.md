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
git clone https://github.com/samneely/dotfiles.git
```

## Run install.sh

```shell
dotfiles/install.sh
```

This shell script handles quite a few things for you.

1. Installs homebrew and bundles
1. Symlinks dotfiles
1. Installs oh-my-zsh
1. Sets up neovim
1. Sets up fzf

## Postgres.app

Are you using PostgreSQL? Install Postgres.app to manage psql database servers.

## Remap Caps Lock to Control

You use this all of the time to make it easier to use the ctrl key for vim/neovim.

## Install programming languages

Install the asdf plugins for the programming languages you need to use. After that, install the language versions you need. 

You also need to include nodejs in this list BEFORE setting up neovim because some neovim plugins require it.

## Create the `.tokensrc` file

Some of the tools you use require tokens to use them or to avoid rate limiting from websites like GitHub. Here's an example:
```shell
export HOMEBREW_GITHUB_API_TOKEN=some-random-token
export NPM_TOKEN=some-random-token
```
