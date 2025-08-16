#!/usr/bin/env bash

# Eğer disk yoksa oluştur
if [ ! -f /data/android.img ]; then
    qemu-img create -f qcow2 /data/android.img 8G
fi

# Android’i başlat
xvfb-run -s "-screen 0 1024x768x16" qemu-system-x86_64 \
    -m 2048 \
    -cdrom /data/android-x86.iso \
    -hda /data/android.img \
    -boot d \
    -vnc :0 &

# VNC'yi noVNC ile yayınla
websockify --web=/usr/share/novnc/ 6080 localhost:5900
