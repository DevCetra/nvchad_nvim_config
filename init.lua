-- Set up cache and leader key
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Load custom lazy configuration (optional)
local lazy_config = require("configs.lazy")

-- Set up the plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",  -- Import plugins from NvChad
  },
  { import = "plugins" },  -- Custom plugins
}, lazy_config)

-- Load theme and custom defaults
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Set some basic editor settings
vim.o.textwidth = 100         -- Set textwidth for wrapping
vim.o.colorcolumn = "80,100"  -- Visual guide for lines
vim.wo.number = true          -- Enable absolute line numbers
vim.wo.relativenumber = true  -- Enable relative line numbers

-- Automatically open NvimTree when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- NvimTree setup with custom keymaps
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings from nvim-tree
  api.config.mappings.default_on_attach(bufnr)
  -- Custom mappings
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
    width = 60,  -- Set width of NvimTree
  },
  on_attach = my_on_attach,  -- Apply custom keymaps
})

-- Load other settings from 'options' and 'nvchad.autocmds'
require "options"
require "nvchad.autocmds"

-- Schedule the loading of mappings (e.g., key bindings)
vim.schedule(function()
  require "mappings"
end)

-- Modify IndentBlankline colors to a very light "transparent" white
vim.cmd [[
  highlight IndentBlanklineChar guifg=#F0F0F0 ctermbg=0
  highlight IndentBlanklineContextChar guifg=#E0E0E0 ctermbg=0
]]

-- Setup LSP diagnostics to disable inline warnings and errors
local function setup_lsp_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,         -- Disable inline diagnostic messages
      signs = true,                 -- Enable diagnostic signs in the gutter
      update_in_insert = false,     -- Do not update diagnostics in insert mode
      underline = true,             -- Underline text with diagnostics
    }
  )
end

-- Call the LSP diagnostics setup
setup_lsp_diags()
