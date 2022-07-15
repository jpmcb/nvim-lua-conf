require'nvim-tree'.setup()

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle <CR>', { noremap = true })
