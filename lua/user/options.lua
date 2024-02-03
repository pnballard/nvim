vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.visualbell = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.autochdir = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undolevels = 500
vim.opt.colorcolumn = { 80 }
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.hlsearch = true
vim.opt.incsearch = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.guifont = "Hack:h12"
vim.opt.clipboard = unnamedplus
if vim.g.platform_detected == "RedHat" then
    vim.opt.guicursor = ""
end

-- netrw customizations
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 80
vim.g.netrw_keepdir = 20
vim.g.netrw_liststyle = 3
vim.g.netrw_hide = 0
vim.g.netrw_browse_split = 2
