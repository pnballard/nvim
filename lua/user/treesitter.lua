local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "ini",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "perl",
        "python",
        "rust",
        "verilog",
        "vhdl",
        "vim",
        "vimdoc",
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
