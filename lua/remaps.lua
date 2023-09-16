options = { noremap = true }

-- Change panes on vim ctrl mappings
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', options)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', options)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', options)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', options)

-- Escape maps to a rolling jk
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', options)
