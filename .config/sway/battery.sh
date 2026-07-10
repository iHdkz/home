#!/bin/bash
# acpiコマンドからパーセンテージと状態を取得
BAT_INFO=$(acpi -b)
PERCENT=$(echo $BAT_INFO | grep -P -o '[0-9]+(?=%)')
STATUS=$(echo $BAT_INFO | awk '{print $3}' | tr -d ',')

if [ "$STATUS" = "Charging" ]; then
    echo "充電 $PERCENT%"
elif [ "$STATUS" = "Discharging" ]; then
    echo "残量 $PERCENT%"
else
    echo "電源 $PERCENT%"
fi
