#!/bin/bash

# Clean APT cache
sudo apt clean

# Clean Brave cache
rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Cache/*

# Clean general cache
rm -rf ~/.cache/*

# Notify user
notify-send "Cache cleanup complete."

