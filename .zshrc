# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

_extend_path "$HOME/.local/bin"
_extend_path "$HOME/bin"
_extend_path "/usr/local/bin"
_extend_path "/opt/homebrew/opt/make/libexec/gnubin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git golang kubectl fd sudo nix-zsh-completions operator-sdk)

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
_extend_path $(go env GOPATH)/bin

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
_extend_path "$HOME/.cargo/bin:$PATH"

# direnv
eval "$(direnv hook bash)"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# dotfile management
alias dotfiles=`/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree="$HOME"`

if command -v hidutil &> /dev/null
then
   # map CAPS lock to tilda: tilde: 0x35, caps: 0x39\u
   # https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
   hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000035}]}' 1> /dev/null
fi

# GitHub
export GITHUB_USER=ricochet

# fzf
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

# Like cd but with z-zsh capabilities
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# 1password 
eval "$(op completion zsh)"; compdef _op op

# export known env files
set -o allexport
if [ -f ~/.secrets ]
then
source ~/.secrets
fi
set +o allexport

# VS Code
_extend_path "/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin:${PATH}"
alias codi="code-insiders"
alias code="code-insiders"

# wasm
export WASI_SDK_PATH="$HOME/local/wasi-sdk-20"

# direnv
eval "$(direnv hook zsh)"

# wash
export WASH_EXPERIMENTAL=true

# emscripten
export EMSDK_QUIET=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bhayes/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bhayes/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bhayes/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bhayes/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/bhayes/.bun/_bun" ] && source "/Users/bhayes/.bun/_bun"

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `wasmtime`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_wasmtime" ]]; then
  typeset -g -A _comps
  autoload -Uz _wasmtime
  _comps[wasmtime]=_wasmtime

  wasmtime completion zsh >| "$ZSH_CACHE_DIR/completions/_wasmtime"
fi
