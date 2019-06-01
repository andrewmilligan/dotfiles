# Uncomment for default PS1 setting:
#export PS1="\h:\W \u\$"
#export PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
export PS1='\[\033[01;91m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '


# Colorize ls output
alias ls="ls -Gh"
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"  # Linux defaults


# Colorize grep output
alias grep="grep --color=auto"


# If on Mac, set .vimrc file based on iTerm profile
OS=`uname -s`
if [[ $OS = "Darwin" ]]; then
  TERMINAL_PROFILE=`echo "$ITERM_PROFILE" | tr '[:upper:]' '[:lower:]'`
  TERMINAL_PROFILE=( $TERMINAL_PROFILE )
  TERMINAL_PROFILE="$( IFS='-'; echo "${PROFILE[*]}" )"
else
  VIMRC="$HOME/.vimrc"
  TERMINAL_PROFILE=
fi
export VIMRC="$HOME/.vimrc"
export TERMINAL_PROFILE="$TERMINAL_PROFILE"

export PATH="/Users/andrew/pkg/bin:$PATH:/Users/andrew/bin"

export PKGSRC="$HOME/pkgsrc"
