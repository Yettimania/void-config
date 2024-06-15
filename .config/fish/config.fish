starship init fish | source
atuin init fish | source

source ~/.asdf/asdf.fish

set fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert underscore blink
set fish_cursor_visual block

set fish_greeting "The way you do anything, is the way you do everything."

direnv hook fish | source

set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $PATH

set -gx GPG_TTY $(tty)
set -gx EDITOR vim
set -gx READER zathura
set -gx TERMINAL alacritty
set -gx BROWSER firefox
set -gx VIEWER sxiv
set -gx FILE fd
set -gx TOUCH_STATUS 1

# System Aliases
alias e="vim"
alias ls="exa --icons"
alias void="/usr/bin/git --git-dir=$HOME/.void/ --work-tree=$HOME $arv"

# Git Aliases
alias gnb='git checkout -b' # new branch
alias ga='git add . --all'
alias gb='git branch'
alias gc='git clone'
alias gci='git commit -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdf='git diff' # git diff (full)
alias gi='git init'
alias gl='git log'
alias gs='git status'
alias gsw='git status'
alias gt='git tag'
alias gu='git pull' # gu = git update
