# base omz config: https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template
# plugins managed by https://getantibody.github.io/

ANTIBODY_HOME="$(antibody home)"
ZSH="$ANTIBODY_HOME/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# Compile dotfiles
for i in .zshenv \
         .alias_zshrc \
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

# autocompletions
if command -v stern &> /dev/null
then
   source <(stern --completion=zsh)
fi
eval "$(direnv hook zsh)"
