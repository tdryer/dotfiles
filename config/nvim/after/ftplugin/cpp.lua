-- install: apt install clangd
vim.lsp.start({
    name = 'clangd',
    cmd = { 'clangd' },
    root_dir = vim.fs.dirname(
        vim.fs.find({ 'CMakeLists.txt', '.git' }, { upward = true })[1]
    ),
})
vim.opt_local.expandtab = false
vim.opt_local.listchars:append { tab="  " }
