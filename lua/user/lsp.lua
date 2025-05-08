--vim.lsp.set_log_level("debug")
require('lspconfig')

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

vim.lsp.enable('bashls')
--vim.lsp.enable('hdl_checker')
vim.lsp.enable('lemminx')
vim.lsp.enable('lua_ls')
vim.lsp.enable('perlls')
vim.lsp.enable('pylsp')
--vim.lsp.enable('svlangserver')
vim.lsp.enable('svls')
--vim.lsp.enable('verible')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
        end

        nmap('gD', vim.lsp.buf.declaration,             "[g]oto [D]eclaration")
        nmap('gd', vim.lsp.buf.definition,              "[g]oto [d]efinition")
        nmap('gr', vim.lsp.buf.references,              "[g]oto [r]eferences")
        nmap('gi', vim.lsp.buf.implementation,          "[g]oto [i]mplementation")
        nmap('K', vim.lsp.buf.hover,                    "Hover Documentation")
        nmap('<C-k>', vim.lsp.buf.signature_help,       "Signature Documenation")
        nmap('<leader>ca', vim.lsp.buf.code_action,     "[c]ode [a]ction")
        nmap('<leader>D', vim.lsp.buf.type_definition,  "Type [D]efinition")

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
            vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
    end,
})
