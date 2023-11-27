-- select square cursor always?
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indentation
vim.opt.smartindent = true

-- text wrapping
vim.opt.wrap = true

-- disable swap file
vim.opt.swapfile = false

-- file backup
vim.opt.backup = false

-- allow undo file creation
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- scroll offset?
vim.opt.scrolloff = 8

-- terminal colors?
vim.opt.termguicolors = true

-- make color column at 160 characters
-- vim.opt.colorcolumn = "120"

--- search mode
vim.opt.hlsearch = true 
vim.opt.incsearch = true

-- set the folding method
-- vim.opt.foldmethod = "expr"
-- vim.foldexpr = "nvim_treesitter#foldexpr()"

-- update timer (ms?)
-- vim.opt.updatetime = 150

-- Set timeouts
vim.opt.timeout = true
vim.opt.timeoutlen = 300

