M = {}
-------------------------------------------------------------------------------------------------------
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
  vim.fn.winrestview(view)
  -- fix folding https://github.com/nvim-treesitter/nvim-treesitter/issues/1424
  if vim.fn.mode() == 'n' and vim.bo.modifiable then
    vim.cmd([[silent! normal! >><<]])
    vim.cmd('silent! w')
  end
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


local function setup_vim_commands()
  vim.cmd [[
    command! NeoClear lua require'neo-clear'.save_me()
  ]]
end
setup_vim_commands()


return M
