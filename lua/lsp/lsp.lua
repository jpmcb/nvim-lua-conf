local options = { noremap = true }

-- LSP config mappings
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
