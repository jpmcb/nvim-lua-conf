require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { 
        "lua_ls",
        "rust_analyzer",
        "gopls",
    },
}

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = { "go", "gomod", "gotmpl", "go.mod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          library = { vim.env.VIMRUNTIME }
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = vim.api.nvim_get_runtime_file("", true)
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

-- Terraform for life
lspconfig.terraformls.setup{}
lspconfig.tflint.setup{}

--lspconfig.tailwindcss.setup {}

-- For the "typescript-language-server"
-- uses default values
lspconfig.tsserver.setup {}

-- Do not need to call setup for the rust-analyizer. This done automagically
-- with the rust-tools plugin
