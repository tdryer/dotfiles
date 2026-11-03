-- install: apt install clangd
return {
    cmd = { 'clangd' },
    filetypes = { 'cpp' },
    root_markers = { 'CMakeLists.txt', '.git' },
}
