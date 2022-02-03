M = {}


function M.save_me()
  vim.cmd('noh')
  if vim.api.nvim_eval('&modified') == 1 then return end
  local topline = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].topline
  vim.cmd('e')
  vim.fn.winrestview({ topline = topline })
end

local function setup_vim_commands()
  vim.cmd [[
    command! NeoClear lua require'neo-clear'.save_me()
  ]]
end

setup_vim_commands()

return M
