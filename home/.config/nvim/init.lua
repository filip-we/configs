require("config.lazy")

require("oil").setup({
   columns = {
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
  preview_win = {
    preview_split = "right",
    split = "belowright",
  },
  keymaps = {
    ["<leader>v"] = {
      "actions.select",
      opts = { vertical = true, split = "belowright" },
    },
    ["<leader>V"] = {
      "actions.select",
      opts = { vertical = true, split = "aboveleft" },
    },
    ["<leader>h"] = {
      "actions.select",
      opts = { horizontal = true, split = "belowright" },
    },
    ["<leader>H"] = {
      "actions.select",
      opts = { horizontal = true, split = "aboveleft" },
    },
    ["<C-p>"] = "actions.preview",
  },
})

vim.lsp.enable("ruff")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ruff" },
  handlers = {
    function(server_name)
      vim.lsp.enable(server_name)
    end,
  },
})

-- Make ag search hidden folders
vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

vim.cmd([[
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>, '--hidden --ignore .git', fzf#vim#with_preview(), <bang>0)
]])

vim.keymap.set('n', '<leader>ag', function()
  vim.cmd('Ag ' .. vim.fn.expand('<cword>'))
end, { desc = 'Ag search word under cursor' })

vim.cmd([[
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

" Testing search dirs
set path+=**
" Set this last so that vim-airline colors work correctly
colorscheme filipwe

]])

-- General settings
vim.opt.swapfile = false

-- Enable relative line numbers (with current line number on cursor line)
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8

vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4


-- ------------------------ --
-- Remapped keys
-- ------------------------ --
local no_yank_modes = {'n', 'v'}

-- Escape built-in terminal easier
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Disable spawning empty buffer
vim.keymap.set({ 'n', 'x' }, '<C-w><C-n>', '<nop>')

vim.keymap.set('n', '<leader>k', '<cmd>nohlsearch<CR>', { silent = true })

-- Delete (motion or visual) to black hole
vim.keymap.set(no_yank_modes, '<leader>d', '"_d', { desc = 'Delete without yanking' })
vim.keymap.set(no_yank_modes, '<leader>D', '"_D', { desc = 'Delete line to end without yanking' })

-- Change (motion or visual) to black hole (preserves register when editing)
vim.keymap.set(no_yank_modes, '<leader>c', '"_c', { desc = 'Change without yanking' })
vim.keymap.set(no_yank_modes, '<leader>C', '"_C', { desc = 'Change line to end without yanking' })

-- Easy system clipboard
vim.keymap.set(no_yank_modes, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set(no_yank_modes, '<leader>P', '"+P', { desc = 'Paste from system clipboard' })
vim.keymap.set(no_yank_modes, '<leader>y', '"+y', { desc = 'Yank directly to system clipboard' })
vim.keymap.set(no_yank_modes, '<leader>Y', '"+Y', { desc = 'Yank directly to system clipboard' })

-- Lazy pane splitting
vim.keymap.set('n', '<leader>tn', '<cmd>leftabove vsplit<CR>', { silent = true })
vim.keymap.set('n', '<leader>te', '<cmd>belowright split<CR>', { silent = true })
vim.keymap.set('n', '<leader>ti', '<cmd>leftabove split<CR>', { silent = true })
vim.keymap.set('n', '<leader>to', '<cmd>belowright vsplit<CR>', { silent = true })

local keyboard_layout = vim.env.KEYBOARD_LAYOUT
if not keyboard_layout or keyboard_layout == "" then
  keyboard_layout = "qwerty"
end

if keyboard_layout == 'colemak' then
    -- Window navigation (Colemak: n/e/i/o -> h/j/k/l)
    local modes = { 'n', 'x' }
    local all_modes = {'n', 'v', 'o'}

    vim.keymap.set(all_modes, 'h', 'e', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'j', 'o', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'k', 'nzz', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'l', 'i', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'H', 'E', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'J', 'O', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'K', 'Nzz', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'L', 'I', { remap = false, silent = true })

    vim.keymap.set(all_modes, 'n', 'h', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'e', 'j', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'i', 'k', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'o', 'l', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'N', 'H', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'E', 'J', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'I', 'K', { remap = false, silent = true })
    vim.keymap.set(all_modes, 'O', 'L', { remap = false, silent = true })

    vim.keymap.set(modes, '<C-w>n', '<C-w>h')
    vim.keymap.set(modes, '<C-w>e', '<C-w>j')
    vim.keymap.set(modes, '<C-w>i', '<C-w>k')
    vim.keymap.set(modes, '<C-w>o', '<C-w>l')
    vim.keymap.set(modes, '<C-w>N', '<C-w>H')
    vim.keymap.set(modes, '<C-w>E', '<C-w>J')
    vim.keymap.set(modes, '<C-w>I', '<C-w>K')
    vim.keymap.set(modes, '<C-w>O', '<C-w>L')

    vim.keymap.set(modes, '<leader>wn', '<C-w>h')
    vim.keymap.set(modes, '<leader>we', '<C-w>j')
    vim.keymap.set(modes, '<leader>wi', '<C-w>k')
    vim.keymap.set(modes, '<leader>wo', '<C-w>l')
    vim.keymap.set(modes, '<leader>wN', '<C-w>H')
    vim.keymap.set(modes, '<leader>wE', '<C-w>J')
    vim.keymap.set(modes, '<leader>wI', '<C-w>K')
    vim.keymap.set(modes, '<leader>wO', '<C-w>L')

    -- Ctrl combinations for pane navigation
    vim.keymap.set(modes, '<C-w><C-n>', '<C-w>h')
    vim.keymap.set(modes, '<C-w><C-e>', '<C-w>j')
    vim.keymap.set(modes, '<C-w><C-i>', '<C-w>k')
    vim.keymap.set(modes, '<C-w><C-o>', '<C-w>l')

    -- Keep cursor; scroll one line
    vim.keymap.set('n', '<C-e>', '<C-e>', { remap = false, silent = true })
    vim.keymap.set('n', '<C-i>', '<C-y>', { remap = false, silent = true })

    -- Keep cursor; scroll half screen
    vim.keymap.set('n', '<C-u>', '<C-d>zz', { remap = false, silent = true })
    vim.keymap.set('n', '<C-y>', '<C-u>zz', { remap = false, silent = true })

    -- Jumping in locations and files
    vim.keymap.set('n', '<leader>n', '<C-o>')
    vim.keymap.set('n', '<leader>o', '<C-i>')
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "<leader>rd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rm", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ra", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rf", function()
      vim.lsp.buf.format({ async = false })
    end, opts)
    vim.keymap.set("n", "<leader>ro", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>rn", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>rv", vim.diagnostic.open_float, opts)

    vim.keymap.set("i", "<leader>rc", vim.lsp.buf.signature_help, opts)
  end,
})
