require 'nvchad.mappings'


local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
-- General Mappings
--------------------------------------------------------------------------------

map('n', '<Leader>//-', function() require('configs.add_comment_separator').add_comment_separator() end, opts)

-- Toggle line diagnostics.
map('n', '<Leader>xt', function() vim.diagnostic.open_float({ scope = "line" }) end, opts)

-- Exit terminal mode using 'C-w'.
map('t', '<C-w>', '<C-\\><C-N>', opts)

-- Exit insert mode using 'jk'.
map('i', 'jk', '<Esc>', opts)

-- F13: Enter Normal mode (from any mode).
map({ 'i', 'n', 'v', 'c', 't' }, '<F13>', '<Esc>', opts)

-- F14: Enter Insert mode (from any mode).
map({ 'i', 'n', 'v', 'c', 't' }, '<F14>', '<Esc>i', opts)

-- F15: Enter Visual mode (from any mode).
map({ 'i', 'n', 'v', 'c', 't' }, '<F15>', '<Esc>v', opts)

-- F16: Enter Command mode (from any mode).
map({ 'i', 'n', 'v', 'c', 't' }, '<F16>', '<Esc><Cmd>call feedkeys(":")<CR>', opts)

-- F19: Exit Terminal mode.
map('t', '<F19>', 'exit<CR>', opts)

-- F19: Write out current buffer (while in insert mode).
map('i', '<F19>', '<Esc>:w<CR>a', opts)

--------------------------------------------------------------------------------
-- LSP Mappings
--------------------------------------------------------------------------------

-- Refactor a symbol.
map({ 'n', 'v' }, '<Leader>rs', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Refactor a symbol', unpack(opts) })

-- Replace text using regex pattern.
map({ 'n', 'v' }, '<Leader>rr', '<cmd>lua ReplaceUsingRegex()<CR>', { desc = 'Replace text using regex', unpack(opts) })

-- Show hover information.
map('n', '<Leader>I', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show hover information', unpack(opts) })

-- Go to the definition of a symbol.
map('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to the definition', unpack(opts) })

-- Find references to a symbol.
map('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Find references', unpack(opts) })

--------------------------------------------------------------------------------
-- NVIM DAP Mappings
--------------------------------------------------------------------------------

-- Step into the debugger.
map('n', '<Leader>dl', '<cmd>lua require"dap".step_into()<CR>', { desc = 'Step into', unpack(opts) })

-- Step over in the debugger.
map('n', '<Leader>dj', '<cmd>lua require"dap".step_over()<CR>', { desc = 'Step over', unpack(opts) })

-- Step out of the debugger.
map('n', '<Leader>dk', '<cmd>lua require"dap".step_out()<CR>', { desc = 'Step out', unpack(opts) })

-- Continue execution in the debugger.
map('n', '<Leader>dc', '<cmd>lua require"dap".continue()<CR>', { desc = 'Continue', unpack(opts) })

-- Toggle a breakpoint in the debugger.
map('n', '<Leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = 'Toggle breakpoint', unpack(opts) })

-- Set a conditional breakpoint.
map('n', '<Leader>dd', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { desc = 'Set conditional breakpoint', unpack(opts) })

-- Terminate the debugger.
map('n', '<Leader>de', '<cmd>lua require"dap".terminate()<CR>', { desc = 'Terminate debugger', unpack(opts) })

-- Run the last debugging session.
map('n', '<Leader>dr', '<cmd>lua require"dap".run_last()<CR>', { desc = 'Run last session', unpack(opts) })

--------------------------------------------------------------------------------
-- Rust Mappings
--------------------------------------------------------------------------------

-- Show testable items in Rust.
map('n', '<Leader>dt', '<cmd>lua vim.cmd("RustLsp testables")<CR>', { desc = 'Show testables', unpack(opts) })

--------------------------------------------------------------------------------
-- Git Mappings
--------------------------------------------------------------------------------

map('n', '<Leader>gh', ':Gitsigns preview_hunk<CR>', opts)
