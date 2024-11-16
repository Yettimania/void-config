" ---------------------------------------------
" Kyle Snyders vimrc
" ---------------------------------------------
set nocompatible		" Disable VI Compatibility

" ---------------------------------------------
" Init - Plugins
" ---------------------------------------------
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'ryanolsonx/vim-xit'
Plug 'preservim/vim-markdown'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'dense-analysis/ale'
call plug#end()

" ---------------------------------------------
" Vim Options
" ---------------------------------------------
set autoindent 			" Default to indenting files
set autoread                    " Automatically reload file
set backspace=indent,eol,start  " Backspace all characters
set formatoptions-=t		" Don't add line-breaks for lines over 'textwidth'
set hlsearch			" Highlight search results
set nostartofline		" Do not jump to first character with page commands
set ruler			" Enable ruler
set showmatch			" Show matching bracket
set showmode			" Show the current made in status line
set showcmd			" Show partial command in status line
set textwidth=80		" 80 columns
set title			" Set the title
set rnu				" Relative line numbers
set bg=dark			" Set background

colorscheme gruvbox

" ---------------------------------------------
" Abbreviations
" ---------------------------------------------
iab <expr> me:: strftime("Author: Kyle Snyder<cr>Date: %B %d, %Y<cr>License: MIT")
iab <expr> dm strftime("defmodule")

" ---------------------------------------------
" Aliases
" ---------------------------------------------
cmap w!! w !sudo tee > /dev/null %

" ---------------------------------------------
" File/Indenting and Syntax Highlighting
" ---------------------------------------------
if has("autocmd")
	filetype plugin indent on

	" Jump to previous cursor location, unless it's a commit message
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

	" Yaml
	autocmd BufNewFile,BufRead                  *.yaml,*.yml setlocal filetype=yaml
	autocmd FileType                            yaml         setlocal sw=2 sts=2 et

	" JSON files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.json setlocal filetype=json
	autocmd FileType                            json   setlocal sw=2 sts=2 et

	" Objective C / C++
	autocmd BufNewFile,BufReadPre,FileReadPre   *.m    setlocal filetype=objc
	autocmd FileType                            objc   setlocal sw=4 sts=4 et
	autocmd BufNewFile,BufReadPre,FileReadPre   *.mm   setlocal filetype=objcpp
	autocmd FileType                            objcpp setlocal sw=4 sts=4 et

	" Rust files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.rs   setlocal filetype=rust
	autocmd FileType                            rust   setlocal sw=4 sts=4 et textwidth=80
	
	" Elixir files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.ex   setlocal filetype=elixir
	autocmd FileType                            elixir setlocal sw=2 sts=2 et textwidth=80
	autocmd BufNewFile,BufReadPre,FileReadPre   *.exs  setlocal filetype=elixir
	autocmd FileType                            elixir setlocal sw=2 sts=2 et textwidth=80

	" Python files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.py   setlocal filetype=python
	autocmd FileType                            python setlocal sw=4 sts=4 et
	 
	" Zig files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.zig   setlocal filetype=zig
	autocmd FileType                            zig setlocal sw=4 sts=4 et

	" Markdown files
	autocmd BufNewFile,BufRead,FileReadPre      *.md,*.markdown setlocal filetype=markdown
	autocmd FileType                            markdown      setlocal sw=4 sts=4 et spell
	
	" TXT files
	autocmd FileType                            text setlocal spell
endif

" ---------------------------------------------
" Spell Check Settings
" ---------------------------------------------
set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout cterm=underline ctermfg=red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


" ---------------------------------------------
" Mappings 
" ---------------------------------------------
let mapleader = ","
nnoremap <leader>f :Files<CR>
nnoremap <leader>e :e!<CR>

" Plugin Configuration
" ---------------------------------------------
let g:airline_theme='base16_gruvbox_dark_soft'
let g:airline_powerline_fonts = 0
let g:slime_target = "tmux"
let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
