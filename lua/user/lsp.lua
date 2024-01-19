-- FIXME - enabling debug as I set up different servers
vim.lsp.set_log_level("debug")

local lspconfig= require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- --vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- lspconfig.pylsp.setup {
--     settings = {
--         pylsp = {
--             plugins = {
--                 pycodestyle = {
--                     maxLineLength = 85
--                 }
--             }
--         }
--     }
-- }
-- 
-- -- C lsps require a project file, use ctags and linting instead
-- --lspconfig.clangd.setup { }
-- 
-- -- Note - Needs a vhdl_ls.toml project file at project root
-- lspconfig.vhdl_ls.setup { }
-- 
-- lspconfig.perlls.setup { }
-- 
-- lspconfig.verible.setup {
--     root_dir = function(fname)
--         return vim.loop.cwd()
--     end,
-- }

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>lca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>lof', vim.diagnostic.open_float)
    end,
})
