local_shell=$(basename $SHELL)
if [ "zsh" != "${local_shell}" ]; then
    export PS1='\[\033[0;32m\][ \u@\h ] \[\033[0;35m\]$PWD\n\[\033[0;32m\]$\[\033[0m\] '
fi
