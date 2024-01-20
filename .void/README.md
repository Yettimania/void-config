# Void System

This is my favorite linux distribution. ♥

## Install onto New System

To avoid a recursive issue add the following to .gitignore

`echo ".void" >> .gitignore`

Then we can clone the `--bare` repo

`git clone --bare <remote-url> $HOME/.void`

Alias for this already exists in the fish config.

To not track all files

`void config --local status.showUntrackedFiles no`

Lastly you can checkout the files.

`void checkout`

## Settings

### Adjust trackpoint speed

`xinput` lists all the input devices. You can then identify the trackpoint ID and run `xinput list-props <id>`

This is only the device id and the `Acceleration Speed` is the property (which has its own ID) that must be edited to slow the speed.

The value is betweetn -1 and 1 and can be set by executing `xinput set-prop <device-id> <prop-id> <setting>`

### Clamshell Mode

I turned off `acpid` for triggering events and removed `handler.sh` file the `zzz` command. This allows me to use the computer with the exeternal monitor as a single screen and close the laptop.

To manage suspend, I have enabled the `elogin` and `dbus` services and edited the `etc/elogind/` settings to include

```bash
[Sleep]
AllowSuspend=yes
```

Which allows me to put the device asleep with `loginctl suspend`

### Clocking

To avoid issues logging into some online provders, the system clock must be correct with the local. I have enabled the `isc-ntpd` service to sync the time with the network.

### Configure audio

This utilizes `alsa,pipewire-alsa, and wireplumber`. It requires and active D-Bus user session so I launched dwm with `dbus-run-session`. It also requires the `XDG_RUNTIME_DIR` which is configured in the `.xinitrc`.

To configure pipewire to use the session manager I configured

```bash
mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
```

For ALSA integreation, we can enable it by:

```bash
mkdir -p /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
```

`wpctl` can then we used to check status and configure output devices with `set-default` 

[Ref Void PipeWire](https://docs.voidlinux.org/config/media/pipewire.html)
