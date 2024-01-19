-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvimtree.setup({
    disable_netrw = false,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    view = {
        width = 30,
        side = "left",
    },
    actions = {
        open_file = { 
            quit_on_open = true,
        },
    },
    renderer = {
        highlight_git = true,
    },
})
