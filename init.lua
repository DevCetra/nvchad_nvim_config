vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Set textwidth
vim.o.textwidth = 100
-- Set colorcolumn (for visual guide)
vim.o.colorcolumn = "80,100"
-- Enable absolute line numbers
vim.wo.number = true
-- Enable relative line numbers

-- Automatically open NvimTree when Neovim starts.
vim.api.nvim_create_autocmd(
  "VimEnter", {
    callback = function()
      require("nvim-tree.api").tree.open()
    end,
  })

-- Setup nvim-tree.
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- Default mappings.
  api.config.mappings.default_on_attach(bufnr)
  -- Custom mappings.
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '\\', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<C-CR>', function()
    local node = api.tree.get_node_under_cursor()
    if node.nodes then
      api.tree.change_root_to_node(node)
    end
  end, opts('Down'))
end
require("nvim-tree").setup({
  view = {
    width = 60,
  },
  on_attach = my_on_attach,
})

require "options"
require "nvchad.autocmds"

vim.schedule(
  function()
    require "mappings"
  end
)

-- Modify IndentBlankline color to a very light "transparent" white
vim.cmd [[
  highlight IndentBlanklineChar guifg=#F0F0F0 ctermbg=0
  highlight IndentBlanklineContextChar guifg=#E0E0E0 ctermbg=0
]]
