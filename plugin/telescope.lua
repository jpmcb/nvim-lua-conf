require('telescope').load_extension('fzf')

options = { noremap = true }

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>rg', '<cmd>Telescope live_grep<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)

