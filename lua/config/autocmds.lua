-- 附加自动命令，在 VeryLazy 时加载；LazyVim 默认自动命令保持启用。
--
-- 保存后保证文件以空行结尾：写入完成后若最后一行不是空行，则追加一个空行，
-- 并用 noautocmd 再写一次（不重新触发保存相关事件）。

-- 不补空行的缓冲区类型。
local skip_filetypes = {
    gitcommit = true,
    gitrebase = true,
    git = true,
}

local function should_skip(buf)
    return vim.bo[buf].buftype ~= ""
        or vim.bo[buf].binary
        or not vim.bo[buf].modifiable
        or vim.bo[buf].readonly
        or skip_filetypes[vim.bo[buf].filetype] == true
        or vim.api.nvim_buf_get_name(buf) == ""
end

local function ensure_blank_last_line(buf)
    if not vim.api.nvim_buf_is_valid(buf) or should_skip(buf) then
        return
    end
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    if #lines == 0 or lines[#lines] == "" then
        return
    end
    vim.api.nvim_buf_set_lines(buf, #lines, #lines, false, { "" })
    vim.api.nvim_buf_call(buf, function()
        pcall(vim.cmd, "silent noautocmd write")
    end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("UserBlankLastLine", { clear = true }),
    callback = function(event)
        ensure_blank_last_line(event.buf)
    end,
})
