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
require('lspconfig').pylyzer.setup {}
require('lspconfig').clangd.setup {}



