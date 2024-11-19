require "nvchad.mappings"

local map = vim.keymap.set

-- General Mappings
-- Enter command mode using ';' in normal mode.
map(
  "n",
  ";",
  ":",
  { desc = "CMD enter command mode" }
)

-- Exit insert mode using 'jk'.
map(
  "i",
  "jk",
  "<ESC>",
  { desc = "Exit insert mode" }
)

-- LSP Mappings
-- Show hover information.
map(
  "n",
  "<Leader>I",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  {
    desc = "Show hover information",
    noremap = true,
    silent = true,
  }
)

-- Refactor a symbol.
map(
  "n",
  "<Leader>rs",
  "<cmd>lua vim.lsp.buf.rename()<CR>",
  {
    desc = "Refactor a symbol",
    noremap = true,
    silent = true,
  }
)

-- Go to the definition of a symbol.
map(
  "n",
  "<Leader>gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  {
    desc = "Go to the definition",
    noremap = true,
    silent = true,
  }
)

-- Find references to a symbol.
map(
  "n",
  "<Leader>gr",
  "<cmd>lua vim.lsp.buf.references()<CR>",
  {
    desc = "Find references",
    noremap = true,
    silent = true,
  }
)

-- NVIM DAP (Debug Adapter Protocol) Mappings
-- Step into the debugger.
map(
  "n",
  "<Leader>dl",
  "<cmd>lua require'dap'.step_into()<CR>",
  { desc = "Debugger step into" }
)

-- Step over in the debugger.
map(
  "n",
  "<Leader>dj",
  "<cmd>lua require'dap'.step_over()<CR>",
  { desc = "Debugger step over" }
)

-- Step out of the debugger.
map(
  "n",
  "<Leader>dk",
  "<cmd>lua require'dap'.step_out()<CR>",
  { desc = "Debugger step out" }
)

-- Continue execution in the debugger.
map(
  [<35;69;33M"n",
  "<Leader>dc",
  "<cmd>lua require'dap'.continue()<CR>",
  { desc = "Debugger continue" }
)

-- Toggle a breakpoint in the debugger.
map(
  "n",
  "<Leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" }
)

-- Set a conditional breakpoint.
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)

-- Terminate the debugger.
map(
  "n",
  "<Leader>de",
  "<cmd>lua require'dap'.terminate()<CR>",
  { desc = "Debugger terminate" }
)

-- Run the last debugging session.
map(
  "n",
  "<Leader>dr",
  "<cmd>lua require'dap'.run_last()<CR>",
  { desc = "Debugger run last" }
)

-- Rustaceanvim Mappings
-- Show testable items in Rust.
map(
  "n",
  "<Leader>dt",
  "<cmd>lua vim.cmd('RustLsp testables')<CR>",
  { desc = "Debugger testables" }
)
