local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.load_extension('media_files')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = "cycle_history_next",
                ["<C-p>"] = "cycle_history_prev",
--
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-c>"] = "close",
--
--                ["<Down>"] = "move_selection_next",
--                ["<Up>"] = "move_selection_previous",
--
--                ["<CR>"] = "select_default",
--                ["<C-x>"] = "select_horizontal",
--                ["<C-v>"] = "select_vertical",
--                ["<C-t>"] = "select_tab",
--
--                ["<C-u>"] = "preview_scrolling_up",
--                ["<C-d>"] = "preview_scrolling_down",
--
--                ["<PageUp>"] = "results_scrolling_up",
--                ["<PageDown>"] = "results_scrolling_down",
--
--                ["<Tab>"] = "toggle_selection" + "move_selection_worse",
--                ["<S-Tab>"] = "toggle_selection" + "move_selection_better",
--                ["<C-q>"] = "send_to_qflist" + "open_qflist",
--                ["<M-q>"] = "send_selected_to_qflist" + "open_qflist",
--                ["<C-l>"] = "complete_tag",
--                ["<C-_>"] = "which_key", -- keys from pressing <C-/>,
            },
--
--            n = {
--                ["<esc>"] = "close",
--                ["<CR>"] = "select_default",
--                ["<C-x>"] = "select_horizontal",
--                ["<C-v>"] = "select_vertical",
--                ["<C-t>"] = "select_tab",
--
--                ["<Tab>"] = "toggle_selection" + "move_selection_worse",
--                ["<S-Tab>"] = "toggle_selection" + "move_selection_better",
--                ["<C-q>"] = "send_to_qflist" + "open_qflist",
--                ["<M-q>"] = "send_selected_to_qflist" + "open_qflist",
--
--                ["j"] = "move_selection_next",
--                ["k"] = "move_selection_previous",
--                ["H"] = "move_to_top",
--                ["M"] = "move_to_middle",
--                ["L"] = "move_to_bottom",
--
--                ["<Down>"] = "move_selection_next",
--                ["<Up>"] = "move_selection_previous",
--                ["gg"] = "move_to_top",
--                ["G"] = "move_to_bottom",
--
--                ["<C-u>"] = "preview_scrolling_up",
--                ["<C-d>"] = "preview_scrolling_down",
--
--                ["<PageUp>"] = "results_scrolling_up",
--                ["<PageDown>"] = "results_scrolling_down",
--
--                ["?"] = "which_key",
--            },
        },
    },

    extensions = {
        media_files = {
            filetypes = {"png", "jpg", "jpeg", "tif", "tiff"},
            find_cmd = {"rg"},
        },
    },
}

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {}) 
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {}) 
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
