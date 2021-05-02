#!/bin/zsh
exec $(cat ${HOME}/.zhistory | fzf --no-sort --tac --header "History")
