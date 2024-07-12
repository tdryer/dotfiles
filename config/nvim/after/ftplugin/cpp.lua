-- install: apt install clangd
vim.lsp.start({ name = 'clangd', cmd = { 'clangd' } })
vim.opt_local.expandtab = false
vim.opt_local.listchars:append { tab="  " }
