# Void System

This is my favorite linux distribution. ♥

## Install  onto New System

To avoid a recursive issue add the following to .gitignore

`echo ".void" >> .gitignore`

Then we can clone the `--bare` repo

`git clone --bare <remote-url> $HOME/.void`

Alias for this already exists in the fish config.

To not track all files

`void config --local status.showUntrackedFiles no`

Lastly you can checkout the files.

`void checkout`

## Configure audio

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
