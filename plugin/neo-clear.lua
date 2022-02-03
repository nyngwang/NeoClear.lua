if vim.fn.has("nvim-0.5") == 0 then
  return
end

if vim.g.loaded_neo_clear ~= nil then
  return
end

require('neo-clear')


vim.g.loaded_neo_clear = 1
