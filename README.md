NeoClear.lua
-----

Save you from both:
- the treesitter bug on folding, see: https://github.com/nvim-treesitter/nvim-treesitter/issues/2439
- the "how to clear the last highlight qq" problem

## Usage

Only one command. Work on "un-saved" buffer.

```lua
NeoClear
```

example

```lua
vim.keymap.set('n', '<C-C>', function() vim.cmd('NeoClear') end, { noremap = true, silent = true, nowait = true })
```
