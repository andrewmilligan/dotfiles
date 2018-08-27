# Uncomment for default PS1 setting:
#export PS1="\h:\W \u\$"
export PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '


# Colorize ls output
alias ls='ls -Gh'
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"  # Linux defaults


# Colorize grep output
alias grep='grep --color=auto'
