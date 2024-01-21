-- FIXME - this slows down neovim, so enable only when debugging LSP issues
vim.lsp.set_log_level("debug")

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- -- Global mappings.
lspconfig.pylsp.setup {
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true, -- Enable the plugin
                    -- executable = "<path-to-ruff-bin>",  -- Custom path to ruff
                    -- config = "<path_to_custom_ruff_toml>",  -- Custom config for ruff to use
                    -- extendSelect = { "I" },  -- Rules that are additionally used by ruff
                    -- extendIgnore = { "C90" },  -- Rules that are additionally ignored by ruff
                    -- format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                    -- severities = { ["D212"] = "I" },  -- Optional table of rules where a custom severity is desired
                    -- unsafeFixes = false,  -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

                    -- -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                    -- lineLength = 88,  -- Line length to pass to ruff checking and formatting
                    -- exclude = { "__about__.py" },  -- Files to be excluded by ruff checking
                    -- select = { "F" },  -- Rules to be enabled by ruff
                    -- ignore = { "D210" },  -- Rules to be ignored by ruff
                    -- perFileIgnores = { ["__init__.py"] = "CPY001" },  -- Rules that should be ignored for specific files
                    -- preview = false,  -- Whether to enable the preview style linting and formatting.
                    -- targetVersion = "py310",  -- The minimum python version to target (applies for both linting and formatting).
                },
                pylsp_mypy = { enabled = true, },
                pycodestyle = { enabled = false, },
                pyflakes = { enabled = false, },
                mccabe = { enabled = false, },
                jedi_completion = { fuzzy = true },
                flake8 = {
                    enabled = false,
                    maxLineLength = 90
                },
                black = {
                    cache_config = true,
                    enabled = true,
                    line_length = 90,
                }
            }
        }
    }
}
--
-- -- C lsps require a project file, use ctags and linting instead
-- --lspconfig.clangd.setup { }

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Note - Needs a vhdl_ls.toml project file at project root
lspconfig.vhdl_ls.setup {
    capabilities = capabilities,
}

lspconfig.perlls.setup {
    capabilities = capabilities,
}

-- TODO - test the other system verilog lsps
lspconfig.verible.setup {
    capabilities = capabilities,
    root_dir = function(_)
        return vim.loop.cwd()
    end,
}

lspconfig.lemminx.setup {
    capabilities = capabilities,
}

lspconfig.bashls.setup {
    capabilities = capabilities,
    root_dir = function(_)
        return vim.loop.cwd()
    end,
}

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

        nmap('gD', vim.lsp.buf.declaration, "[g]oto [D]eclaration")
        nmap('gd', vim.lsp.buf.definition, "[g]oto [d]efinition")
        nmap('gr', vim.lsp.buf.references, "[g]oto [r]eferences")
        nmap('gi', vim.lsp.buf.implementation, "[g]oto [i]mplementation")
        nmap('K', vim.lsp.buf.hover, "Hover Documentation")
        nmap('<C-k>', vim.lsp.buf.signature_help, "Signature Documenation")
        nmap('<leader>ca', vim.lsp.buf.code_action, "[c]ode [a]ction")
        nmap('<leader>D', vim.lsp.buf.type_definition, "Type [D]efinition")
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
            vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
    end,
})
