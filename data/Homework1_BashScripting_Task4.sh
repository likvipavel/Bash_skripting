#!/bin/bash

echo "Home dir: $HOME"
echo "User Name: $(whoami)"
echo "User ID: $(id -u)($(id -un))"
echo "Group Information: $(id -g)($(id -gn))"
echo "Terminal: $TERM"
echo "Current directory: $(pwd)"
echo "System date/time: $(date)"

