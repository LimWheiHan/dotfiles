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
# PS1='[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\n$ '

# Using vim for man pages
# HISTSIZE=5000
# HISTFILESIZE=10000
# export MANPAGER='vim -M +Man!'

# Using vim for man pages
# HISTSIZE=5000
# HISTFILESIZE=10000
# export MANPAGER='vim +Man!'
# MANPAGER='vim -M +MANPAGER "+set nonumber" -'
MANPAGER='vim -M +MANPAGER -'

# prompt (with showing git branch)
# ref: https://gist.github.com/justintv/168835
FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_RESET="\[\e[0m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"
FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_CYAN="\[\e[36m\]"
FG_GREEN="\[\e[32m\]"
FG_GREY="\[\e[37m\]"
FG_MAGENTA="\[\e[35m\]"
FG_RED="\[\e[31m\]"
FG_WHITE="\[\e[97m\]"
BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_GREEN="\[\e[42m\]"
BG_MAGENTA="\[\e[45m\]"
BG_RED="\[\e[41m\]"

parse_git_bg() {
  [[ $(git status -s 2>/dev/null) ]] && echo -e "\e[43m" || echo -e "\e[42m"
}

parse_git_fg() {
  [[ $(git status -s 2>/dev/null) ]] && echo -e "\e[33m" || echo -e "\e[32m"
}

PS1="\n${FG_BLUE}╭─"  # begin arrow to prompt
PS1+="${FG_MAGENTA}" # begin USERNAME container
# PS1+="${BG_MAGENTA}${FG_CYAN}${FMT_BOLD}  "   # print Arch OS icon
PS1+="${FG_WHITE}\u"                           # print username
PS1+="${FMT_UNBOLD} ${FG_MAGENTA}${BG_BLUE} " # end USERNAME container / begin DIRECTORY container
PS1+="${FG_GREY}\w "                           # print directory
PS1+="${FG_BLUE}${BG_CYAN} "                  # end DIRECTORY container / begin FILES container
PS1+="${FG_BLACK}"
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # print number of folders
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # print number of files
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # print number of symlinks
PS1+="${FMT_RESET}${FG_CYAN}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" # check if git branch exists
PS1+="\$(parse_git_bg) "                                                              # end FILES container / begin BRANCH container
PS1+="${FG_BLACK} BRANCH "                                                            # print current git branch
PS1+="${FMT_RESET}\$(parse_git_fg)\")\n"                                              # end last container (either FILES or BRANCH)
PS1+="${FG_BLUE}╰ "                                                                   # end arrow to prompt
PS1+="${FG_CYAN}\\$ "                                                                  # print prompt
PS1+="${FMT_RESET}"
export PS1

