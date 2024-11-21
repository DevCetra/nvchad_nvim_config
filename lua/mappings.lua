require 'nvchad.mappings'

local map = vim.keymap.set

--------------------------------------------------------------------------------
-- General Mappings
--------------------------------------------------------------------------------

-- Exit insert mode using 'jk' (while in insert mode).
map(
  { 'i' },
  'jk',
  '<Esc>',
  {
    noremap = true,
    silent = true,
  }
)

-- F13: Enter Normal mode (from any mode).
map(
  { 'i', 'n', 'v', 'c', 't' },
  '<F13>',
  '<Esc> ',
  {
    noremap = true,
    silent = true,
  }
)

-- F14: Enter Insert mode (from any mode).
map(
  { 'i', 'n', 'v', 'c', 't' },
  '<F14>',
  '<Esc>i',
  {
    noremap = true,
    silent = true,
  }
)

-- F15: Enter Visual mode (from any mode).
map(
  { 'i', 'n', 'v', 'c', 't' },
  '<F15>',
  '<Esc>v',
  {
    noremap = true,
    silent = true,
  }
)

-- F16: Enter Command mode (from any mode).
map(
  { 'i', 'n', 'v', 'c', 't' },
  '<F16>',
  '<Esc><Cmd>call feedkeys(":")<CR>',
  {
    noremap = true,
    silent = true,
  }
)

-- F19: Exit Terminal mode.
map(
  't',
  '<F19>',
  'exit<CR>',
  {
    noremap = true,
    silent = true,
  }
)

-- F19: Write out current buffer (while in insert mode).
map(
  'i',
  '<F19>',
  '<Esc>:w<CR>a',
  {
    noremap = true,
    silent = true,
  }
)

--------------------------------------------------------------------------------
-- LSP Mappings
--------------------------------------------------------------------------------

-- Refactor a symbol.
map(
  { 'n', 'v' },
  '<Leader>rs',
  '<cmd>lua vim.lsp.buf.rename()<CR>',
  {
    desc = 'Refactor a symbol',
    noremap = true,
    silent = true,
  }
)

-- Replace text using regex pattern.
map(
  { 'n', 'v' },
  '<Leader>rr',
  '<cmd>lua ReplaceUsingRegex()<CR>',
  {
    desc = 'Replace text using regex',
    noremap = true,
    silent = true,
  }
)

-- Show hover information.
map(
  'n',
  '<Leader>I',
  '<cmd>lua vim.lsp.buf.hover()<CR>',
  {
    desc = 'Show hover information',
    noremap = true,
    silent = true,
  }
)

-- Go to the definition of a symbol.
map(
  'n',
  '<Leader>gd',
  '<cmd>lua vim.lsp.buf.definition()<CR>',
  {
    desc = 'Go to the definition',
    noremap = true,
    silent = true,
  }
)

-- Find references to a symbol.
map(
  'n',
  '<Leader>gr',
  '<cmd>lua vim.lsp.buf.references()<CR>',
  {
    desc = 'Find references',
    noremap = true,
    silent = true,
  }
)

function ReplaceUsingRegex()
  -- Prompt for the regex pattern
  local pattern = vim.fn.input('Regex pattern to replace: ')

  -- Prompt for the replacement string
  local replacement = vim.fn.input('Replacement: ')

  -- If both pattern and replacement are provided, perform the replacement
  if pattern ~= '' and replacement ~= '' then
    -- Use 'substitute' command with valid pattern and replacement
    local cmd = string.format('%%s/%s/%s/g', vim.fn.escape(pattern, '/'), vim.fn.escape(replacement, '/'))
    vim.cmd(cmd)
  end
end

--------------------------------------------------------------------------------
-- NVIM DAP (Debug Adapter Protocol) Mappings
--------------------------------------------------------------------------------

-- Step into the debugger.
map(
  'n',
  '<Leader>dl',
  '<cmd>lua require"dap".step_into()<CR>',
  {
    desc = 'Debugger step into',
  }
)

-- Step over in the debugger.
map(
  'n',
  '<Leader>dj',
  '<cmd>lua require"dap".step_over()<CR>',
  {
    desc = 'Debugger step over',
  }
)

-- Step out of the debugger.
map(
  'n',
  '<Leader>dk',
  '<cmd>lua require"dap".step_out()<CR>',
  {
    desc = 'Debugger step out',
  }
)

-- Continue execution in the debugger.
map(
  'n',
  '<Leader>dc',
  '<cmd>lua require"dap".continue()<CR>',
  {
    desc = 'Debugger continue',
  }
)

-- Toggle a breakpoint in the debugger.
map(
  'n',
  '<Leader>db',
  '<cmd>lua require"dap".toggle_breakpoint()<CR>',
  {
    desc = 'Debugger toggle breakpoint',
  }
)

-- Set a conditional breakpoint.
map(
  'n',
  '<Leader>dd',
  '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
  {
    desc = 'Debugger set conditional breakpoint',
  }
)

-- Terminate the debugger.
map(
  'n',
  '<Leader>de',
  '<cmd>lua require"dap".terminate()<CR>',
  {
    desc = 'Debugger terminate',
  }
)

-- Run the last debugging session.
map(
  'n',
  '<Leader>dr',
  '<cmd>lua require"dap".run_last()<CR>',
  {
    desc = 'Debugger run last',
  }
)

--------------------------------------------------------------------------------
-- Rust Mappings
--------------------------------------------------------------------------------

-- Show testable items in Rust.
map(
  'n',
  '<Leader>dt',
  '<cmd>lua vim.cmd("RustLsp testables")<CR>',
  {
    desc = 'Debugger testables',
  }
)

--------------------------------------------------------------------------------
-- Git Mappings
--------------------------------------------------------------------------------

map(
  'n',
  '<Leader>gh',
  ':Gitsigns preview_hunk<CR>',
  {}
)
