-- install: pip install ruff
vim.lsp.start({
    name = 'ruff',
    cmd = { 'ruff', 'server', '--preview' },
    init_options = {
        settings = {
            lint = {
                extendSelect = { 'ARG' },
            }
        }
    },
    on_attach = function(client, bufnr)
        -- Do not use lsp for `gq` formatting (wrapping lines)
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end,
})
