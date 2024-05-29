-- insert bullets when starting new line
-- use C-U to cancel, C-T to indent, C-D to outdent
vim.opt_local.comments = {
    "b:* [ ]",
    "b:* [X]",
    "b:* [x]",
    "b:*",
    "b:- [ ]",
    "b:- [X]",
    "b:- [x]",
    "b:-",
}
vim.opt_local.formatoptions:append("ro")
vim.api.nvim_set_hl(0, "markdownCode", { link="String" })
vim.api.nvim_set_hl(0, "markdownCodeBlock", { link="String" })
vim.treesitter.start()
vim.opt_local.conceallevel = 2
