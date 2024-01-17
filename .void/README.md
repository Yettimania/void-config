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
