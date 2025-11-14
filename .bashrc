# enable color support of ls, grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'
# alias python='python3'
# alias k='kubectl'
#Enable the alias for auto-completion.
# complete -o default -F __start_kubectl k

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Basic Shell Prompt
PS1='[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\n$ '

# For Local Libraries to link to
export LD_LIBRARY_PATH="/usr/local/lib"

# Using vim for man pages
HISTSIZE=5000
HISTFILESIZE=10000
# export MANPAGER='vim +Man!'
export MANPAGER='vim -M +MANPAGER "+set nonumber" -'

export GUIX_PROFILE="$HOME/.config/guix/current"
export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
