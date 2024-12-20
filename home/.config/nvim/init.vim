" VIM-rc-file primarily for Unix-like OS:es
" By filipwe
" Last updated 2023-07-08

" Settings from Vundle (plugin manager)
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Work-related
" Plugin 'hashivim/vim-terraform'
" Plugin 'github/copilot.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End of Settings from Vundle (plugin manager)
" Install listed plugins with :PluginInstall


" Common settings
set noswapfile

" Sets indents to four spaces, as well as converting tabs to 4 spaces
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4

" Consistent indents in new lines
set smarttab

" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:-,nbsp:_
set list

set guifont=Lucida\ Console:h10
set ruler

" Colors and colorscheme
set t_Co=256
syntax on
set hlsearch
colorscheme filipwe

" Syntax for asm6502
augroup asm6502
    au!
    autocmd BufNewFile,BufRead *.s set syntax=asm6502
augroup END

" Optimizing searches in repos.
set wildignore=*/.git/*,*/*venv*/*,*/__pycache__/*,*/temp_test/*

" Set netwr to be sticky to the left.
let g:netrw_altv=1

" Allow vim-airline to find correct fonts
let g:airline_powerline_fonts = 1

" Allow setting dark/light theme from environment variable
if empty($BACKGROUND)
    let background = "dark"
else
    let background = $BACKGROUND
endif

let &background=background
" let g:airline_theme='zenburn'
let g:airline_theme='base16_gruvbox_dark_soft'

" Allow swtiching pane (to Tmux) from Netrw with <C-l>
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh

" Testing search dirs
set path+=**

