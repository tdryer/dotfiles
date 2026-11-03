-- install: go install golang.org/x/tools/gopls@latest
return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork' },
    root_markers = { 'go.mod', 'go.work', '.git' },
}
