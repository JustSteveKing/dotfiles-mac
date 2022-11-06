# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Hide username in prompt
DEFAULT_USER=`whoami`

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git composer macos)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/dotfiles-custom can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/{exports,aliases,functions}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.spin/bin:$HOME/bin:/usr/local/bin:/opt/homebrew/bin/brew:/$HOME/.composer/vendor/bin:$PATH"
