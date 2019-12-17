### custom setting ###

##################################################
# display current git branch in prompt
# copy and paste at ~/.bashrc

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

branch_color ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      color=""
      if git status | grep 'nothing to commit, working tree clean' > /dev/null 2>&1
    #   if git diff --quiet 2>/dev/null >&2
      then
         color="${c_green}"
      else
         color=${c_red}
      fi
   else
      return 0
   fi
   echo -ne $color
}
# export PS1='\[\033[01;32m\]\D{%F} \[\033[00m\]: \[\033[38;5;117m\]\w\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n\[\033[01;32m\]\u@\h\[\033[00m\]$ \[$(tput sgr0)\]'  # for new Windows Terminal
export PS1='\[\033[38;5;8m\]\D{%F} \[\033[00m\]: \[\033[38;5;117m\]\w\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n\[\033[38;5;8m\]\u@\H\\$ \[$(tput sgr0)\]'  # for original Windows cmd Terminal

# for Mac
# export PS1='\D{%F} \[\033[00m\]: \[\033[38;5;117m\]\w\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n\[\033[00m\]\u@\h\[\033[00m\]$ \[$(tput sgr0)\]'
##################################################

# exa setting
alias ls='exa --git --header'
export LS_COLORS=$LS_COLORS:'di=1;4;34:fi=0;37:'
export EXA_COLORS='da=1;31:'

# open command
open(){
	explorer.exe `wslpath -w "$PWD/$1"`
}

# alias shortcuts
alias home='cd /mnt/c/Dev'
alias desk='cd /mnt/c/Users/Yoon/Desktop'
alias aws='ssh -i "<aws key>" <username@hostname>'
alias activate='. env/bin/activate'  # python env activate
alias enablechmod='sudo umount /mnt/c; sudo mount -t drvfs C: /mnt/c -o metadata'  # wsl chmod issue troubleshooting

