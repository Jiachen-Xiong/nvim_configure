-- 键位：内置 LSP 跳转、补全候选确认、文件浏览。

-- 跳转到定义。
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义" })

-- 插入模式：补全菜单打开时 <Tab> 确认候选，否则插入缩进；<Enter> 始终换行。
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  end
  return "<Tab>"
end, { expr = true, replace_keycodes = true, desc = "确认补全候选" })

-- 文件浏览器（netrw，Neovim 自带）。
if vim.fn.exists(":Explore") == 2 then
  vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "文件浏览器" })
end

-- 快速保存。
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "保存" })