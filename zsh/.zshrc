# base omz config: https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
# plugins managed by https://getantibody.github.io/

ANTIBODY_HOME="$(antibody home)"
ZSH="$ANTIBODY_HOME/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Compile dotfiles
for i in .zshenv \
         .profile \
         .profile.local \
         .zprofile \
         .zshenv.local \
         .zprofile \
         .zshrc \
         .shrc \
         .shrc.local \
         .zshrc.local; do
  if [[ -e ${HOME}/${i} ]] && [[ ! -e ${HOME}/${i}.zwc ]] \
    || [[ ${HOME}/${i} -nt ${HOME}/${i}.zwc ]]; then
    zcompile "${HOME}/${i}"
  fi
done
unset i

# Disable echo escape sequences in MSys2 or Cygwin - variables inherited from
# Windows may have backslashes in them
[[ $OSTYPE == (msys|cygwin) ]] && alias echo='echo -E'
alias hgrep='fc -fl 0 | grep'

# which should not be aliased in ZSH
alias which &> /dev/null && unalias which

# Global Aliases
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g LL='2>&1 | less'
alias -g NE='2> /dev/null'
alias -g NUL='&> /dev/null'
alias -g T='| tail'
alias -g V='|& vim -'

# Map vim to nvim
alias vim="nvim"
alias vi="nvim"
alias v='$EDITOR'
alias ev='$EDITOR ~/.config/nvim/init.vim'
alias te="exa"

# Update neovim bundles
alias nvbi="nvim +PlugInstall +qa"
alias nvbu="nvim +PlugUpdate +qa"

alias dsdelete='find . -name "*.DS_Store" -type f -delete'
alias ll='ls -lGha $@'

alias goba='nocorrect go build ./...'
alias gota='nocorrect gotestsum'

alias cdc='cd $CONVOY_ROOT'

function sagew {
   if [[ -f sage/sage.go ]]; then
      if [[ ! -f ./build/sage || ./go.mod -nt ./build/sage ]]; then
         echo 'Building sage.'
         go run sage/sage.go buildSage
      fi
   fi
   ./build/sage $*
}

gateway() {
    export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
    export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
    export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o 'jsonpath={.items[0].status.hostIP}')
    export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
    echo "Istio Ingress \$GATEWAY_URL: $GATEWAY_URL"
}

# History environment variables
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=120000  # Larger than $SAVEHIST for HIST_EXPIRE_DUPS_FIRST to work
SAVEHIST=100000

# In the line editor, number of matches to show before asking permission
LISTMAX=9999

setopt AUTO_CD            # Change to a directory just by typing its name
setopt AUTO_PUSHD         # Make cd push each old directory onto the stack
setopt CDABLE_VARS        # Like AUTO_CD, but for named directories
setopt PUSHD_IGNORE_DUPS  # Don't push duplicates onto the stack

unsetopt LIST_BEEP        # Don't beep on an ambiguous completion
unsetopt BEEP

setopt EXTENDED_HISTORY       # Save time stamps and durations
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_IGNORE_DUPS       # Do not enter 2 consecutive duplicates into history
setopt HIST_IGNORE_SPACE      # Ignore command lines with leading spaces
setopt HIST_VERIFY            # Reload results of history expansion before executing
setopt INC_APPEND_HISTORY     # Constantly update $HISTFILE
setopt SHARE_HISTORY          # Constantly share history between shell instances
unsetopt FLOW_CONTROL         # Free up Ctrl-Q and Ctrl-S
setopt INTERACTIVE_COMMENTS   # Allow comments in interactive mode

# Hide hostname when logged in as bahaye
DEFAULT_USER="bahaye"

# map CAPS lock to tilda: tilde: 0x35, caps: 0x39
# https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000035}]}'
