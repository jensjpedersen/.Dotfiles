#!/bin/zsh

bat=$(acpi -b | awk -F " |%" '{print $4}')
charge=$(acpi -a | awk '{print $3}')

if [ ${charge}="on-line" ]
then
    if [ ${bat} -lt 30 ]
    then
        echo  ${bat}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${bat}%
    else
        echo  ${bat}%
    fi
else 
    if [ ${bat} -lt 30 ]
    then
        echo  ${bat}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${bat}%
    else
        echo  ${bat}%
    fi
fi
#BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
#BAT=$(acpi -b | awk)
#echo "$BAT"
## Full and short texts
#echo "Battery: $BAT"
#echo "BAT: $BAT"
#
## Set urgent flag below 5% or use orange below 20%
#[ ${BAT%?} -le 5 ] && exit 33
#[ ${BAT%?} -le 20 ] && echo "#FF8000"
#
#exit 0
