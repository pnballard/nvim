local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    "nvim-lualine/lualine.nvim",
    "akinsho/bufferline.nvim",
    "moll/vim-bbye",
    "windwp/nvim-autopairs",
    "ludovicchabant/vim-gutentags",
    "christoomey/vim-tmux-navigator",

    -- "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",

    -- Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "p00f/nvim-ts-rainbow",

    -- colorschemes
    "ellisonleao/gruvbox.nvim",
    "Mofiqul/vscode.nvim",
    "marko-cerovac/material.nvim",
    "rebelot/kanagawa.nvim",
    "nyoom-engineering/oxocarbon.nvim",
    "folke/tokyonight.nvim",
--    "navarasu/onedark.nvim",
--    { "catppuccin/nvim", as = "catppuccin", }
    "tanvirtin/monokai.nvim",
    "NLKNguyen/papercolor-theme",
    "bluz71/vim-nightfly-colors",

    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "delphinus/cmp-ctags",

    -- snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    --    -- LSP
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    --  "williamboman/nvim-lsp-installer",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- linting
    "mfussenegger/nvim-lint",

    -- commenting
    "terrortylor/nvim-comment",
}

local opts = {}

require("lazy").setup(plugins, opts)
