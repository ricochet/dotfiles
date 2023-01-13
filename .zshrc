# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git golang kubectl fd sudo)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Go
export PATH=$PATH:$(go env GOPATH)/bin

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"

# direnv
eval "$(direnv hook bash)"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# dotfile management
alias dotfiles=`git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`

if command -v hidutil &> /dev/null
then
   # map CAPS lock to tilda: tilde: 0x35, caps: 0x39\u
   # https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
   hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000035}]}'
fi

# GitHub
export GITHUB_USER=ricochet

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# skim
source "$HOME/.skim/shell/completion.zsh"
source "$HOME/.skim/shell/key-bindings.zsh"
SKIM_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git' || git ls-tree -r --name-only HEAD || rg --files || find ."

# use bat as a previewer
alias skvi='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden)"; [[ $? -eq 0 ]] && vim "$x" || true }; f'
# doing the same for VSCode
alias skvs='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden)"; [[ $? -eq 0 ]] && code :w "$x" || true }; f'

# 1password 
eval "$(op completion zsh)"; compdef _op op

# cosmonic
alias auth-multiverse="$HOME/bin/auth-multiverse.sh"

# rancher desktop
export PATH="$HOME/.rd/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault
complete -o nospace -C /opt/homebrew/bin/packer packer
complete -o nospace -C /opt/homebrew/bin/terraform terraform
complete -o nospace -C /opt/homebrew/bin/nomad nomad

# export known env files
set -o allexport
if [ -f ~/.secrets ]
then
source ~/.secrets
fi
set +o allexport

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="/Users/bhayes/.cosmo/bin:${PATH}"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"

# wasm
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
