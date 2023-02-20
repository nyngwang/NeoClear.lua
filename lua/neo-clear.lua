M = {}
-------------------------------------------------------------------------------------------------------
local list_command_fn = {}


-------------------------------------------------------------------------------------------------------
function M.setup(opt)
  for _, cus_fn in ipairs(opt.list_command_fn) do
    table.insert(list_command_fn, cus_fn)
  end
end


function M.neo_clear()
  vim.cmd('noh')
  vim.fn.timer_stopall()
  for _, cus_fn in ipairs(list_command_fn) do
    cus_fn()
  end
end


local function setup_vim_commands()
  vim.api.nvim_create_user_command('NeoClear', M.neo_clear, {})
end
setup_vim_commands()


return M
