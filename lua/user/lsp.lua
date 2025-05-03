--vim.lsp.set_log_level("debug")
local lspconfig = require('lspconfig')


vim.lsp.config('hdl_checker', {
    filetypes = {'vhdl'}
})

vim.lsp.enable('bashls')
vim.lsp.enable('perlls')
vim.lsp.enable('pylsp')
vim.lsp.enable('hdl_checker')
vim.lsp.enable('lemminx')
vim.lsp.enable('verible')
--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
---- -- Global mappings.
--lspconfig.pylsp.setup {
--    capabilities = capabilities,
--    settings = {
--        pylsp = {
--            plugins = {
--                ruff = {
--                    enabled = true, -- Enable the plugin
--                },
--                --[[
--                pylsp_mypy = { enabled = true, },
--                pycodestyle = { enabled = false, },
--                pyflakes = { enabled = false, },
--                mccabe = { enabled = false, },
--                jedi_completion = { fuzzy = true },
--                flake8 = {
--                    enabled = false,
--                    maxLineLength = 90
--                },
--                black = {
--                    cache_config = true,
--                    enabled = true,
--                    line_length = 90,
--                } ]]
--            }
--        }
--    }
--}
---- -- C lsps require a project file, use ctags and linting instead
---- --lspconfig.clangd.setup { }
--
--lspconfig.lua_ls.setup {
--    capabilities = capabilities,
--    settings = {
--        Lua = {
--            diagnostics = {
--                globals = { 'vim' }
--            }
--        }
--    }
--}
--
---- xml lsp
--lspconfig.lemminx.setup {
--    capabilities = capabilities,
--}
--
---- In windows dont' set up HDL and bash lsps
--if vim.loop.os_uname().sysname == "Linux" then
--    -- Note - Needs a vhdl_ls.toml project file at project root
--    -- lspconfig.vhdl_ls.setup {
--    --     capabilities = capabilities,
--    -- }
----    lspconfig.hdl_checker.setup {
----        capabilities = capabilities,
----    }
--
--    lspconfig.perlls.setup {
--        capabilities = capabilities,
--    }
--
--    lspconfig.verible.setup {
--        capabilities = capabilities,
--        root_dir = function(_)
--            return vim.loop.cwd()
--        end,
--    }
--
--    lspconfig.bashls.setup {
--        capabilities = capabilities,
--        root_dir = function(_)
--            return vim.loop.cwd()
--        end,
--    }
--end

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
