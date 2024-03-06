-- Hi

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('tpope/vim-surround')
Plug('tpope/vim-commentary')
Plug('kaarmu/typst.vim')
Plug('dasupradyumna/midnight.nvim')

vim.call('plug#end')
