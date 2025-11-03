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

" Remapped keys
tnoremap <Esc> <C-\><C-n>

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

" Set this last so that vim-airline colors work correctly
colorscheme filipwe

]])
