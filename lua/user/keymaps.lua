-- Convenience
local keymap = vim.api.nvim_set_keymap

-- Fast ESC to normal mode from insert mode
keymap("i", "jk", "<ESC>", { noremap = true, silent = true})

-- Easy navigation for split windows
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true})
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true})
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true})
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true})

-- Buffer switching
keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true})
keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true})

-- Easy opening of files in new tabs
--keymap("n", "nt", ":tabnew", { noremap = true, silent = true})
keymap("n", "<C-Right", ":tabnext<CR>", { noremap = true, silent = true})
keymap("n", "<C-Left", ":tabprevious<CR>", { noremap = true, silent = true})

-- Visual
keymap("v", ">", ">gv", { noremap = true, silent = true})
keymap("v", "<", "<gv", { noremap = true, silent = true})
keymap("v", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true})
keymap("v", "<A-k>", ":m .-1<CR>==", { noremap = true, silent = true})

-- Leader stuff
vim.g.mapleader = " "

--keymap("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true})
--keymap("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true})

keymap("n", "<leader><leader>",  ":e", { noremap = true, silent = true})
keymap("n", "<leader>e",  ":NvimTreeToggle<CR>", { noremap = true, silent = true})
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true})
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", { noremap = true, silent = true})
keymap("n", "<leader>g",  ":Telescope grep_string<CR>", { noremap = true, silent = true})
keymap("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true})
