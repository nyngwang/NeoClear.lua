NeoClear.lua
-----

Save you from both:
- the tree-sitter bug on folding, see: https://github.com/nvim-treesitter/nvim-treesitter/issues/2439
- the "how to clear the last highlight qq" problem

## Features

- No weight.
- Only one command.
- Can be run on "un-saved" buffer without error(as `silent!`)
  - but you still need to save the buffer to solve the folding bug.
- Leave window-view intact after run.

## Usage


```lua
NeoClear
```

example

```lua
vim.keymap.set('n', '<C-C>', function()
  vim.cmd('NeoClear')
end, { noremap = true, silent = true, nowait = true })
```
