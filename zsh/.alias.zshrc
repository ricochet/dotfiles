# Disable echo escape sequences in MSys2 or Cygwin - variables inherited from
# Windows may have backslashes in them
[[ $OSTYPE == (msys|cygwin) ]] && alias echo='echo -E'
alias hgrep='fc -fl 0 | grep'

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
# alias vi="vi"
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

export PATH_TO_MEMSQL=~/memsql
alias memsql='mysql --local-infile=1 -h 127.0.0.1 -u root --prompt="memsql> "' # client to connect to memsql
alias my='mysql --local-infile=1 -h 127.0.0.1 --socket=/var/run/mysqld/mysqld.sock -u root --port 3307' # client to connect to mysql (running on port 3307)

# run singlebox memsqld
alias       single='cd $PATH_TO_MEMSQL/debug;   ./memsqld --singlebox'
alias      singler='cd $PATH_TO_MEMSQL/release; ./memsqld --singlebox'
# run loopback memsqld
alias  distributed='cd $PATH_TO_MEMSQL/debug;   ./memsqld'
alias distributedr='cd $PATH_TO_MEMSQL/release; ./memsqld'
# run memsqld in gdb
alias      singled='cd $PATH_TO_MEMSQL/debug; gdb -ex run -ex "tui enable" --args ./memsqld --singlebox'
alias distributedd='cd $PATH_TO_MEMSQL/debug; gdb -ex run -ex "tui enable" --args ./memsqld            '

alias t='$PATH_TO_MEMSQL/memsqltest/t.py'
alias pt='psy test --debug-only -f'

alias memmake='memsql-please make debug --skip-binplace memsql-server && ~/memsql/utils/private/save-gdbindex.sh ${PATH_TO_MEMSQL}/debug/memsqld'
alias memclean='memsql-please make debug --skip-binplace clean'

alias c_d='rm -r data/* tracelogs/*' # Clear memsql data (run from the build/install dir you wish to clear)
alias c_p='rm -r plancache/*' # Clear memsql plancache (run from the build/install dir you wish to clear)
alias c_b='rm -r bincache/*' # Clear builds cached by distributed.py (run from memsql/)
