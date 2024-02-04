-- install: go install golang.org/x/tools/gopls@latest
vim.lsp.start({ name = 'gopls', cmd = { 'gopls' } })
vim.opt_local.expandtab = false
vim.opt_local.list = false
