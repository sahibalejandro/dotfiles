vim.g.mapleader = ' '

vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.swapfile = false
vim.o.scrolloff = 5
vim.o.sidescrolloff = vim.o.scrolloff
vim.o.mouse = ''
vim.o.laststatus = 0

-- Splits that make more sense
vim.o.splitbelow = true
vim.o.splitright = true

-- Confirm instead of throwing a big ugly error
vim.o.confirm = true

-- Make wildmenu behave more friendly
vim.o.wildmode = 'longest:full,full'

-- Set the title so tmux can display more
-- info in its 'pane_title' setting.
vim.o.title = true

-- Configure indentation
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = vim.o.tabstop

-- Make invisible characters visible
vim.o.list = true
vim.o.listchars = 'tab:> ,trail:·'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
