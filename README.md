# Neovim 配置（无插件）

只使用 Neovim 内置功能，不依赖插件管理器：启动快、无插件更新、Windows 与 WSL2 共用一份配置。

包含：内置 LSP（clangd）、内置补全菜单、treesitter 高亮（Neovim 自带 parser）、GBK 编码识别、保存补空行、剪贴板桥接。

## 安装

1. 安装 Neovim 0.11 及以上（当前使用 0.12.6）。
2. 安装 `clangd`（C/C++ 语言服务器）：
   - Windows：安装 LLVM，确保 `clangd.exe` 在 PATH 中。
   - WSL2 / Linux：`sudo apt install clangd`。
3. 克隆到 Neovim 配置目录：

   Windows（PowerShell）：

   ```powershell
   git clone https://github.com/Jiachen-Xiong/nvim_configure.git "$env:LOCALAPPDATA\nvim"
   ```

   WSL2 / Linux：

   ```bash
   git clone https://github.com/Jiachen-Xiong/nvim_configure.git ~/.config/nvim
   ```

4. 复制全局 clang-format 风格文件：

   Windows：`copy clang-format %USERPROFILE%\.clang-format`

   WSL2 / Linux：`cp clang-format ~/.clang-format`

5. 启动 `nvim`，无需安装任何东西。

## 目录

```
init.lua                入口，按顺序加载 config 下的模块
lua/config/options.lua  选项、环境变量、剪贴板
lua/config/autocmds.lua 保存补空行、treesitter 高亮
lua/config/keymaps.lua  键位
lua/config/lsp.lua      clangd（内置 LSP + 内置补全）
clang-format            C/C++ 风格（复制到用户主目录）
curl/.curlrc            Windows 下 Neovim 内 curl 的配置
```

## 键位

| 按键 | 功能 |
| --- | --- |
| `<leader>e` | 文件浏览器（netrw） |
| `<leader>w` | 保存 |
| `gd` | 跳转到定义 |
| `<Tab>` | 补全菜单打开时确认候选，否则插入缩进 |
| `<Enter>` | 换行 |
| `gra` / `grn` / `grr` | 代码操作 / 重命名 / 引用（Neovim 内置 LSP 键位） |
| `K` | 悬浮文档 |

`<leader>` 是空格。

## 平台差异

| 项目 | Windows | WSL2 / Linux |
| --- | --- | --- |
| clangd | LLVM 安装目录（PATH） | 系统包 `clangd` |
| 剪贴板 | 系统默认 | `win32yank.exe`（WSL）/ `xclip`（Linux X11） |
| clang-format 风格 | `%USERPROFILE%\.clang-format` | `~/.clang-format` |
| curl 配置 | `curl/.curlrc`（`CURL_HOME` 指定） | 不使用 |

## 恢复插件版配置

带 LazyVim 和插件的旧配置保留在 `lazyvim` 分支：

```bash
git switch lazyvim
# 首次启动会重新安装插件
```