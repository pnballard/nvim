local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_isntalled = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "perl",
        "verilog",
    },
    sync_install = false,
    ignore_install = { "" },
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
