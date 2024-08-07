#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Removes .gitignore_global from $HOME (if it exists) and symlinks the .gitignore_global file from the .dotfiles
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose spatie/global-ray spatie/visit

# Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install

# Install Global Ray
#$HOME/.composer/vendor/bin/global-ray install

# Create a Sites directory
mkdir $HOME/projects

# Clone Github repositories
$DOTFILES/clone.sh

# Git configuration
$DOTFILES/git-config.sh

# Sidebar
$DOTFILES/sidebar.sh

# NPM global packages
$DOTFILES/npm_global_packages.sh

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
