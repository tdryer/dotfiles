-- install: pip install python-lsp-ruff
vim.lsp.start({
    name = 'python-lsp-server',
    cmd = { 'pylsp' },
    settings = { pylsp = { plugins = { ruff = {
        enabled = true,
        extendSelect = { 'ARG' },
    } } } }
})
