#!/bin/zsh

bat=$(acpi -b | awk -F " |%" '{print $4}')
charge=$(acpi -a | awk '{print $3}')
if [ ${charge} = "on-line" ]
then
    if [ ${bat} -lt 30 ]
    then
        echo  ${bat}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${bat}%
    else
        echo hei   ${bat}%
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
