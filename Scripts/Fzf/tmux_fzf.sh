#!/bin/sh
# Searches for git repositories and attathc/create tmux session

search=$(fd -t d _git$ ${HOME})
serach_names=$(echo "${search}" | awk -F "/" '{print $NF}')
name=$(echo "${serach_names}" | fzf --header="Tmux attach/create new session")
dir=$(echo "${search}" | grep ${name})

if [[ $(tmux ls) =~ ${name} ]]; then
    tmux a -t ${name}
else
    cd ${dir}
    tmux new -s ${name}
fi
