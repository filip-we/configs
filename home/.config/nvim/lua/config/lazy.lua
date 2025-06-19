-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local operating_system = vim.fn.system("uname")

if operating_system:match("Darwin") then
  plugin_list = {
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    "christoomey/vim-tmux-navigator",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "stevearc/oil.nvim",
    "hashivim/vim-terraform",
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
    "CopilotC-Nvim/CopilotChat.nvim",
  }
else
  plugin_list = {
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    "christoomey/vim-tmux-navigator",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "stevearc/oil.nvim",
  }
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugin_list,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
