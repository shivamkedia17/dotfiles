--------------------------------------------------------------------------------



-- [[ Plugins ]]
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

--------------------------------------------------------------------------------
--[[ Global Vim Variables]]



vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.t_co = 256
vim.g.background = "dark"
vim.g.mapleader = ' '

--------------------------------------------------------------------------------
-- [[ Options ]]

local opt = vim.opt

-- [[ Context ]]
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true

-- [[ Search ]]
opt.hlsearch = false

-- [[ Whitespace ]]
opt.expandtab = true
opt.tabstop = 4    -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent

opt.smartindent = true

opt.laststatus = 1

opt.wildmenu = true  -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
opt.showcmd = true   -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
opt.splitright = true

---
--------------------------------------------------------------------------------

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'mfussenegger/nvim-lint' },
        { 'stevearc/conform.nvim',            opts = {} },
        { 'tpope/vim-surround' },
        { 'tpope/vim-commentary' },
        { 'dasupradyumna/midnight.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'simrat39/rust-tools.nvim' },
        { 'rust-lang/rust.vim' },
        { 'nvim-treesitter/nvim-treesitter' },
        { 'mhartington/formatter.nvim' },
    },
    -- Configure any other settings here. See the documentation for more details.
    checker = { enabled = true, notify = false },
})

require('mason').setup()

local lsp_servers = {
    "clangd",
    "denols",
    "eslint",
    "html",
    "jsonls",
    "pyright", -- Changed from pylyzer to pyright
    "rust_analyzer",
    "gopls",
}

local formatters = {
    "prettier",
    "stylua",
    "ruff",
    "rustfmt",
    "gofmt",
}

require("mason-lspconfig").setup({
    ensure_installed = lsp_servers,
})

-- Setup linting
require('lint').linters_by_ft = {
    javascript = { 'eslint' },
    typescript = { 'eslint' },
}

-- Configure language servers with diagnostic capabilities
local lspconfig = require('lspconfig')

-- Python setup
lspconfig.pyright.setup {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace"
            }
        }
    }
}

-- Rust setup
require('rust-tools').setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    }
})

-- JavaScript/TypeScript setup with ESLint
lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
    settings = {
        packageManager = 'npm'
    },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
})

-- JSON setup
lspconfig.jsonls.setup {}

-- Go setup
lspconfig.gopls.setup({
    cmd = { "gopls" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})

-- Setup autoformatting
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        rust = { "rustfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        go = { "gofmt" },
    },
    format_on_save = true,
})

-- Trigger linting on changes
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

----------------------------------------------------------------------------------------

-- -- [[ More settings ]]

vim.cmd.colorscheme 'midnight'

--------------------------------------------------------------------------------
-- function to set keymaps
local function set_keymap(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- local variable 'opts' to store the keymap options
local opts = {
    noremap = true,
    silent = true
}

set_keymap('n', '<leader>pv', ':Vex<CR>', opts)
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
set_keymap('n', '<leader><CR>', ':so %<CR>', opts)

--------------------------------------------------------------------------------
