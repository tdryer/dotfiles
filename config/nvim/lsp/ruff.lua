-- install: pip install ruff
return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', '.git' },
    init_options = {
        settings = {
            lint = {
                extendSelect = { 'ARG' },
            }
        }
    },
    on_attach = function(client, bufnr)
        -- Do not use lsp for `gq` formatting (wrapping lines)
        vim.bo[bufnr].formatexpr = ""
    end,
}
