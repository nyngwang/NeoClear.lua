local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }
local NOREF_NOERR = { noremap = true, silent = true }
local EXPR_NOREF_NOERR_TRUNC = { expr = true, noremap = true, silent = true, nowait = true }
-------------------------------------------------------------------------------------------------------
M = {}
local list_command_fn = {}
local last_input = nil

local function save_me()
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
  vim.cmd("echo ''")
end

-------------------------------------------------------------------------------------------------------

function M.setup(opt)
  for _, cus_fn in ipairs(opt.list_command_fn) do
    table.insert(list_command_fn, cus_fn)
  end
end

function M.save_me()
  save_me()
end

function M.fuck()
  local input = vim.fn.input('fuck this: ')
  if (input == '' or input:match('%s+')) then
    input = last_input
  end
  last_input = input
  vim.cmd("exe 'normal! V'")
  vim.cmd("/\\%V"..input)
  vim.cmd("exe 'normal! N'")
  vim.api.nvim_feedkeys('', 'v', true)
  save_me()
end

local function setup_vim_commands()
  vim.cmd [[
    command! NeoClear lua require'neo-clear'.save_me()
  ]]
end

setup_vim_commands()

return M
