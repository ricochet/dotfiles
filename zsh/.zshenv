# Paths
export PATH="/usr/local/bin/:$PATH"

# Set path correctly for Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Vim FTW
export EDITOR='nvim'

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Java and Old
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# export JAVA_HOME=$(/usr/libexec/java_home)
export JDK_HOME=${JAVA_HOME}
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export SPRING_PROFILES_ACTIVE=dev
export SPRING_CONSOLE_TOKEN=guides
export NODE_PATH='/usr/local/lib/node_modules'

# GOLANG
export GOPATH="${HOME}/golang"
export PATH="$PATH:${GOPATH}/bin"
export GOPRIVATE="*.sas.com,github.com/sas-gophers"
export GONOSUMDB=*.sas.com
export GOPROXY=http://goproxy.sas.com:3000

# GitHub
export GITHUB_USER=ricochet

# Repos
export CONVOY_ROOT="${HOME}/repos/convoy"
export PATH="$PATH:${CONVOY_ROOT}/sonder/build/tools/darwin"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# export known env files
set -o allexport
source ~/.secrets
set +o allexport
