-- 引导 lazy.nvim 并按 LazyVim 的插件规格加载配置。

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- LazyVim 及其插件集。
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- 本目录下的自定义插件与覆盖配置。
        { import = "plugins" },
    },
    defaults = {
        -- 自定义插件在启动时加载，LazyVim 插件按需加载。
        lazy = false,
        -- 使用各插件的最新提交。
        version = false,
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true, -- 定期检查插件更新
        notify = false, -- 不弹出更新提示
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
