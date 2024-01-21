require('nvim_comment').setup()

vim.api.nvim_create_autocmd(
    {
        'BufEnter',
        'BufFilePost',
    },
    {
    pattern = { '*.sv', "*.v", "*.vh" },
    callback = function()
        vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    end,
    }
)

vim.api.nvim_create_autocmd(
    {
        'BufEnter',
        'BufFilePost',
    },
    {
    pattern = { '*.vhd', "*.vhdl"},
    callback = function()
        vim.api.nvim_buf_set_option(0, "commentstring", "-- %s")
    end,
    }
)
