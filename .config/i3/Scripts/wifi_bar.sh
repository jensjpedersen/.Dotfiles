#! /bin/zsh

signal=$(nmcli device wifi list | grep "*" | awk '{print $8}')%
echo $signal
