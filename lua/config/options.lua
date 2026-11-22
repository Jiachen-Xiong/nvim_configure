-- 基础选项，不依赖插件管理器。
-- Neovim 内置功能：LSP、补全菜单、treesitter、文件编码识别。

local is_windows = vim.fn.has("win32") == 1
local is_wsl = vim.fn.has("wsl") == 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 环境变量 ---------------------------------------------------------------

-- Windows：curl 从该目录读取配置（curl/.curlrc 关闭 Schannel 证书吊销检查）。
if is_windows then
  vim.env.CURL_HOME = vim.fs.joinpath(vim.fn.stdpath("config"), "curl")
end

-- Linux/WSL：把 ~/.local/bin 加入 PATH（ripgrep、fd 等工具）。
if not is_windows then
  local bindir = vim.fs.joinpath(vim.fn.expand("~"), ".local", "bin")
  local path = vim.env.PATH or ""
  if vim.uv.fs_stat(bindir) and not path:find(bindir, 1, true) then
    vim.env.PATH = bindir .. ":" .. path
  end
end

-- 缩进 -------------------------------------------------------------------

-- 4 空格缩进。
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- 显示 -------------------------------------------------------------------

-- 行号、诊断列、80 列竖线。
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.cursorline = true

-- 搜索 -------------------------------------------------------------------

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- 编辑 -------------------------------------------------------------------

vim.opt.mouse = "a"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300

-- 补全菜单：menuone 单候选也弹出，noinsert 不自动插入文本。
-- 首项自动选中，由 <Tab>（映射为 <C-y>）确认；<Enter> 只换行。
vim.opt.completeopt = { "menuone", "noinsert" }

-- 编码 -------------------------------------------------------------------

-- 识别顺序：UTF-8、GBK、GB18030（Keil/MDK 工程源码）。
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,latin1"

-- 剪贴板 -----------------------------------------------------------------

if is_wsl and vim.fn.executable("win32yank.exe") == 1 then
  -- WSL：直接读写 Windows 剪贴板，不依赖 Wayland/RDP 剪贴板通道。
  vim.g.clipboard = "win32yank"
elseif
  not is_windows
  and vim.env.DISPLAY
  and not vim.env.DISPLAY:match("^:0")
  and vim.fn.executable("xclip") == 1
then
  -- Linux X11（含 xrdp 桌面）：wl-copy 缺少 Wayland runtime 时用 xclip。
  vim.g.clipboard = "xclip"
end

-- 与系统剪贴板共用寄存器。
vim.opt.clipboard = "unnamedplus"

-- 终端 -------------------------------------------------------------------

-- 关闭同步输出（DECSET 2026）；远程桌面（xrdp）下避免画面残影。
if vim.fn.exists("+termsync") == 1 then
  vim.opt.termsync = false
end