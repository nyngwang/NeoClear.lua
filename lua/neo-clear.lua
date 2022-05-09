M = {}
local list_command_fn = {}

function M.setup(opt)
  for _, cus_fn in ipairs(opt.list_command_fn) do
    table.insert(list_command_fn, cus_fn)
  end
end

function M.save_me()
  vim.cmd('noh')
  vim.fn.timer_stopall()
  if vim.api.nvim_eval('&modified') == 1
    or vim.bo.buftype == 'nofile'
    or vim.fn.bufname() == '' then return end
  local view = vim.fn.winsaveview()
  for _, cus_fn in ipairs(list_command_fn) do
    cus_fn() end
  vim.cmd('e')
  vim.fn.winrestview(view)
end

local function setup_vim_commands()
  vim.cmd [[
    command! NeoClear lua require'neo-clear'.save_me()
  ]]
end

setup_vim_commands()

return M
