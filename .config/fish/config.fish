starship init fish | source

set fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert underscore blink
set fish_cursoer_visual block

set fish_greeting "The way you do anything, is the way you do everything."

direnv hook fish | source

set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $PATH

set -gx GPG_TTY $(tty)
set -gx EDITOR hx
set -gx READER zathura
set -gx TERMINAL alacritty
set -gx BROWSER firefox
set -gx VIEWER sxiv
set -gx FILE lf
set -gx TOUCH_STATUS 1
