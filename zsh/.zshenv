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

# Hide hostname when logged in as bhayes
DEFAULT_USER="bhayes"

if command -v hidutil &> /dev/null
then
   # map CAPS lock to tilda: tilde: 0x35, caps: 0x39\u
   # https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
   hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000035}]}'
fi

# showkey -s
# Capslock:
# 0x3a 0xba
#     58    	0x006d (m)	0x004d (M)	0x006d (m)	0x004d (M)
# keycode  58 press
# Backtick
#      49         0x0060 (grave)  0x007e (asciitilde)     0x0060 (grave)  0x007e (asciitilde)
# keycode  41 release

# Step 3: Create “swap.desktop” file and put it into ~/.config/autostart with following contents in it:

# [Desktop Entry]
# Name=Swap
# Exec=xmodmap -e "keycode 118 = Delete" && xmodmap -e "keycode 119 = Insert"
# Terminal=false
# Type=Application

# chmod +x ~/.config/autostart/swap.desktop

# Paths
export PATH="/usr/local/bin/:$PATH"

# Set path correctly for Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH="${HOME}/golang"
export PATH="$PATH:${GOPATH}/bin"

# Vim FTW
export EDITOR='nvim'

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# GitHub
export GITHUB_USER=ricochet

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kustomize
export XDG_CONFIG_HOME="$HOME/.config"

# export known env files
set -o allexport
source ~/.secrets
set +o allexport

source ~/memsql/.memsqlrc

# Rust
source $HOME/.cargo/env

# Wasmer
export WASMER_DIR="/home/bhayes/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="$HOME/repos/oss/WebAssembly/wabt/bin:$PATH"

# python
export PATH="$HOME/.local/bin:$PATH"

# Wasienv
export WASIENV_DIR="/home/bhayes/.wasienv"
[ -s "$WASIENV_DIR/wasienv.sh" ] && source "$WASIENV_DIR/wasienv.sh"
 export PATH=$PATH:/home/bhayes/repos/oss/WebAssembly/wabt/bin

# emsdk
# source "/home/bhayes/repos/oss/emsdk/emsdk_env.sh"

# Java
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# Spark
export SPARK_HOME="/opt/spark"
export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
export PYSPARK_PYTHON=/usr/bin/python3

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
