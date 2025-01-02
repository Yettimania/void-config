-- ---------------------------------------------
-- Kyle Snyders Neovim Config
-- ---------------------------------------------

-- Disable compatibility with legacy Vim
vim.opt.compatible = false

-- ---------------------------------------------
-- Plugin Manager Initialization (packer.nvim)
-- ---------------------------------------------
require('packer').startup(function(use)
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'morhetz/gruvbox'

    use 'godlygeek/tabular'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-commentary'
    use 'ryanolsonx/vim-xit'
    use 'preservim/vim-markdown'
    use 'jpalardy/vim-slime'
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

    use 'rust-lang/rust.vim'
    use 'ziglang/zig.vim'
    -- use 'elixir-editors/vim-elixir'
    use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})
    use 'dense-analysis/ale'
end)


-- ---------------------------------------------
-- Elixir-Tools Setup 
-- ---------------------------------------------
require("elixir").setup({
  nextls = {enable = false},
  elixirls = {enable = true},
  projectionist = {enable = true},
})

-- ---------------------------------------------
-- Options
-- ---------------------------------------------
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.cursorline = true
vim.opt.formatoptions:remove('t')
vim.opt.hlsearch = true
vim.opt.startofline = false
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.textwidth = 80
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- ---------------------------------------------
-- Abbreviations
-- ---------------------------------------------
vim.cmd([[
iab <expr> me:: strftime("Author: Kyle Snyder<cr>Date: %B %d, %Y<cr>License: MIT")
iab <expr> dm strftime("defmodule")
]])

-- ---------------------------------------------
-- Aliases
-- ---------------------------------------------
vim.cmd([[
cmap w!! w !sudo tee > /dev/null %
]])

-- ---------------------------------------------
-- Autocommands and Syntax Highlighting
-- ---------------------------------------------
vim.cmd([[
filetype plugin indent on
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

autocmd BufNewFile,BufRead *.yaml,*.yml setlocal filetype=yaml
autocmd FileType yaml setlocal sw=2 sts=2 et

autocmd BufNewFile,BufReadPre,FileReadPre *.json setlocal filetype=json
autocmd FileType json setlocal sw=2 sts=2 et

autocmd BufNewFile,BufReadPre,FileReadPre *.m setlocal filetype=objc
autocmd FileType objc setlocal sw=4 sts=4 et

autocmd BufNewFile,BufReadPre,FileReadPre *.mm setlocal filetype=objcpp
autocmd FileType objcpp setlocal sw=4 sts=4 et

autocmd BufNewFile,BufReadPre,FileReadPre *.rs setlocal filetype=rust
autocmd FileType rust setlocal sw=4 sts=4 et textwidth=80

autocmd BufNewFile,BufReadPre,FileReadPre *.ex,*.exs setlocal filetype=elixir
autocmd FileType elixir setlocal sw=2 sts=2 et textwidth=80

autocmd BufNewFile,BufReadPre,FileReadPre *.py setlocal filetype=python
autocmd FileType python setlocal sw=4 sts=4 et

autocmd BufNewFile,BufReadPre,FileReadPre *.zig setlocal filetype=zig
autocmd FileType zig setlocal sw=4 sts=4 et

autocmd BufNewFile,BufRead,FileReadPre *.md,*.markdown setlocal filetype=markdown
autocmd FileType markdown setlocal sw=4 sts=4 et spell

autocmd FileType text setlocal spell
]])

-- ---------------------------------------------
-- Spell Check Settings
-- ---------------------------------------------
vim.opt.spelllang = {'en'}
vim.cmd([[
highlight clear SpellBad
highlight SpellBad term=standout cterm=underline ctermfg=red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
]])

-- ---------------------------------------------
-- Mappings
-- ---------------------------------------------
vim.g.mapleader = ","
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':e!<CR>', { noremap = true, silent = true })

-- ---------------------------------------------
-- Plugin Configuration
-- ---------------------------------------------
vim.g.airline_theme = 'base16_gruvbox_dark_soft'
vim.g.airline_powerline_fonts = 0
vim.g.slime_target = "tmux"
vim.g.ale_completion_enabled = 0
vim.g.ale_lint_on_save = 1
vim.g.ale_fix_on_save = 1
