-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.clipboard = 'unnamedplus'

--[[
local copilot = require('copilot')
 
-- 注册一个特定的处理函数来处理 Copilot 的请求
copilot.setup({
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  handlers = {
    ['textDocument/codeAction'] = function(err, _, result, _, bufnr)
      if err then error(tostring(err)) end
      if not result or vim.tbl_isempty(result) then print("No code actions available") return end
 
      local code_actions = {}
      for _, r in ipairs(result) do
        table.insert(code_actions, {
          title = r.title,
          action = function()
            vim.lsp.buf.execute_code_action({ r })
          end
        })
      end
 
      local selection = vim.fn.inputlist(code_actions)
      if selection > 0 then
        code_actions[selection].action()
      end
    end
  }
})
 
-- 将 Copilot 集成到需要的键位绑定中
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.copilot.accept_completion_item()', { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.copilot.show_completions()', { expr = true, silent = true })

--]]
