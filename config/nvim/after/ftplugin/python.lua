-- install: pip install python-lsp-ruff
vim.lsp.start({
    name = 'python-lsp-server',
    cmd = { 'pylsp' },
    settings = { pylsp = { plugins = { ruff = {
        enabled = true,
        extendSelect = { 'ARG' },
    } } } },
    on_attach = function(client, bufnr)
        -- Do not use lsp for `gq` formatting
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    end,
})
