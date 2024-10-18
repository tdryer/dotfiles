-- install: go install golang.org/x/tools/gopls@latest
vim.lsp.start({
    name = 'gopls',
    cmd = { 'gopls' },
    root_dir = vim.fs.dirname(
        vim.fs.find({ 'go.mod', 'go.work', '.git' }, { upward = true })[1]
    ),
})
vim.opt_local.expandtab = false
vim.opt_local.list = false
