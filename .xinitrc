mkdir /run/user/$(id -u)
chmod 700 /run/user/$(id -u)

echo "laptop" > /tmp/display_state

XDG_RUNTIME_DIR=/run/user/$(id -u)

eval $(dbus-launch)
export DBUS_SESSION_BUS_ADDRESS

feh --bg-scale ~/pics/backgrounds/gruvbox-linux.png

dunst &
tresorit-cli start &
pipewire &
ratpoison
