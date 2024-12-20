-- [[ opts.lua ]]

local opt = vim.opt

-- [[ Context ]]
opt.number = true
opt.relativenumber = true

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true

-- [[ Search ]]
opt.hlsearch = false

-- [[ Whitespace ]]
opt.expandtab = true
opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
