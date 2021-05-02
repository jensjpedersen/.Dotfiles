#!/bin/zsh
master=$HOME/Sync/FAM/Master

course_name=$(ls -l ${master} | grep "^d" | awk '{print $9}' )

menu=("config\n""vimwiki\n""tmux\n"${course_name})
choise=$(echo ${course_name} | fzf)


dir=${master}/${choise}
#file=$(fd index.md ${dir})
file=${dir}/Notes/index.md
[ -e ${file} ] && vim ${file} # Check if index.md file exist and open in vim
