-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
function no_paste(reg)
    return function(lines)
        -- Do nothing! We can't paste with OSC52
    end
end

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
         ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
         ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = no_paste("+"), -- Pasting disabled
        ["*"] = no_paste("*"), -- Pasting disabled
    }
}

vim.g.autoformat = false

-- 设置缩进为 4 个空格
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

