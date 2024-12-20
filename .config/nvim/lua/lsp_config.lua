require('mason').setup()
require('mason-lspconfig').setup()

require('lspconfig').lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').typst_lsp.setup{
        settings = {
                exportPdf = "onSave"
        }
}
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

