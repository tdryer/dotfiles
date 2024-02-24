require "paq" {
  "bitc/vim-bad-whitespace",
  "echasnovski/mini.completion",
  "junegunn/fzf",
  "ledger/vim-ledger",
  "lifepillar/vim-solarized8",
  "savq/paq-nvim",
}

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.statusline = " %f%m%h%r%=%p%% %l/%L %c "
vim.g.solarized_statusline = "flat"
vim.opt.scrolloff = 5
vim.opt.clipboard = "unnamedplus"
vim.opt.modeline = false -- security
vim.opt.list = true
vim.opt.listchars = { tab="→ " }
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.signcolumn = "no"
vim.keymap.set("n", "<Space>", ":nohlsearch<CR>")
vim.cmd.colorscheme("solarized8")
vim.keymap.set("n", "<C-P>", ":FZF<CR>")
vim.keymap.set("n", "tk", ":tabnext<CR>")
vim.keymap.set("n", "tj", ":tabprev<CR>")
vim.keymap.set("v", "<", "<gv") -- repeated outdent in visual mode
vim.keymap.set("v", ">", ">gv") -- repeated indent in visual mode
vim.opt.spell = true
vim.opt.spellcapcheck = ""
vim.api.nvim_set_hl(0, "SpellBad", { undercurl=true })
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.breakindentopt = "list:-1" -- hanging indent for lists
vim.opt.linebreak = true
require('mini.completion').setup()
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("n", "<F12>", vim.lsp.buf.format)
vim.opt.matchpairs:append("<:>")
