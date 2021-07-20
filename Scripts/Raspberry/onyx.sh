#!/bin/bash
bluetoothctl power on 
bluetoothctl disconnect
bluetoothctl scan on &
sleep 20
bluetoothctl connect 04:FE:A1:94:F3:8F
