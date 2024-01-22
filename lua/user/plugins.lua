local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Packer and basic plugins
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "windwp/nvim-autopairs"
    use "ludovicchabant/vim-gutentags"

    -- use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "p00f/nvim-ts-rainbow"

    -- colorschemes
    use "ellisonleao/gruvbox.nvim"
    use "Mofiqul/vscode.nvim"
    use "marko-cerovac/material.nvim"
    use "rebelot/kanagawa.nvim"
    use "nyoom-engineering/oxocarbon.nvim"
    use "folke/tokyonight.nvim"

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"
    use "delphinus/cmp-ctags"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    --    -- LSP
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    --  use "williamboman/nvim-lsp-installer"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- linting
    use "mfussenegger/nvim-lint"

    -- commenting
    use "terrortylor/nvim-comment"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
