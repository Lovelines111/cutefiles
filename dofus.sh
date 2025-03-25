#!/bin/bash

EXEC="systemd-run --scope -p MemoryMax=6G -- appimage-run /home/luvelyne/Downloads/Ankama\ Launcher-Setup-x86_64.AppImage
"
sudo firejail --net=enp7s0 "$EXEC"
