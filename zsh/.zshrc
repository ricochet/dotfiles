# base omz config: https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
# plugins managed by https://getantibody.github.io/

ANTIBODY_HOME="$(antibody home)"
source ~/.zsh_plugins.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

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

alias v='$EDITOR'
alias ev='$EDITOR ~/.config/nvim/init.vim'

# Update neovim bundles
alias nvbi="nvim +PlugInstall +qa"
alias nvbu="nvim +PlugUpdate +qa"

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

# Map vim to nvim
alias vim="nvim"