# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/npm/bin:$PATH
export PATH="$PATH:/home/stephen/.nvm/versions/node/v12.16.2/bin/npm"
export PATH="$PATH:/home/stephen/.npm-global/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Dev/blender-2.92.0-linux64:$PATH"
export PATH="$HOME/Dev/DataGrip/bin:$PATH"
# export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/home/stephen/.local/share/coursier/bin"
export FLYCTL_INSTALL="/home/stephen/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$HOME/Dev/zola/target/release:$PATH"
export PATH="$HOME/Dev/zeit:$PATH"
export ZEIT_DB=~/.config/zeit.db

# export NPM_TOKEN="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"
# export NPM_TOKEN="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"
export NPM_TOKEN="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"

#alias npm='/home/stephen/.nvm/versions/node/v12.16.2/bin/npm'
alias pip='pip3'
alias tmux='TERM=screen-256color-bce tmux'
# alias yarn='/home/stephen/.npm-global/bin/yarn'
alias rslint='rslint_cli'
alias cs='~/Dev/cs'

fpath=(~/.zsh $fpath)

gch() {
 git checkout “$(git branch — all | fzf| tr -d ‘[:space:]’)”
}

[[ -s /home/stephen/.autojump/etc/profile.d/autojump.sh ]] && source /home/stephen/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Path to your oh-my-zsh installation.
export ZSH="/home/stephen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
source ~/.oh-my-zsh/themes/ghostwheel/theme
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git fzf-tab zsh-autosuggestions poetry)
plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting thefuck)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.bash_aliases ]; then                                                 
  . ~/.bash_aliases                                                           
fi 

setxkbmap -option 'caps:ctrl_modifier'

# turn on `vi` mode for readline
set -o vi

numprocesses=$(ps ax | rg 'xcape' | wc -l)
if [[ $numprocesses -lt 2 ]] ; then
  xcape -e 'Caps_Lock=Escape'
fi

# eval "$(thefuck --alias --enable-experimental-instant-mode)" 
eval "$(thefuck --alias)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export PATH="$HOME/.poetry/bin:$PATH"

# cd ~/repos

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source ~/.gstack/gstack_completion.sh
[ -f "/home/stephen/.ghcup/env" ] && source "/home/stephen/.ghcup/env" # ghcup-env

# opam configuration
test -r /home/stephen/.opam/opam-init/init.zsh && . /home/stephen/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source /home/stephen/.config/broot/launcher/bash/br

# bun completions
[ -s "/home/stephen/.bun/_bun" ] && source "/home/stephen/.bun/_bun"

# Bun
export BUN_INSTALL="/home/stephen/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PNPM_HOME="/home/stephen/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function teleport-login() {
  tsh login --proxy=groundspeed.teleport.sh:443
}

function teleport-pypi() {
  # Thank you Rick for this snippet
  tsh app login pypi --proxy=groundspeed.teleport.sh:443 > ~/pypi-login
  cat $(cat ~/pypi-login | grep '\-\-cert' | cut -d ' ' -f4) > ~/pypi-cert
  cat $(cat ~/pypi-login | grep '\-\-key' | cut -d' ' -f4) >> ~/pypi-cert
  pip3 config set global.client-cert ~/pypi-cert
  rm -f ~/pypi-login
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
