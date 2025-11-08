require("config.lazy")

local operating_system = vim.fn.system("uname")

if operating_system:match("Darwin") then
  require("CopilotChat").setup {}
end

require("oil").setup({
   columns = {
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  }
})


vim.cmd([[
" Common settings
set noswapfile

set smartindent
set smarttab

set shiftwidth=4
set expandtab
set tabstop=4

" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:-,nbsp:_
set list

" Not used in nvim
"set guifont=Lucida\ Console:h10

" Colors and colorscheme
set t_Co=256
syntax on
set hlsearch

" Syntax for asm6502
augroup asm6502
    au!
    autocmd BufNewFile,BufRead *.s set syntax=asm6502
augroup END

" Optimizing searches in repos.
set wildignore=*/.git/*,*/*venv*/*,*/__pycache__/*

" Allow setting dark/light theme from environment variable
if empty($BACKGROUND)
    let background = "dark"
else
    let background = $BACKGROUND
endif

let &background=background
if &background == "light"
    let g:airline_theme='light'
else
    let g:airline_theme='base16_gruvbox_dark_soft'
endif

" Check keyboard layout
if empty($KEYBOARD_LAYOUT)
    let keyboard_layout = "qwerty"
else
    let keyboard_layout = $KEYBOARD_LAYOUT
endif

" Remapped keys
" Escape built-in termial easier
tnoremap <Esc> <C-\><C-n>

" Disable spawning empty buffer
nnoremap <C-w><C-n> <nop>|xnoremap <C-w><C-n> <nop>

" Allow vim-airline to find correct fonts
let g:airline_powerline_fonts = 1

" Allow vim-airline to be displayed correctly
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Allow swtiching pane (to Tmux) from Netrw with <C-l>
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh

" Testing search dirs
set path+=**

" Remap if we use Colemak
if keyboard_layout=='colemak'
    " Cursor movement
    noremap n h|xnoremap n h|onoremap n h
    noremap e j|xnoremap e j|onoremap e j
    noremap i k|xnoremap i k|onoremap i k
    noremap o l|xnoremap o l|onoremap o l

    " Move other stuff
    noremap h e
    noremap j o
    noremap k n
    noremap l i

    " Text objects
    onoremap l i
    vnoremap l i

    " Insert
    nnoremap l i
    nnoremap L I

    " Search
    nnoremap k n|xnoremap k n|onoremap k n
    nnoremap K N|xnoremap K N|onoremap K N

    " Window navigation
    nnoremap <C-w>n <C-w>h|xnoremap <C-w>n <C-w>h
    nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j
    nnoremap <C-w>i <C-w>k|xnoremap <C-w>i <C-w>k
    nnoremap <C-w>o <C-w>l|xnoremap <C-w>o <C-w>l
    nnoremap <C-w>N <C-w>H|xnoremap <C-w>n <C-w>h
    nnoremap <C-w>E <C-w>J|xnoremap <C-w>e <C-w>j
    nnoremap <C-w>I <C-w>K|xnoremap <C-w>i <C-w>k
    nnoremap <C-w>O <C-w>L|xnoremap <C-w>o <C-w>l

endif

" Set this last so that vim-airline colors work correctly
colorscheme filipwe

]])
