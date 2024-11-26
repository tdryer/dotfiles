-- insert bullets when starting new line via comment prefixes
-- use C-U to cancel, C-T to indent, C-D to outdent
-- TODO: Make auto-wrapping with `gq` indent correctly
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
-- don't auto-wrap text with comment prefixes
vim.opt_local.formatoptions:remove("q")
vim.api.nvim_set_hl(0, "markdownCode", { link="String" })
vim.api.nvim_set_hl(0, "markdownCodeBlock", { link="String" })
-- treesitter is too slow for very large files
if vim.api.nvim_buf_line_count(0) < 10000 then
    vim.treesitter.start()
end
