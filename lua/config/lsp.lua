-- C/C++ 语言服务器（clangd），使用 Neovim 内置 LSP 客户端与内置补全菜单。

local clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    -- 不自动插入 #include（补全和代码操作都不会加头文件）。
    "--header-insertion=never",
    "--completion-style=detailed",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  -- 工程根标记；.clang-format 不参与根目录判断（全局风格文件位于用户主目录）。
  root_markers = {
    ".clangd",
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
  init_options = {
    clangdFileStatus = true,
  },
}

if vim.fn.executable("clangd") ~= 1 then
  return
end

vim.lsp.config("clangd", clangd)
vim.lsp.enable("clangd")

-- 客户端挂载后启用内置补全菜单（输入时自动弹出）。
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method("textDocument/completion", event.buf) then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})