mkdir /run/user/$(id -u)
chmod 700 /run/user/$(id -u)

XDG_RUNTIME_DIR=/run/user/$(id -u)

feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png

tresorit-cli start &
pipewire &
slstatus &

dbus-run-session dwm
