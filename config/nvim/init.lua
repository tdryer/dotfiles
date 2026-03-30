vim.pack.add({
    "https://github.com/bitc/vim-bad-whitespace",
    "https://github.com/junegunn/fzf",
    "https://github.com/junegunn/fzf.vim",
    "https://github.com/ledger/vim-ledger",
    "https://github.com/lifepillar/vim-solarized8",
    "https://github.com/ggml-org/llama.vim",
})
vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, {})
vim.api.nvim_create_user_command("PackAutoDelete", function()
    local names = vim.iter(vim.pack.get(nil, {info = false}))
        :filter(function(p) return not p.active end)
        :map(function(p) return p.spec.name end)
        :totable()
    if #names > 0 then vim.pack.del(names) end
end, {})

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.statusline = " %f%m%h%r%=%p%% %l/%L %c "
vim.g.solarized_statusline = "flat"
vim.opt.scrolloff = 5
vim.opt.clipboard = "unnamedplus" -- requires `wl-clipboard` (Wayland) or `xsel` (X11)
vim.opt.modeline = false -- security
vim.opt.list = true
vim.opt.listchars = { tab="→ " }
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.signcolumn = "no"
vim.keymap.set("n", "<Space>", ":nohlsearch<CR>")
vim.cmd.colorscheme("solarized8")
vim.keymap.set("n", "<C-P>", ":Files<CR>")
vim.keymap.set("n", "<C-O>", ":RG<CR>")
vim.g.fzf_layout = {
    window = {
        width = 0.9,
        height = 0.9,
    }
}
vim.g.fzf_vim = {
    preview_window = { "up" },
    grep_multi_line = 1,
}
vim.keymap.set("n", "tk", ":tabnext<CR>")
vim.keymap.set("n", "tj", ":tabprev<CR>")
vim.keymap.set("v", "<", "<gv") -- repeated outdent in visual mode
vim.keymap.set("v", ">", ">gv") -- repeated indent in visual mode
vim.opt.spell = true
vim.opt.spellcapcheck = ""
vim.api.nvim_set_hl(0, "SpellBad", { undercurl=true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#dc322f" }) -- red
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#60512e" }) -- dim yellow
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.breakindentopt = "list:-1" -- hanging indent for lists
vim.opt.linebreak = true
vim.keymap.set("n", "<F12>", vim.lsp.buf.format)
vim.opt.matchpairs:append("<:>")
vim.g.python_indent = {
    open_paren = "shiftwidth()",
    closed_paren_align_last_line = false,
}
vim.keymap.set("ca", "W", "write")
vim.keymap.set("ca", "Q", "quit")
vim.diagnostic.config({ virtual_text = true })
