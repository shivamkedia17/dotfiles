

--------------------------------------------------------------------------------
-- [[ Plugins ]]

local Plug = vim.fn['plug#']
local api = vim.api

vim.call('plug#begin')

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('tpope/vim-surround')
Plug('tpope/vim-commentary')
Plug('kaarmu/typst.vim')
Plug('dasupradyumna/midnight.nvim')

vim.call('plug#end')


require('mason').setup()
require('mason-lspconfig').setup()

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},  -- Recognize 'vim' as a global variable
      },
    },
  },
}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').denols.setup {}
require('lspconfig').clangd.setup {}
require('lspconfig').gopls.setup({
    cmd = { "gopls" },
    root_dir = function(fname)
        return require('lspconfig').util.root_pattern("go.mod")(fname) or vim.loop.os_homedir()
    end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                staticcheck = true,
            },
            staticcheck = true,
        },
    },
})



--------------------------------------------------------------------------------
-- [[ Options ]]

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
opt.smartindent = true


opt.scrolloff=8

--------------------------------------------------------------------------------

api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)


--------------------------------------------------------------------------------
--[[ Global Vim Variables]]

local g = vim.g

vim.cmd.colorscheme 'midnight'


g.t_co = 256
g.background = "dark"

--------------------------------------------------------------------------------
