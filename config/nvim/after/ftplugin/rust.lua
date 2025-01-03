-- install: rustup component add rust-analyzer
vim.lsp.start({
    name = 'rust-analyzer',
    cmd = { 'rust-analyzer' },
    root_dir = vim.fs.dirname(
        vim.fs.find({ 'Cargo.toml', '.git' }, { upward = true })[1]
    ),
})
