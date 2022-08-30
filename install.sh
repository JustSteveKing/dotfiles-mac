#!/bin/bash

echo -e "Lets do this."
echo -e "------------------\n"
sudo -v

## Hostname
echo -e "Do you want to set a hostname for this machine? (y/n)"
read -p "Answer: " reply

if [[ $reply =~ ^[Yy]$ ]]
then
  echo -e "What do you want your computer hostname to be?"
  read -p "Answer: " reply
  hostnamectl set-hostname $reply
fi


## Hushlogin
echo -e "Add a .hushlogin to hide "last login" when starting a new terminal session? (y/n)"
read -p "Answer: " reply

if [[ $reply =~ ^[Yy]$ ]]
then
  echo -e "Adding .hushlogin file\n"
  echo -e "-----------------\n"
  touch $HOME/.hushlogin
fi

echo -e "Setting up your Mac ..."
echo -e "-----------------\n"

# Check for Oh My Zsh and install if we do not have it
if test ! $(which omz); then
  echo -e "Installing Oh My Zsh\n"
  echo -e "-----------------\n"
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we do not have it
if test ! $(which brew); then
  echo -e "Installing Homebrew\n"
  echo -e "-----------------\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
echo -e "Symlinking the ZSH files.\n"
echo -e "-----------------\n"
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
echo -e "Updating Homebrew.\n"
echo -e "-----------------\n"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo -e "Setting up Homebrew.\n"
echo -e "-----------------\n"
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# gitignore
echo -e "Adding a global .gitignore\n"
echo -e "-----------------\n"
ln -s $HOME/dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Set default MySQL root password and auth type
echo -e "Setting root MySQL password to 'password'\n"
echo -e "-----------------\n"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
echo -e "Installing PECL: \n"
echo -e "- imagick\n- redis\n- swoole\n"
echo -e "-----------------\n"
pecl install imagick redis swoole

# Install global Composer packages
echo -e "Installing Laravel Installer ...\n"
echo -e "-----------------\n"
/usr/local/bin/composer global require laravel/installer

# Create a Developer directory
echo -e "Creating directory '$HOME/Developer\n"
echo -e "-----------------\n"
mkdir $HOME/Developer

# Set up VCS Repos
echo -e "Creating directory '$HOME/Developer/github\n"
echo -e "-----------------\n"
mkdir $HOME/Developer/github
echo -e "Creating directory '$HOME/Developer/gitlab\n"
echo -e "-----------------\n"
mkdir $HOME/Developer/gitlab

echo -e "Creating directory '$HOME/Developer/github/juststeveking\n"
echo -e "-----------------\n"
mkdir $HOME/Developer/github/juststeveking

# Symlink the Mackup config file to the home directory
echo -e "Symlinking the Mackup configuration file to $HOME\n"
echo -e "-----------------\n"
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

echo -e "Setting up vim\n"
echo -e "-----------------\n"
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $HOME/.dotfiles/.vim $HOME/.vim

echo -e "Setting up SSH\n"
echo -e "-----------------\n"
ls -s ${HOME}/.dotfiles/ssh/conf.d ${HOME}/.ssh/conf.d

chmod +x ${HOME}/.dotfiles/z.sh

echo -e "All done\n"
