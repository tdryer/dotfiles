-- install: pip install ruff
vim.lsp.start({
    name = 'ruff',
    cmd = { 'ruff', 'server' },
    root_dir = vim.fs.dirname(
        vim.fs.find({ 'pyproject.toml', 'setup.py', '.git' }, { upward = true })[1]
    ),
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
