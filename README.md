# Neovim 閰嶇疆锛堟棤鎻掍欢锛?
鍙娇鐢?Neovim 鍐呯疆鍔熻兘锛屼笉渚濊禆鎻掍欢绠＄悊鍣細鍚姩蹇€佹棤鎻掍欢鏇存柊銆乄indows 涓?WSL2 鍏辩敤涓€浠介厤缃€?
鍖呭惈锛氬唴缃?LSP锛坈langd锛夈€佸唴缃ˉ鍏ㄨ彍鍗曘€乼reesitter 楂樹寒锛圢eovim 鑷甫 parser锛夈€丟BK 缂栫爜璇嗗埆銆佷繚瀛樿ˉ绌鸿銆佸壀璐存澘妗ユ帴銆?
## 瀹夎

1. 瀹夎 Neovim 0.11 鍙婁互涓婏紙褰撳墠浣跨敤 0.12.6锛夈€?2. 瀹夎 `clangd`锛圕/C++ 璇█鏈嶅姟鍣級锛?   - Windows锛氬畨瑁?LLVM锛岀‘淇?`clangd.exe` 鍦?PATH 涓€?   - WSL2 / Linux锛歚sudo apt install clangd`銆?3. 鍏嬮殕鍒?Neovim 閰嶇疆鐩綍锛?
   Windows锛圥owerShell锛夛細

   ```powershell
   git clone https://github.com/Jiachen-Xiong/nvim_configure.git "$env:LOCALAPPDATA\nvim"
   ```

   WSL2 / Linux锛?
   ```bash
   git clone https://github.com/Jiachen-Xiong/nvim_configure.git ~/.config/nvim
   ```

4. 澶嶅埗鍏ㄥ眬 clang-format 椋庢牸鏂囦欢锛?
   Windows锛歚copy clang-format %USERPROFILE%\.clang-format`

   WSL2 / Linux锛歚cp clang-format ~/.clang-format`

5. 鍚姩 `nvim`锛屾棤闇€瀹夎浠讳綍涓滆タ銆?
## 鐩綍

```
init.lua                鍏ュ彛锛屾寜椤哄簭鍔犺浇 config 涓嬬殑妯″潡
lua/config/options.lua  閫夐」銆佺幆澧冨彉閲忋€佸壀璐存澘
lua/config/autocmds.lua 淇濆瓨琛ョ┖琛屻€乼reesitter 楂樹寒
lua/config/keymaps.lua  閿綅
lua/config/lsp.lua      clangd锛堝唴缃?LSP + 鍐呯疆琛ュ叏锛?clang-format            C/C++ 椋庢牸锛堝鍒跺埌鐢ㄦ埛涓荤洰褰曪級
curl/.curlrc            Windows 涓?Neovim 鍐?curl 鐨勯厤缃?```

## 閿綅

| 鎸夐敭 | 鍔熻兘 |
| --- | --- |
| `<leader>e` | 鏂囦欢娴忚鍣紙netrw锛?|
| `<leader>w` | 淇濆瓨 |
| `gd` | 璺宠浆鍒板畾涔?|
| `<Tab>` | 琛ュ叏鑿滃崟鎵撳紑鏃剁‘璁ゅ€欓€夛紝鍚﹀垯鎻掑叆缂╄繘 |
| `<Enter>` | 鎹㈣ |
| `gra` / `grn` / `grr` | 浠ｇ爜鎿嶄綔 / 閲嶅懡鍚?/ 寮曠敤锛圢eovim 鍐呯疆 LSP 閿綅锛?|
| `K` | 鎮诞鏂囨。 |

`<leader>` 鏄┖鏍笺€?
## 骞冲彴宸紓

| 椤圭洰 | Windows | WSL2 / Linux |
| --- | --- | --- |
| clangd | LLVM 瀹夎鐩綍锛圥ATH锛?| 绯荤粺鍖?`clangd` |
| 鍓创鏉?| 绯荤粺榛樿 | `win32yank.exe`锛圵SL锛? `xclip`锛圠inux X11锛?|
| clang-format 椋庢牸 | `%USERPROFILE%\.clang-format` | `~/.clang-format` |
| curl 閰嶇疆 | `curl/.curlrc`锛坄CURL_HOME` 鎸囧畾锛?| 涓嶄娇鐢?|

## 鎭㈠鎻掍欢鐗堥厤缃?
甯?LazyVim 鍜屾彃浠剁殑鏃ч厤缃繚鐣欏湪 `lazyvim` 鍒嗘敮锛?
```bash
git switch lazyvim
# 棣栨鍚姩浼氶噸鏂板畨瑁呮彃浠?```