#!/bin/bash

# Swayからウィンドウツリーを取得し、jqで「ID: ウィンドウ名」の形式に整形
# それをwofiのdmenuモードに渡し、選ばれたIDのウィンドウにフォーカスする
swaymsg -t get_tree | \
  jq -r '.nodes[].nodes[] | recurse(.nodes[]?) | recurse(.floating_nodes[]?) | select(.type=="con" and .name!=null) | "\(.id): \(.name)"' | \
  wofi --show dmenu --prompt "Window" | \
  awk -F ':' '{print $1}' | \
  xargs -I {} swaymsg "[con_id={}] focus"
