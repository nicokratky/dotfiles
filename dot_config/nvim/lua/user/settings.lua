local g = vim.g
local o = vim.o

o.termguicolors = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- always show relative line numbers
o.number = true
o.relativenumber = true

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 10

o.autoindent = true
o.wrap = true
o.breakindent = true

-- Case insensitive seraching unless /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Better searching
o.hlsearch = true
o.incsearch = true

-- Sane splitting
o.splitbelow = true
o.splitright = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Map <leader> to ,
g.mapleader = ','
g.maplocalleader = ','
